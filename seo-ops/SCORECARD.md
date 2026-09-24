# SCORECARD — DesiMachines.com

Weekly KPI check against the targets in `seo-ops/registry.md`. Compiled by ORCH, normally Mondays.

## 2026-09-21

**Headline: real traffic growth this week (trailing-28d clicks +21%) and the CWV issue is essentially resolved — but a newly-discovered GA4 measurement gap is now the thing to watch, having gone from a 3-point curiosity to a confirmed 4-day accelerating decline (83%→48% capture of real leads).** This is the first cycle in a while with unambiguous good news on raw traffic and technical health; the open question is now about measurement accuracy, not site performance.

| Metric | Baseline (2026-08-01) | Current (2026-09-21) | Target | Status |
|---|---|---|---|---|
| Organic clicks/mo | ~31k (Jun) | **Trailing 28d: 43,000 clicks (Recent tab, final day 09-19), up from 35,410 the prior 28d — +21%.** August itself: 40,930 (Trends & Movers monthly table — this is now the only Aug figure present anywhere in the sheet; the previously-cited 39,486 "confirmed close" no longer traceable, formally still unreconciled). September is mid-month, no full-month figure yet. | ≥60k by 2026-11-01 (2x); 95k stretch (3x) | 🟢 first real acceleration signal in weeks — trailing-28d run-rate (~46k/mo annualized from the 28d figure) is meaningfully closer to the 2x target than any prior read |
| Top-3 keywords | 8,426 | **7,878** (Trends & Movers, Position Band 1-3, window ending 09-16) — prior 28d was 8,797, 28d-before was 8,483: a non-monotonic up-then-down pattern, likely a window-comparability artifact rather than a real reversal-then-decline. The new Keyword Positions tab (453 tracked keywords, daily) could eventually replace this reconciliation-prone series, but this cycle's pull only sampled 51 of 453 rows (impression-biased) — not yet a clean substitute. | ≥9,500 | 🟡 83% of target; volatile/hard-to-trust series, flagged for a full Keyword Positions pull next cycle to finally get one clean source |
| Lead measurement (was "Lead rate") | 14.6% | **Reframed this cycle — the real story is a measurement gap, not the rate itself.** GA4 now captures only 48% of real leads as of 09-20 (was 83% just 3 days earlier, 09-17) — a confirmed 4-day accelerating decline via the new Website Record vs GA4 table, not noise. True click-to-lead rate is understated by GA4 and increasingly so; no clean website-record-based rate exists yet to replace the old GA4-derived figure. | ≥14.6% held | 🔴 can't currently give a trustworthy number — the measurement gap itself is this cycle's real finding |
| AIO citations (core set) | 1/3 | 3/4, unchanged since 09-15 — **now 6 days without a fresher spot-check** | ≥15/60 full target | 🟡 holding but stale; overdue for a re-check |
| AI/LLM sessions/28d | 292 | **523 (weekly-bucket sum, trailing 4 completed weeks: 08-24/08-31/09-07/09-14)** — up from the 464 carried-forward figure, but this is a weekly-sum not a rolling-28d pull, so treat as directionally better, not a strict apples-to-apples improvement. 90d total: 1,411 sessions / 145 leads / 10.3% lead rate. | ≥900/28d | 🔴 58.1% of target on the fresher read (was 51.6%) — improving but still well short |

### This week's major developments

- **CWV essentially resolved, confirmed via Semrush.** Slow-page count: 7,981 (baseline) → 826 (09-12) → **47 (09-19)**, a -99.4% total drop. This has been the single largest recurring technical-health flag in this document for six weeks; it's done.
- **New headline risk: GA4 lead-capture rate in free-fall.** 53%(09-16)→83%(09-17, peak)→71%(09-18)→60%(09-19)→**48%(09-20)** — 4 straight declining days, ~-12 points/day, now below the pre-peak baseline with no reversal yet. This directly affects every lead/conversion number anyone (including this document) reports from GA4. Recommend treating this as this week's top priority to root-cause, not just track.
- **Sunday Ahrefs-competitor refresh missed for a second consecutive week** — Competitors/Competitor Pages/Backlink Gap/Whitespace stuck at 09-16, now 5 days stale. The 09-19 "Routine v2" change cut this job's weekly Ahrefs budget 30k→10k units, which may be a contributing factor but doesn't fully explain a total miss.
- **Real technical/content work shipped this week**, independent of the above: dozer sub-category titles/descriptions, 41 dozer PDP descriptions, 21 oversized images compressed (132MB→51MB), 2 broken internal links fixed, a new "Audit Inputs" triage tab cross-referencing Ahrefs+Semrush findings against the live site.
- **GSC Daily Trend appendix table now 36 days frozen (08-16)** — but continues to read as a broken presentation table, not a real feed problem: Recent and Keyword Positions tabs both remain current (09-19), a normal 2-day lag.
- **Mac-fleet handoff document, sent 09-12, still shows no sign of pickup after 9 days.**

## 2026-09-14

**Headline: multiple independent signals point the same direction this week — rankings, visibility, and AI-referral lead quality are all softening at once, on top of a second data pipeline now stalled alongside the 22-day-frozen GSC feed.** Top-3 keyword count has declined across three consecutive read points (8,743→8,490→8,288). The Brand Category visibility alert that first fired 09-13 (-31% WoW) worsened to -40% WoW by 09-14 — two consecutive days deepening, not a blip. AI-referral lead rate slipped from 13.8% to 12.0%. None of these alone would be alarming; together, in the same week, they're worth someone looking at what's actually happening on the Brand Category template/pages rather than waiting for next week's read.

| Metric | Baseline (2026-08-01) | Current (2026-09-14) | Target | Status |
|---|---|---|---|---|
| Organic clicks/mo | ~31k (Jun) | **39,486 (Aug, confirmed close, per 09-07)** — but this cycle's Trends & Movers "Seasonality" table (09-09) shows a conflicting **40,930** for the same August month; not reconciled, don't treat either as replaced. Sep still has no usable full-month figure (GSC frozen since 08-23); only a partial-month read exists (9,014 clicks through ~09-06). | ≥60k by 2026-11-01 (2x); 95k stretch (3x) | 🟡 unchanged from last confirmed read; **cannot assess current pace** — Sep is a data gap, not a number |
| Top-3 keywords | 8,426 | **8,288** (Trends & Movers, Position Band 1-3, dated 09-09, window 08-10→09-06) — **declining across 3 consecutive reads: 8,743→8,490→8,288.** Now a third distinct "current" figure layered on the unresolved 8,710-vs-8,461 gap flagged 09-07. | ≥9,500 | 🔴 87.2% of target and **trending the wrong way**, not just short — downgraded from 🟡 |
| Lead rate | 14.6% | ≈9.8% click-to-lead (re-derived from SEO→Sales Funnel category totals, 09-09, 90d: 6,118 leads / 62,576 clicks — same ballpark as the prior 9.6%, not a confirmed like-for-like re-read); AI-referral **12.0%** (AI & Answer Engines, 09-09, 90d: 157 leads / 1,307 sessions) — down from 13.8% | ≥14.6% held | 🔴 below baseline; AI-referral channel — the one bright spot in every prior cycle — softened too this week |
| AIO citations (core set) | 1/3 | 4/4 held, per the 09-08 spot-check — **now 6 days without a fresher check.** New nuance carried from 09-08: on 2 of the 4 core queries (commercial/price intent), the AI Overview body now names a competitor (InfraJunction/IndiaMART) as the "next step" even though our citation still holds — citation presence stable, referral-click risk rising. | ≥15/60 full target | 🟡 downgraded from 🟢 — technically holding, but the qualitative risk flagged 09-08 hasn't been re-checked or addressed |
| AI/LLM sessions/28d | 292 | **464/28d carried forward from 09-07 — not re-verified this cycle** (no clean 28d figure available; the AI & Answer Engines tab's weekly rows include a partial final week that can't be safely summed). 90d total: 1,307 sessions / 157 leads. | ≥900/28d | 🔴 51.6% of target (last known clean figure) |

### This week's new/worsening findings

- **Brand Category visibility alert, day 2: -31% WoW (09-13) → -40% WoW (09-14).** Impressions 68,961→41,433 on the latest read. First-ever Alerts-tab trigger in the tracked period, and it's deepening rather than resolving. Not yet diagnosed which specific pages/queries are driving it — next priority for the daily cycle.
- **New: the weekly/Ahrefs-fed tab refresh appears to have missed its scheduled Sunday (09-13) run.** Every weekly tab (Keywords, Pages, Trends & Movers, Cannibalization, Demand & Coverage, SEO→Sales, Geography, AI & Answer Engines, Social→SEO, Web Vitals, Technical & Structure, Waste & Freshness, Crawl Audit, Competitors, Competitor Pages, Backlink Gap, Whitespace) is stuck at 09-08/09-09 — 5-6 days stale. This is a **second stalled pipeline**, distinct from and in addition to the GSC daily feed. Every metric in the table above is only as fresh as this stalled pipeline allows.
- **Disclaimer three-way contradiction now re-confirmed live for 4 consecutive days** (09-11 through 09-14, Sheet1's own daily Live-HTTP check) — `/disclaimer/` still 404s in production despite the Insights Log's 09-08 "FIXED" claim and the Action Plan's "non-issue" archival.
- **Positive: Ahrefs workspace limit doubled to 200,000 units** (from 100,000), usage flat at 79,953 since 09-13 — the budget-headroom concern flagged 09-13 (80% of the old limit used) is resolved; now at ~40% of the new limit.
- **Mac-fleet handoff document** (sent 09-12, consolidating all open ORCH fixes/content for the WP-access-holding Mac fleet session) shows **no sign of pickup as of 09-14** — 2 days in, not yet a concern, but worth watching.

## 2026-09-07

**Headline: August closed confirmed at 39,486 clicks (+11.4% MoM) — but MoM growth is decelerating three months running (21%→13%→11%), and a straight-line extrapolation at that decay rate lands short of the 60k-by-Nov-1 target unless growth reaccelerates.** This is the first cycle with a real, confirmed monthly close rather than an extrapolated MTD figure — treat prior cycles' "run-rate" numbers as superseded.

| Metric | Baseline (2026-08-01) | Current (2026-09-07) | Target | Status |
|---|---|---|---|---|
| Organic clicks/mo | ~31k (Jun) | **39,486 (Aug, confirmed close)** — Sep has no real data yet (GSC frozen at 08-23) | ≥60k by 2026-11-01 (2x); 95k stretch (3x) | 🟡 65.8% of 2x target, 41.6% of 3x; MoM growth decelerating (21%→13%→11%) — **not confirmed on pace** |
| Top-3 keywords | 8,426 | ~8,461 (freshest read; reconciliation gap vs last cycle's 8,710 — different snapshot dates, not a real conflict) | ≥9,500 | 🟡 89% of target |
| Lead rate | 14.6% | 9.6% click-to-lead (90d blended, unchanged from last cycle — data stale since 09-02); AI-referral 13.8% | ≥14.6% held | 🔴 below baseline; AI channel still holding up best |
| AIO citations (core set) | 1/3 | 4/4, held since 08-25 — **13 days without a fresher spot-check** | ≥15/60 full target | 🟢 core set solid but unverified-fresh; scale-out to remaining ~56 not started |
| AI/LLM sessions/28d | 292 | **464/28d (clean comparable figure, first time)** | ≥900/28d | 🔴 51.6% of target — worse and clearer than the prior placeholder estimate |

## What changed since 2026-09-01

| Metric | Baseline (2026-08-01) | Current | Target | Status |
|---|---|---|---|---|
| Organic clicks/mo | ~31k (Jun best-ever) | ~38–40k run-rate (Aug MTD 29,753 through day 23, extrapolated — **not a confirmed close**) | ≥60k by 2026-11-01 (2x) | 🟡 ~65% of target; **not currently on pace** at this run-rate |
| Top-3 keywords | 8,426 | 8,710 | ≥9,500 | 🟡 92% of target, recovering but short |
| Lead rate | 14.6% | 9.4% click-to-lead (90d blended); AI-referral leads 14.0% | ≥14.6% held | 🔴 below baseline overall; AI channel holding up best |
| AIO citations (core set) | 1/3 spot-checked | 4/4 held, 2nd consecutive week | ≥15/60 full target | 🟢 core set solid; scale-out to remaining ~56 not started |
| AI/LLM sessions/28d | 292 | ~1,161/90d (rate not directly comparable) | ≥900/28d | 🟡 needs a clean 28d comparison next cycle |

- August's MTD extrapolation (~38–40k, reported 09-01) is now superseded by the confirmed 39,486 close — the extrapolation held up well, for the record.
- Blog-refresh engine broke its ~10-day stall on 09-07 (271 posts refreshed, 241/254 stamped) — the one clear positive since last week.
- Semrush access restored (was blocked 09-05), but its weekly audit cadence slipped to biweekly — no new snapshot since 08-29, next due 09-12. No CWV before/after is possible yet regardless, since nothing has been deployed to WordPress.
- **New finding (09-07): Ahrefs workspace usage jumped to 63,475/100,000 (63.5%)** — far more than this session's own 4,914-unit spend on 09-05, consistent with the newly-discovered ~100-session fleet drawing on the same shared account. No centralized budget tracking across that fleet is visible from here.

## Data-integrity flags — as of 2026-09-21

- **GSC Daily Trend appendix table: 36 days frozen at 08-16** (worsened from 08-23 during a since-partial repair). Continues to read as a broken presentation table, not a real feed problem — Recent and Keyword Positions tabs both remain current (09-19, normal 2-day lag).
- **New headline flag: GA4 lead-capture rate fell from 83% to 48% over 4 consecutive days (09-17→09-20)** — a confirmed, accelerating measurement gap, not noise. Affects every lead/conversion figure sourced from GA4, including this document's own "lead rate" row historically.
- **Sunday Ahrefs-competitor refresh missed for a second consecutive week** — 5 days stale as of today, likely related to the 09-19 Ahrefs-budget cut (30k→10k weekly units) but not fully explained by it.
- Top-3 keyword count remains a volatile, hard-to-trust series across cycles (7,878 this week, non-monotonic vs. the prior two reads) — still not resolved by a single clean source, though the new Keyword Positions tab is a candidate once fully sampled.
- August organic-clicks figure: only one value (40,930) is now traceable in the sheet; the earlier "confirmed close" of 39,486 is no longer independently reconcilable — treating 40,930 as current by default, flagging the discrepancy as unresolved rather than silently dropped.
- Authority Dashboard/Engine frozen since `run_date` 2026-07-30 — now 52 days, no new run.
- Missing Prices tab static since "Generated 2026-08-04" (48 days), still 0/169 filled.

## WP access — status as of 2026-09-21 (see registry.md for full history)

Unchanged since 09-14: ORCH still has no WordPress access (this environment's network policy blocks outbound calls to desimachines.com; the WordPress.com connector route was tried and ruled out). The consolidated handoff document (`seo-ops/handoff/mac-fleet-handoff-2026-09-12.md`) has now shown **no sign of pickup for 9 consecutive days**. Worth a direct check-in with Saurav on whether it was ever relayed.

## Sessions — status at compile time (2026-09-21)

- **ORCH**: running, daily loop live (`trig_01KeDdx4Bw8NaELHwdU4mzhQ`), now also reading the new Site Inventory tab Mondays/Thursdays (added 09-17, known partial-coverage limitation documented in registry.md).
- **Mac fleet** (19 named scheduled tasks, external): clearly active and shipping real fixes throughout this past week — a large 09-18 dashboard-accuracy self-audit (9 closures), a 09-19/09-20 content/technical-fix batch (dozer titles, image compression, broken links), and the new Audit Inputs/Website-Record-vs-GA4 tracking tabs, both built in direct response to findings ORCH surfaced (schema/CWV data, GA4 undercounting). Quality and responsiveness look genuinely good this week.
- **Blog-refresh engine** (external): found on 09-19 to have been quietly stalled since 08-27 (~3+ weeks) despite the tracking tab re-exporting cumulative totals daily — corrected after ORCH had mischaracterized it as active in earlier cycles.
- **Authority Engine** (external): frozen 52 days, zero outreach ever sent, one approval-ready item still sitting unsent.
- **Sunday Ahrefs-competitor pipeline** (external): now itself stalled 2 weeks running — see data-integrity flags above.

## Re-prioritization notes

Three items are overdue for a decision or root-cause rather than another status check: (1) **the GA4 capture-rate collapse (83%→48% in 4 days)** — this week's most urgent item, needs actual investigation into why, not just continued tracking; (2) Authority Engine's frozen outreach (52 days, one email away from LIVE — needs only Saurav's one-word approval); (3) the Mac-fleet handoff sitting unactioned for 9 days — worth confirming directly with Saurav whether it was ever relayed, rather than continuing to check silently each day.
