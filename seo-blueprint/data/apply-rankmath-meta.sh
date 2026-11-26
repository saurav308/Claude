#!/usr/bin/env bash
# Apply RankMath SEO title + description from a CSV to WordPress posts in bulk.
#
# CSV format (header required): url,rank_math_title,rank_math_description
# Matches each URL to a post via WordPress's own url_to_postid(), then sets
# the RankMath post-meta keys. Works on RankMath free or PRO.
#
# Requirements: run on the server in the WordPress root, with WP-CLI installed.
# ALWAYS back up the database first.  Use --dry-run to preview with no writes.
#
# Usage:
#   bash apply-rankmath-meta.sh ctr-rewrites-rankmath.csv --dry-run
#   bash apply-rankmath-meta.sh ctr-rewrites-rankmath.csv

set -euo pipefail

CSV="${1:?Usage: apply-rankmath-meta.sh <csv> [--dry-run]}"
DRY=0
[[ "${2:-}" == "--dry-run" ]] && DRY=1

command -v wp >/dev/null || { echo "WP-CLI (wp) not found. Run this in the WP root on the server."; exit 1; }
[[ -f "$CSV" ]] || { echo "CSV not found: $CSV"; exit 1; }

ok=0; skip=0; line=0

# Read CSV (quoted fields, commas inside fields). Python does the parsing and
# emits TAB-separated url/title/desc so bash can read them safely.
python3 - "$CSV" <<'PY' | while IFS=$'\t' read -r url title desc; do
import csv, sys
r = csv.reader(open(sys.argv[1], encoding="utf-8"))
header = next(r, None)
for row in r:
    if len(row) < 3 or not row[0].strip():
        continue
    # strip newlines/tabs to keep the TSV clean
    out = [c.replace("\t", " ").replace("\n", " ").strip() for c in row[:3]]
    print("\t".join(out))
PY
  line=$((line+1))
  [[ -z "${url:-}" ]] && continue

  pid="$(wp eval "echo (int) url_to_postid('${url//\'/\\\'}');" 2>/dev/null || echo 0)"
  if [[ "$pid" == "0" || -z "$pid" ]]; then
    echo "SKIP  (no post)  $url"
    skip=$((skip+1))
    continue
  fi

  if [[ "$DRY" == "1" ]]; then
    echo "DRY   #$pid  $url"
    echo "        title: $title"
    echo "        desc : $desc"
  else
    wp post meta update "$pid" rank_math_title       "$title" >/dev/null
    wp post meta update "$pid" rank_math_description  "$desc"  >/dev/null
    echo "SET   #$pid  $url"
  fi
  ok=$((ok+1))
done

echo "----"
echo "processed=$line  applied/matched=$ok  skipped=$skip  dry_run=$DRY"
echo "Tip: after applying, purge cache (and Cloudflare cache) so new tags are served."
