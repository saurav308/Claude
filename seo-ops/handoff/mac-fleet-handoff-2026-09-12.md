# DesiMachines SEO Fix Handoff — ORCH → Mac Fleet Session

*Compiled 2026-09-12*

## 0. What this document is

This is a consolidated, prioritized handoff of SEO/technical findings and ready-to-ship content, prepared by **ORCH** — a cloud-based Claude session that performs SEO research, technical diagnosis, and content drafting for desimachines.com but **has no WordPress access and no live-site network access**. ORCH cannot deploy anything itself.

This document is being handed to **the Mac-based fleet Claude Code session**, which has **confirmed live WordPress write access** to desimachines.com. The site owner (Saurav) is manually relaying this document between the two sessions — there is no direct connection between ORCH and the fleet.

**Before doing anything in this document, check your own recent work and logs first.** The Mac fleet runs two recurring tasks that may already have addressed some items below:

- **`desimachines-weekly-audit-fix`** — Saturdays 09:08, uses Ahrefs/Semrush data. ORCH's registry flags this as *"very likely the owner of the Semrush/Ahrefs technical fixes"* tracked in this document — i.e., it may already be scoped to pick up exactly the kind of Semrush/Ahrefs technical issues listed in Section 2(a)/(b) below.
- **`desimachines-seo-dashboard-weekly`** — Tuesdays 00:01. ORCH's best guess as the pipeline that shipped a batch of production fixes on 2026-09-08 (dozer noindex fix, a real `/disclaimer/` page, an author-indexing fix) — each was marked "Verified on production" per the registry.

**Important caveat from ORCH's own registry:** ownership of items in this document by either of these two tasks is *inferred from naming/cadence/one day of Insights Log evidence — it is not confirmed by Saurav*. ORCH's registry explicitly says not to assume coverage and not to re-produce fix content on a cadence without Saurav's confirmation either way. So: **check logs/history for these two tasks before re-doing any item below**, but do not assume silence in those logs means "not done" — when in doubt, do a fast live check against production before spending effort, and report back either way (see Section 5).

Every item below cites the exact ORCH source file it came from, in the repo at `/home/user/Claude/seo-ops/...`, so you (or Saurav) can trace anything back to source. All URLs, mappings, and content blocks are reproduced **verbatim** — nothing has been paraphrased.

---

## Table of contents

- 1. Status flags / critical context
- 2(a). VERIFY FIRST — may already be fixed or in progress
- 2(b). HIGH PRIORITY — new / not yet addressed
- 2(c). CONTENT READY TO PUBLISH — organized by target URL
- 2(d). BLOCKED ON SAURAV — do not attempt, do not invent data
- 3. Adjacent items worth noting (not a direct ask, flagged for awareness)
- 4. Process/mechanics rules to follow when applying any of this
- 5. Status reporting — what to send back, and to whom

---

## 1. Status flags / critical context

- **Semrush F4 is the only fix item marked CLOSED anywhere in ORCH's files** — closed 2026-09-12, confirmed by ORCH via Semrush MCP. Everything else across all three technical-fix files remains OPEN/unapplied as of each file's latest status check.
- `seo-ops/fixes/technical-fixes-final.md` (dated 2026-09-05) states, as of that date, **none of its ship-ready fixes had been applied**, and explicitly says: *"S-EXEC, the session chartered to apply these, no longer exists"* (its session ID returns "not found," likely reclaimed after 8+ days idle). These items have had **no confirmed owner** since 2026-09-05 — this handoff exists to give them one.
- That file's reconfirmation of Semrush F4 as "unfixed, unchanged" is dated 2026-09-05, i.e. it **predates and is superseded by** the 2026-09-12 closure below. Do not treat the 09-05 file's F4 language as current.
- As of 2026-09-12, a **new, large-scale technical issue was discovered that supersedes nothing but adds to the list**: a ~190x spike in Semrush's Product-schema markup-error count (Section 2(b), item NEW-1). This is not in any of the three fix-package files — it surfaced only in ORCH's 2026-09-12 daily log.
- A **three-way contradiction exists on the `/disclaimer/` page** (Section 2(a)) — three different sources disagree on whether it's fixed, and this needs resolving before it's marked done anywhere.

---

## 2(a). VERIFY FIRST — do not redo without checking

These are items ORCH believes may already be fixed, partially fixed, or in progress via fleet activity. **Check production and your own task logs before spending effort on any of these.**

### V1 — `/compare/` HTTP 500 errors (53 URLs flagged, 5 spot-checked clean, 48 still unverified)

- **Source:** ORCH daily logs `seo-ops/logs/orch/2026-09-08-daily.md`, `2026-09-11-daily.md`, `2026-09-12-daily.md`.
- **Background:** The sheet's Crawl Audit tab (dated 09-08, now stale) sampled 121 URLs; **53 returned HTTP 500**, all `/compare/*` URLs, spanning every equipment category (excavator, backhoe-loader, motor-grader, crane, concrete-pump, self-loading-concrete-mixer, transit-mixer, wheel-loader, compactor, skid-steer-loader) — both category hub pages and individual model-vs-model pages. All 53 shared symptoms: no H1, no canonical, duplicate title, no meta description.
- **09-12 finding:** A fresh Semrush site-audit crawl (finished 09-12 07:31 UTC, first since 08-29) found **zero pages sitewide with a 5xx status** (issue 38 "5xx errors": 0/20,000 pages crawled). Semrush's `page_info` report was used to spot-check **5 specific URLs** directly, all confirmed **NOT** 500ing, with real content/titles present and only routine warnings:
  1. `/compare/excavator/`
  2. `/compare/motor-grader/`
  3. `/compare/crane/`
  4. `/compare/backhoe-loader/`
  5. `/compare/jcb-345lc-hd-vs-liebherr-r-928-litronic-excavator/`
- **What is still unverified:** the remaining **48 of the original 53 flagged URLs** — including concrete-pump, self-loading-concrete-mixer, transit-mixer, wheel-loader, compactor, and skid-steer-loader `/compare/` pages, the dozer-category compare pages, and any other model-vs-model URLs among the 53 not named above. The sheet's own Crawl Audit tab has **not re-run** since 09-08 (4+ days stale as of 09-12) and so cannot independently corroborate the fix.
- **ORCH's explicit characterization:** *"likely fixed, not confirmed fixed."*
- **What to do:** Before doing any `/compare/` work in this document, run a fresh crawl audit (or spot-check the remaining ~48 URLs directly, or at minimum a broad sample across the categories not yet spot-checked: concrete-pump, self-loading-concrete-mixer, transit-mixer, wheel-loader, compactor, skid-steer-loader, dozer). If your `desimachines-weekly-audit-fix` task already re-crawled since 09-08, pull that result instead of re-crawling. **Report back which of the 48 are now confirmed clean** (see Section 5) so ORCH can close this formally instead of re-flagging it.

### V2 — Semrush F4: 9 compare-page canonical errors (issue 38)

- **Source:** `seo-ops/fixes/semrush-audit-fix-package.md`; closure confirmed in `seo-ops/logs/orch/2026-09-12-daily.md`.
- **Status: ✅ CLOSED 2026-09-12.** Confirmed via Semrush Site Audit snapshot `6aa4aea26246167e456577f1` (finished 2026-09-12 07:31 UTC): issue 38 count is now **0** (was 10 in the 08-29 snapshot, 9 as originally flagged). Verified by ORCH via Semrush MCP (`history` report, 3-snapshot trend: 08-22 baseline → 10 (08-29) → 0 (09-12)).
- **Caveat, verbatim from ORCH:** this is *"not yet independently re-checked page-by-page against the 9 URLs below, but the aggregate count hitting zero across a fresh 20,000-page crawl is strong evidence."* Owner/fixer is unconfirmed — ORCH believes it's most likely the same fleet pipeline that also appears to have resolved the `/compare/` HTTP 500 issue (V1 above) and shipped a large Core Web Vitals improvement (slow-page count 7,981→826) in the same window.
- **Action needed: light verification only, not a fix.** Spot-check a few of the 9 URLs below to confirm each now either self-canonicalizes or points at a URL that actually exists. **Do not re-apply the fix if it's already correct** — just confirm and report.
- **Exact affected pages, source → previously-broken canonical target (verbatim):**
  - `/compare/xcmg-xe140i-infra-vs-sany-sy120c-9-excavator/` → sany-sy120c-9-vs-xcmg-xe140i-infra
  - `/compare/sany-sy390c-10hd-grama-vs-jcb-345lc-hd-excavator/` → jcb-345lc-hd-vs-sany-sy390c-10hd-grama
  - `/compare/sany-stg140c-10-vs-fine-fmg-985-hd-motor-grader/` → fine-fmg-985-hd-vs-sany-stg140c-10
  - `/compare/mahindra-earthmaster-vx-vs-escorts-digmax-super-backhoe-loader/` → escorts-digmax-super-vs-mahindra-earthmaster-vx
  - `/compare/mahindra-earthmaster-vx-vs-case-770-nx-magnum-backhoe-loader/` → case-770-nx-magnum-vs-mahindra-earthmaster-vx
  - `/compare/liugong-935e-hd-vs-liebherr-r-938-litronic-excavator/` → liebherr-r-938-litronic-vs-liugong-935e-hd
  - `/compare/liugong-935e-hd-vs-liebherr-r-928-litronic-excavator/` → liebherr-r-928-litronic-vs-liugong-935e-hd
  - `/compare/liebherr-r-938-litronic-vs-jcb-345lc-hd-excavator/` → jcb-345lc-hd-vs-liebherr-r-938-litronic
  - `/compare/jcb-455-5n-vs-cat-950gc-wheel-loader/` → cat-950gc-vs-jcb-455-5n
- One of these 9 (`/compare/jcb-345lc-hd-vs-liebherr-r-928-litronic-excavator/`) is also in the V1 spot-check list above and was independently confirmed not-500ing — so it's doubly verified on that dimension, but still not confirmed on the *canonical-target* dimension specifically.

### V3 — Dozer noindex fix, `/disclaimer/` page, author-indexing fix (09-08 batch)

- **Source:** ORCH `registry.md`, referencing `seo-ops/logs/orch/2026-09-08-daily.md`.
- Registry documents this batch as **already fixed and "Verified on production"** by (most likely) `desimachines-seo-dashboard-weekly`:
  - Dozer product/category **noindex** removed (41 products + parent + 3/4 child categories).
  - A **real `/disclaimer/` page** shipped, superseding an old dead-JS-modal version — **but see item V4 immediately below: this is contradicted by a live 404 seen as late as 09-11/09-12. Do not mark this closed without resolving V4 first.**
  - An **author-indexing bug** fix (Chayan Sarkar, 48 articles + a new `/authors/` hub).
- **Explicitly NOT the same fix** as the dozer compare-page 404 issue in Section 2(d) — do not assume the 518 dozer `/compare/` 404s are resolved by this. They are a separate, still-open problem.
- **Action:** Spot-check these three are genuinely live before assuming they need no further work. If they check out, no action needed beyond reporting confirmation.

### V4 — `/disclaimer/` three-way contradiction (unresolved as of 09-12)

- **Source:** `seo-ops/logs/orch/2026-09-11-daily.md`, reconfirmed unresolved in `2026-09-12-daily.md`.
- Three sources disagree, verbatim:
  1. **Action Plan CLOSED-archive (from July)** calls `/disclaimer/` a **"non-issue."**
  2. **09-08 Insights Log entry** states the disclaimer page was **"FIXED... live, indexed"** — the 09-08 log itself describes it as: a real `/disclaimer/` page was shipped, *"the footer link had been a dead JS modal since at least July, misclassified in the Action Plan as 'non-issue.'"*
  3. **Sheet1's own crawl row for `/disclaimer/`**, as of the 09-11 pull (and still as of the stale 09-08 audit referenced again on 09-12), shows **HTTP 404 / PAGE MISSING.**
- **Status per ORCH as of 09-12:** *"Unreconciled."* No new Insights Log entries to update it, no Saurav reply.
- **Action needed:** Load `https://desimachines.com/disclaimer/` directly and check the actual HTTP status. If it's genuinely live (200), the crawl-audit row is stale data and should be corrected/re-run. If it's genuinely 404, the "FIXED" Insights Log entry from 09-08 was wrong or the page regressed — investigate and either restore it or correct the record. **This needs a definitive answer, not another data point** — report the resolution back per Section 5 so ORCH can close the loop.

### V5 — AIO / price-range widening action (check before touching pricing content)

- **Source:** `registry.md`, referencing the 09-08 log.
- Registry notes: *"the other pipeline queued an action to widen the published price range"* in response to InfraJunction taking the "backhoe loader price in india" headline slot in AI Overviews. This is separate from the 169-missing-prices item (Section 2(d)) but touches the same pricing content.
- **Action:** Check whether this was actioned before doing any pricing-adjacent work from Section 2(c) (several ready-to-publish blocks below quote specific price ranges, e.g. JCB backhoe loader ₹22 lakh–₹35 lakh). If the price-range widening already shipped, make sure the price figures you publish from Section 2(c) are still consistent with it — don't publish stale numbers if a wider range has already gone live elsewhere on the site.

### V6 — Semrush F6 (slow-page / CWV) — partially addressed, re-check the count

- **Source:** `seo-ops/fixes/semrush-audit-fix-package.md`; context updated in `seo-ops/logs/orch/2026-09-12-daily.md`.
- Not a discrete fix, a monitoring item. Verbatim from the original file: *"Load-time threshold breaches concentrated on PDP/brand/compare templates... Saurav's 08-19 CWV changes target exactly this."* Original action: *"no new work — use the next weekly Semrush audit (~08-29) as the independent before/after for the CWV ship."*
- **09-12 update:** the 09-12 Semrush snapshot shows a large improvement in slow-page count (7,981→826, per the F4 closure note's context) and other deltas: permanent redirects 21,729→2,511 (−19,218); outdated content 5,134→4,123; content-not-optimized 17,490→15,702; pages-with-one-internal-link 194→24; pages-not-crawled 41→3.
- **Action:** No fix work needed. Just confirm the 7,981→826 slow-page improvement and the redirect-count drop line up with work your own tasks did (the permanent-redirects drop looks consistent with Semrush F1's trailing-slash fix, item T1 below, having already been applied somewhere — if it has, don't reapply it, just confirm and report; if it hasn't been applied and this drop has some other explanation, F1 in Section 2(b) is still open).

---

## 2(b). HIGH PRIORITY — NEW / NOT YET ADDRESSED

These have **no evidence anywhere in ORCH's files or logs that they have been fixed**. Verify quickly per Section 2(a)'s instruction (check your task logs), but treat these as open unless you find contrary evidence.

### NEW-1 — Product-schema markup errors spiked ~190x (Semrush issue 45) — the single largest technical-health signal on the site right now

- **Source:** `seo-ops/logs/orch/2026-09-12-daily.md` (newly discovered this cycle — not in any of the three fix-package files).
- **Semrush issue 45 ("Structured data that contains markup errors")** jumped from **180 (08-29 snapshot) to 34,368 (09-12 snapshot)** — a **~190x increase** — and is now the single largest driver of Semrush's total error count (**35,316 total errors, up from ~8,300**).
- **Root cause identified:** Product schema markup missing required fields — **`aggregateRating`, `offers`, and `review`**.
- **Sampled affected pages (page-type patterns, no specific URL list given):** individual `/compare/*` model-vs-model pages, and `/wheel-loader/*` product pages.
- **ORCH's assessment, verbatim:** *"reads as a sitewide Product-schema template issue (possibly introduced by the same deploy that fixed the 500s and the canonical issue), not a one-off."*
- **Status: not actioned this cycle** — ORCH flags it *"for the next content/technical pass, since it's now the dominant technical-health signal in Semrush's data."*
- **This directly overlaps with two existing items you should read together:**
  - **Semrush F2b** (below): *"template rule: when a product has no price, suppress the bare Product JSON-LD block (or output it only once a real offer/review exists). Do NOT paper over with fabricated aggregateRating — the hardcoded 4.5 pattern is already a schema-spam risk."* (Source: `seo-ops/fixes/semrush-audit-fix-package.md`)
  - **Ahrefs Finding 4** (below): schema errors extend beyond unpriced products — compare pages across excavator, telehandler, backhoe-loader verticals show `schema.org validation error` (121, +11) and `Google rich results validation error` (183, +15), both growing, independent of whether the product has a price. (Source: `seo-ops/fixes/ahrefs-site-audit-fix-package.md`)
- **Action needed:** Given the magnitude (180→34,368) and the fact this appeared in the same window as other template-level deploys, this needs an actual template/code review of the Product JSON-LD generation on `/compare/*` and `/wheel-loader/*` pages — find out what changed and fix at the template level. Do not attempt to hand-patch 34,368 pages individually. Treat F2b + Ahrefs Finding 4 + NEW-1 as one investigation, not three.

### T1 — Semrush F1: site-wide nav links missing trailing slash (issue 214)

- **Source:** `seo-ops/fixes/semrush-audit-fix-package.md`.
- **Affected URLs:** `https://desimachines.com/skid-steer-loader` and `https://desimachines.com/telehandler` (no trailing slash) — internally linked from every crawled page (site-wide header/footer menu template); each 301-redirects to its slash version.
- **Impact:** 21,776 "permanent redirect" notices.
- **Fix, verbatim:** *"edit the menu items — add the trailing slash to both. One edit, ~20k notices gone, every internal click saved a redirect."*
- **Owner:** WP Appearance → Menus. No approval gate needed (content edit, not a redirect rule).
- **Status: unconfirmed either way** — the 09-12 log's redirect-count drop (21,729→2,511, see V6 above) is *suggestive* this may already be done, but was not explicitly attributed to this fix. **Check the menu items directly before doing this** — if the trailing slash is already there, this is done; report it as already-done rather than re-editing.

### T2 — Semrush F3: self-compare page (issue 2)

- **Source:** `seo-ops/fixes/semrush-audit-fix-package.md`, reconfirmed unfixed in `seo-ops/fixes/technical-fixes-final.md` (09-05).
- **Affected URL:** `/compare/manitou-1340r-vs-manitou-1340r-skid-steer-loader/` — the site's only 4xx as of the original audit. A compare-generator bug created an X-vs-X page; it 404s but is internally linked.
- **Fix, verbatim:** *"remove it + its inlinks; add a generator guard `left != right`."*

### T3 — Semrush F5: 16 duplicate compare-page titles (issue 6)

- **Source:** `seo-ops/fixes/semrush-audit-fix-package.md`; ship-ready corrected titles in `seo-ops/fixes/technical-fixes-final.md`.
- **Root cause, verbatim:** *"All pairs where the title template collapses model variants: Manitou "MBL 745 HT" vs "MBL 745 HT Plus", Hyundai "Smart" vs "Smart-X", Bull "BS4 Champion" vs "BS5 Super Smart" (full 16-URL list in audit; all /compare/)."*
- **Fix, verbatim:** *"title generator must use the full variant name (include "Plus"/"X"/BS-series token)."*
- **Content is ready to ship — see Section 2(c), "F5 — 16 duplicate compare-page titles" table below** for the full verbatim 16-row URL → corrected-title mapping.
- **Implementation note, verbatim:** *"Apply via the same RankMath `rank_math_title` mechanism as the July batch. Each title is now unique — verify with a duplicate-title check before/after."*

### T4 — Semrush F7 / Ahrefs Finding 3: ~720 / 20,027-page missing ALT text — one template-level fix

- **Source:** `seo-ops/fixes/semrush-audit-fix-package.md` (F7) and `seo-ops/fixes/ahrefs-site-audit-fix-package.md` (Finding 3), same underlying defect, confirmed cross-referenced; ship-ready complete mapping in `seo-ops/fixes/technical-fixes-final.md`.
- Semrush counts 720 missing-ALT instances (issue 110), mostly theme assets, e.g. `/wp-content/themes/construction-equipments/assets/img/product/add-to-cart.png` repeated across pages. Ahrefs counts the same defect by **affected page**: 20,027 of 25,022 pages (80%) — *"the single largest count in the whole audit, and functionally the entire warnings bucket."*
- **Root cause, verbatim (Ahrefs):** *"every shared template image carries `alt=""` — the site logo, the 8 category nav icons..., UI icons..., and the ~40 bank/insurance partner logos... that appear on every finance/insurance CTA block sitewide. Because these ~50 shared assets render on nearly every page, one page's empty alt becomes 20,000+ page-level flags."* Elevated priority per Ahrefs: *"Elevate priority."*
- **Content is ready to ship — see Section 2(c), "Sitewide ALT text mapping (~57 images)" below** for the full verbatim filename → alt-text lookup table (logo, category nav icons, UI icons, bank logos, insurance logos, OEM logo).
- **Implementation note, verbatim:** *"this is a theme/template-level fix, not per-post content — apply via the theme's image-render function or a one-time DB update matching `src LIKE` the filename patterns above. A single deploy should clear the vast majority of the 20,027-page count; re-run the Ahrefs audit afterward to confirm (target: drop to low hundreds — the residual will be genuine per-product photos still missing alt text, a separate, smaller cleanup)."*

### T5 — Semrush F8: 733 "Read More" non-descriptive anchors (issue 217)

- **Source:** `seo-ops/fixes/semrush-audit-fix-package.md`.
- **Fix, verbatim:** *"Fix in template: "View [model] price & specs". Fold into internal-linking work."*

### T6 — Semrush F9: 131 hreflang conflicts (issue 24)

- **Source:** `seo-ops/fixes/semrush-audit-fix-package.md`. Low urgency.
- **Details, verbatim:** *"all on parameter/filter URLs (`/opportunities/?state=…&sort=…`, `?swoof=` filters) plus oddities: `/tamil.nadu/` (malformed URL — should it exist?) and `/used-construction-equipment/` (a used page exists despite the pillar being parked)."*
- **Fix, verbatim:** *"emit hreflang/locale tags only on canonical URLs; inspect the two odd URLs."*

### T7 — Ahrefs Finding 2: 283 broken images, 100% on `/motor-grader/` — root cause not isolated, now actionable with WP access

- **Source:** `seo-ops/fixes/ahrefs-site-audit-fix-package.md`, reconfirmed unresolved and still un-isolated in `seo-ops/fixes/technical-fixes-final.md` (09-05); registry.md (via 09-08 log) notes still "unaddressed" as of that date with no update in 09-11/09-12 logs.
- **Details, verbatim:** *"issue `Page has broken image` jumped from 0 to 283, all new. Sampled 130 — 100% are `/motor-grader/<model>/` product pages and `/compare/*-motor-grader/` pages — an existing, live, previously-healthy vertical with real search traffic (GSC: "grader machine" ~5,200/mo, page currently pos 13.8, slid from 11.7)."*
- **Root cause notes, verbatim (not fully isolated by ORCH — blocked on live access, which the fleet now has):** *"Pulled full raw HTML of one affected page (`/motor-grader/cat-120/`) — confirms two things: (a) the page uses a lazy-load pattern (SVG placeholder → `data-lazy-src` swap) consistently across ~370 images, and (b) I could not identify the single broken image URL from static HTML alone... This needs S-EXEC or the dev team to check, once access exists: did a motor-grader-specific image path/CDN/upload batch change or go missing around the same time the dozer vertical shipped? The concentration on exactly one vertical (not site-wide) rules out a global plugin regression and points at something scoped to motor-grader's product data or image folder."*
- **Action needed:** With live WP/CDN access, pull `site-audit-page-info` (or equivalent) per-URL to get the exact broken `src`, then find the pattern (one folder, one missing upload batch, one data-import error) and batch-fix.

### T8 — Ahrefs Finding 4: compare-page schema errors extend beyond unpriced products

- **Source:** `seo-ops/fixes/ahrefs-site-audit-fix-package.md`, reconfirmed unchanged in `seo-ops/fixes/technical-fixes-final.md` (09-05).
- **Details, verbatim:** *"Semrush's package attributed structured-data errors to unpriced-product pages only. Ahrefs' `schema.org validation error` (121, +11) and `Google rich results validation error` (183, +15) — both growing — sampled URLs show compare pages across multiple verticals (excavator, telehandler, backhoe-loader), not just unpriced products. The unpriced-product fix (Semrush F2) is still correct and should ship, but it will not clear all schema errors — the compare-page template likely has its own structured-data issue (possibly Product/Review schema emitted on comparison pages where it doesn't cleanly apply). Needs a second, compare-template-specific schema review once S-EXEC has page access."*
- **Fold this into NEW-1's investigation above** — same symptom class, same templates (`/compare/*`), likely the same root fix.

### T9 — Ahrefs Finding 1: ~500 dozer compare pages 404 — generator was never run for this category

- **Source:** `seo-ops/fixes/ahrefs-site-audit-fix-package.md`, reconfirmed 100% present in `seo-ops/fixes/technical-fixes-final.md` (09-05); still open per `registry.md` through 09-12 logs.
- **Note:** the *decision* of which fix path to take is Blocked on Saurav (see Section 2(d), item B2) — but the **investigation/prep work** described here is not blocked and can proceed now that the fleet has WP access.
- **Details, verbatim:** *"issue `4XX page` / `404 page` jumped from ~1 to 518 URLs, 517 of them brand new (added=0, new=517, removed=0). Sampled 200 of the 404s directly — 100% are `/compare/<model>-vs-<model>-dozer/` URLs (BEML, CAT, Komatsu, Shantui, SEM, Zoomlion, LiuGong, Case model pairs — dozens of pairings)."*
- **Root cause, verbatim:** *"`https://desimachines.com/dozer/` is a fully-built, live category hub — 41 dozer products, real pricing table (₹30 lakh–₹2.2 Cr by model), brand list, finance/insurance CTAs, full editorial content... The individual dozer product pages exist. The compare-page generator was never run for the dozer category — live-fetch of a sampled compare URL returns `CRAWL_NOT_FOUND`, confirming the page genuinely doesn't exist, not a crawl artifact."*
- **Action needed now (not blocked):** *"S-EXEC to investigate the compare-page generator's category config once WP access lands and prepare whichever path Saurav picks."* Go find the generator's category config, confirm dozer is excluded/missing, and have both fix paths (below) ready to execute the moment Saurav decides:
  1. (Recommended) *"Finish it — run/trigger the compare-page generator for the "dozer" category, the same generator already used for excavator/backhoe-loader/crane/etc. This converts ~500 dead links into the actual growth surface the Insights Log identified..."*
  2. (Interim, if #1 needs more time) *"Suppress/remove the internal links generating these dead compare URLs (likely a "popular comparisons" or cross-link module scoped to all categories, not yet excluding dozer) so the 404s stop accumulating crawl waste and dead-end visitor paths, until the compare pages are ready."*
- Registry explicitly notes this needs a **"finish-vs-suppress decision... from Saurav"** — see Section 2(d), item B2.

---

## 2(c). CONTENT READY TO PUBLISH — organized by target URL

Everything in this section is finished, ship-ready copy. Preserve the text **exactly** when pasting into RankMath / WordPress — do not edit wording, only the mechanics of where it goes (see Section 4 for placement rules). Follow the batching/validation rules in Section 4 before publishing any of it.

### C1 — `/backhoe-loader/jcb/`
**Source:** `seo-ops/content/aeo-hub-rewrites.md`, Item 1. **Change type:** Title rewrite + meta description rewrite + answer-first opening block insertion + new FAQPage JSON-LD schema.

**Title (≤60 char):**
`JCB Backhoe Loader Price in India 2026 | Models & Specs`

**Meta description (≤155 char):**
`See JCB backhoe loader prices, EMI, and specs for every model sold in India — 3DX, 3DX Plus, 3DX Super, 4DX. Compare and connect with a dealer.`

**Answer-first opening (insert as first paragraph, above existing content):**
> JCB backhoe loaders in India range from **₹22 lakh to ₹35 lakh** ex-showroom depending on the model (3DX, 3DX Plus, 3DX Super, 3DX Xtra, 4DX) and state. The 3DX is JCB's best-selling model, with a 76 HP engine and 0.9m³ bucket capacity. Prices below are updated for 2026 and vary by dealer location, financing terms, and attachments.

**FAQPage JSON-LD:**
```json
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {
      "@type": "Question",
      "name": "What is the price of a JCB backhoe loader in India?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "JCB backhoe loader prices in India range from approximately ₹22 lakh to ₹35 lakh ex-showroom, depending on the model and location. The JCB 3DX, the most popular model, typically starts around ₹28 lakh."
      }
    },
    {
      "@type": "Question",
      "name": "Which JCB backhoe loader model is best for Indian conditions?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "The JCB 3DX is the most widely used model in India due to its balance of power, fuel efficiency, and parts availability. The 3DX Plus and 3DX Super add higher horsepower and hydraulic capacity for heavier-duty work."
      }
    },
    {
      "@type": "Question",
      "name": "What is the EMI for a JCB backhoe loader?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "EMI on a JCB backhoe loader typically starts around ₹55,000–₹60,000 per month on a standard finance tenure, depending on down payment, interest rate, and loan term. Use the on-page EMI calculator for an exact figure by model."
      }
    }
  ]
}
```

---

### C2 — `/manufacturers-and-brands-guide/jcb-equipment-price-india/`
**Source:** `seo-ops/content/aeo-hub-rewrites.md`, Item 2. **Flagged as the highest-ROI single edit on the site.** **Change type:** Title rewrite + meta description rewrite + answer-first opening + new FAQPage JSON-LD schema.

**Title:**
`JCB Price List India 2026 — All Models & On-Road Price`

**Meta description:**
`Full JCB price list for India: backhoe loaders, excavators, wheel loaders. On-road & ex-showroom prices by model, updated 2026. Compare before you buy.`

**Answer-first opening:**
> JCB equipment prices in India start from **₹22 lakh** for the 3DX backhoe loader and go up to **₹85 lakh+** for larger excavators and wheel loaders. This guide lists ex-showroom and on-road prices for every JCB model sold in India as of 2026, including the 3DX, 3DX Plus, 4DX, and NXT excavator range.

**FAQPage JSON-LD:**
```json
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {
      "@type": "Question",
      "name": "What is the on-road price of JCB in India?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "On-road JCB prices in India are typically 3–8% higher than ex-showroom prices, covering RTO registration, road tax, and insurance. A JCB 3DX with an ex-showroom price of ₹28 lakh usually costs ₹29–30 lakh on-road, varying by state."
      }
    },
    {
      "@type": "Question",
      "name": "What is the cheapest JCB machine price in India?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "The most affordable JCB models in India are compact backhoe loaders and mini excavators, starting around ₹22–24 lakh ex-showroom. Larger excavators and wheel loaders cost significantly more."
      }
    }
  ]
}
```

---

### C3 — `/backhoe-loader/` (category hub)
**Source:** `seo-ops/content/aeo-hub-rewrites.md`, Item 3. **Change type:** Title rewrite + meta description rewrite + answer-first opening + new FAQPage JSON-LD schema.

**Title:**
`Backhoe Loader Price in India 2026 | Compare All Brands`

**Meta description:**
`Compare backhoe loader prices, specs & EMI from JCB, Case, Escorts Kubota, Mahindra & more. 50+ models, updated 2026 pricing, finance options.`

**Answer-first opening:**
> A backhoe loader in India costs between **₹18 lakh and ₹38 lakh** depending on brand, engine power (55–92 HP), and features. JCB, Case, Escorts Kubota, Mahindra, and ACE are the leading brands sold in India. This page compares current models, specifications, and on-road prices across all major manufacturers.

**FAQPage JSON-LD:**
```json
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {
      "@type": "Question",
      "name": "What is a backhoe loader used for?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "A backhoe loader is a construction machine combining a front loader bucket and a rear digging arm (backhoe), used for excavation, trenching, loading material, and light demolition on construction sites, roadwork, and agricultural projects."
      }
    },
    {
      "@type": "Question",
      "name": "Which backhoe loader brand is best in India?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "JCB holds the largest market share in India and is the generic name many buyers use for the category. Case, Escorts Kubota, Mahindra, and ACE are the other major brands, each competitive on price and after-sales support depending on region."
      }
    },
    {
      "@type": "Question",
      "name": "What is the price range of a backhoe loader?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "Backhoe loader prices in India range from about ₹18 lakh for entry-level 2WD models to ₹38 lakh for high-horsepower 4WD models with advanced hydraulics."
      }
    }
  ]
}
```

---

### C4 — `/crane/` (category hub)
**Source:** `seo-ops/content/aeo-hub-rewrites.md`, Item 4. **Change type:** Title rewrite + meta description rewrite + answer-first opening + new FAQPage JSON-LD schema.

**Title:**
`Crane Price in India 2026 | Hydra, Pick & Carry & Mobile`

**Meta description:**
`Compare crane prices in India — Hydra cranes, pick-and-carry cranes, mobile cranes. Specs, capacity, EMI options from ACE, Escorts & more, updated 2026.`

**Answer-first opening:**
> Crane prices in India range from **₹15 lakh** for a small hydra crane (9–12 ton capacity) to **₹60 lakh+** for larger pick-and-carry and mobile cranes. "Hydra" is the common name used across India for pick-and-carry cranes, led by ACE and Escorts (Farana). This page compares current models by lifting capacity, reach, and price.

**FAQPage JSON-LD:**
```json
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {
      "@type": "Question",
      "name": "What is the price of a hydra crane in India?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "Hydra (pick-and-carry) crane prices in India range from around ₹15 lakh for 9-ton capacity models to ₹45 lakh+ for 25-ton and larger capacity models, depending on brand and reach."
      }
    },
    {
      "@type": "Question",
      "name": "What is the difference between a hydra crane and a mobile crane?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "A hydra crane (pick-and-carry crane) is a compact, highly maneuverable crane designed to lift and carry loads over short distances on-site. A mobile crane is typically larger, truck-mounted, and built for longer-distance transport and higher lifting heights."
      }
    }
  ]
}
```

---

### C5 — `/excavator/` (category hub)
**Source:** `seo-ops/content/aeo-hub-rewrites.md`, Item 5. **Change type:** Title rewrite + meta description rewrite + answer-first opening + new FAQPage JSON-LD schema.

**Title:**
`Excavator Price in India 2026 | Poclain, JCB, Tata Hitachi`

**Meta description:**
`Compare excavator (poclain machine) prices in India — mini, compact & heavy excavators from JCB, Tata Hitachi, Komatsu, CAT. Specs & EMI, updated 2026.`

**Answer-first opening:**
> Excavator (commonly called "poclain machine" in India) prices range from **₹18 lakh** for mini excavators to **₹85 lakh+** for large heavy excavators. Popular brands include JCB, Tata Hitachi, Komatsu, and CAT. "Poclain" is a widely used generic term across India for hydraulic excavators, named after an early manufacturer, not a current brand.

**FAQPage JSON-LD:**
```json
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {
      "@type": "Question",
      "name": "What is a poclain machine?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "\"Poclain machine\" is a common Indian term for a hydraulic excavator, named after the French company Poclain that pioneered hydraulic excavators. Today the term is used generically for excavators from any brand, similar to how \"JCB\" is used for backhoe loaders."
      }
    },
    {
      "@type": "Question",
      "name": "What is the price of a poclain machine in India?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "Excavator (poclain machine) prices in India range from about ₹18 lakh for mini excavators to ₹85 lakh or more for large heavy excavators, depending on operating weight, brand, and features."
      }
    }
  ]
}
```

---

### C6 — `/crane/hydra/`
**Source:** `seo-ops/content/aeo-hub-rewrites.md`, Item 6. **Change type:** Title rewrite + meta description rewrite + answer-first opening + new FAQPage JSON-LD schema.

**Title:**
`Hydra Crane Price in India 2026 | 9 to 25 Ton Models`

**Meta description:**
`Hydra crane (pick-and-carry) prices from 9-ton to 25-ton capacity. ACE, Escorts Farana models compared — specs, lifting charts, EMI. Updated 2026.`

**Answer-first opening:**
> A hydra crane (pick-and-carry crane) in India costs **₹15 lakh to ₹45 lakh** depending on lifting capacity, from 9-ton compact models to 25-ton heavy-duty models. ACE and Escorts (branded "Farana") are the two dominant manufacturers. This page compares current hydra crane models by capacity, boom reach, and price.

**FAQPage JSON-LD** (source note, verbatim, unresolved: *"also add a Hindi variant if the page has a Hindi/Hinglish section, given the "हाइड्रा मशीन" query volume — flag to whoever owns the Hindi-unpark decision"* — **no Hindi FAQ text was written, only English is provided below. Do not invent a Hindi version — see Section 2(d), item B5.**):
```json
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {
      "@type": "Question",
      "name": "What is a hydra machine used for?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "A hydra machine (pick-and-carry crane) is used to lift and transport heavy loads over short distances on construction sites, warehouses, and material yards — commonly for loading/unloading trucks, placing precast concrete, and site material handling."
      }
    },
    {
      "@type": "Question",
      "name": "How much does a hydra crane cost?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "Hydra crane prices in India start around ₹15 lakh for 9-ton capacity models and go up to ₹45 lakh for 25-ton capacity models, varying by brand and features."
      }
    }
  ]
}
```

---

### C7 — `/wheel-loader/` (category hub)
**Source:** `seo-ops/content/aeo-hub-rewrites.md`, Item 7. **Change type:** Title rewrite + meta description rewrite + answer-first opening + new FAQPage JSON-LD schema.

**Note:** `/wheel-loader/*` pages are also named as sampled affected pages in the NEW-1 schema-error spike (Section 2(b)). This title/meta/FAQ content is unrelated to that Product-schema bug and can ship independently, but be aware both workstreams touch this same template family.

**Title:**
`Wheel Loader Price in India 2026 | Compare All Brands`

**Meta description:**
`Wheel loader (loader machine) prices in India — JCB, Komatsu, CAT, XCMG models compared. Bucket capacity, engine power & EMI, updated 2026.`

**Answer-first opening:**
> Wheel loader ("loader machine") prices in India range from **₹18 lakh** for compact models to **₹65 lakh+** for large-capacity loaders. JCB, Komatsu, CAT, and XCMG are the leading brands. This page compares current models by bucket capacity, engine power, and price.

**FAQPage JSON-LD:**
```json
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {
      "@type": "Question",
      "name": "What is a wheel loader used for?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "A wheel loader is used to load, carry, and dump loose material — soil, gravel, sand, or debris — onto trucks or into piles. It's common on construction sites, quarries, and material yards."
      }
    },
    {
      "@type": "Question",
      "name": "What is the price of a wheel loader (loader machine) in India?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "Wheel loader prices in India range from around ₹18 lakh for compact models to ₹65 lakh or more for large-capacity loaders, depending on bucket size and engine power."
      }
    }
  ]
}
```

---

### C8 — `/backhoe-loader/jcb-3dx/`
**Source:** `seo-ops/content/quickwin-model-pages.md`, Item 9. **Change type:** Title rewrite + meta description rewrite + answer-first opener + FAQPage schema.

**Note on schema:** the source file does **not** write out FAQ JSON-LD text for this page — it instructs: *"follow the JSON-LD pattern from aeo-hub-rewrites.md, answering "What is the price of JCB 3DX in India?" using the figures given"* in the opener below. You (or whoever applies this) must construct that one Q&A block using the C1–C7 JSON-LD structure as the template and the exact price figures below — do not invent different figures.

**Title:**
`JCB 3DX Price in India 2026 | 76 HP Backhoe Loader`

**Meta description:**
`JCB 3DX on-road price, EMI & full specs. 76 HP engine, 0.9m³ bucket — India's best-selling backhoe loader. Compare offers & connect with a dealer.`

**Answer-first opener:**
`The JCB 3DX costs ₹27–30 lakh ex-showroom in India (2026), with on-road prices typically ₹28–32 lakh depending on state RTO charges. It's powered by a 76 HP engine with a 0.9m³ loader bucket and 0.28m³ backhoe bucket — the best-selling backhoe loader in India.`

---

### C9 — `/backhoe-loader/jcb-3dx-plus/`
**Source:** `seo-ops/content/quickwin-model-pages.md`, Item 10. **Change type:** Title rewrite + meta description rewrite + answer-first opener + FAQPage schema ("What is the price of JCB 3DX Plus in India?" — same instruction as C8: schema text not pre-written, follow the aeo-hub-rewrites.md JSON-LD pattern using these figures, do not invent different ones).

**Title:**
`JCB 3DX Plus Price in India 2026 | Specs & EMI`

**Meta description:**
`JCB 3DX Plus price, on-road cost & EMI in India. Higher hydraulic output than the standard 3DX. Compare specs and get the best dealer offer.`

**Answer-first opener:**
`The JCB 3DX Plus costs ₹29–33 lakh ex-showroom in India (2026) — roughly ₹1.5–2 lakh above the standard 3DX — for higher hydraulic flow and additional operator comfort features. On-road price typically runs ₹30–35 lakh depending on state.`

**Note, verbatim from source:** *"This cluster is explicitly flagged as entangled with the JCB cannibalization problem (see cannibalization-consolidation.md), but the on-page content fix should ship regardless of the consolidation timeline."* — i.e., ship this even before/independent of the canonical consolidation work in C13 below.

---

### C10 — `/compactor/` (road roller cluster)
**Source:** `seo-ops/content/quickwin-model-pages.md`, Item 11. **Change type:** Title rewrite + meta description rewrite + answer-first opener.

**Flagged in source as possibly needing more than a CTR fix:** *"rank-push candidate, not just content fix — check word count / internal-link depth vs. top-3 competitors before assuming title/meta alone will move rank."*

**Title:**
`Road Roller Price in India 2026 | Compare All Models`

**Meta description:**
`Road roller (compactor) prices in India — vibratory, static & tandem rollers compared. Specs, drum width & EMI options, updated 2026.`

**Answer-first opener:**
`Road roller prices in India range from ₹15 lakh for compact vibratory rollers to ₹45 lakh+ for heavy tandem rollers used in highway construction. This page compares current models by drum width, compaction force, and price.`

---

### C11 — F5: 16 duplicate compare-page titles, corrected (full table, verbatim)
**Source:** Spec in `seo-ops/fixes/semrush-audit-fix-package.md`; corrected titles in `seo-ops/fixes/technical-fixes-final.md`, Item 1. Cross-referenced above as T3.

**Root-cause restatement, verbatim:** *"The generator drops the distinguishing model token (Plus/Smart-X/BS-series) when two variants share a base name. Corrected titles below preserve the distinguishing token and stay in the site's established `X vs Y: question-format` pattern (confirmed live on 2 of 3 sampled compare pages back in August)."*

| URL | Corrected title |
|---|---|
| `/compare/case-770-ex-vs-manitou-mbl-745-ht-backhoe-loader/` | Case 770 EX vs Manitou MBL 745 HT: Which Backhoe Loader Wins? |
| `/compare/hyundai-r215-smart-plus-vs-xcmg-xe250lc-k-excavator/` | Hyundai R215 Smart Plus vs XCMG XE250LC-K: Excavator Compared |
| `/compare/jcb-3dx-super-vs-manitou-mbl-745-ht-plus-backhoe-loader/` | JCB 3DX Super vs Manitou MBL 745 HT Plus: Backhoe Loader Compared |
| `/compare/jcb-3dx-vs-manitou-mbl-745-ht-backhoe-loader/` | JCB 3DX vs Manitou MBL 745 HT: Which Backhoe Loader to Buy? |
| `/compare/hyundai-r220ls-smart-plus-vs-liugong-922ea-alpha-excavator/` | Hyundai R220LS Smart Plus vs LiuGong 922E-A Alpha: Excavator Compared |
| `/compare/bull-sd76-bs5-super-smart-vs-jcb-3dx-super-backhoe-loader/` | Bull SD76 BS5 Super Smart vs JCB 3DX Super: Backhoe Loader Compared |
| `/compare/hyundai-r220ls-smart-x-plus-vs-liugong-922ea-alpha-excavator/` | Hyundai R220LS Smart-X Plus vs LiuGong 922E-A Alpha: Excavator Compared |
| `/compare/case-851-nx-vs-manitou-mbl-745-ht-backhoe-loader/` | Case 851NX vs Manitou MBL 745 HT: Backhoe Loader Compared |
| `/compare/jcb-3dx-super-vs-manitou-mbl-745-ht-backhoe-loader/` | JCB 3DX Super vs Manitou MBL 745 HT: Which Backhoe Loader Wins? |
| `/compare/bull-sd76-bs4-champion-vs-jcb-3dx-super-backhoe-loader/` | Bull SD76 BS4 Champion vs JCB 3DX Super: Backhoe Loader Compared |
| `/compare/ace-phantom-4wd-vs-manitou-mbl-745-ht-plus-backhoe-loader/` | ACE Phantom 4WD vs Manitou MBL 745 HT Plus: Backhoe Loader Compared |
| `/compare/jcb-3dx-vs-manitou-mbl-745-ht-plus-backhoe-loader/` | JCB 3DX vs Manitou MBL 745 HT Plus: Which Backhoe Loader Wins? |
| `/compare/ace-phantom-4wd-vs-manitou-mbl-745-ht-backhoe-loader/` | ACE Phantom 4WD vs Manitou MBL 745 HT: Backhoe Loader Compared |
| `/compare/hyundai-r215-smart-x-plus-vs-xcmg-xe250lc-k-excavator/` | Hyundai R215 Smart-X Plus vs XCMG XE250LC-K: Excavator Compared |
| `/compare/case-770-ex-vs-manitou-mbl-745-ht-plus-backhoe-loader/` | Case 770 EX vs Manitou MBL 745 HT Plus: Backhoe Loader Compared |
| `/compare/case-851-nx-vs-manitou-mbl-745-ht-plus-backhoe-loader/` | Case 851NX vs Manitou MBL 745 HT Plus: Backhoe Loader Compared |

**Implementation, verbatim:** *"Apply via the same RankMath `rank_math_title` mechanism as the July batch. Each title is now unique — verify with a duplicate-title check before/after."*

---

### C12 — Sitewide ALT text mapping (~57 shared images), full table, verbatim
**Source:** Spec/root cause in `seo-ops/fixes/ahrefs-site-audit-fix-package.md` (Finding 3) and `seo-ops/fixes/semrush-audit-fix-package.md` (F7); full mapping table in `seo-ops/fixes/technical-fixes-final.md`, Item 2. Cross-referenced above as T4.

**Root cause, verbatim:** *"every shared template image — logo, category nav icons, UI icons, all bank/insurance partner logos — carries `alt=""`. Because these render on nearly every page, this one fix collapses the 20,027-page warning count by the large majority. This is a mechanical transformation (filename → readable name + context), safe to apply as a lookup table rather than hand-editing each image."*

**Logo:**
| File | Alt text |
|---|---|
| `cropped-desi-machines.webp` | Desi Machines logo |

**Category nav icons** (path: `/wp-content/uploads/2026/01/*.webp`):
| File | Alt text |
|---|---|
| `ex-1.webp` | Excavator category icon |
| `bl-1.webp` | Backhoe loader category icon |
| `mg-1.webp` | Motor grader category icon |
| `wl-1.webp` | Wheel loader category icon |
| `crane-1.webp` | Crane category icon |
| `roller-1.webp` | Road roller / compactor category icon |
| `sl.webp` | Self-loading concrete mixer category icon |
| `cn.webp` | Concrete pump category icon |
| `concrete-pump-icon-1.png` | Concrete pump icon |
| `desi-machines-telehanlder-small-icon.png` | Telehandler category icon |

**UI icons** (path: `/wp-content/themes/construction-equipments/assets/img/product/*`):
| File | Alt text |
|---|---|
| `add-to-cart.png` | Add to compare |
| `download.png` | Download brochure |
| `medal.png` | Verified listing badge |
| `userImg.png` | User profile placeholder |

**Bank & finance partner logos** (paths: `/wp-content/uploads/2024/12/*` and `2026/*`; standing rule, verbatim, for any partner logo not listed individually: *"filename → "`<Bank Name>` logo"; apply this rule to every remaining partner logo not listed individually below, since the transform is fully mechanical"*):
| File | Alt text |
|---|---|
| `aditya-birla-capital-logo.png` | Aditya Birla Capital logo |
| `au-small-finance-bank-logo.png` | AU Small Finance Bank logo |
| `axis-bank-logo.png` | Axis Bank logo |
| `bajaj-finserv-logo.png` | Bajaj Finserv logo |
| `bandhan-bank-logo.png` | Bandhan Bank logo |
| `bank-of-baroda-bank-logo.png` | Bank of Baroda logo |
| `canara-bank-logo.png` | Canara Bank logo |
| `central-bank-of-india-logo.png` | Central Bank of India logo |
| `chola-mandalam-finance-logo.png` | Cholamandalam Finance logo |
| `cnh-capital-logo.png` | CNH Capital logo |
| `hdb-financial-services-logo.png` | HDB Financial Services logo |
| `hdfc-bank-logo.png` | HDFC Bank logo |
| `hinduja-leyland-finance-logo.png` | Hinduja Leyland Finance logo |
| `icici-bank-logo.png` | ICICI Bank logo |
| `idbi-bank-logo.png` | IDBI Bank logo |
| `idfc-bank-logo.png` | IDFC Bank logo |
| `iifl-finance-logo.png` | IIFL Finance logo |
| `kotak-mahindra-bank-logo.png` | Kotak Mahindra Bank logo |
| `mahindra-finance-logo.png` | Mahindra Finance logo |
| `pnb-logo.png` | Punjab National Bank logo |
| `poonawala-fincorp-logo.png` | Poonawalla Fincorp logo |
| `ratnaafin-logo.png` | Ratnaafin logo |
| `sakthi-financial-sercvices.png` | Sakthi Financial Services logo |
| `sbi-logo.png` | State Bank of India logo |
| `shriram-finance-logo.png` | Shriram Finance logo |
| `sundaram-finance-logo.png` | Sundaram Finance logo |
| `tata-capital-logo.png` | Tata Capital logo |
| `ubi-logo.png` | Union Bank of India logo |

**Insurance partner logos** (same mechanical rule → *"`<Insurer Name>` logo"*):
| File | Alt text |
|---|---|
| `axa-xl-insurance-logo.png` | AXA XL Insurance logo |
| `bajaj-allianz-logo.png` | Bajaj Allianz logo |
| `digit-insurance-logo.png` | Digit Insurance logo |
| `future-generali-insurance-logo.png` | Future Generali Insurance logo |
| `hdfc-ergo-insurance-logo.png` | HDFC ERGO Insurance logo |
| `icic-lombard-logo.png` | ICICI Lombard logo |
| `iffco-tokio-insurance-logo.png` | IFFCO Tokio Insurance logo |
| `kotak-mahindra-insurance-logo.png` | Kotak Mahindra Insurance logo |
| `liberty-insurance-logo.png` | Liberty Insurance logo |
| `magma-hdi-insurance-logo.png` | Magma HDI Insurance logo |
| `national-insurance-logo.png` | National Insurance logo |
| `new-india-insurance-logo.png` | New India Assurance logo |
| `oriental-insurance-logo.png` | Oriental Insurance logo |
| `raheja-qbe-insurance-logo.png` | Raheja QBE Insurance logo |
| `reliance-general-insurance-logo.png` | Reliance General Insurance logo |
| `royal-sundaram-insurance-logo.png` | Royal Sundaram Insurance logo |
| `sbi-general-insurance.png` | SBI General Insurance logo |
| `shriram-general-insurance-logo.png` | Shriram General Insurance logo |
| `tata-aig-insurance-logo.png` | Tata AIG Insurance logo |
| `united-india-insurance-logo.png` | United India Insurance logo |
| `universal-sompo-logo.jpg` | Universal Sompo Insurance logo |
| `cholamandalam-ms-logo.png` | Cholamandalam MS Insurance logo |

**OEM logo:**
| File | Alt text |
|---|---|
| `desi-machines-caterpillar-logo.webp` | Caterpillar logo |

**Implementation, verbatim:** *"this is a theme/template-level fix, not per-post content — apply via the theme's image-render function or a one-time DB update matching `src LIKE` the filename patterns above. A single deploy should clear the vast majority of the 20,027-page count; re-run the Ahrefs audit afterward to confirm (target: drop to low hundreds — the residual will be genuine per-product photos still missing alt text, a separate, smaller cleanup)."*

---

### C13 — Canonicalization plan (cannibalization consolidation), full table, verbatim
**Source:** `seo-ops/content/cannibalization-consolidation.md`. **Change type across all rows:** Canonical tag consolidation (`rel=canonical`) — **pre-authorized** per the S-EXEC charter (redirects, if needed instead, require **Saurav's approval first** — see Section 2(d), item B4). This is technical-directive content, not title/meta/FAQ copy, but is included here verbatim per the same "ready to execute" standard.

| # | Query cluster | URLs competing | Total clicks | Recommended canonical target | Rationale (verbatim) |
|---|---|---|---|---|---|
| 1 | jcb | 7 | 1,601 | `/backhoe-loader/jcb/` | "Already the best-ranking URL (pos 1.6); brand-nav intent belongs on the brand hub" |
| 2 | jcb price | 12 | 1,048 | `/manufacturers-and-brands-guide/jcb-equipment-price-india/` | "Already pos 1, $293/mo traffic value — the money page, other 11 URLs should point here" |
| 3 | jcb price in india | 11 | 794 | same as #2 | "Same query family, same target — merge with #2's fix" |
| 4 | poclain price | 2 | 644 | `/excavator/` (interim) | "See note below — may justify a dedicated page instead of a canonical" |
| 5 | hydra machine | 3 | 527 | `/crane/hydra/` | "Already pos 1.1–1.2, already the AEO-fix target in `aeo-hub-rewrites.md`" |
| 6 | poclain machine price | 2 | 354 | `/excavator/` (interim) | "Same note as #4" |
| 7 | desi machine (brand) | 13 | 338 | `/` (homepage) or `/about-us/` | "13 URLs splitting a brand-navigational query is the most chaotic cluster on the list" |
| 8 | crane | 2 | 286 | `/crane/` | "Straightforward, already the AEO-fix target" |
| 9 | hydra crane | 9 | 274 | `/crane/hydra/` | "Same target as #5 — the 9-URL split here is the largest single cluster by URL count" |
| 10 | road roller price | 2 | 264 | `/compactor/` | "Pairs with the quick-win fix in `quickwin-model-pages.md`" |
| 11 | desi machines (brand) | 5 | 225 | `/` (homepage) | "Same brand-split issue as #7, smaller" |
| 12 | poclain machine | 3 | 205 | `/excavator/` | "Same note as #4/#6" |
| 13 | backhoe | 5 | 195 | `/backhoe-loader/` | "Already the AEO-fix target" |
| 14 | concrete mixer machine price | 3 | 189 | `/concrete-mixer/` | (none given, "—") |
| 15 | farana crane | 10 | 177 | `/crane/hydra/` or dedicated (see note) | "10-URL split, second-largest cluster by URL count" |

**Note on Poclain (#4/#6/#12, combined 1,203 clicks across 7 URLs):** flags a possible **new dedicated page**, `/excavator/poclain/`, as a build candidate — a content-roadmap decision, not yet made (see Section 2(d), item B6).

**Note on Farana (#15, plus a separate "farana" query with 10 URLs/104 clicks not in the numbered table, combined ~281 clicks across the two variants, 20 URLs total):** flags that Escorts' "Farana" hydra-crane sub-brand may deserve its own page distinct from `/crane/hydra/` — same undecided-roadmap status (Section 2(d), item B6).

**Mechanics, verbatim (applies to rows #1–3, #5, #8–9, #13 — "the straightforward hub-consolidation cases"):** *"add `rel=canonical` on every non-canonical URL in each cluster pointing to the recommended target; do not delete or redirect the non-canonical URLs unless they carry zero unique content — if a URL is a genuinely different page (e.g. a model page that also ranks for the generic query), leave it live and un-canonicalized, and instead strengthen internal linking to the canonical target."* Noted in source as already flagged in the Action Plan (P2, "OPEN — carried from 1-Aug plan") needing Agency review — *"this file is that review."*

**Standing rule for everything not in the table above, verbatim:** *"remaining ~398 lower-volume rows of the captured 413, plus the un-captured 1,226 rows — apply "canonical to whichever URL already ranks best" as a standing rule for any cluster crossing ~50+ combined clicks rather than re-analyzing by hand."*

---

### C14 — Decay-page fixes — diagnosis/refresh directives (NOT copy-paste-ready; needs content authored before publishing)
**Source:** `seo-ops/content/decay-page-fixes.md`. **Important distinction from C1–C13 above:** this file contains **no drafted title/meta/FAQ copy** — only per-page diagnosis and refresh-scope instructions. Treat this as a content-writing task, not a paste job — do not publish anything here without first writing the actual refreshed spec tables / price bands / copy the diagnosis calls for.

**Tier 1 — real lead volume, needs immediate content refresh:**

| URL | Decay | Clicks (prev28→28d) | Leads | Diagnosis / fix direction (verbatim) |
|---|---|---|---|---|
| `/crane/escorts-f15-fighter` | -41% | 161→95 | **97** | "Highest lead count of any decaying page. Refresh spec table, price band, and check for a competing internal URL (cross-reference cannibalization list before assuming pure content decay)." |
| `/crane/escorts-hydra-14` | -32% | 111→76 | **79** | "Same crane cluster as above — likely the same root cause (content staleness or internal cannibalization from the hydra/crane consolidation gap flagged in `cannibalization-consolidation.md`). Fix both together." |
| `/backhoe-loader/bull-sd76-bs5-super-smart` | -39% | 136→83 | 63 | "Model page decay with real lead volume — check price accuracy (Insights Log elsewhere flagged stale price bands as a recurring issue on Bull/SD76 pages) and refresh the spec table." |
| `/crane/escorts-hydra-12` | -33% | 94→63 | 47 | "Same pattern as the other Escorts crane pages — this looks like a cluster-wide issue, not three unrelated declines. Prioritize a single root-cause investigation across all Escorts/hydra crane pages before fixing individually." |
| `/backhoe-loader/ace-ax-124` | -36% | 72→46 | 32 | — (no note given) |
| `/excavator/jcb-nxt-140` | -63% | 30→11 | 14 | "Steepest decline with meaningful leads remaining — investigate first among the smaller pages." |
| `/self-loading-concrete-mixer/schwing-stetter-slm-4600` | -39% | 104→63 | 25 | "Also flagged as an AEO 'winnable clicks' page in the sheet — this page has two separate open issues; fixing the AEO/CTR side (per the winnable-clicks methodology) may address both at once." |
| `/self-loading-concrete-mixer/fiori-dbs-4300` | -39% | 142→87 | 16 | — (no note given) |

**Cross-cutting recommendation, verbatim:** *"Three Tier-1 items (`escorts-f15-fighter`, `escorts-hydra-14`, `escorts-hydra-12`) are all Escorts/hydra crane pages declining together — investigate as one root cause (template change, pricing update, or competing internal page per the Farana/hydra cannibalization notes) before treating as three separate content-refresh tasks."*

**Tier 2 — brand-nav pages where decay may not be fixable by content (verify before spending effort):**

| URL | Decay | Leads | Note (verbatim) |
|---|---|---|---|
| `/excavator/jcb` | -80% | 11 | "Also on the Action Plan's own 'NOT WINNABLE' list (brand-nav mismatch) — the decay here may be an extension of the same structural problem (searchers want a JCB catalog, this is one model), not a fixable content issue. Don't spend a content-refresh cycle here; if anything, this strengthens the case for the JCB brand-hub consolidation in `cannibalization-consolidation.md` rather than a standalone fix." |
| `/hinduja-leyland-finance` | -50% to -66% (source conflict) | 8–12 | "**Data-quality blocker: the Action Plan and Pages tab disagree on this page's own numbers as of the same pull.** Before prescribing a fix, get a clean re-read from the sheet owner — don't act on either figure blind." — **treat as Blocked, see Section 2(d), item B7.** |

**Missing data — re-pull needed before diagnosis (not actionable yet — Blocked, see Section 2(d), item B8):**
- `/concrete-pump/ajax-asp-7011` — numeric columns lost to a Google Sheets export artifact; was ranked #4 in Action Plan's top-15 severity list.
- `/excavator/cat-345-gc` — same issue; was ranked #9 in Action Plan's top-15 severity list.

**Backlog, verbatim:** *"29 additional decay-flagged URLs captured but not written up individually (full list said to be "in the research digest," not in this file). 44 of the claimed 87 total decaying pages remain entirely unenumerated in this pull."* No action possible on these until that digest is retrieved — not itemized here because it isn't itemized in source.

---

### C15 — Backlog / not-ready content items (do not attempt to write these yet — flagged, not scoped)

- **New page `/excavator/komatsu/` (or `/komatsu/`)** — Komatsu brand hub. **Source:** `seo-ops/content/aeo-hub-rewrites.md`, Item 8. Reasoning quoted: *"komatsu" (10,420 clicks left) + "komatsu excavator" (1,109) currently rank via `/excavator/komatsu-pc500lc-10r/` — a single model page ranking for a brand-navigational query.* No title/meta/FAQ content is drafted — explicitly stated in source as *"This is new-page work (needs product data), not a copy edit — flagging as a backlog item... not part of this "ready-to-ship" batch."* Also flags **Zoomlion** ("zoomlion," 1,938 clicks left) as having the identical gap and identical recommendation.
- **"hitachi" brand hub** — **Source:** `seo-ops/content/quickwin-model-pages.md`. Opp Score 30,000 (the single highest Opp Score on the entire quick-win list, pos 10.5, 50,000 volume) with **no clear existing target page** — same "needs a brand hub" pattern as Komatsu/Zoomlion, called out as *"the highest-priority new-page candidate if only one can be built."* No content drafted.
- **Poclain dedicated page** `/excavator/poclain/` and **Farana dedicated page** — see C13 notes above; roadmap decision not made.
- **Hindi/Hinglish FAQ variant for `/crane/hydra/`** — flagged, not written; see C6 note and Section 2(d), item B5.
- **Queries #12–60 of the quick-win 60-query list** (small-volume long-tail: "ajax machine," "tata hitachi," "xcmg," "transit mixer," "hitachi photo/photos" [image-intent, separate workstream]) — apply the same answer-first+FAQ recipe "as capacity allows," no specific copy given.
- **Explicitly flagged as NOT worth pursuing, verbatim:** *"mahindra blazo"* (2,459 clicks left) — a truck model, off-category for DesiMachines, likely mismatched traffic — **skip it.**

---

## 2(d). BLOCKED ON SAURAV — do not attempt; do not invent data

These items cannot be completed by any Claude session, ORCH or fleet. **Do not fabricate, estimate, or guess at the missing inputs.** Flag them to Saurav and wait.

### B1 — Missing Prices: 169 products, 0 filled (Semrush F2a)

- **Source:** `seo-ops/fixes/semrush-audit-fix-package.md` (F2), reconfirmed in `seo-ops/fixes/technical-fixes-final.md` (09-05: *"Still 0/169 filled per the 2026-09-04 sheet pull — needs Saurav's price data, cannot be produced by any session."*), and reconfirmed still 0/169 through the 09-08, 09-11, and 09-12 ORCH logs per `registry.md` (day-count tracked continuously: 0/169 at 09-08 [35 days], 0/169 at 09-11, 0/169 at 09-12).
- **Affected:** 168 structured-data ERRORS (Semrush issue 45's original, smaller sub-cause, distinct from the NEW-1 190x spike — this is the "PRICE TO ADD" register, ~169 products). page_info: item `PRODUCT`, cause `REQUIRED`, missing `["aggregateRating","offers","review"]`. Sample URL appearing in both the Semrush list and the "💰 Missing Prices" register: `/wheel-loader/jcb-440-5/`.
- **Fix, verbatim, part (a) — the blocked half:** *"Saurav fills the "PRICE TO ADD" column — P1 10 rows first — so Offer schema is emitted (this was already the #1 quick ask; Semrush independently confirms it)"*
- **What the fleet CAN do without Saurav (part (b), not blocked — already listed as T-item under NEW-1/F2b in Section 2(b)):** *"template rule: when a product has no price, suppress the bare Product JSON-LD block (or output it only once a real offer/review exists). Do NOT paper over with fabricated aggregateRating — the hardcoded 4.5 pattern is already a schema-spam risk."*
- **Explicit instruction: no session may invent or estimate these 169 prices — only Saurav can supply the actual price data.**

### B2 — Dozer compare-page 404s: finish-vs-suppress decision

- **Source:** `seo-ops/fixes/ahrefs-site-audit-fix-package.md` (Finding 1); `registry.md`.
- The **investigation and prep work** (T9, Section 2(b)) is not blocked and should proceed now. What's blocked is **which fix path to execute**:
  1. Run the compare-page generator for the dozer category (recommended), or
  2. Suppress/remove the internal links generating the dead URLs as an interim measure.
- Registry, verbatim: needs a **"finish-vs-suppress decision... from Saurav."** Original source instruction, verbatim: *"Flag to Saurav directly (this is outside S-EXEC's current access and looks like a different workstream)."*
- **Do not unilaterally pick a path** — prepare both, present them, wait for the decision.

### B3 — YMYL-adjacent content requiring compliance sign-off

- Not a single named item in ORCH's files, but flagged here per your instructions as a standing rule: anything touching **pricing claims, finance/EMI figures, or insurance-partner content** is YMYL-adjacent (health/finance content Google and users hold to a higher accuracy bar). This includes:
  - Every price range quoted in Section 2(c) (C1–C10) — these are ORCH's drafted figures based on available data, not confirmed against Saurav's actual current price sheet. **Before publishing, cross-check these ranges against Saurav's live pricing** (and against item V5's price-range-widening action) rather than assuming they're current.
  - Any EMI/finance-figure claims (e.g., C1's *"EMI on a JCB backhoe loader typically starts around ₹55,000–₹60,000 per month"* and C2's *"On-road JCB prices... typically 3–8% higher"*) — these are illustrative estimates from ORCH, not verified financial figures from a lender. Flag to Saurav for compliance review before shipping if there's any finance/lending compliance concern on the site.
  - The bank/insurance partner logo alt-text mapping (C12) is purely descriptive (bank/insurer names) and is **not** a compliance concern by itself — call this out only for actual claims made in body copy, not for the alt-text table.
- **Action:** flag any of the above to Saurav for sign-off before publishing if there's uncertainty; do not treat ORCH's price/EMI figures as gospel.

### B4 — Redirects (as opposed to canonical tags) require Saurav's sign-off

- **Source:** `seo-ops/content/cannibalization-consolidation.md`, process rule.
- Canonical tags are **pre-authorized** under the S-EXEC charter (see C13). **Redirects are not** — verbatim: *"redirects, if needed instead, require Saurav's approval first."* If any consolidation work in C13 seems to call for a 301 redirect rather than a canonical tag (e.g., a URL with genuinely zero unique content that should be removed rather than just de-duped), stop and get sign-off before implementing the redirect.

### B5 — Hindi/Hinglish FAQ variant for `/crane/hydra/` — unpark decision needed

- **Source:** `seo-ops/content/aeo-hub-rewrites.md`, Item 6 note.
- Verbatim: *"also add a Hindi variant if the page has a Hindi/Hinglish section, given the "हाइड्रा मशीन" query volume — flag to whoever owns the Hindi-unpark decision."* This implies Hindi content is currently "parked" (a deliberate site-wide decision) — do not write Hindi content without confirming that decision has changed. Flag to Saurav.

### B6 — Poclain and Farana dedicated-page roadmap decisions

- **Source:** `seo-ops/content/cannibalization-consolidation.md`, notes on rows #4/#6/#12 (Poclain, combined 1,203 clicks across 7 URLs) and row #15 + the unlisted "farana" query (combined ~281 clicks across 20 URLs).
- Both are flagged as **possible new dedicated pages** rather than folding into existing hubs — this is a content-roadmap decision, not a technical fix, and isn't ORCH's or the fleet's call to make unilaterally. Flag to Saurav for a decision before building either page or committing to the interim `/excavator/` canonical target.

### B7 — `/hinduja-leyland-finance` decay page — data-quality blocker

- **Source:** `seo-ops/content/decay-page-fixes.md`, Tier 2.
- Verbatim: *"Data-quality blocker: the Action Plan and Pages tab disagree on this page's own numbers as of the same pull. Before prescribing a fix, get a clean re-read from the sheet owner — don't act on either figure blind."* This needs the sheet owner (likely Saurav or whoever maintains the master tracking sheet) to reconcile the two conflicting decay figures (-50% vs -66%, 8 vs 12 leads) before any refresh work is scoped.

### B8 — Two decay pages with corrupted/missing source data

- **Source:** `seo-ops/content/decay-page-fixes.md`.
- `/concrete-pump/ajax-asp-7011` and `/excavator/cat-345-gc` both lost their numeric columns to a Google Sheets export artifact. Both need a **re-pull/re-extraction from the sheet owner** before any diagnosis or fix can be scoped — not something either Claude session can reconstruct from what's available.

---

## 3. Adjacent items worth noting (not a direct ask in this handoff, but relevant to fleet ownership tracking)

- **Security: 4 of 18 author URLs expose admin usernames** (`/author/saurav/`, `/author/sanjiv/`, etc.). Flagged by "the other pipeline" per the 09-08 log, still open per `registry.md`. A 2FA/login-rate-limiting check was recommended but not yet actioned. Not one of the five requested categories in this handoff, but worth a look given it's a live security exposure and the fleet has WP access to actually check WP login hardening settings.
- **The 19 named scheduled tasks** operating under the standing SEO-strategist autonomy mandate (dated 2026-07-21, full list in Saurav's 2026-09-01 self-sent email, not reproduced in the registry) give the fleet **full autonomy on-site** (metas/schema/internal links/content/structure/automations) — **off-page/outreach still needs Saurav's per-action sign-off.** Keep that boundary in mind: everything in Section 2(a)–(c) of this document is on-site work and should be within your existing autonomy; nothing in this document should be read as authorizing outreach/off-page action.
- Per `registry.md`: ORCH has **not yet cross-checked every ORCH-tracked open item against the fleet's task registry line by line** — the mapping of which items the Mac fleet already owns is inferred from titles/cadence/one day of Insights Log evidence, **not confirmed**. This is exactly why Section 2(a) exists — treat it as a real gap, not a formality.

---

## 4. Process/mechanics rules to follow when applying anything from Section 2(c)

**Source:** consolidated from `seo-ops/content/aeo-hub-rewrites.md` and `seo-ops/content/cannibalization-consolidation.md`.

1. **RankMath fields:** titles/metas go into `rank_math_title` / `rank_math_description` per page — same mechanism as the July CTR-fix batch.
2. **WP-CLI script reference:** `data/apply-rankmath-meta.sh` in the repo — same pattern used in the July CTR-fix batch. Check whether this script still applies / is still the right tool before using it.
3. **Answer-first paragraph placement:** insert as the **first block of body content**, above the existing intro — do **not** delete existing content, this adds to it.
4. **FAQ schema placement:** add as a `<script type="application/ld+json">` block; if the page already has a visible FAQ section without matching schema, make sure the schema's questions match what's visibly on the page — **don't publish schema for content that isn't there.**
5. **Pre-publish validation:** validate every JSON-LD block with **Google's Rich Results Test** before publishing.
6. **Rollout/batching discipline:** ship **2–3 hub pages at a time** with **≥72h between batches** (the site's kill-switch discipline, per the S-EXEC charter) — watch GSC CTR at +7 days before the next batch. This applies to the C1–C10 hub/page rewrites.
7. **Canonical vs. redirect authorization:** canonical tags (C13) are **pre-authorized**; redirects require Saurav's sign-off first (see B4).
8. **Canonicalization mechanics:** apply `rel=canonical` only where a URL has no unique content; leave distinct pages (e.g., model pages that also rank for a generic query) live and un-canonicalized, strengthening internal links to the target instead.
9. **Standing rule for long-tail cannibalization rows:** canonical to whichever URL already ranks best, for any cluster with ~50+ combined clicks, without re-analyzing the full ~1,639-row list by hand (see C13's standing rule).

---

## 5. Status reporting

Whoever executes items from this document, please note back what happened — dated — for each item you touch, so **ORCH does not re-flag it in future daily cycles.** Report via **the master sheet's Insights Log** (which ORCH already reads daily) or directly to Saurav (saurav@teampromotedge.com), whichever is the normal channel for this. For each item, note:

- **Item ID** (e.g. "V1," "T4," "C11," "B2" — use the IDs from this document, or the original F#/Finding# IDs, so it's traceable back to source).
- **Completed** — what was done, and the date.
- **Skipped** — and why (e.g., blocked, deprioritized, decided against).
- **Already done** — if you find it was already fixed by `desimachines-weekly-audit-fix`, `desimachines-seo-dashboard-weekly`, or any other existing task, say which one and when, so ORCH updates its registry instead of treating it as still-open.
- Specifically close the loop on the two open verification gaps this document flags: **V1** (the remaining 48 unverified `/compare/` 500 URLs) and **V4** (the `/disclaimer/` three-way contradiction) — these need a definitive dated answer, not another "likely" data point.

---

*End of handoff document. All content above is reproduced verbatim from ORCH's source files at `/home/user/Claude/seo-ops/` as cited inline. Prepared by ORCH, 2026-09-12, for manual relay to the Mac fleet session by Saurav.*