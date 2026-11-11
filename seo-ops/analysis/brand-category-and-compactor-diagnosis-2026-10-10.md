# Diagnosis: Brand Category alerts (10-04, 10-10) & Compactor/Product-page keyword-decline cluster

**Requested by Saurav 2026-10-10, direct chat instruction ("dig into the brand category and compactor clusters").** Produced via a 9-agent investigation workflow (Scope → parallel Investigate [GSC deep-dive, SERP/competitive, technical, site-change correlation] → Synthesize) using Ahrefs (project 9518353), Semrush Site Audit (project 22542129), and the master sheet. Prior reference: `seo-ops/analysis/brand-category-drop-diagnosis-2026-09-17.md`.

**Operational note: this investigation consumed most of the remaining Ahrefs workspace budget.** Usage went from 194,440/200,000 before this ran to **198,890/200,000 (99.4%) after** — essentially exhausted, with the next reset not until 2026-10-17 (7 days out). Several recommended follow-ups below explicitly require Ahrefs calls that aren't affordable until then.

---

## Verdict, up front

- **Brand Category**: **Medium-high confidence.** Both alerts (10-04 and 10-10) are the September JCB brand-navigational SERP reassignment continuing and deepening — not a new problem, not a site-side break. `/backhoe-loader/jcb/`'s core query ("jcb") has now essentially disappeared from Google's results for that page, with its parent `/backhoe-loader/` absorbing the demand instead. **New and more serious than September's read**: a second page, `/excavator/jcb/`, is independently collapsing on the same timeline, and — unlike the backhoe-loader pair — **no compensating page has been confirmed**, so this is not cleanly "no real loss" across the board anymore.
- **Compactor cluster**: **High confidence that compactor, ajax machine, jcb excavator, and loader machine share one cause; low confidence on what that cause actually is.** Four different pages collapsed 70-93% in impressions within the same tight 3-day window (2026-09-17 to 09-20), and the identical signature shows up on other, untracked Product (Models) pages too — this reads as a page-type-wide Google-side event, not four coincidences. Demand, competitors, content edits, cannibalization, and current technical health have all been checked and ruled out as the cause. **farana/farana crane is a different, unrelated problem** (intra-page query cannibalization on a healthy, stable page) and shouldn't be bundled in.

The two clusters do not appear to share a root cause with each other.

---

## PART 1 — Brand Category

### Most likely root cause

Same mechanism as September, now more complete and hitting a second page:

- `/backhoe-loader/jcb/` weekly impressions ran 48K-62K through 2026-08-31, then collapsed: 10,289 (week of 09-07) → 2,878 → 450 → 420 → 120 (week of 10-05, partial). The bare query **"jcb"** went from 245,958 impressions/543 clicks in August to absent from the page's top-50 keywords by October — it didn't rank worse, it lost the query entirely.
- Its parent `/backhoe-loader/` (a Category page, different type) held steady at ~8,000-9,200 impressions/day throughout and grew its own top keyword "jcb price" from 102,194 impressions/568 clicks (Aug) to 17,391/174 in just the first 10 days of October — independently confirmed via an Ahrefs SERP crawl showing it moved from unranked (09-07) to organic position 5 today for that query.
- Root cause already on record in the Action Plan (flagged 29 Sep): the signed-out Indian SERP for "jcb" now opens with an AI Overview, jcb.com sponsored/sitelink blocks, and PAA/video — Google increasingly treats "jcb" as brand-navigational and routes it to jcb.com or the category hub, not a DesiMachines ranking problem.
- **New this round**: `/excavator/jcb/` is collapsing on the identical timeline (986 impressions peak mid-September → 44 impressions/position 21.8 by week of 10-05) — a JCB-brand-wide effect, not isolated to one page. Its parent `/excavator/` is growing, but that growth tracks the whole category's trajectory rather than specifically timing with JCB's loss — **not confirmed as absorption**, unlike the backhoe-loader pair.
- Technical and competitive checks rule out alternatives: both main pages are indexable with zero errors; the CWV picture runs backwards from a technical-cause theory (the losing page passes CWV cleanly, the gaining page has the worse score); no new competitor appeared in the SERP between 09-07 and today.

### Affected pages/queries

| Page | Role | Evidence |
|---|---|---|
| `/backhoe-loader/jcb/` | Primary casualty | 48-62K/week → 120/week; "jcb" query gone from top-50 by October |
| `/backhoe-loader/` (parent) | Confirmed compensating gainer | Steady ~8-9K/day; unranked→position 5 for "jcb price" |
| `/excavator/jcb/` | New, second casualty | 986→44 impressions, position →21.8 |
| `/excavator/` (parent) | Growing, but not confirmed as absorbing JCB's loss | Growth timing tracks the category broadly, not JCB specifically |
| ~25 other sampled Brand Category pages | No comparable crash | Flat/gradual drift only |
| `/concrete-mixer/ajax/` | Unresolved, flagged not confirmed | Dropped then partially recovered; a same-week Ahrefs data gap prevents a clean read |

### Timeline

09-04→09-09 impressions collapse (still ranking 3-5) → week of 09-07 weekly impressions -79% WoW → ~09-13 onward position itself breaks down into double digits → 09-18 INP defect diagnosed on the losing page (10 days after onset, so not the trigger; fix still never shipped to prod as of this writing) → 09-21 `/excavator/jcb/` begins its own parallel decline → 09-29 an unrelated admin-ajax 500-error fix ships to Brand Category pages (postdates onset by 3 weeks) → October, "jcb" query disappears entirely from the backhoe-loader page's top keywords → 10-04 and 10-10 alerts fire.

### Ruled out

Not technical/indexation (both pages clean, indexed, no errors). Not CWV (runs backwards from what a CWV theory predicts). Not competitor displacement (same domains on the SERP both dates). Not the admin-ajax fix or the October parts-page launches (wrong timing, wrong URL families). Not a direct edit to either main page.

### Recommended next action

**Can be checked without a decision from you:** re-pull `/excavator/`'s JCB-adjacent keywords once Ahrefs budget allows, to confirm or rule out it absorbing `/excavator/jcb/`'s loss; check the remaining ~65 unsampled Brand Category pages for the same signature; resolve `/concrete-mixer/ajax/` once the data gap closes.

**Needs your call:**
1. The Brand Category mobile INP fix has sat in staging 8+ days past approval — it's a legitimate, separately-diagnosed issue even though it isn't this event's cause. Worth shipping regardless?
2. If Google is structurally reassigning brand-navigational queries like "jcb" away from brand pages toward category hubs, is recapturing these pages' standalone visibility worth pursuing — or should the Brand Category alert's expectations for JCB specifically be recalibrated? By October this looks less like a temporary reallocation and more like a durable new equilibrium.

### Confidence: Medium-high

Kept from "high": neither alert's exact published numbers (23,283→16,894; 194→155) could be reconciled to a specific page or verified aggregate — directionally consistent only, with one apparent exact match traced to a data-gap artifact and discarded. The `/excavator/jcb/` loss has no confirmed compensating page. The Action Plan's description of the "jcb" SERP (sponsored blocks, local pack) doesn't match Ahrefs' own crawl of it — unresolved, likely a methodology difference. Ahrefs' quota ran out mid-investigation, limiting how deep the SERP history pull could go.

---

## PART 2 — Compactor / Product-page cluster

### Most likely root cause

**A Google-side visibility collapse hitting the Product (Models) page type broadly, landing in a precise 3-day window (2026-09-17 to 09-20) — not demand, not competition, not a content edit, not simple cannibalization, and not a current technical fault. The specific trigger is not confirmed.**

Four of the five co-alerting keywords — **compactor, ajax machine, jcb excavator, loader machine** — each rank on a different Product (Models) page, and all four lost 70-93% of daily impressions within the same tight window, with the same shape afterward (sudden collapse, position briefly unaffected, then compounding erosion over the following 1-2 weeks). The identical signature also shows up on other, untracked Product (Models) pages in the sheet's own Decay Queue — meaning this is plausibly broader than just these four alerting keywords, which is the single most important finding here.

Everything locally explicable has been ruled out for the core "compactor" case:
- **Not demand** — India search volume for "compactor" was flat (2,547→2,670→2,475/mo) against an 86-94% site-side collapse.
- **Not competition** — the organic top-10 and SERP-feature stack for "compactor" are unchanged between 09-09 and 10-07; DesiMachines never ranked organically for the bare term on either date.
- **Not a content edit** — all four implicated pages were last modified months before the collapse (April-June 2026).
- **Not cannibalization** — if the query had just shifted to a different DesiMachines page, total impressions for "compactor" across every competing URL would have held flat. Instead the total pool fell 86% while the number of competing thin URLs *rose* — Google fragmenting a shrinking pool across more pages, not redirecting to a winner.
- **Not a current technical fault** — today's Semrush crawl shows the pages clean: indexed, no canonical issues, no CWV flags.
- **Not proportional to a site-wide event** — overall site impressions moved only ~20% in the same window (and recovered by the next day), versus 70-93% on these specific pages.

**One concrete, unconfirmed lead worth flagging**: a field INP defect (388-760ms, traced to the Enquire-sheet button's class toggle re-styling a ~13,000-node DOM) was diagnosed against Product (Models) PDPs on **2026-09-16** — one to three days before the collapse started. No fix for this has shipped. The timing is suggestive but not proven causal.

**The most direct available lead for next steps**: a sitewide Ahrefs Site Audit crawl on 09-28 recorded **+102 newly noindexed pages** and "pages dropped from Top 10" / "organic traffic dropped" flags on dozens more — it was not possible this round (Ahrefs budget ran out) to check whether the four affected pages are among them. This is the single fastest way to confirm or rule out an indexing-side cause once budget allows.

### Affected pages/queries

| Keyword | Page | Status |
|---|---|---|
| compactor | `/compactor/xcmg-xs115h/` | Collapsed 09-19/09-20; 10 of 11 tracked queries on the page fell together (29-95%) |
| ajax machine | `/self-loading-concrete-mixer/ajax-argo-2500/` | Collapsed 09-18, same magnitude |
| jcb excavator | `/excavator/jcb-nxt-215-lc-fuel-master/` | Collapsed 09-17, same magnitude (not SERP/technically checked this round — a gap) |
| loader machine | `/wheel-loader/xcmg-zl33fv/` | Collapsed 09-18, plus a real secondary factor: the live SERP for this query genuinely strengthened (new competitor hub + OEM pages), compounding the slide. Note: the page actually ranking live is the category hub `/wheel-loader/`, not this PDP — attribution unresolved. |

**Not part of this cluster, different mechanism**: farana/farana crane (both on `/crane/hydra/`) — this page stayed healthy throughout (1,800-2,600 impressions/day, no collapse); the two keywords' own slide is an intra-page query reshuffle (other queries on the same page gained as these fell), not a visibility or technical problem. Should not be remediated the same way as the other four.

### Timeline

09-08→09-18 short-lived peak across all four pages → **09-16 INP defect diagnosed on Product (Models) PDPs, no fix shipped** → 09-17 jcb excavator collapses → 09-18 ajax machine and loader machine collapse → 09-19/20 compactor collapses (five independent series break on this identical 2-day window) → 09-20/21 site-wide impressions dip only ~20% and recover by next day (confirms this wasn't proportional/site-wide) → 09-22 onward position erosion compounds → **09-28 sitewide crawl shows +102 newly noindexed pages, not yet cross-checked against these four** → 10-02→10-06 position keeps eroding, last reliable GSC data point → 10-04/10-10 alerts fire in the live sheet.

### Ruled out

Not demand, not a new competitor or SERP feature, not an edit to the affected pages, not simple cannibalization, not a current technical/indexability fault, not proportional to a site-wide event, not the admin-ajax fix or diagnosed INP fixes (neither shipped before or during the collapse), not logged anywhere in Action Plan/URL Structure, not the October new-page launches (wrong URL families, wrong timing).

### Recommended next action

1. **Pull GSC's own Index Coverage / URL Inspection history directly** (not via Ahrefs) for all four pages across 09-15→09-25 — the one source that could directly confirm or rule out an indexing-status change at the exact onset; none of this round's methods had access to it.
2. **Get the actual deploy/commit log for 09-17 to 09-20** from the code repo — the Action Plan sheet evidently didn't log whatever caused a collapse this size, so it can't be trusted alone to say "no site-side cause."
3. **Cross-reference the 09-28 Ahrefs crawl's +102 newly-noindexed pages** against these four (and other Decay Queue Product (Models) pages) once budget allows (after 10-17) — the fastest concrete lead available.
4. Resolve the `/wheel-loader/` vs `/wheel-loader/xcmg-zl33fv/` attribution gap before treating "loader machine" as explained by SERP crowding alone.
5. **Don't rewrite the PDP content as a fix** — nothing points to content quality; that would burn effort before the actual cause is confirmed.
6. Shipping the already-diagnosed Product (Models) INP fix is reasonable as general hygiene regardless, but shouldn't be presented as "the fix" for this cluster unless steps 1-3 connect it to the actual trigger.
7. Re-check once 10-07→10-13 GSC data clears (~10-13) to see whether these pages are stabilizing or still eroding.

### Confidence

**High** that compactor, ajax machine, jcb excavator, and loader machine share one mechanism (synchrony + magnitude + the same shape recurring on other untracked pages make four coincidences implausible). **Low** on the specific trigger — every investigation thread independently reached "couldn't determine" on cause, stated plainly rather than rounded up. **High** that farana/farana crane is unrelated.

**Verdict on urgency: this is a real, ongoing loss worth active investigation, not a transient blip** — the four pages remain 70-85% below baseline as of the last reliable data (10-06), three weeks after onset, with position still eroding rather than recovering. The next step should be diagnostic (GSC Index Coverage, deploy logs, the noindex cross-reference), not a remediation action, since the trigger isn't confirmed yet.

---

## Cross-cutting note

These two clusters don't appear to share a cause. Brand Category is one well-evidenced mechanism (JCB brand-navigational SERP reassignment) concentrated in one page type. Compactor is a broader, multi-page Product-page-type problem with an unconfirmed trigger. The only loose link is an unexplained timing coincidence (several unrelated keywords inflecting within days of each other in both clusters, independently, around mid-to-late September) — not evidence of a shared cause, just worth another look if a cause for either ever surfaces.

## Caveats carried forward, not resolved

- Ahrefs workspace budget is now 198,890/200,000 (99.4%) — essentially exhausted until the 2026-10-17 reset. Several recommended next actions above require Ahrefs calls that aren't affordable until then.
- No access this round to: GSC's own Index Coverage/URL Inspection history, a direct code-repo deploy log, or the hidden 🔁 Blog Refreshes / 🧪 Audit Inputs sheet tabs — any could surface a cause these methods couldn't see.
- The sheet's own alert-generation figures (both clusters) could not be exactly reconciled against independently-pulled GSC data — directionally consistent only in every case checked.
