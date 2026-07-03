#!/usr/bin/env bash
# WordPress plugin + performance-hygiene audit (read-only — makes NO changes).
# Run on the server in the WP root (WP-CLI required):  bash plugin-audit.sh
#
# Reports:
#   1. Full plugin inventory (active/inactive, version, update available)
#   2. Red flags: redundant cache/optimizer layers, known heavyweights
#   3. Autoloaded-options weight (every request pays this) + top offenders
#   4. Expired transients + wp-cron backlog
#
# Decision rules (doc 20, Phase 4):
#   - One page cache per tier (Varnish origin / Cloudflare edge) -> extra cache
#     plugins get deactivated.
#   - One image optimizer (Cloudflare Polish OR origin WebP) -> extra image
#     plugins get deactivated.
#   - JS minify/defer is handled by defer-third-party.php -> optimizer plugins off.
#   - Deactivate -> observe 1 week -> delete. Always back up the DB first.

set -uo pipefail

command -v wp >/dev/null || { echo "WP-CLI (wp) not found. Run in the WP root on the server."; exit 1; }

echo "=================================================================="
echo "1) PLUGIN INVENTORY"
echo "=================================================================="
wp plugin list --fields=name,status,update,version

# Known-offender patterns: plugins whose job is already done by the
# Varnish/Breeze/Cloudflare/mu-plugin stack, or that are notorious main-thread
# / DB hogs on catalog sites. A match = "review", not "automatically delete".
REDUNDANT_CACHE="wp-rocket|w3-total-cache|wp-super-cache|wp-fastest-cache|litespeed-cache|hummingbird|sg-cachepress|autoptimize|wp-optimize"
REDUNDANT_IMAGE="wp-smushit|shortpixel|ewww-image-optimizer|imagify|optimole"
HEAVYWEIGHTS="revslider|revolution-slider|broken-link-checker|wordfence|jetpack|yet-another-related-posts|contextual-related-posts|wp-statistics|slimstat|wordpress-popular-posts|updraftplus"
DUP_SEO="wordpress-seo|all-in-one-seo|seopress"   # RankMath is the SEO plugin; two SEO plugins = double meta output

echo
echo "=================================================================="
echo "2) RED FLAGS"
echo "=================================================================="
ACTIVE="$(wp plugin list --status=active --field=name)"
flag () {  # $1=pattern  $2=reason
  hits="$(printf '%s\n' "$ACTIVE" | grep -Ei "$1" || true)"
  [[ -n "$hits" ]] && printf '%s\n' "$hits" | while read -r p; do echo "  [REVIEW] $p — $2"; done
}
flag "$REDUNDANT_CACHE" "cache/minify layer duplicated by Varnish+Breeze+Cloudflare (keep Breeze only)"
flag "$REDUNDANT_IMAGE" "image optimization duplicated if Cloudflare Polish / origin WebP is on"
flag "$HEAVYWEIGHTS"    "known heavyweight — check if its job is still needed / covered by Cloudflare WAF"
flag "$DUP_SEO"         "second SEO plugin alongside RankMath — duplicate meta/schema output risk"
echo "  (no line above a section = nothing flagged)"

echo
echo "=================================================================="
echo "3) AUTOLOADED OPTIONS (loaded on EVERY request; >800KB total = fix)"
echo "=================================================================="
wp db query "SELECT ROUND(SUM(LENGTH(option_value))/1024) AS autoload_KB FROM $(wp db prefix)options WHERE autoload IN ('yes','on','auto-on');" --skip-column-names 2>/dev/null \
  || wp option list --autoload=on --format=count
echo "-- top 15 offenders --"
wp db query "SELECT option_name, ROUND(LENGTH(option_value)/1024) AS KB FROM $(wp db prefix)options WHERE autoload IN ('yes','on','auto-on') ORDER BY LENGTH(option_value) DESC LIMIT 15;" 2>/dev/null || true
echo "Fix pattern: options left behind by deleted plugins ->"
echo "  wp option update <name> --autoload=no   (or delete if plugin is gone)"

echo
echo "=================================================================="
echo "4) TRANSIENTS + CRON"
echo "=================================================================="
echo "-- expired transients (safe to clear: wp transient delete --expired) --"
wp transient list --expired --format=count 2>/dev/null || echo "n/a"
echo "-- wp-cron events due now / overdue (a large backlog slows random requests) --"
wp cron event list --format=count
echo "Tip (Cloudways): disable WP pseudo-cron and use a real server cron:"
echo "  define('DISABLE_WP_CRON', true);  +  panel Cron Job: wp cron event run --due-now (every 5 min)"

echo
echo "Done. This script changed nothing. Deactivate flagged plugins one at a time,"
echo "observe for a week (front-end, wp-admin, leads still firing), then delete."
