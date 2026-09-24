# Diagnosis: Brand Category Visibility Drop (-31% → -52% WoW, 2026-09-13 to 2026-09-16)
**Prepared for: ORCH daily log / Saurav** | **Date: 2026-09-17** | **Sources: 4 independent investigations (GSC page-level drilldown, Site Audit technical/indexation check, competitive/SERP check, site-change timeline)**

---

## 1. Most Likely Root Cause

**High-medium confidence: JCB-cluster cannibalization/ranking reallocation, triggered by a single-day event on 2026-09-08→09-09, is the dominant driver — not a sitewide technical failure, not a competitor gain, not a broad algorithmic hit.**

Three of the four reports converge on this, each ruling out a different alternative and leaving the same residual explanation:

- **[GSC Page-Level Drilldown — direct evidence]**: `/backhoe-loader/jcb/` (a Brand Category page) shows a catastrophic **single-day** collapse between 2026-09-08 and 2026-09-09 — impressions 3,249 → 461 (that day), and matched-week 56,973 (Aug 25-31) → 6,749 (Sep 8-14), **-88.2%**. The exact-match query **"jcb"** crashed identically on the same date (52,215 → 6,672 impressions, **-87.2%**), with average position degrading from ~3-4 to 6-8. Critically, this happened **simultaneously with the parent category page `/backhoe-loader/` (all brands) gaining +20.3%** (47,771 → 57,478 impressions) over the same window, with its average position *improving*. This loss/gain pairing is exactly the "P2 cannibalization: JCB price cluster" risk the master sheet's own Action Plan had already flagged — it looks like it materialized on 09-09, with Google reallocating ranking credit from the brand-specific page to the generic category page rather than resolving in JCB's favor.
- **[Competitive/SERP Check — rules out external cause, corroborates internal redistribution]**: No competitor gained visibility in this window; Domain Rating stayed flat (39-40, normal noise); and Ahrefs' independent organic-traffic model for the whole site actually **rose** through the alert window (41,857 → 46,118, Sep 9 → Sep 16). A real external demotion or competitive loss should show up as a site-wide traffic dip — it didn't. This is consistent with traffic being *redistributed between DesiMachines' own pages* (brand page down, category page up) rather than lost to a competitor or a Google-wide penalty.
- **[Technical/Indexation Check]**: Found no noindex, robots block, non-200 status, or canonical break on `/backhoe-loader/jcb/` or `/backhoe-loader/` — but **this check cannot see anything after 2026-08-28** (the last completed crawl), so it neither confirms nor rules out a technical trigger specifically on 09-08/09-09. It does rule out several *other* technical explanations (see Section 4).
- **[Site-Change Timeline]**: No report found a *confirmed, dated* site change that directly touches `/backhoe-loader/jcb/` or backhoe-loader navigation. The closest candidates in the causal window are a confirmed 09-08 fleet deploy batch (dozer noindex fix, disclaimer page, author-indexing fix — none of which target backhoe-loader/JCB) and an unpinned 08-29→09-12 template/routing deploy (compare/500 fix, canonical fix, CWV win, likely a menu trailing-slash edit, and a confirmed 190x Product-schema regression on `/compare/*` and `/wheel-loader/*` templates — not confirmed on backhoe-loader templates). A **"Desimachines megamenu refresh" fleet session** — the textbook mechanism for exactly this symptom (nav/menu changes altering internal links into brand-hub vs. category-hub pages) — is named in the fleet discovery list but **has no confirmed run date or diff in any log**.

**Bottom line on cause:** the *what* (JCB brand-category page losing rank/impressions to its own parent category page, on 09-08/09-09) is well-evidenced. The *why* (what specifically changed Google's page selection) is **not yet confirmed** — it may be an organic algorithmic resolution of the pre-existing cannibalization risk, or it may have been triggered by an unverified site-side change (menu edit, internal link change, or CSV-import bleed) around the same date. No report found the smoking-gun trigger.

---

## 2. Specific Affected Pages / Queries

| Item | Role | Evidence |
|---|---|---|
| `/backhoe-loader/jcb/` | **Primary casualty** — dominant driver | -88.2% impressions matched-week (56,973→6,749); loss (~50,200 impr) is comparable to or larger than the entire Brand Category bucket's reported WoW loss (34,523 impr, 66,338→31,815) |
| Query **"jcb"** (bare head term) | Crashed same day as the page, same magnitude | -87.2% matched-week (52,215→6,672); position 3-4 → 6-8 |
| Query **"bull jcb price"** | Secondary casualty, same date | 259→123 impressions (-52.5%); position 2.9-3.2 → 4.0-8.5 |
| `/backhoe-loader/` (parent, all brands) | **Compensating gainer** — likely destination of reallocated signal | +20.3% impressions (47,771→57,478); position improved 6.4 → 4.5-5.1 |
| `/jcb/` (Brand Details, no category prefix) | **Not part of this crash** — separate, pre-existing issue | Chronically weak (position 14-50) the whole window, no 09-09 discontinuity (62→52 impressions, noise-level). Explains the smaller, flat "Brand (Details)" clicks alert as a distinct, longstanding problem. |
| Query **"jcb price"** (high-volume commercial modifier, vol 73,000) | **Unaffected** — held position #1 throughout | Reconciles apparent tension with the drilldown: the page didn't lose *all* rankings, just the bare head term and a secondary query — consistent with a narrowing/reallocation rather than a uniform demotion |
| Control group (no crash, rules out tracking artifact) | — | Keyword "tata hitachi" +0.6%, "hydra machine" flat, `/crane/hydra/` +10%, `/crane/escorts/` +20% |

**Coverage gap:** only 7 of ~85 Brand Category URLs were sampled in the GSC drilldown. Other JCB-branded pages (e.g., `/excavator/jcb/`, confirmed technically clean but not checked for a 09-09 impressions break) and other brand+category pages sharing the same nav/template as backhoe-loader have not been individually checked for the same pattern.

---

## 3. Timeline

- **Causal window (per WoW definition):** ~2026-09-06 to 09-13.
- **Actual causal event, as isolated in the data:** a single-day step-change between **2026-09-08 and 2026-09-09** — impressions on `/backhoe-loader/jcb/` fell from 3,249 (09-08, best position of the period at 3.22) to 461 (09-09), and stayed low (305-1,277/day) through the latest data available (09-14).
- **Alert firing sequence:** first fired 09-13 (-31% WoW, 69,920→48,426), worsened daily: -40% (09-14) → -46% (09-15) → **-52% (09-16, 66,338→31,815)**.
- **Nearby confirmed site changes** (none directly tied to the affected pages, but the same-week timing is worth noting): a confirmed fleet deploy batch on **09-08** (dozer noindex fix via CSV-import defect, disclaimer page, author-indexing fix); and a template/routing deploy dated only within **08-29→09-12** (compare/500 fix, canonical fix, CWV improvement, likely menu edit, Product-schema regression).
- **Important arithmetic note on the "worsening" pattern:** a WoW % that gets monotonically worse across several days is *not* on its own proof of an ongoing/accelerating regression. It is also the expected mechanical signature of a **single step-change event viewed through a rolling 7-day comparison window**: each successive alert date's "current" 7-day window becomes more fully saturated with post-crash days while the "prior" 7-day window still partly (then progressively less) reflects the high pre-crash baseline. This alone can produce several consecutive days of increasingly negative WoW % from one 09-09 event, without requiring Google to be "progressively de-indexing more pages." This has not been independently confirmed against the full bucket-level daily series (only the single JCB page's daily numbers are in hand), so treat it as a plausible alternative to the "progressive template regression" theory raised in the site-change report, not a settled explanation — this is exactly the kind of check ORCH can close out next cycle (see 5a).

---

## 4. What Does NOT Explain It

- **Sitewide technical/indexation health is clean** for the 7 checked URLs across every available crawl (2026-08-13, 08-27, 08-28): no noindex, no robots.txt block, no non-200 status, no canonical break, zero net "indexable → non-indexable" change sitewide on the 08-28 crawl. *(Caveat: crawl visibility ends 08-28 — see Section 6.)*
- **Robots.txt is unchanged and blocks nothing**, sitewide, both currently-cached and vs. the prior crawl.
- **No server errors** — 500/5xx counts are zero across the crawl history.
- **No competitor gained ranking or traffic** on the affected pages' queries in this window (91infra.com, infra.tractorjunction.com, jcb.com, tatahitachi.co.in, hyundai all flat-to-down).
- **No sitewide authority or traffic collapse** — Domain Rating flat (39-40, normal recalc noise), Ahrefs' modeled organic traffic for the site *rose* through the window.
- **No new SERP-layout intrusion** (AI Overview/Shopping) on the checked queries — feature sets identical before/after.
- **Not a GSC tracking/data artifact** — ruled out by the control group (several other Brand Category URLs/queries show no comparable break at 09-09) and by the fact that clicks/impressions persist post-crash at reduced-but-nonzero levels rather than zeroing out.
- **The `/dozer/` noindex event is real but unrelated** — it's a newly-launched vertical intentionally shipped noindexed (doesn't exist in the 08-13 snapshot), confirmed to not touch excavator/backhoe-loader/crane categories.
- **Do not re-investigate any of the above** without new evidence specific to the causal window.

---

## 5. Recommended Next Action

**ORCH can verify directly, next cycle (no human needed):**
1. Re-pull `gsc-page-history`/`gsc-keyword-history` for `/backhoe-loader/jcb/` and the "jcb" query through 09-16/09-17 (current data stops at 09-14) to confirm whether the crash has stabilized, worsened further, or partially recovered — and pull the actual bucket-level daily Brand Category totals to test the rolling-window arithmetic in Section 3 rather than assuming an accelerating cause.
2. Run the same daily-history pull on the remaining ~78 unsampled Brand Category URLs (prioritize other JCB-brand pages, e.g. `/excavator/jcb/`, and any page sharing backhoe-loader's nav/template) to determine whether 09-09 was JCB-specific or a broader brand-pattern break.
3. **Trigger a fresh Ahrefs Site Audit crawl now** — the current one is 20 days stale (08-28) and has zero visibility into the causal window. Re-run the same 7-URL + sweep check afterward, watching specifically for noindex/canonical/internal-link changes on `/backhoe-loader/jcb/` and `/backhoe-loader/` dated after 08-28.
4. Pull internal-link counts/anchor text into `/backhoe-loader/jcb/` vs. `/backhoe-loader/` (before/after 09-08) to directly test the menu-refresh/cannibalization mechanism.
5. Check whether the confirmed Product-schema regression (180→34,368 errors, from the 08-29→09-12 deploy) extends to backhoe-loader brand-category templates, not just `/compare/*` and `/wheel-loader/*` as currently documented.

**Needs a human decision or WP-access action (flag to Saurav):**
6. **Ask directly whether the "Desimachines megamenu refresh" fleet session actually ran, and if so, when and what it changed.** This is the single most plausible unverified mechanism (a nav/menu edit altering internal links into the JCB brand-hub vs. the category hub) and cannot be resolved from logs alone.
7. Ask whether the 09-08 dozer CSV-import noindex-fix job touched only dozer rows, or whether the same import batch also wrote to backhoe-loader/JCB category or product rows — this needs direct CMS/import-log access ORCH doesn't have.
8. Confirm live, via WP access, whether `/backhoe-loader/jcb/`'s canonical tag currently points to itself or has been changed to point at `/backhoe-loader/` — Ahrefs' cached crawl (08-28) predates the event and a live `curl` check from this environment was blocked (403 Forbidden), so this cannot be confirmed from here.
9. **Decision needed from Saurav**: if this does turn out to be Google resolving the known JCB cannibalization risk in favor of the generic category page, is that an acceptable outcome (net traffic isn't obviously lost, just reallocated) or should the team actively try to recapture `/backhoe-loader/jcb/`'s standalone visibility? This affects whether the next step is "fix a bug" or "recalibrate the alert / accept the redistribution."

---

## 6. Confidence Level and Caveats

**Confidence: MEDIUM-HIGH** that JCB-cluster cannibalization/reallocation, dated 09-08/09-09 and centered on `/backhoe-loader/jcb/`, is the dominant driver of the Brand Category alert. This is supported convergently: direct page/query-level evidence from one report, and two other independent reports each ruling out a different alternative (technical, competitive) without finding contradicting evidence.

**What keeps this from being HIGH confidence / fully closed:**
- No report identified the **confirmed trigger mechanism** — what specifically changed Google's page-selection for "jcb" on 09-09 is not established. The most plausible candidate (megamenu refresh) is unverified; the confirmed 09-08 deploy claims dozer-only scope; no canonical change was found, but only in stale (pre-08-28) crawl data.
- GSC page-level data cuts off **09-14**, two days short of the most recent alert (09-16) — cannot yet confirm whether the crash is stabilizing, still worsening, or recovering.
- Only **7 of ~85** Brand Category URLs were individually sampled; other contributing URLs cannot be ruled out.
- Site Audit's last crawl is **20 days stale (08-28)** — the "clean technical health" finding is real but time-bounded and does not cover the actual event date or the alert window at all.
- A live verification attempt (`curl`) was blocked by a 403 from the sandbox/site, so nothing was independently confirmed outside Ahrefs' cached data.
- All findings are **correlational (same-day timing)**, not a confirmed causal diff of before/after HTML, canonical tags, or menu structure.
- The report on `/dozer/`'s prior-verified "not fixed" disclaimer claim (said fixed 09-08, actually still 404 through 09-14) is a reminder that "verified on production" claims from the fleet's 09-08 batch should not be taken at face value without direct re-verification.
---

## 7. Addendum (2026-09-17, later same day) — clicks-vs-impressions check, Saurav's call

**Saurav's decision:** acceptable outcome, conditional on traffic (not just visibility) not actually being lost.

**Direct verification via `gsc-page-history` (daily, 2026-08-20→09-14, Ahrefs project 9518353):** comparing the same two matched weeks used in Section 2/3 (Aug 25-31 vs Sep 8-14) for the two pages responsible for essentially the entire alert:

| | Impressions | Clicks |
|---|---|---|
| `/backhoe-loader/jcb/` | 56,973 → 6,749 (-88.2%) | 126 → 27 |
| `/backhoe-loader/` (parent) | 47,771 → 57,478 (+20.3%) | 205 → 362 |
| **Combined** | 104,744 → 64,227 (-38.7%) | **331 → 389 (+17.5%)** |

**Combined clicks rose despite combined impressions falling.** The alert is impressions-only; actual traffic for this cluster did not decline — it improved slightly, consistent with average position improving on the surviving/reallocated rankings. This directly satisfies Saurav's stated condition ("unless traffic is lost... I am okay").

**Scope caveat:** verified for the 2 pages driving the bulk of the alert, not all ~85 Brand Category URLs individually — but the fact that no separate "Clicks | Brand Category" alert fired alongside the visibility one is a corroborating signal that clicks are not collapsing bucket-wide either.

**Disposition: downgraded from active investigation to routine monitoring.** Not pursuing recapture of `/backhoe-loader/jcb/`'s standalone visibility unless a future cycle shows an actual click/lead decline for the cluster.
