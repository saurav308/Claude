# SEO Ops Registry — DesiMachines.com

**Single source of truth for every Claude session running on this site.** Every session reads this before acting and logs each cycle to `./seo-ops/logs/`. Maintained by ORCH.

Last updated: 2026-08-02 (ORCH)

---

## Active sessions

### ORCH — Orchestrator / Head of SEO & Organic Growth
- **Where:** this repo, branch `claude/desimachines-seo-growth-baknjd`
- **Objective:** own the 3x-traffic mission; run the daily report-diff loop and weekly scorecard; route issues to owning sessions; maintain this registry.
- **KPI / target:** portfolio-level — organic clicks ~31k → ≥60k/mo by 2026-11-01 (2x), ~95k/mo by month 5–6 (3x); lead rate ≥14.6% held; top-3 keywords 8,426 → ≥9,500.
- **Inputs:** master sheet (`14pJu0Ji-5LRZKkYR2F6uZYay-GUs-HzVC7d0gVeTaz0`, daily 5 PM refresh); Ahrefs project 9518353 GSC/web-analytics (0-unit endpoints); session logs in `seo-ops/logs/`.
- **Outputs:** daily diff + routing notes → `seo-ops/logs/orch/`; weekly `seo-ops/SCORECARD.md`; registry updates; session charters + prompts.
- **Cadence:** daily pull ~17:45 IST (post-refresh); weekly scorecard Monday.
- **Guardrails:** never spends Ahrefs paid units without budgeting (quota exhausted until 2026-08-09; ≤5k units/week after); ask-first list per Saurav's rules applies portfolio-wide.

### S-EXEC — Site Execution Engineer  *(chartered 2026-08-02, GO by Saurav)*
- **Where:** new session — prompt at `seo-ops/prompts/01-site-executor.md`; branch `claude/desimachines-site-executor`. Must run with site access (local Claude Code + SSH/WP-CLI, or cloud + WAF allowlist + WP app password).
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
