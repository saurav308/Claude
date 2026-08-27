# S-EXEC Phase 0 — Access + Safety Verification

**Session:** S-EXEC (Site Execution Engineer), cloud/sandboxed Claude Code run
**Date:** 2026-08-27
**Branch:** `claude/desimachines-site-executor`

Per charter (`seo-ops/prompts/01-site-executor.md`), verified and recorded before any write-path work. Per ORCH's 2026-08-27 kickoff addendum, items 1–2 were expected to fail in this cloud sandbox — confirmed below — so this cycle proceeds read-only per the charter's own fallback ("If any of 1–4 fails → STOP, report exactly what's missing to Saurav, and proceed only with Phase 1's read-only analysis").

## Checklist

| # | Item | Result | Detail |
|---|------|--------|--------|
| 1 | Site reachability (curl homepage, expect 200) | **FAIL** | Direct outbound to `desimachines.com` is blocked by this environment's egress proxy: `curl -sS https://desimachines.com/` → `CONNECT tunnel failed, response 403` (exit 56). This is a sandbox network-policy block, not a site-side WAF response — cannot be fixed from this session. **Workaround in place:** the Exa MCP fetch tool (`web_fetch_exa`) reaches the live site fine — verified by fetching `https://desimachines.com/` and getting real homepage markdown (product grid, "Popular Comparisons," the hardcoded "4.5 rating" on every card — matches the known schema-spam defect in the fix package). Used for all Phase 1 read-only page reads this cycle; it is not a substitute for #2/#3 below (no write, no crawl-scale access, no WAF-allowlist proof either way). |
| 2 | Write access (WP application password + real REST route, or SSH + WP-CLI) | **FAIL — blocked, needed from Saurav** | No credentials of either kind exist in this session or repo. Needed: **(a)** SSH host/user/key for Cloudways, or **(b)** a WP application password plus the *real* REST base (WP-Hide is active and may have renamed `/wp-json`). Until one arrives, no writes (menu edits, meta updates, schema deploys) are possible — all Priority Zero work this cycle is prepared as ready-to-apply artifacts only, not executed. |
| 3 | Crawl permission (Cloudflare/WAF allowlist for this session's IP/UA) | **BLOCKED / not testable** | Moot while #1 holds — this environment cannot make direct HTTP requests to the domain at all (proxy-level block, applies regardless of WAF state), so an allowlist can't be exercised or verified from here even if Saurav has already granted one. |
| 4 | Backups (Cloudways on-demand backup) | **BLOCKED / not testable** | Requires hosting-panel or SSH access per #2. |
| 5 | Rollback rehearsal (restore one test page's meta from snapshot) | **BLOCKED** | Depends on #2 and #4. |
| 6 | Measurement (GSC data flowing via Ahrefs project 9518353) | **PASS** | `gsc-performance-history` (project_id 9518353, 2026-08-01→08-27, weekly) returned real weekly clicks/impressions/CTR/position (e.g. week of 08-03: 8,992 clicks / 910,208 impr / 0.99% CTR / pos 4.83; week of 08-10 dipped to 7,034 clicks / 781,453 impr — worth a line in next traffic-forensics pass). Confirms the GSC feed this charter depends on for every batch's +7/+21/+28d checkpoint is live. |

## Tool-state verification (ORCH addendum items 1–2)

- **Ahrefs MCP — addendum said "entitlement lapsed, every endpoint returns Insufficient plan."** Verified directly, **found otherwise**: `subscription-info-limits-and-usage` returned a healthy Lite-tier workspace (2,756 / 100,000 units used, resets 2026-09-17); the free `gsc-performance-history` endpoint returned real data (item 6 above); a **paid** endpoint (`site-explorer-domain-rating`, 50 units) also succeeded (DR 39, Ahrefs rank 1,602,604). Ahrefs is live right now, contradicting the addendum's expectation — recorded here rather than silently trusting the stale claim. Will keep using the 0-unit `gsc-*`/`web-analytics-*` endpoints freely and budget paid endpoints against the registry's ≤5k units/week guidance (current usage is trivial against the 100k workspace cap).
- **Semrush MCP — expected working.** Confirmed: `list_projects` shows project **22542129 "Desi Machines"** (desimachines.com) with `siteaudit`, `tracking`, `backlinkAudit`, `linkBuilding`, `seoideas`, `gat` enabled. Pulled the live Site Audit snapshot (`6a88fcd02ad9d2ae5009fa80`) issue details directly for F1/F3/F4/F5 (see Priority Zero artifacts) — ground-truthed against the fix package rather than re-trusting its summary blind.
- **Google Drive MCP (master sheet)** — confirmed working: `14pJu0Ji-5LRZKkYR2F6uZYay-GUs-HzVC7d0gVeTaz0` ("Desi Machines_Website_Structure") is reachable, owned by `saurav@teampromotedge.com`, last modified 2026-08-27 (today) — matches charter's daily-refresh description exactly (tab colour legend, reading guide). Full tab-by-tab pull deferred to the Phase 1 deep dive (see EXECUTION-PLAN.md ETA note).
- **Exa MCP (fetch)** — confirmed working, used as the read-only substitute for direct site access (item 1 above).
- **GitHub MCP** — confirmed working, authenticated as `saurav308` (repo owner of `saurav308/Claude`).

## What's needed from Saurav to unblock Phase 0 fully

1. SSH host/user/key for the Cloudways box, **or** a WP application password + the real (WP-Hide-renamed) REST base.
2. Confirmation the Cloudflare/WAF allowlist covers this session's egress path, once (1) makes it relevant — direct HTTP is proxy-blocked regardless, so this only matters once a non-sandboxed executor (local Claude Code, per the charter's own recommended run mode) or a tunnel is in place.

## Disposition this cycle

Proceeding read-only per the charter's fallback: Priority Zero (F1–F5 ready-to-apply artifacts, `seo-ops/exec/ready/`) prepared now so they can ship within the hour once (2) arrives; Phase 1 deep dive started (see `seo-ops/analysis/EXECUTION-PLAN.md`), full SITE-MODEL/TRAFFIC-FORENSICS to follow next cycle — noted as in-progress rather than shipped, since a same-cycle full 29-page-type + link-graph pass would mean guessing rather than reading the sheet properly.
