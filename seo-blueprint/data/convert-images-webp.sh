#!/usr/bin/env bash
# Bulk-convert JPEG/PNG in wp-content/uploads to WebP (and optionally AVIF) siblings.
# Creates image.jpg.webp next to image.jpg — originals are NEVER touched, so this is
# fully additive/reversible. Pair with htaccess-webp-avif.txt so Apache serves the
# sibling to browsers that Accept the format.
#
# SKIP THIS SCRIPT if Cloudflare Polish / Cloudways CF Enterprise (Polish+Mirage) is
# already converting formats at the edge — one image optimizer per stack (doc 20 §3.1).
#
# Requirements on the server: cwebp (package "webp"); optionally avifenc ("libavif-bin").
#   Cloudways: sudo apt-get install webp libavif-bin   (or ask support to install)
#
# Usage:
#   bash convert-images-webp.sh <uploads-dir> --dry-run          # preview + size report
#   bash convert-images-webp.sh <uploads-dir>                    # convert to WebP
#   bash convert-images-webp.sh <uploads-dir> --avif             # WebP + AVIF
#
# Safe to re-run: skips siblings that already exist and are newer than the source.

set -euo pipefail

DIR="${1:?Usage: convert-images-webp.sh <uploads-dir> [--dry-run] [--avif]}"
shift || true
DRY=0; AVIF=0
for a in "$@"; do
  case "$a" in
    --dry-run) DRY=1 ;;
    --avif)    AVIF=1 ;;
    *) echo "Unknown flag: $a"; exit 1 ;;
  esac
done

[[ -d "$DIR" ]] || { echo "Not a directory: $DIR"; exit 1; }
command -v cwebp >/dev/null || { echo "cwebp not found (apt-get install webp)"; exit 1; }
if [[ $AVIF -eq 1 ]] && ! command -v avifenc >/dev/null; then
  echo "avifenc not found (apt-get install libavif-bin) — continuing with WebP only"
  AVIF=0
fi

QUALITY_WEBP=82
QUALITY_AVIF=55        # AVIF quality scale differs; ~55 visually matches WebP 82
MIN_BYTES=10240        # skip tiny images (<10 KB) — no meaningful win

count=0; made=0; skipped=0; saved=0

while IFS= read -r -d '' img; do
  count=$((count+1))
  src_bytes=$(stat -c%s "$img")
  [[ $src_bytes -lt $MIN_BYTES ]] && { skipped=$((skipped+1)); continue; }

  webp="${img}.webp"
  if [[ ! -f "$webp" || "$img" -nt "$webp" ]]; then
    if [[ $DRY -eq 1 ]]; then
      echo "[dry] would create $webp ($(numfmt --to=iec $src_bytes))"
    else
      if cwebp -quiet -q $QUALITY_WEBP "$img" -o "$webp"; then
        new_bytes=$(stat -c%s "$webp")
        if [[ $new_bytes -ge $src_bytes ]]; then
          rm -f "$webp"   # conversion didn't help; don't ship a bigger file
        else
          made=$((made+1)); saved=$((saved + src_bytes - new_bytes))
        fi
      else
        echo "warn: cwebp failed on $img" >&2
      fi
    fi
  fi

  if [[ $AVIF -eq 1 ]]; then
    avif="${img}.avif"
    if [[ ! -f "$avif" || "$img" -nt "$avif" ]]; then
      if [[ $DRY -eq 1 ]]; then
        echo "[dry] would create $avif"
      else
        avifenc -q $QUALITY_AVIF -s 6 "$img" "$avif" >/dev/null 2>&1 || echo "warn: avifenc failed on $img" >&2
        if [[ -f "$avif" && $(stat -c%s "$avif") -ge $src_bytes ]]; then rm -f "$avif"; fi
      fi
    fi
  fi
done < <(find "$DIR" -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' \) -print0)

echo "----------------------------------------"
echo "Scanned: $count | converted: $made | skipped(<10KB): $skipped | bytes saved: $(numfmt --to=iec ${saved:-0})"
if [[ $DRY -eq 0 && $made -gt 0 ]]; then
  echo "Next: append htaccess-webp-avif.txt to the app's .htaccess, then purge Varnish (Breeze) + Cloudflare."
fi
