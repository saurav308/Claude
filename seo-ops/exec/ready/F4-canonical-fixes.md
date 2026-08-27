# F4 — 9 compare-page canonicals pointing at non-existent reversed URLs

**Issue:** Semrush issue 38 ("canonical → broken page"), 9 URLs. Pulled fresh from the live snapshot (`issue_details`, issueid 38) — matches the fix-package doc's list exactly, confirming it's still current as of 2026-08-27:

| # | Source (real, indexed) | Currently canonicalizes to (does not exist) |
|---|---|---|
| 1 | `/compare/xcmg-xe140i-infra-vs-sany-sy120c-9-excavator/` | `/compare/sany-sy120c-9-vs-xcmg-xe140i-infra-excavator/` |
| 2 | `/compare/sany-sy390c-10hd-grama-vs-jcb-345lc-hd-excavator/` | `/compare/jcb-345lc-hd-vs-sany-sy390c-10hd-grama-excavator/` |
| 3 | `/compare/sany-stg140c-10-vs-fine-fmg-985-hd-motor-grader/` | `/compare/fine-fmg-985-hd-vs-sany-stg140c-10-motor-grader/` |
| 4 | `/compare/mahindra-earthmaster-vx-vs-escorts-digmax-super-backhoe-loader/` | `/compare/escorts-digmax-super-vs-mahindra-earthmaster-vx-backhoe-loader/` |
| 5 | `/compare/mahindra-earthmaster-vx-vs-case-770-nx-magnum-backhoe-loader/` | `/compare/case-770-nx-magnum-vs-mahindra-earthmaster-vx-backhoe-loader/` |
| 6 | `/compare/liugong-935e-hd-vs-liebherr-r-938-litronic-excavator/` | `/compare/liebherr-r-938-litronic-vs-liugong-935e-hd-excavator/` |
| 7 | `/compare/liugong-935e-hd-vs-liebherr-r-928-litronic-excavator/` | `/compare/liebherr-r-928-litronic-vs-liugong-935e-hd-excavator/` |
| 8 | `/compare/liebherr-r-938-litronic-vs-jcb-345lc-hd-excavator/` | `/compare/jcb-345lc-hd-vs-liebherr-r-938-litronic-excavator/` |
| 9 | `/compare/jcb-455-5n-vs-cat-950gc-wheel-loader/` | `/compare/cat-950gc-vs-jcb-455-5n-wheel-loader/` |

(All 9 targets confirmed as the *reversed A/B ordering* — the compare-generator's dedup logic assumed the reversed URL always exists, which it doesn't for these 9 pairs.)

**Fix:** set each source page's canonical to **itself** (the URL that actually exists and is indexed), since generating the reversed-order page is out of scope here (that's a generator-behavior decision, not a one-line fix) and self-canonical is the safe default per the charter ("point the canonical at the URL that actually exists (usually self-canonical)").
**Owner:** S-EXEC. **Approval:** pre-authorized ("per-page canonical fixes are pre-authorized").
**Batch size:** 9 URLs (well under the 50-URL cap).

## 1. Resolve post IDs (discovery)

Compare pages are likely a custom post type (confirm the actual CPT slug first — probably `compare` or similar; check via `wp post-type list`):

```bash
wp post-type list --field=name
# then, once confirmed (example assumes CPT slug 'compare'):
for slug in \
  xcmg-xe140i-infra-vs-sany-sy120c-9-excavator \
  sany-sy390c-10hd-grama-vs-jcb-345lc-hd-excavator \
  sany-stg140c-10-vs-fine-fmg-985-hd-motor-grader \
  mahindra-earthmaster-vx-vs-escorts-digmax-super-backhoe-loader \
  mahindra-earthmaster-vx-vs-case-770-nx-magnum-backhoe-loader \
  liugong-935e-hd-vs-liebherr-r-938-litronic-excavator \
  liugong-935e-hd-vs-liebherr-r-928-litronic-excavator \
  liebherr-r-938-litronic-vs-jcb-345lc-hd-excavator \
  jcb-455-5n-vs-cat-950gc-wheel-loader; do
  echo -n "$slug -> "; wp post list --post_type=compare --name="$slug" --field=ID
done
```

## 2. Snapshot current (broken) canonical values before writing

```bash
wp db query --skip-column-names "
SELECT p.ID, p.post_name, pm.meta_value
FROM wp_posts p
JOIN wp_postmeta pm ON pm.post_id = p.ID AND pm.meta_key = 'rank_math_canonical_url'
WHERE p.post_name IN (
  'xcmg-xe140i-infra-vs-sany-sy120c-9-excavator',
  'sany-sy390c-10hd-grama-vs-jcb-345lc-hd-excavator',
  'sany-stg140c-10-vs-fine-fmg-985-hd-motor-grader',
  'mahindra-earthmaster-vx-vs-escorts-digmax-super-backhoe-loader',
  'mahindra-earthmaster-vx-vs-case-770-nx-magnum-backhoe-loader',
  'liugong-935e-hd-vs-liebherr-r-938-litronic-excavator',
  'liugong-935e-hd-vs-liebherr-r-928-litronic-excavator',
  'liebherr-r-938-litronic-vs-jcb-345lc-hd-excavator',
  'jcb-455-5n-vs-cat-950gc-wheel-loader'
);
" > seo-ops/data/meta-snapshots/$(date +%F)-f4-canonicals-before.csv
```

## 3. Apply (self-canonical, per resolved ID)

```bash
wp post meta update <ID_1> rank_math_canonical_url 'https://desimachines.com/compare/xcmg-xe140i-infra-vs-sany-sy120c-9-excavator/'
wp post meta update <ID_2> rank_math_canonical_url 'https://desimachines.com/compare/sany-sy390c-10hd-grama-vs-jcb-345lc-hd-excavator/'
wp post meta update <ID_3> rank_math_canonical_url 'https://desimachines.com/compare/sany-stg140c-10-vs-fine-fmg-985-hd-motor-grader/'
wp post meta update <ID_4> rank_math_canonical_url 'https://desimachines.com/compare/mahindra-earthmaster-vx-vs-escorts-digmax-super-backhoe-loader/'
wp post meta update <ID_5> rank_math_canonical_url 'https://desimachines.com/compare/mahindra-earthmaster-vx-vs-case-770-nx-magnum-backhoe-loader/'
wp post meta update <ID_6> rank_math_canonical_url 'https://desimachines.com/compare/liugong-935e-hd-vs-liebherr-r-938-litronic-excavator/'
wp post meta update <ID_7> rank_math_canonical_url 'https://desimachines.com/compare/liugong-935e-hd-vs-liebherr-r-928-litronic-excavator/'
wp post meta update <ID_8> rank_math_canonical_url 'https://desimachines.com/compare/liebherr-r-938-litronic-vs-jcb-345lc-hd-excavator/'
wp post meta update <ID_9> rank_math_canonical_url 'https://desimachines.com/compare/jcb-455-5n-vs-cat-950gc-wheel-loader/'
```

REST alternative (once the meta field is confirmed REST-exposed by RankMath, verify with a GET first):
```
POST {REST_ROUTE}/wp/v2/compare/<id>
{ "meta": { "rank_math_canonical_url": "<self-url>" } }
```

## 4. Validate

- `curl -I` (from a machine that can reach the site) or Exa-fetch each of the 9 URLs and confirm the rendered `<link rel="canonical">` now matches the page's own URL.
- Next Semrush audit (~2026-08-29): issue 38 count should drop from 9 → 0.

## Rollback

Two options, prefer the second:
- Restore the broken reversed-order value from the snapshot CSV (reproduces the original defect — only use if the self-canonical change itself caused an unexpected regression).
- Simply delete the `rank_math_canonical_url` meta value (`wp post meta delete <ID> rank_math_canonical_url`) — RankMath falls back to its own default canonical logic, which for a standalone page is normally already self-referential. This is the safer rollback since it doesn't reintroduce the broken target.
