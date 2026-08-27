# F5 — Duplicate titles on compare variants

**Issue:** Semrush issue 6, 16 URLs (8 pairs). **Pulled full current `<title>` text for all 16 via `page_info` on 2026-08-27** (not just the 3 sample pairs in the summary doc) — this changed the picture materially, so the fix below is more targeted than "16 pages need a title fix."

## What's actually there (ground-truthed, not assumed)

| Pair | Page A title (live) | Page B title (live) | Verdict |
|---|---|---|---|
| ACE Phantom 4WD vs Manitou MBL 745 HT / HT+ | "...HT: Which to Buy" | "...HT+: Which to Buy" | **Near-dupe only** — already differs by "+" |
| CASE 851 NX vs Manitou MBL 745 HT / HT+ | "...HT: Which to Buy" | "...HT+: Which to Buy" | **Near-dupe only** — already differs by "+" |
| CASE 770 EX vs Manitou MBL 745 HT / HT+ | "...HT: Which to Buy" | "...HT+: Which to Buy" | **Near-dupe only** — already differs by "+" |
| JCB 3DX Super vs Manitou MBL 745 HT / HT+ | "...HT: Which to Buy?" | "...HT+: Which to Buy" | **Near-dupe only** — already differs by "+" (and "?") |
| JCB 3DX vs Manitou MBL 745 HT / HT+ | "...HT: Which To Buy?" | "...HT+: Which to Buy" | **Near-dupe only** — already differs by "+" |
| **Bull SD76 BS4 Champion / BS5 Super Smart vs JCB 3DX Super** | "Bull SD76 vs JCB 3DX Super: Which Backhoe to Buy?" | "Bull SD76 vs JCB 3DX Super: Which Backhoe to Buy" | **REAL duplicate** — BS4/BS5 token fully dropped, titles identical but for a trailing "?" |
| **Hyundai R215 Smart X Plus / Smart Plus vs XCMG XE250LC-K** | "Hyundai R215 vs XCMG XE250LC-K: Which Excavator?" | "Hyundai R215 vs XCMG XE250LC-K: Which Excavator" | **REAL duplicate** — Smart-X-Plus/Smart-Plus token fully dropped |
| **Hyundai R220LS Smart X Plus / Smart Plus vs Liugong 922EA Alpha** | "Hyundai R220LS vs Liugong 922Ea: Which Excavator" | "Hyundai R220LS vs Liugong 922Ea: Which Excavator?" | **REAL duplicate** — same pattern |

So of the 16 flagged URLs: **6 (3 pairs) are genuine content-identical duplicates** (Bull SD76, Hyundai R215, Hyundai R220LS) where the distinguishing variant token is dropped entirely from the title. The other **10 (5 pairs, all Manitou MBL 745 HT vs HT+)** already carry a real distinguishing "+" and are, at most, near-duplicates flagged by Semrush's fuzzy match — lower priority, optional cosmetic hardening.

**Root cause (generator-level, needs code access to confirm/fix permanently):** the title-building function maps a model slug to a display name, and for at least these three model families (`bull-sd76-*`, `hyundai-r215-smart-*`, `hyundai-r220ls-smart-*`) the lookup truncates to the base model, dropping the trailing variant qualifier (`bs4-champion`/`bs5-super-smart`, `smart-x-plus`/`smart-plus`). The Manitou `ht`/`ht-plus` pair shows the generator *can* carry a variant token through — so this is a per-model-family lookup gap, not a systemic truncation bug. Fixing it permanently needs a look at the actual lookup table/function (flagged for Phase 1 code access), but the immediate fix below doesn't wait on that.

## Fix — Tier A (real duplicates, apply now): per-page `rank_math_title` override

**Owner:** S-EXEC. **Approval:** pre-authorized (non-product template titles). **Batch size:** 6 URLs.

```bash
# snapshot first
wp db query --skip-column-names "
SELECT p.ID, p.post_name, pm.meta_value
FROM wp_posts p JOIN wp_postmeta pm ON pm.post_id=p.ID AND pm.meta_key='rank_math_title'
WHERE p.post_name IN (
  'bull-sd76-bs4-champion-vs-jcb-3dx-super-backhoe-loader',
  'bull-sd76-bs5-super-smart-vs-jcb-3dx-super-backhoe-loader',
  'hyundai-r215-smart-x-plus-vs-xcmg-xe250lc-k-excavator',
  'hyundai-r215-smart-plus-vs-xcmg-xe250lc-k-excavator',
  'hyundai-r220ls-smart-x-plus-vs-liugong-922ea-alpha-excavator',
  'hyundai-r220ls-smart-plus-vs-liugong-922ea-alpha-excavator'
);
" > seo-ops/data/meta-snapshots/$(date +%F)-f5-titles-before.csv

# apply — re-inserts the dropped variant token, keeps the site's existing title shape
wp post meta update <ID_bull_bs4>    rank_math_title 'Bull SD76 BS4 Champion vs JCB 3DX Super: Which Backhoe to Buy?'
wp post meta update <ID_bull_bs5>    rank_math_title 'Bull SD76 BS5 Super Smart vs JCB 3DX Super: Which Backhoe to Buy?'
wp post meta update <ID_r215_xplus>  rank_math_title 'Hyundai R215 Smart X Plus vs XCMG XE250LC-K: Which Excavator?'
wp post meta update <ID_r215_plus>   rank_math_title 'Hyundai R215 Smart Plus vs XCMG XE250LC-K: Which Excavator?'
wp post meta update <ID_r220ls_xplus> rank_math_title 'Hyundai R220LS Smart X Plus vs Liugong 922EA Alpha: Which Excavator?'
wp post meta update <ID_r220ls_plus>  rank_math_title 'Hyundai R220LS Smart Plus vs Liugong 922EA Alpha: Which Excavator?'
```
(Resolve `<ID_*>` the same way as F4 step 1 — `wp post list --post_type=compare --name=<slug> --field=ID`.)

All 6 titles stay within RankMath's ~60-char guidance except the two R220LS ones (68 chars) — acceptable given uniqueness beats a few truncated characters here; revisit only if Google visibly truncates them in the SERP snippet.

## Fix — Tier B (near-dupes, optional/lower priority): the 5 Manitou HT/HT+ pairs

These already differ (by "+"). Leave as-is unless a future audit still flags them after Tier A + F1/F3/F4 ship — if Semrush's fuzzy-match keeps catching them, the cheap hardening is standardizing the trailing punctuation (some have "?", some don't — that inconsistency, not the "+", is the only other variance) rather than a content rewrite. Not scheduled as its own batch; fold into the next title-hygiene pass if it recurs.

## Validate

- Re-fetch each of the 6 Tier-A URLs (Exa or direct) and confirm the rendered `<title>` matches.
- Next Semrush audit (~2026-08-29): issue 6 should drop from 16 → at most 10 (the untouched Tier-B near-dupes), confirming the fix targeted the right 6.

## Rollback

```bash
wp post meta update <ID> rank_math_title '<old_value_from_csv>'
```
