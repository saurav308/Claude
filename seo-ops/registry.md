# SEO Ops Registry — DesiMachines.com

**Single source of truth for every Claude session running on this site.** Every session reads this before acting and logs each cycle to `./seo-ops/logs/`. Maintained by ORCH.

Last updated: 2026-09-05 (ORCH) — **major finding this update, read the new section below before acting on anything else in this file.**

---

## ⚠️ MAJOR FINDING (2026-09-05) — a much larger, pre-existing session fleet exists outside this registry

While re-checking S-EXEC's status, its session ID returned "not found" — independently confirmed twice (once by a research subagent, once by ORCH directly). Cross-checking the account's full session list surfaced **~100 other Claude Code Remote sessions touching DesiMachines**, most running on a clear recurring cadence, that this registry has never tracked because ORCH had no visibility into them until now. Sampled titles (session IDs in the raw list, not repeated here — re-list via `list_sessions` if needed): **Desimachines opportunity desk** (near-daily), **Desimachines shorts drip** (near-daily, likely social/video), **Desimachines channel news** / **channel tenders** (near-daily), **Desimachines weekly audit fix** (weekly, last fired 2026-08-29 — this is almost certainly the intended owner of exactly the Semrush/Ahrefs technical-issue resolution this registry has been tracking as unowned), **Desimachines seo dashboard weekly**, **Desimachines design qa weekly**, **Dm price title test**, **Dm vernacular pages plan** (the Hindi-unpark question may already be someone's active workstream), **UGC: Used/ Rent** (active as of 2026-09-03, despite the sheet describing "used" as parked), **Dozer product details development** (2026-09-04 — explains the /dozer/ hub build), **Desimachines routine librarian**, **Claude x DM sessions summary and prompt**, **System cleanup and session consolidation** (2026-08-28 — same week ORCH built S-EXEC; may be related to why S-EXEC no longer exists), **Desimachines megamenu refresh**, **Desimachines model cost review**, **Build customer retention system for DesiMachines**, **Desimachines weekly newsletter**, **Dm control inbox**.

**What this means, concretely:**
1. **S-EXEC is gone** — either reclaimed after 8+ days idle/disconnected, or caught in the 2026-08-28 "System cleanup and session consolidation" session. Its prepared fixes (Semrush F1–F5, the Ahrefs findings) were never applied — no WP access was ever granted to it before it disappeared.
2. **ORCH cannot read these other sessions' content** — `get_session` returns metadata only (title/status/timestamps), no transcript/message access exists from this session. Everything above is inferred from titles and cadence, not verified content.
3. **This registry has likely been duplicating or missing work** this whole operation — e.g., "Desimachines weekly audit fix" may already handle exactly what the two `seo-ops/fixes/*.md` files were written for; "Dm vernacular pages plan" may already own the Hindi decision this registry has flagged as pending 3 reviews running.
4. **Action for Saurav:** the fastest way to resolve this is for you to tell ORCH (a) whether "Desimachines weekly audit fix" already covers the Semrush/Ahrefs findings in `seo-ops/fixes/`, (b) who/what has actual WP write access now that S-EXEC is gone, and (c) whether you want ORCH to keep operating a parallel repo-based system at all, or fold into whatever the other session fleet already does. Until then, ORCH will keep producing ready-to-ship content (titles, schema, fix specs) into this repo as the safest default — it duplicates nothing live, and costs nothing if another session already covers it.

## Active sessions

### ORCH — Orchestrator / Head of SEO & Organic Growth
- **Where:** this repo, branch `claude/desimachines-seo-growth-baknjd`
- **Objective:** own the 3x-traffic mission; run the daily report-diff loop and weekly scorecard; route issues to owning sessions; maintain this registry.
- **KPI / target:** portfolio-level — organic clicks ~31k → ≥60k/mo by 2026-11-01 (2x), ~95k/mo by month 5–6 (3x); lead rate ≥14.6% held; top-3 keywords 8,426 → ≥9,500.
- **Inputs:** master sheet (`14pJu0Ji-5LRZKkYR2F6uZYay-GUs-HzVC7d0gVeTaz0`, daily 5 PM refresh); Ahrefs project 9518353 GSC/web-analytics (0-unit endpoints); session logs in `seo-ops/logs/`.
- **Outputs:** daily diff + routing notes → `seo-ops/logs/orch/`; weekly `seo-ops/SCORECARD.md`; registry updates; session charters + prompts.
- **Cadence:** daily pull 00:30 IST (after the sheet's 23:45 IST refresh) — LIVE via Routine `trig_01KeDdx4Bw8NaELHwdU4mzhQ` (created 2026-08-27); weekly scorecard Monday.
- **Guardrails:** never spends Ahrefs paid units without budgeting (quota exhausted until 2026-08-09; ≤5k units/week after); ask-first list per Saurav's rules applies portfolio-wide.

### S-EXEC — Site Execution Engineer  *(chartered 2026-08-02; LAUNCHED 2026-08-27; SESSION NO LONGER EXISTS as of 2026-09-05 — see finding above)*
- **Was:** cloud session `session_01DjyxjKen4GXYxo3XCByLDN` (model claude-sonnet-5), branch `claude/desimachines-site-executor`; charter at `seo-ops/prompts/01-site-executor.md` + kickoff addendum. Reached "Phase 0 complete, Semrush F1–F5 ready-to-apply artifacts prepared, blocked on WP access" and then went idle; `get_session` now returns "not found" (confirmed twice, 2026-09-05). **Never received WP access before disappearing — nothing it prepared was ever applied to the live site.**
- **All fixes it would have applied are now finalized as deployable content directly in this repo** (no execution session to hand them to): `seo-ops/fixes/technical-fixes-final.md` (Semrush F5 — 16 corrected titles; Ahrefs F3 — full ~57-image alt-text mapping), `seo-ops/content/aeo-hub-rewrites.md` (7 hub-page rewrites + FAQ schema, covering ~80% of the AEO opportunity), `seo-ops/content/quickwin-model-pages.md`, `seo-ops/content/cannibalization-consolidation.md`, `seo-ops/content/decay-page-fixes.md` — all written 2026-09-05, all still needing someone with WP access to actually deploy them.
- **Still open, unfixed, re-verified 2026-09-05:** dozer compare 404s (518 URLs, finish-vs-suppress decision needed from Saurav), motor-grader broken images (283 URLs, root cause needs live access to isolate), 169 unpriced products (needs Saurav's price data, no session can produce this).
- **Do not re-launch a new S-EXEC-style session until Saurav answers the fleet question above** — launching a duplicate execution session before knowing whether "Desimachines weekly audit fix" already owns this would compound the duplication problem, not fix it.
- **Objective:** Phase 1 deep-dive (traffic forensics, whole-site model, content-bucket map, link graph), then direct implementation on the live WP site + growth tooling: W1 meta/AEO (60 targets + remaining template titles + schema hygiene), W2 own crawler/index hygiene, W3 internal-linking engine, W4 used-valuation tool, W5 WhatsApp platform, W6 Hindi `/hi/` surface, W7 AI-engine distribution (llms.txt, feeds, Brand Radar prompts), W8 SERP wargaming.
- **KPI / targets:** 60-target head-term CTR 0.2%→0.6%; blended CTR ≥1.2% (+6 wks); orphans 1,365→<100; top-3 ≥9,500 by 11-01; ≥100 valuation leads/mo (+8 wks); ≥300 WhatsApp RFQs/mo (+8 wks); Hindi clicks 0→2k/mo (+10 wks); LLM sessions 292→900/28d; AIO citations ≥15/60; competitor-template detection <7 days.
- **Inputs:** master sheet; Ahrefs project 9518353; `seo-blueprint/` docs 04/08/15/16/18/19 + `data/`; branch `claude/tech-stack-seo-viability-4qo1vc` docs 20–23 + scripts.
- **Outputs:** `seo-ops/analysis/{SITE-MODEL,TRAFFIC-FORENSICS,EXECUTION-PLAN}.md`; batch logs `seo-ops/logs/exec/`; meta snapshots `seo-ops/data/meta-snapshots/`; crawler DB `seo-ops/data/crawl.db`; weekly SCORECARD section.
- **Cadence:** write batches ≤50 URLs, ≥72h between same-template batches, GSC checks +7/+21/+28d; weekly crawl; Monday reporting.
- **Guardrails:** product-title veto (722 hand-set titles); ask-first: robots/sitemaps, mass redirects, site-wide noindex/canonical rules, deletions, template-code deploys, YMYL rate/eligibility claims; kill switch = batch clicks −20% WoW vs flat site → same-day rollback; snapshot-before-write always; does not touch blog posts owned by the refresh engine without checking its register.

## External sessions (running outside this repo — observed via master sheet; charters pending)

- **Sheet daily-pulse / dashboard pipeline** — refreshes daily tabs 5 PM, weekly analyses, Monday competitor run. Owner of the master report. *Charter pending: Saurav to share prompt or approve reverse-engineering.*
- **Blog-refresh engine** — Lane A/B refreshes (26 posts on 2026-07-31; 24/173 stamped, cycle 0). Owns the 173 blog posts. *Charter pending.*
- **Authority Engine** — link prospecting/outreach (159-prospect DB, +254 ref domains in 10 wks; 32 items human-blocked). *Charter pending; tighten: no paid placements.*
- **Action-Plan compiler** — monthly plan into 🎯 Action Plan tab (last compiled 2026-07-12). *Charter pending.*

## Proposed (awaiting GO — see ORCH first response 2026-08-01)

- S1 AEO-CTR Engine → folded into S-EXEC W1/W7. ✅ superseded
- S2 SERP Estate (quick-wins harvest + rank defense + cannibalization + compare pruning) → partially in S-EXEC (W1 canonicals, W2 compare audit); **pos-4–10 quick-win content briefs + top-3 defense loop still unowned.**
- S3 Lead Engine (CRO ship + CRM join + bot-lead purge + newsletter) → partially in S-EXEC (W5); **CRM join, GA4 event QA, newsletter activation still unowned.**
- S5 Data-Ops & Intel (sheet integrity, quota governance, connector auth) → **unowned.**

## Retired / out of scope

- PR#2 `claude/search-console-errors-9frpb9` (GSC triage) — one-shot runbook; merge into canonical branch, retire session.
- PR#3 `claude/tech-stack-seo-viability-4qo1vc` (perf/security kit) — artifacts adopted as S-EXEC inputs; merge (renumber doc-20 collision), retire session.
- PR#4 PromotEdge audit — different business; excluded from this portfolio.
- State-page expansion — killed by evidence (SEO→Sales: state pages ≈ zero leads).
