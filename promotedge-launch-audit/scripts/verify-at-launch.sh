#!/usr/bin/env bash
# PromotEdge launch verification — run from any normal machine (NOT behind a restricted proxy).
# Usage:
#   ./verify-at-launch.sh https://promotedge.net/promotedge-next2   # T-1 (staging: expect NOINDEX=present, that's correct)
#   ./verify-at-launch.sh https://www.promotedge.com                # T-0 (production: NOINDEX must be ABSENT)
# Covers the head-level checks the remote audit could not perform through the WAF.

set -u
BASE="${1:?Usage: $0 <base-url-without-trailing-slash>}"
UA_BROWSER="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126 Safari/537.36"
PAGES=( "/" "/services/" "/services/seo/" "/services/seo/local-seo/" "/services/ai-search-optimisation/" "/industries/" "/industries/real-estate/" "/industries/healthcare/" "/work/" "/work/weichai-india/" "/blog/" "/blog/seo-vs-aeo-vs-geo/" "/about/" "/contact/" "/careers/" "/privacy-policy/" "/terms/" )
pass=0; fail=0; warn=0
ok()   { echo "  ✅ $1"; pass=$((pass+1)); }
bad()  { echo "  ❌ $1"; fail=$((fail+1)); }
note() { echo "  ⚠️  $1"; warn=$((warn+1)); }

echo "== 1. Per-page head checks =="
for p in "${PAGES[@]}"; do
  url="$BASE$p"
  html=$(curl -sSL -A "$UA_BROWSER" --max-time 30 "$url" 2>/dev/null)
  code=$(curl -sS -o /dev/null -w "%{http_code}" -A "$UA_BROWSER" --max-time 30 "$url")
  echo "-- $p [$code]"
  if [ "$code" != "200" ]; then
    case "$p" in "/privacy-policy/"|"/terms/") bad "MISSING legal page ($code) — P0-2";; *) bad "HTTP $code";; esac
    continue
  fi
  # title / description / canonical / robots / schema / og
  t=$(echo "$html" | grep -oiP '(?<=<title>).*?(?=</title>)' | head -1)
  [ -n "$t" ] && { tl=${#t}; [ "$tl" -le 65 ] && ok "title (${tl}ch): $t" || note "title ${tl}ch (>65, will truncate): $t"; } || bad "no <title>"
  echo "$html" | grep -qiP '<meta[^>]+name=["'\'']description' && ok "meta description present" || bad "meta description MISSING"
  canon=$(echo "$html" | grep -oiP '<link[^>]+rel=["'\'']canonical["'\''][^>]*>' | grep -oiP 'href=["'\''][^"'\'']+' | cut -d'"' -f2 | head -1)
  if [ -n "$canon" ]; then
    case "$canon" in "$BASE"*) ok "canonical self-domain: $canon";; *) bad "canonical points OFF-DOMAIN: $canon";; esac
  else note "no canonical tag (add self-referencing)"; fi
  if echo "$html" | grep -qiP '<meta[^>]+robots[^>]+noindex'; then
    case "$BASE" in *promotedge-next2*) ok "noindex present (correct for staging)";; *) bad "NOINDEX ON PRODUCTION — the classic launch killer";; esac
  else
    case "$BASE" in *promotedge-next2*) bad "staging page is INDEXABLE (P0-6)";; *) ok "indexable";; esac
  fi
  n=$(echo "$html" | grep -ciP 'application/ld\+json'); [ "$n" -gt 0 ] && ok "JSON-LD blocks: $n" || note "no JSON-LD (schema plan 04 §3)"
  echo "$html" | grep -qiP 'property=["'\'']og:image' && ok "og:image present" || note "og:image missing"
  echo "$html" | grep -qiP '\(\s*/[a-z-]' && bad "literal (/path) token still in HTML (P0-3)" || ok "no (/path) tokens"
  echo "$html" | grep -qi 'demo form' && bad "'demo form' string still present (P0-1)" || ok "no demo-form string"
  # content in initial HTML (SSR proof): check a known phrase server-side
  if [ "$p" = "/" ]; then
    echo "$html" | grep -qi 'under one roof' && ok "content present in initial HTML (SSR/static ✅)" || bad "hero copy NOT in initial HTML — JS-only rendering, invisible to AI crawlers"
  fi
done

echo; echo "== 2. Redirects & normalisation =="
for pair in "/index.html:/" "/services/index.html:/services/" "/case-studies/:/work/" "/insights/:/blog/"; do
  from="${pair%%:*}"; want="${pair##*:}"
  loc=$(curl -sS -o /dev/null -w "%{http_code} %{redirect_url}" -A "$UA_BROWSER" "$BASE$from")
  echo "  $from → $loc (want 301 → $BASE$want)"
done
curl -sS -o /dev/null -w "  http→https: %{http_code} %{redirect_url}\n" "http://www.promotedge.com/" 2>/dev/null || true
curl -sS -o /dev/null -w "  apex→www:  %{http_code} %{redirect_url}\n" -A "$UA_BROWSER" "https://promotedge.com/" 2>/dev/null || true

echo; echo "== 3. Discovery files =="
for f in "/robots.txt" "/sitemap.xml" "/llms.txt"; do
  # robots/llms/sitemap live at DOMAIN root in production; under prefix they may not exist on staging
  root=$(echo "$BASE" | grep -oP 'https://[^/]+')
  c=$(curl -sS -o /dev/null -w "%{http_code}" -A "$UA_BROWSER" "$root$f"); echo "  $root$f → $c"
done

echo; echo "== 4. 404 behaviour =="
c=$(curl -sS -o /dev/null -w "%{http_code}" -A "$UA_BROWSER" "$BASE/definitely-not-a-page-xyz/")
[ "$c" = "404" ] && ok "hard 404 returned" || bad "expected 404, got $c (soft-404 risk)"

echo; echo "== 5. AI / search crawler access matrix (WAF + robots must BOTH allow on production) =="
for ua in "Googlebot/2.1 (+http://www.google.com/bot.html)" "bingbot/2.0" "GPTBot/1.0" "OAI-SearchBot/1.0" "ClaudeBot/1.0" "Claude-User/1.0" "PerplexityBot/1.0" "Google-Extended" "CCBot/2.0" "AhrefsBot/7.0" "facebookexternalhit/1.1"; do
  c=$(curl -sS -o /dev/null -w "%{http_code}" -A "Mozilla/5.0 (compatible; $ua)" --max-time 20 "$BASE/")
  name="${ua%%/*}"
  case "$BASE" in
    *promotedge-next2*) echo "  $name → $c (staging: blocking is acceptable)";;
    *) if [ "$c" = "200" ]; then echo "  ✅ $name → 200"; else echo "  ❌ $name → $c (edge/WAF blocking — GEO killer, see 04 §1)"; fi;;
  esac
done

echo; echo "== 6. Performance quick pulse (full PSI run still required) =="
curl -sS -o /dev/null -A "$UA_BROWSER" -w "  TTFB %{time_starttransfer}s | total %{time_total}s | %{size_download} bytes | HTTP/%{http_version} | gzip/br: check headers\n" "$BASE/"

echo; echo "== Summary: $pass passed · $warn warnings · $fail FAILED =="
[ "$fail" -eq 0 ] && echo "GATE: GREEN (address warnings)" || echo "GATE: RED — fix ❌ items before/at launch"
