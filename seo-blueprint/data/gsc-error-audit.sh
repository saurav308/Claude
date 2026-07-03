#!/usr/bin/env bash
# gsc-error-audit.sh — diagnose the 3 GSC notifications of 3 Jul 2026 (see 20-GSC-Indexing-Errors-Triage-and-Fix.md)
#
#   Usage: bash gsc-error-audit.sh [site_url] [priority_csv]
#          bash gsc-error-audit.sh https://desimachines.com ctr-rewrites-rankmath.csv
#
# Read-only: only GET/HEAD requests against the site, throttled. Needs bash + curl.
# Run from any machine that can open the site in a browser (NOT the Claude cloud
# environment — the WAF blocks datacenter IPs).
#
# Output (./gsc-audit-out/):
#   robots.txt                     — live robots.txt
#   report-robots-blocked.csv      — url,matched_rule          (feeds runbook §2)
#   report-redirects.csv           — url,http_code,redirects_to (feeds §3)
#   report-errors.csv              — url,http_code              (4xx/5xx hygiene)
#   report-soft404-candidates.csv  — url,title,word_count       (feeds §4)
#   summary.txt                    — counts + priority-page guardrail pass/fail

set -u
SITE="${1:-https://desimachines.com}"
PRIORITY_CSV="${2:-ctr-rewrites-rankmath.csv}"
OUT="gsc-audit-out"
UA="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0 Safari/537.36"
MAX_URLS="${MAX_URLS:-4000}"      # cap sitemap URLs checked
SOFT404_SAMPLE="${SOFT404_SAMPLE:-400}"  # cap full-body fetches for soft-404 scan
SLEEP=0.15

mkdir -p "$OUT"
fetch() { curl -sS -L -A "$UA" --max-time 30 "$@"; }

echo "== 1/5 robots.txt =="
fetch "$SITE/robots.txt" -o "$OUT/robots.txt" || { echo "FATAL: cannot fetch $SITE/robots.txt"; exit 1; }
echo "saved -> $OUT/robots.txt"

# Collect Disallow rules that apply to Googlebot: groups 'User-agent: *' and 'User-agent: Googlebot'
awk '
  BEGIN{IGNORECASE=1; apply=0}
  /^[Uu]ser-agent:/ {
    ua=$0; sub(/^[Uu]ser-agent:[ \t]*/,"",ua); gsub(/[ \t\r]+$/,"",ua)
    apply=(ua=="*" || tolower(ua)=="googlebot") ? 1 : 0; next
  }
  apply && /^[Dd]isallow:/ {
    r=$0; sub(/^[Dd]isallow:[ \t]*/,"",r); gsub(/[ \t\r]+$/,"",r)
    if (r != "") print r
  }' "$OUT/robots.txt" | sort -u > "$OUT/.disallow_rules"
echo "Disallow rules in effect for Googlebot: $(wc -l < "$OUT/.disallow_rules")"

# robots pattern -> grep -E regex ( * -> .* ; $ anchors ; else prefix match )
rule_to_regex() {
  local r="$1" anchor=""
  case "$r" in *'$') anchor='$'; r="${r%$}";; esac
  r=$(printf '%s' "$r" | sed -e 's/[.[\()+?{}|^$]/\\&/g' -e 's/\*/.*/g')
  printf '^%s%s' "$r" "$anchor"
}

is_blocked() {  # $1 = path(+query). echoes matching rule if blocked
  local path="$1" rule rx
  while IFS= read -r rule; do
    rx=$(rule_to_regex "$rule")
    if printf '%s' "$path" | grep -Eq "$rx"; then echo "$rule"; return 0; fi
  done < "$OUT/.disallow_rules"
  return 1
}

echo "== 2/5 sitemap discovery =="
grep -i '^sitemap:' "$OUT/robots.txt" | sed 's/^[Ss]itemap:[ \t]*//' | tr -d '\r' > "$OUT/.sitemap_seeds"
[ -s "$OUT/.sitemap_seeds" ] || printf '%s\n%s\n' "$SITE/sitemap_index.xml" "$SITE/sitemap.xml" > "$OUT/.sitemap_seeds"

: > "$OUT/.page_urls"
extract_locs() { grep -o '<loc>[^<]*</loc>' | sed -e 's/<loc>//' -e 's|</loc>||'; }
while IFS= read -r sm; do
  [ -z "$sm" ] && continue
  body=$(fetch "$sm") || continue
  if printf '%s' "$body" | grep -q '<sitemapindex'; then
    printf '%s' "$body" | extract_locs | while IFS= read -r child; do
      fetch "$child" | extract_locs >> "$OUT/.page_urls"; sleep "$SLEEP"
    done
  else
    printf '%s' "$body" | extract_locs >> "$OUT/.page_urls"
  fi
done < "$OUT/.sitemap_seeds"
sort -u "$OUT/.page_urls" | head -n "$MAX_URLS" > "$OUT/.urls"
TOTAL=$(wc -l < "$OUT/.urls")
echo "sitemap URLs collected: $TOTAL (cap $MAX_URLS)"
[ "$TOTAL" -eq 0 ] && echo "WARN: no sitemap URLs found — check $OUT/.sitemap_seeds"

echo "== 3/5 robots check (priority pages + sitemap URLs) =="
echo "url,matched_rule" > "$OUT/report-robots-blocked.csv"
PRI_BLOCKED=0
check_robots_list() {
  while IFS= read -r u; do
    [ -z "$u" ] && continue
    path="/${u#*://*/}"; [ "$path" = "/$u" ] && path="/"
    if rule=$(is_blocked "$path"); then
      echo "\"$u\",\"$rule\"" >> "$OUT/report-robots-blocked.csv"
      [ "${2:-}" = "priority" ] && PRI_BLOCKED=$((PRI_BLOCKED+1))
    fi
  done < "$1"
}
if [ -f "$PRIORITY_CSV" ]; then
  tail -n +2 "$PRIORITY_CSV" | cut -d, -f1 | tr -d '"' > "$OUT/.priority_urls"
  check_robots_list "$OUT/.priority_urls" priority
else
  echo "WARN: $PRIORITY_CSV not found — skipping priority-page guardrail"
  : > "$OUT/.priority_urls"
fi
check_robots_list "$OUT/.urls"
echo "robots-blocked rows: $(( $(wc -l < "$OUT/report-robots-blocked.csv") - 1 ))"

echo "== 4/5 HTTP status sweep (redirects / errors) =="
echo "url,http_code,redirects_to" > "$OUT/report-redirects.csv"
echo "url,http_code" > "$OUT/report-errors.csv"
n=0
while IFS= read -r u; do
  n=$((n+1)); [ $((n % 200)) -eq 0 ] && echo "  ...$n/$TOTAL"
  # no -L: we want the FIRST hop status of the sitemap URL itself
  hdr=$(curl -sS -I -A "$UA" --max-time 20 "$u" 2>/dev/null) || { echo "\"$u\",fetch_failed" >> "$OUT/report-errors.csv"; continue; }
  code=$(printf '%s' "$hdr" | awk 'NR==1{print $2}')
  case "$code" in
    3??) loc=$(printf '%s' "$hdr" | awk -F': ' 'tolower($1)=="location"{print $2}' | tr -d '\r' | head -1)
         echo "\"$u\",$code,\"$loc\"" >> "$OUT/report-redirects.csv";;
    4??|5??) echo "\"$u\",$code" >> "$OUT/report-errors.csv";;
  esac
  sleep "$SLEEP"
done < "$OUT/.urls"
echo "redirects: $(( $(wc -l < "$OUT/report-redirects.csv") - 1 )) | errors: $(( $(wc -l < "$OUT/report-errors.csv") - 1 ))"

echo "== 5/5 soft-404 scan (first $SOFT404_SAMPLE 200-status URLs + all priority pages) =="
echo "url,title,word_count" > "$OUT/report-soft404-candidates.csv"
cat "$OUT/.priority_urls" <(head -n "$SOFT404_SAMPLE" "$OUT/.urls") | sort -u | while IFS= read -r u; do
  [ -z "$u" ] && continue
  body=$(fetch "$u") || continue
  title=$(printf '%s' "$body" | grep -o '<title>[^<]*' | head -1 | sed 's/<title>//' | tr -d '",')
  words=$(printf '%s' "$body" | sed -e 's/<script[^>]*>.*<\/script>//g' -e 's/<style[^>]*>.*<\/style>//g' -e 's/<[^>]*>/ /g' | wc -w)
  flag=0
  printf '%s' "$title" | grep -Eqi 'not found|no result|nothing found|404|page unavailable|error' && flag=1
  [ "$words" -lt 120 ] && flag=1
  [ "$flag" -eq 1 ] && echo "\"$u\",\"$title\",$words" >> "$OUT/report-soft404-candidates.csv"
  sleep "$SLEEP"
done
echo "soft-404 candidates: $(( $(wc -l < "$OUT/report-soft404-candidates.csv") - 1 ))"

{
  echo "GSC error audit — $(date)"
  echo "site: $SITE | sitemap URLs checked: $TOTAL"
  echo
  echo "robots-blocked rows : $(( $(wc -l < "$OUT/report-robots-blocked.csv") - 1 ))"
  echo "redirecting sitemap URLs: $(( $(wc -l < "$OUT/report-redirects.csv") - 1 ))  <- every one of these feeds 'Page with redirect'; replace with final URL in sitemap"
  echo "4xx/5xx sitemap URLs: $(( $(wc -l < "$OUT/report-errors.csv") - 1 ))"
  echo "soft-404 candidates : $(( $(wc -l < "$OUT/report-soft404-candidates.csv") - 1 ))"
  echo
  if [ -s "$OUT/.priority_urls" ]; then
    if [ "$PRI_BLOCKED" -eq 0 ]; then
      echo "GUARDRAIL PASS: none of the 63 priority (Batch 1+2) pages is blocked by robots.txt"
    else
      echo "GUARDRAIL FAIL: $PRI_BLOCKED priority page(s) blocked by robots.txt — fix robots.txt FIRST (runbook 20 §2)"
    fi
  fi
  echo "Next: follow 20-GSC-Indexing-Errors-Triage-and-Fix.md §6 order of operations."
} | tee "$OUT/summary.txt"
