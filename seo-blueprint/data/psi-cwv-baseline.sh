#!/usr/bin/env bash
# Core Web Vitals baseline/re-measure via the PageSpeed Insights API.
# For each URL: records CrUX FIELD data (what Google ranks on) + Lighthouse LAB data.
#
# Setup (one-time, free):
#   Google Cloud Console -> enable "PageSpeed Insights API" -> create API key
#   export PSI_API_KEY=<key>
#
# Usage:
#   bash psi-cwv-baseline.sh cwv-priority-urls.txt baseline-2026-07-10.csv
#   bash psi-cwv-baseline.sh cwv-priority-urls.txt after-2026-08-01.csv desktop   # optional 3rd arg
#
# Output CSV columns:
#   url,strategy,field_lcp_ms,field_inp_ms,field_cls,field_assessment,
#   lab_perf_score,lab_lcp_ms,lab_tbt_ms,lab_cls,error

set -euo pipefail

URLS_FILE="${1:?Usage: psi-cwv-baseline.sh <urls-file> <out.csv> [mobile|desktop]}"
OUT="${2:?Usage: psi-cwv-baseline.sh <urls-file> <out.csv> [mobile|desktop]}"
STRATEGY="${3:-mobile}"
: "${PSI_API_KEY:?Set PSI_API_KEY (free key: Google Cloud Console -> PageSpeed Insights API)}"

[[ -f "$URLS_FILE" ]] || { echo "URLs file not found: $URLS_FILE"; exit 1; }

echo "url,strategy,field_lcp_ms,field_inp_ms,field_cls,field_assessment,lab_perf_score,lab_lcp_ms,lab_tbt_ms,lab_cls,error" > "$OUT"

while IFS= read -r url; do
  [[ -z "$url" || "$url" == \#* ]] && continue
  echo "-> $url ($STRATEGY)"

  enc_url="$(python3 -c 'import urllib.parse,sys; print(urllib.parse.quote(sys.argv[1], safe=""))' "$url")"
  resp="$(curl -sS --max-time 120 </dev/null \
    "https://www.googleapis.com/pagespeedonline/v5/runPagespeed?url=${enc_url}&strategy=${STRATEGY}&category=performance&key=${PSI_API_KEY}" \
    || echo '{"error":{"message":"curl failed"}}')"

  RESP="$resp" python3 - "$url" "$STRATEGY" <<'PY' >> "$OUT"
import json, os, sys
url, strategy = sys.argv[1], sys.argv[2]
try:
    d = json.loads(os.environ.get("RESP") or "")
except Exception:
    d = {"error": {"message": "unparseable response"}}

def cell(v): return "" if v is None else v

if "error" in d:
    msg = str(d["error"].get("message", ""))[:120].replace('"', "'")
    print(f'"{url}",{strategy},,,,,,,,,"{msg}"')
else:
    fld = (d.get("loadingExperience") or {}).get("metrics") or {}
    def fp(k): return (fld.get(k) or {}).get("percentile")
    assessment = (d.get("loadingExperience") or {}).get("overall_category", "")
    lh  = d.get("lighthouseResult") or {}
    aud = lh.get("audits") or {}
    def lab(k): return (aud.get(k) or {}).get("numericValue")
    score = ((lh.get("categories") or {}).get("performance") or {}).get("score")
    cls_f = fp("CUMULATIVE_LAYOUT_SHIFT_SCORE")
    row = [
        f'"{url}"', strategy,
        cell(fp("LARGEST_CONTENTFUL_PAINT_MS")),
        cell(fp("INTERACTION_TO_NEXT_PAINT")),
        cell(cls_f / 100 if cls_f is not None else None),   # CrUX reports CLS x100
        assessment,
        cell(round(score * 100) if score is not None else None),
        cell(round(lab("largest-contentful-paint")) if lab("largest-contentful-paint") is not None else None),
        cell(round(lab("total-blocking-time")) if lab("total-blocking-time") is not None else None),
        '"%s"' % ((aud.get("cumulative-layout-shift") or {}).get("displayValue", "")),
        '""',
    ]
    print(",".join(str(x) for x in row))
PY

  sleep 3   # PSI is rate-limited; be polite
done < "$URLS_FILE"

echo "Done -> $OUT"
echo "Pass thresholds (mobile, field): LCP<=2500ms, INP<=200ms, CLS<=0.1"
