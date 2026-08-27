# S-EXEC Execution Plan — cycle 2026-08-27

**Status: partial.** This is the Priority Zero batch plan plus a down-payment on Phase 1, not the full deep dive. The charter calls for `SITE-MODEL.md` (whole-site model) and `TRAFFIC-FORENSICS.md` (click-trend decomposition) before any write — those require a proper pass through all 29 page-types in the master sheet's Sheet1, the link-graph/orphan tabs, and a real crawl, which this cycle didn't do. Recording that honestly rather than shipping thin versions of those two files. **ETA: next cycle** (this session is currently write-blocked anyway — see `seo-ops/logs/exec/phase0.md` — so there's no pressure to rush a write-gating deliverable).

What *is* real this cycle: Phase 0 verification, tool-state check, and the Priority Zero fix package — all ground-truthed against live Semrush/GSC data pulled today, not copied from prior summaries.

## First three W1 batches (per charter's "first message" requirement)

All three are prepared as ready-to-apply artifacts in `seo-ops/exec/ready/` — none executed yet (no WP write access — see phase0.md). Sequenced to ship within an hour of credentials arriving, per ORCH's instruction.

**Batch 1 — today, once access lands:**
- F1: menu trailing-slash fix (2 items, ~21.8k redirect notices cleared)
- F3: kill the X-vs-X self-compare page + generator guard (the site's only 4xx)
- Rationale: cheapest edits, biggest and clearest audit-count wins, zero content-model risk (menu items + one dead link).

**Batch 2 — this week:**
- F4: 9 compare-page canonical fixes (self-canonical, pre-authorized)
- F5 Tier A: 6 genuinely duplicate compare-page titles (3 pairs, variant token restored) — Tier B (5 near-dupe Manitou pairs) deferred, they already differ by a "+" and are lower priority.
- Rationale: per-page RankMath meta writes, no template/code deploy needed, batch well under the 50-URL cap.

**Batch 3 — this week, parallel:**
- F2b: the Product-schema suppression rule (mu-plugin, `rank_math/json_ld` filter) — ships independent of F2a (Saurav's price fills), and stops emitting invalid schema on unpriced products either way, without ever fabricating a rating.
- Rationale: one file, reversible by deletion, pre-authorized schema hygiene.

Every batch gets: dry-run/discovery query, before-snapshot to `seo-ops/data/meta-snapshots/`, apply, validation (schema parser / re-fetch / redirect check), and a GSC check at +7/+21/+28d per the charter's cadence. Kill switch stands: >20% WoW click drop on affected URLs with flat site-wide → same-day rollback, logged in `seo-ops/logs/exec/`.

## Verification this cycle (not assumed from stale docs)

- Re-pulled Semrush issue details (214, 45, 2, 38, 6) directly from the live snapshot rather than trusting the summary doc verbatim — this caught that F5's "16 duplicate titles" is actually 6 real duplicates + 10 near-duplicates that already differ by one character, changing the batch scope for the better (smaller, more precise fix).
- Confirmed GSC feed live via Ahrefs project 9518353: weekly clicks 8,366 → 8,992 → 7,034 over the last 3 full weeks (2026-07-27 through 2026-08-16 windows) — the mid-August dip is worth a line in the eventual TRAFFIC-FORENSICS pass, not chased down this cycle.
- Corrected the ORCH kickoff's Ahrefs-lapsed assumption — it's live (see phase0.md) — so paid Ahrefs endpoints are usable, budgeted per the registry's ≤5k units/week guidance, not avoided outright.

## Phase 1 deep dive — next cycle

Plan for the full pass, unchanged from the charter:
1. Traffic forensics: decompose Feb→today weekly clicks into impressions × CTR × position, by the sheet's 29 page-types and by query bucket; attribute the July CTR step, the May impressions ramp, top-3 erosion, and the mid-August dip flagged above.
2. Whole-site model: full page-type inventory, content-bucket ownership map, per-template module inventory.
3. Link graph: in/out-degree, orphans, anchor-text map; flag 1,000+-link listing templates.
4. Top-200 money-page content/schema pass (the hardcoded 4.5 ratings visible on the live homepage today are exactly the schema-spam risk F2 already flags — worth a dedicated count once the crawl exists).

Outputs: `SITE-MODEL.md`, `TRAFFIC-FORENSICS.md` — both pending, will supersede this file's "first three batches" framing with the full batched EXECUTION-PLAN once shipped.
