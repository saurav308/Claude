# SCORECARD — DesiMachines.com

Weekly KPI check against the targets in `seo-ops/registry.md`. Compiled by ORCH, normally Mondays.

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

## Data-integrity flags — as of 2026-09-14

- **GSC daily feed frozen at 2026-08-23 — now 22 days stale.** Every "current" click figure in this document is the best available read, not a live one.
- **New: the weekly/Ahrefs-fed tab pipeline appears to have missed its 09-13 (Sunday) scheduled refresh** — 16 tabs stuck at 09-08/09-09, 5-6 days stale. A second stalled pipeline, independent of the GSC freeze and of this session's own confirmed-working Ahrefs API access.
- Top-3 keyword count now has a **third** distinct "current" value in three cycles (8,710 → 8,461 → 8,288) from different tab snapshot dates — the reconciliation ask from 09-07 is still open, and the underlying trend across the three reads is downward, so this isn't just noise to average away.
- August organic-clicks figure now has **two disagreeing sources**: 39,486 (confirmed monthly close, 09-07) vs. 40,930 (this cycle's Trends & Movers Seasonality table, 09-09) — needs one authoritative source picked, not two numbers coexisting.
- Authority Dashboard/Engine frozen since `run_date` 2026-07-30 — no new run in 6+ weeks.
- Missing Prices tab static since "Generated 2026-08-04" (41 days), still 0/169 filled — no session may invent this data; it needs Saurav's real price sheet.

## WP access — status as of 2026-09-14 (see registry.md for full history)

The ~100-session-fleet mystery from 09-05 is **resolved** (via Gmail, confirmed 09-10): this is one governed 19-task Claude Code operation (Mac + Cloudways server) under a standing SEO-strategist mandate, not an unknown sprawl — `desimachines-weekly-audit-fix` (Sat 09:08) and `desimachines-seo-dashboard-weekly` (Tue 00:01) are the most likely owners of the Semrush/Ahrefs technical-fix content. What's still unresolved: **ORCH itself has no WordPress access and, per a 09-12 live test, this environment's network policy actively blocks outbound calls to desimachines.com** — so even a valid Application Password wouldn't currently let this session reach the site. The WordPress.com connector route was tried and ruled out (no Jetpack, no WordPress.com account on the site). Given no direct or programmatic path exists to the Mac fleet session either (confirmed via `list_triggers`/`ListAgents` on 09-12 — it runs as local launchd/cron jobs, not registered sessions on this account), ORCH compiled everything into one consolidated handoff document (`seo-ops/handoff/mac-fleet-handoff-2026-09-12.md`, sent to Saurav 09-12) for manual relay — no sign of pickup as of 09-14.

## Sessions — status at compile time (2026-09-14)

- **ORCH**: running, daily loop live (`trig_01KeDdx4Bw8NaELHwdU4mzhQ`).
- **S-EXEC**: gone since 09-05 (reclaimed after 8+ days idle). All prepared fixes finalized as deployable content directly in this repo (`seo-ops/fixes/*.md`, `seo-ops/content/*.md`, and the consolidated `seo-ops/handoff/mac-fleet-handoff-2026-09-12.md`) — none confirmed deployed yet.
- **Mac fleet** (19 named scheduled tasks, external, confirmed via Gmail 09-10): actively shipping real fixes as of 09-08 (dozer noindex, author-page fix) with "Verified on production" language; also independently appears to have fixed the `/compare/` HTTP 500 issue and a broken-canonical issue (Semrush F4) by 09-12, per Semrush data — though the sheet's own disclaimer-page claim from the same 09-08 batch still doesn't match production as of 09-14.
- **Blog-refresh engine** (external): recovering since 09-07, ordinary daily growth continuing (279+ posts refreshed as of 09-12).
- **Authority Engine** (external): frozen 6+ weeks, zero outreach ever sent, one approval-ready item sitting unsent in the Blocked-Queue.
- **Weekly/Ahrefs-fed sheet pipeline** (external): now itself stalled — see data-integrity flags above.

## Re-prioritization notes

Three items remain overdue for a decision rather than another status check: (1) the dealer-phone click-test (48 days untested), (2) Authority Engine's frozen outreach (6+ weeks, one email away from LIVE — needs only Saurav's one-word approval on the Blocked-Queue item), (3) the newly-worsening Brand Category visibility alert, which needs a root-cause look before next Monday rather than another week of "still firing, still worsening."
