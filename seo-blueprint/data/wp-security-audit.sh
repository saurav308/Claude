#!/usr/bin/env bash
# WordPress security self-audit (READ-ONLY — changes nothing).
# Run on the Cloudways server in the WP root:  bash wp-security-audit.sh
# Maps findings to the hardening checklist in doc 22 §3.

set -uo pipefail
command -v wp >/dev/null || { echo "WP-CLI (wp) not found. Run in the WP root on the server."; exit 1; }
PREFIX="$(wp db prefix 2>/dev/null || echo wp_)"
UPLOADS="$(wp eval 'echo wp_upload_dir()["basedir"];' 2>/dev/null || echo ./wp-content/uploads)"
DOCROOT="$(wp eval 'echo ABSPATH;' 2>/dev/null || echo .)"

hr(){ echo "=================================================================="; }

hr; echo "1) CORE / PLUGIN / THEME UPDATES  (doc 22 §3.1)"; hr
echo "-- WordPress core --"
wp core check-update 2>/dev/null || true
wp core version 2>/dev/null
echo "-- Plugins with updates available (patch these; unpatched = #1 entry point) --"
wp plugin list --update=available --fields=name,status,version,update_version 2>/dev/null || echo "none / n/a"
echo "-- Themes with updates available --"
wp theme list --update=available --fields=name,status,version,update_version 2>/dev/null || echo "none / n/a"

hr; echo "2) DEACTIVATED-BUT-PRESENT (files still exploitable — delete them, §3.1)"; hr
wp plugin list --status=inactive --field=name 2>/dev/null || true
wp theme list --status=inactive --field=name 2>/dev/null || true

hr; echo "3) ADMIN USERS  (least privilege + no 'admin' username, §3.4/§3.5)"; hr
wp user list --role=administrator --fields=ID,user_login,user_email,user_registered 2>/dev/null
echo "-- Any user literally named admin/administrator/desimachines (guessable) --"
wp user list --fields=user_login 2>/dev/null | grep -Ei '^(admin|administrator|desimachines|root|test)$' && echo "  ^ RENAME these" || echo "  none of the obvious guessable names — good"

hr; echo "4) KEY wp-config FLAGS  (§3.6)"; hr
chk(){ wp config get "$1" 2>/dev/null | grep -qi "$2" && echo "  OK   $1 = $(wp config get "$1" 2>/dev/null)" || echo "  TODO $1 not set to $2 (doc 22 §3.6 / wp-config-hardening.php)"; }
chk DISALLOW_FILE_EDIT 1
chk FORCE_SSL_ADMIN 1
wp config get DISALLOW_FILE_MODS 2>/dev/null >/dev/null && echo "  note DISALLOW_FILE_MODS is set (blocks ALL updates — only if you patch via deploys)"

hr; echo "5) EXPOSED SURFACES"; hr
[ -f "$DOCROOT/xmlrpc.php" ] && echo "  xmlrpc.php present — confirm it's blocked (21 htaccess-antiscrape.txt / §3.4)"
[ -f "$DOCROOT/readme.html" ] && echo "  readme.html present — leaks WP version; delete it (§3.12)"
[ -f "$DOCROOT/wp-config-sample.php" ] && echo "  wp-config-sample.php present — harmless but tidy to remove"

hr; echo "6) FILE PERMISSIONS — world-writable (777/666) files/dirs (§3.6)"; hr
find "$DOCROOT" -maxdepth 4 -type f -perm -0002 2>/dev/null | head -20
find "$DOCROOT" -maxdepth 4 -type d -perm -0002 2>/dev/null | head -20
echo "(target: dirs 755, files 644, wp-config.php 640/600; none should be world-writable)"

hr; echo "7) PHP files inside uploads (should be ZERO — a shell here = compromise, §3.7)"; hr
find "$UPLOADS" -type f -iname '*.php' 2>/dev/null | head -20 || true
echo "(any result above is a RED FLAG — investigate immediately, see §4)"

hr; echo "8) RECENTLY-MODIFIED PHP (last 14 days — unexpected changes = possible injection)"; hr
find "$DOCROOT" -type f -iname '*.php' -mtime -14 2>/dev/null | grep -vE '/(cache|uploads/cache)/' | head -40
echo "(expected after updates; unexpected files/dates near a suspected hack = investigate)"

hr; echo "9) BACKDOOR SIGNATURE SCAN (heuristic — matches need eyeballing, §2/§4)"; hr
PAT='eval\s*\(\s*(base64_decode|gzinflate|gzuncompress|str_rot13)|\bassert\s*\(\s*\$|\bpreg_replace\s*\(.*/e|\b(FilesMan|WSO|c99sh|r57shell|b374k)\b|\$_(POST|GET|REQUEST|COOKIE)\s*\[[^]]*\]\s*\('
grep -rInE "$PAT" "$DOCROOT/wp-content" 2>/dev/null | grep -vE '/(cache)/' | head -40
echo "(matches are HEURISTIC — legit code occasionally trips these. Review each; concentration in uploads/ or odd filenames = likely malware.)"

hr; echo "DONE — read-only. Prioritize: any §7 hit or §9 concentration first, then §1 updates, §3 admin/2FA, §6 perms."
