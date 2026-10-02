# DesiMachines SEO Growth — Handoff Summary

**As of:** 2026-08-27 · **Written by:** ORCH (Head of SEO & Organic Growth session) · **For:** picking this work up cold, in this session or a new one.

---

## 1. The goal

DesiMachines.com (India's neutral construction-equipment discovery/comparison platform; revenue = qualified leads to OEMs/dealers/financiers/insurers, sells nothing itself) wants **3x organic traffic**. This session was set up as the orchestrating "Head of SEO & Organic Growth," reading a live master data feed, mapping every growth lever, finding gaps against already-running sessions, and building/running a system of chartered sub-sessions with measurable KPIs — not just writing another strategy doc.

**Definition of success set on 2026-08-01:** North star = qualified organic leads, traffic is the input. Because impressions were flat/declining at the time and CTR gains alone saturate around 2x, the honest target is **2x organic clicks (~60k/mo) by 2026-11-01, 3x (~95k/mo) by month 5–6**, holding the ~14.6% lead rate, top-3 keywords ≥9,500, AIO citations on ≥15 of 60 tracked queries, AI/LLM sessions ≥900/28d, and a CRM-joined revenue attribution live by then.

## 2. Decisions made, and why

- **`seo-ops/` in the repo is the single source of truth**, not chat memory — `registry.md` (session charters + KPIs + guardrails), `logs/orch/` (dated review cycles), `logs/exec/` (execution batches), `prompts/` (ready-to-paste session prompts), `fixes/` (validated issue packages). *Why:* the prior portfolio (PRs #1–#3) was 99% documentation with no tracking system, so charters drifted and nothing got measured against a target.
- **Chartered and launched a separate execution session, S-EXEC**, on **Sonnet 5** (this orchestrator stays on the top-tier model) rather than doing execution work inline. *Why:* the diagnosis, repeated three review cycles running, was that the strategy/analysis layer was excellent but nothing was shipping — a dedicated session with a WP-CLI/REST-focused charter was the fix, per your "use appropriate model of Claude code" instruction.
- **Built a scheduled daily ORCH loop** (a Routine, not manual polling) that pulls the sheet, diffs it, routes issues to the right session, and logs — because the report is a live feed, not a snapshot, and drift compounds if reviewed only when asked.
- **Every claim is cited to a sheet tab or API metric; nothing invented.** When Ahrefs/Semrush ran out of quota or the API lapsed, that was reported as a gap, not papered over.
- **Guardrails encoded, never overridden:** product-page titles are hand-set by you and must not be bulk-rewritten (your 07-28 call); ask-first before robots/sitemap changes, mass redirects, site-wide noindex/canonical rules, deletions, deploys, or YMYL finance/insurance claims. All canonical/title/schema fixes proposed so far are page-level, not site-wide rule changes, so they're pre-authorized under the S-EXEC charter — but redirects and anything crossing the ask-first list still come to you first.
- **Recommended (not yet executed) killing PR#2 and PR#3 as separate sessions**, merging their content into the canonical branch — they collide on file numbering and neither owns a live KPI.
- **Prioritized data-validated fixes over the raw issue count.** When you said Semrush was open in your browser, I pulled the same audit via API rather than trusting a screen I can't see, and separated 5 real, fixable issues from ~90% noise (see §4).

## 3. Where things stand right now

- **Business trajectory (as of the 2026-08-19 review, the latest full one):** August was pacing ~4% ahead of July's record month (35,441 clicks, best ever, +942% YoY) — 19,023 clicks in the first 16 days. The impressions decline that had been going on since June **reversed**. Top-3 keyword erosion, declining three periods straight, **halted**. Google's AI Overviews cited DesiMachines on **4 of 4** spot-checked queries including the first **commercial** one. Traffic share taken from the competitor peer set rose 5.21%→6.08% during a 3-week window Ahrefs was down.
- **The recurring, still-unresolved problem, flagged in 3 straight reviews:** JCB/Poclain/Hydra keyword cannibalization across 10–15 duplicate URLs each. "jcb price in india" has slid position **2.3 → 3.1 → 4.0 → 4.5** across the reviews while the canonical fix sat "OPEN — carried."
- **Two automations stalled silently:** the blog-refresh engine hasn't logged a post since 08-05 (was 10/day, 116 of 180 posts still pending); the Authority Engine has been frozen since 07-31 with **zero outreach ever sent**, even though its queued jobs unblocked on 08-10.
- **Toolchain:** Ahrefs API entitlement lapsed around 08-17/19 (`Insufficient plan` on every endpoint, including the free ones) — this also feeds the master sheet's GSC columns, so it's a live risk to the dashboard itself. Semrush is working (topped up). Not yet re-verified as of this writing; the daily loop checks it automatically.
- **Your 08-19 mobile-CWV/form changes:** never logged in the sheet (no row documents what changed). I locked the pre-ship baseline for comparison: Product-template mobile INP was 1,100ms (SLOW, the site's worst signal), form completion was ~2.2% (741 starts → 16 submits on 08-18). Effect isn't measurable yet — needs the next weekly CWV run (~08-23, should exist by now) and a few days of Leads & Events data. **This has not been checked since the 08-19 review — worth doing on the next cycle.**
- **Semrush Site Audit validated (08-27):** of the scary headline (7,896 errors), 95% is one thing (7,544 "slow pages," tied to the CWV work above). Found and packaged 5 genuinely real, fixable issues (see §4) plus a noise triage so you don't chase false signals.
- **S-EXEC launched today (08-27)** with a kickoff addendum covering current reality (no WP access yet, Ahrefs down, use Semrush+Exa+sheet). Its first job: turn the 5 validated fixes into ready-to-apply WP-CLI/REST/template artifacts in `seo-ops/exec/ready/` so they can ship the hour credentials arrive, then do its own Phase-1 site/traffic deep-dive. **I have not yet checked back on its progress.**
- **Daily ORCH loop is live** (Routine, fires ~00:30 IST daily). It fired once already; that cycle has **not yet been run/actioned** because your handoff request came in first — it will fire again on its normal schedule, or can be triggered on demand.

## 4. The validated Semrush fix package (ready for S-EXEC to implement)

Full detail in `seo-ops/fixes/semrush-audit-fix-package.md`. Summary:
1. **F1** — Site-wide nav links to `/skid-steer-loader` and `/telehandler` are missing trailing slashes, forcing a 301 on every internal click sitewide → 21,776 notices. One menu edit fixes it.
2. **F2** — 168 structured-data errors = your 169 unpriced products' Product schema is missing `offers`/`aggregateRating`/`review`. Fix: fill the 10 P1 prices (~15 min, independently your highest-leverage open item) + a template rule to suppress the schema block when unpriced.
3. **F3** — A generator bug created a self-compare page (`manitou-1340r-vs-manitou-1340r`), the site's only 4xx. Delete + add a guard.
4. **F4** — 9 compare pages canonicalize to reversed-order URLs that were never generated (404s). Exact list in the fix file; per-page canonical fixes.
5. **F5** — 16 duplicate titles where the compare-page title generator drops model variant tokens ("Plus"/"X"/BS-series).
6. **F6 (not a new fix, a metric to watch)** — 7,544 slow pages is the CWV work already in flight; the next Semrush audit (~08-29, weekly) is the independent before/after for your 08-19 changes.

## 5. Files, names, and IDs you'll need

**Repo:** `saurav308/Claude`
- Branch `claude/desimachines-seo-growth-baknjd` — this orchestrator's branch, has all `seo-ops/` work.
- Branch `claude/desimachines-site-executor` — S-EXEC's branch (new).
- **PR #5** (draft): https://github.com/saurav308/Claude/pull/5 — the seo-ops system.
- Older branches: `claude/desimachines-seo-strategy-hdgg2p` (PR#1, original 90-day blueprint, docs 00–19), `claude/search-console-errors-9frpb9` (PR#2, recommend merge/retire), `claude/tech-stack-seo-viability-4qo1vc` (PR#3, recommend merge/retire), `claude/promotedge-seo-audit-colzqa` (PR#4, different business — out of scope).

**Key files:**
- `seo-ops/registry.md` — read this first, always. Session charters, KPIs, guardrails.
- `seo-ops/prompts/01-site-executor.md` — S-EXEC's full charter.
- `seo-ops/fixes/semrush-audit-fix-package.md` — the 5 validated fixes.
- `seo-ops/logs/orch/2026-08-07-report-review.md`, `2026-08-19-report-review.md` — prior review cycles, with the leak history (JCB cannibalization trend, etc.).
- `seo-ops/HANDOFF.md` — this file.

**Session/trigger IDs:**
- This orchestrator session: `session_017vCh5x7GCeLvoqMqtDN8Ra`
- S-EXEC session (Sonnet 5): `session_01DjyxjKen4GXYxo3XCByLDN`
- Daily ORCH Routine: `trig_01KeDdx4Bw8NaELHwdU4mzhQ` (cron `0 19 * * *` UTC = 00:30 IST)

**Data sources:**
- Master sheet: `14pJu0Ji-5LRZKkYR2F6uZYay-GUs-HzVC7d0gVeTaz0` (Google Drive connector)
- Ahrefs project "Desimachines" id `9518353` (API currently broken — verify)
- Semrush project `22542129` "Desi Machines" (working, database `in`)

## 6. Open questions — need Saurav

1. **WP application password / real REST route (WP-Hide renames `/wp-json`), or SSH+WP-CLI** — the single biggest blocker; S-EXEC can prepare fixes but not ship them without this.
2. **Ahrefs subscription/API status** — check and restore if lapsed.
3. **Fill the 10 P1 missing prices** in the sheet's 💰 register.
4. **Hindi unpark decision** — evidence has hardened across two reviews (competitors winning with full Hindi mirrors); still parked pending your call.
5. **Used/second-hand unpark decision** — same pattern, still parked.
6. **Equipment Times outreach send-approval** — the Authority Engine's only unblocked action, still waiting.
7. **What exactly changed in the 08-19 CWV/form deploy** — never logged; would sharpen the before/after read.
8. **Merge/retire PR#2 and PR#3** as separate sessions — recommended, not executed.
9. **External sessions** (sheet pipeline, blog-refresh engine, Authority Engine, Action-Plan compiler) run outside this repo with unknown charters, reverse-engineered from their outputs only — share their prompts, or confirm reverse-engineering into the registry is fine.

## 7. Instructions to pick this up cold

1. Read `seo-ops/registry.md` in full, then this file.
2. Check PR #5 for anything merged/changed since 2026-08-27.
3. Pull the master sheet fresh; diff against `seo-ops/logs/orch/2026-08-19-report-review.md` (the last full review) — expect the daily Routine to have already logged smaller diffs since then in `seo-ops/logs/orch/`.
4. Check S-EXEC's status (`session_01DjyxjKen4GXYxo3XCByLDN`) — has it produced `seo-ops/exec/ready/` artifacts, opened a PR, hit the WP-access blocker?
5. Verify Ahrefs API status with one `subscription-info` call.
6. Resume the daily/weekly cadence: daily diff-and-route, Monday `seo-ops/SCORECARD.md`, Friday Semrush-audit before/after check.
7. On any of the ask-first triggers (robots/sitemap, mass redirects, site-wide noindex/canonical, deletions, deploys, YMYL claims) — stop and ask, per standing rule.
