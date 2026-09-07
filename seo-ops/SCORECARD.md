# SCORECARD — DesiMachines.com

Weekly KPI check against the targets in `seo-ops/registry.md`. Compiled by ORCH, normally Mondays.

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

## Data-integrity flags this period

- GSC daily feed frozen at 2026-08-23 — now **15 days stale**, unchanged for a full week. This is no longer "lag," it's a stalled pipeline; every "current" click/keyword figure above is the best available read, not a live one.
- Sheet's own Ahrefs-dependent competitor/Authority-Engine pipeline stalled since 08-25/08-10 respectively, independent of this session's own confirmed-working Ahrefs access.
- Top-3 keyword count has two different "current" values across recent cycles (8,710 vs 8,461) from different tab snapshot dates — needs a single clean reconciled read next cycle rather than two competing numbers.

## MAJOR — the session-fleet question (open since 2026-09-05)

S-EXEC no longer exists. The account runs ~100 other DesiMachines-related Claude sessions this registry never tracked (e.g. "Desimachines weekly audit fix," "Dm vernacular pages plan," "UGC: Used/ Rent") — ORCH can see titles/cadence but not their content. Asked Saurav on 09-05 whether these already cover the Semrush/Ahrefs technical fixes, the Hindi decision, and used/rental; **no reply as of 09-07, and no corroborating evidence in the sheet that anyone acted on it.** Saurav separately offered WP access in chat on 09-07 — ORCH requested the actual connection details (application password + REST route, or SSH/WP-CLI) and is awaiting them; once received, execution will proceed directly from this session rather than via a new S-EXEC-style relaunch.

## Sessions — status at compile time

- **ORCH**: running, daily loop live (`trig_01KeDdx4Bw8NaELHwdU4mzhQ`).
- **S-EXEC**: gone (reclaimed after 8+ days idle). All prepared fixes finalized as deployable content directly in this repo instead (`seo-ops/fixes/technical-fixes-final.md`, `seo-ops/content/*.md`) — none deployed yet, awaiting WP access.
- **Blog-refresh engine** (external): stall broken 09-07, 241/254 posts stamped — recovering.
- **Authority Engine** (external): frozen 4+ weeks, zero outreach ever sent — escalation candidate, unchanged.
- **Sheet daily-pulse pipeline** (external): daily tabs current; weekly/paid tabs stalled since 08-25; Ahrefs-fed tabs' banner dates observed one day ahead this cycle (IST/UTC rollover artifact, content unaffected).
- **~100-session fleet** (external, newly discovered 09-05): content/status unknown to ORCH; awaiting Saurav's clarification.

## Re-prioritization notes

Two items remain overdue for a decision rather than another status check: (1) the dealer-phone click-test (41 days untested), (2) Authority Engine's frozen outreach (4+ weeks, one email away from LIVE). A third now joins them: (3) the session-fleet question, now blocking ORCH from knowing whether further content production duplicates existing work.
