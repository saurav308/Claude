# Ahrefs Site Audit — validated findings + fix package

Source: Ahrefs Site Audit API, project 9518353 "Desimachines", crawl completed 2026-08-28T00:41:35Z (25,022 URLs; health score 97/100; 812 URLs with errors, 20,168 with warnings, 19,757 with notices). This is the first full crawl since the Ahrefs API entitlement was restored — the "change" deltas below are versus whatever the last successful crawl was before the outage, so treat magnitudes as "accumulated since last measured," not "happened in one day."

Cross-reference: `seo-ops/fixes/semrush-audit-fix-package.md` (2026-08-27) — findings below are additional/complementary, not a re-check of that package. Two items overlap and are noted.

## FINDING 1 — NEW: ~500 dozer compare pages 404 (Error, top priority)

**What:** issue `4XX page` / `404 page` jumped from ~1 to **518 URLs, 517 of them brand new** (added=0, new=517, removed=0). Sampled 200 of the 404s directly — **100% are `/compare/<model>-vs-<model>-dozer/` URLs** (BEML, CAT, Komatsu, Shantui, SEM, Zoomlion, LiuGong, Case model pairs — dozens of pairings).

**Root cause, confirmed live:** `https://desimachines.com/dozer/` is a fully-built, live category hub — 41 dozer products, real pricing table (₹30 lakh–₹2.2 Cr by model), brand list, finance/insurance CTAs, full editorial content. This is clearly the team's response to the Insights Log's 2026-08-16 finding ("we own /dozer/ with zero vocabulary visibility on 2,400+2,800/mo searches — the cheapest win on the board"). **The individual dozer product pages exist. The compare-page generator was never run for the dozer category** — live-fetch of a sampled compare URL returns `CRAWL_NOT_FOUND`, confirming the page genuinely doesn't exist, not a crawl artifact.

**This is a near-miss, not a failure — most of the work is done.** Two paths:
1. **(Recommended) Finish it — run/trigger the compare-page generator for the "dozer" category**, the same generator already used for excavator/backhoe-loader/crane/etc. This converts ~500 dead links into the actual growth surface the Insights Log identified, and is squarely in scope for whoever built the /dozer/ vertical (not a Claude-session artifact — S-EXEC has had no WP write access and Ahrefs was down during this window, so this was shipped by the human dev/content team).
2. **(Interim, if #1 needs more time)** Suppress/remove the internal links generating these dead compare URLs (likely a "popular comparisons" or cross-link module scoped to all categories, not yet excluding dozer) so the 404s stop accumulating crawl waste and dead-end visitor paths, until the compare pages are ready.

**Action:** Flag to Saurav directly (this is outside S-EXEC's current access and looks like a different workstream); S-EXEC to investigate the compare-page generator's category config once WP access lands and prepare whichever path Saurav picks.

## FINDING 2 — NEW: 283 broken images, 100% on /motor-grader/ (Error)

**What:** issue `Page has broken image` jumped from 0 to **283, all new**. Sampled 130 — **100% are `/motor-grader/<model>/` product pages and `/compare/*-motor-grader/` pages** — an existing, live, previously-healthy vertical with real search traffic (GSC: "grader machine" ~5,200/mo, page currently pos 13.8, slid from 11.7).

**Root cause: not fully isolated from this session (no WP access).** Pulled full raw HTML of one affected page (`/motor-grader/cat-120/`) — confirms two things: (a) the page uses a lazy-load pattern (SVG placeholder → `data-lazy-src` swap) consistently across ~370 images, and (b) I could not identify the single broken image URL from static HTML alone (Ahrefs verifies broken images by fetching them; a live per-URL check is faster with WP/CDN access). **This needs S-EXEC or the dev team to check, once access exists: did a motor-grader-specific image path/CDN/upload batch change or go missing around the same time the dozer vertical shipped?** The concentration on exactly one vertical (not site-wide) rules out a global plugin regression and points at something scoped to motor-grader's product data or image folder.

**Action:** S-EXEC priority #2 (after dozer). Pull `site-audit-page-info` per-URL once WP access exists to get the exact broken `src`; likely a batch fix once the pattern is found (one folder, one missing upload set, or one data-import error).

## FINDING 3 — Confirmed: ~20,000-page "missing alt text" is a ~40-image template fix (Warning)

**What:** `Missing alt text` = **20,027 of 25,022 pages (80%)** — the single largest count in the whole audit, and functionally the entire warnings bucket.

**Root cause, confirmed via raw HTML:** every shared template image carries `alt=""` — the site logo, the 8 category nav icons (`ex-1.webp`, `bl-1.webp`, `mg-1.webp`, `wl-1.webp`, `crane-1.webp`, `roller-1.webp`, `sl.webp`, `cn.webp`), UI icons (`add-to-cart.png`, `download.png`, `medal.png`, `userImg.png`), and the ~40 bank/insurance partner logos (HDFC, ICICI, Bajaj, SBI, etc.) that appear on every finance/insurance CTA block sitewide. Because these ~50 shared assets render on nearly every page, one page's empty alt becomes 20,000+ page-level flags.

**This is the same root defect Semrush found independently** (its issue 110, 720 missing-ALT — Semrush counts unique images, Ahrefs counts affected pages; both point at the same theme assets, e.g. `add-to-cart.png`).

**Action:** One template-level fix — write real alt text for ~40–50 shared images (partner-logo alts = bank/insurer name; category-icon alts = category name; UI-icon alts = short function description). This single fix should collapse the 20,027-page count by the large majority. Folds into the existing Semrush F7 item — same fix, now proven to be the dominant warning on the site, not a minor one. **Elevate priority.**

## FINDING 4 — Addendum to Semrush F2: schema errors extend beyond unpriced products

Semrush's package attributed structured-data errors to unpriced-product pages only. Ahrefs' `schema.org validation error` (121, +11) and `Google rich results validation error` (183, +15) — both **growing** — sampled URLs show compare pages across multiple verticals (excavator, telehandler, backhoe-loader), not just unpriced products. **The unpriced-product fix (Semrush F2) is still correct and should ship, but it will not clear all schema errors** — the compare-page template likely has its own structured-data issue (possibly Product/Review schema emitted on comparison pages where it doesn't cleanly apply). Needs a second, compare-template-specific schema review once S-EXEC has page access.

## POSITIVE SIGNALS — no action, worth knowing

- **"Slow server response for AI crawlers" improved sharply: 5,169 now vs ~10,144 before (net −4,975; 6,172 URLs removed from the list vs 1,196 added).** Plausibly tied to Saurav's 2026-08-19 CWV work — the independent confirmation the master sheet review has been waiting for.
- **"Page and SERP titles do not match" improved (283, −110, 136 removed vs 25 added)** — the July title-rewrite work continuing to land in Google's index.
- **"Pages dropped from Top 10" (309, −62) and "Organic traffic dropped" (188, −55)** — both improving (fewer pages newly declining than in the prior period), consistent with the top-3 erosion having halted per the 08-19 review.
- **"Changed pages not submitted to IndexNow" down 6,923** — improving, low-priority automation either way.

## BENIGN / INTENTIONAL — no action

- **Noindex/nofollow pages up ~197** (`Noindex page` 716 +196, `Noindex follow` 488 +149, `Noindex and nofollow` 228 +47) **paired with matching jumps in missing meta-description (482 +196) and missing H1 (436 +150).** Sampled URLs are exclusively WordPress `/tag/*`, `/category/*` archives and deep pagination (`/concrete-pump/page/3/` etc.) — thin taxonomy/archive pages, correctly noindexed, and archive templates don't carry custom meta/H1 by design. Reads as deliberate hygiene, not a regression. **One thing worth a glance:** `/category/motor-grader/` exists as a duplicate URL alongside the real hub `/motor-grader/` — a WordPress blog-category-taxonomy name colliding with the product-category slug. Cosmetic; rename the blog taxonomy term if it bothers you, otherwise ignore.
- **Robots.txt, CSS, JavaScript: zero issues across the board** — clean.
- **Duplicate pages without canonical: 0; canonical-to-4xx/5xx/redirect: 0; external link errors: 0** — clean (the 9 broken-canonical pages Semrush found are a different, narrower check Ahrefs doesn't flag the same way — both packages stand).
- **AI Discoverability: bots not blocked (0 on both "blocked from all/some AI search bots"), no inconsistent AI-bot policy.** Healthy.

## Tiny, low-priority — roll into general cleanup, no dedicated effort

- `Page size exceeds 2 MB`: 1 page (`/excavator/sany/`, a brand hub listing many models — expected to be heavy).
- `Image broken`: 1 new. `Image file size too large`: 3 new.
- `H1 tag changed` / `Title tag changed` / `Meta description changed` / `Word count changed`: large "changed" counts (5,700+ each) — these are churn trackers, not defects; they reflect the ongoing title/meta/content rewrite work across sessions. No action.

## Sequence
1. **Now → Saurav:** flag Finding 1 (dozer compare 404s) — real growth opportunity half-shipped, needs a decision on finish-vs-suppress.
2. **S-EXEC priority queue, once WP access exists:** Finding 3 (alt-text template fix, ~40 images, clears ~80% of all warnings) → Finding 1's chosen path → Finding 2 (motor-grader image root-cause) → Finding 4 (compare-template schema review).
3. **Next Ahrefs crawl:** re-check Findings 1–2 counts as the resolution signal; confirm the CWV-linked positive signals (AI-crawler response time, title/SERP match) continue improving.
