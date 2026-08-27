# Priority Zero — ready-to-apply fix package

Implementation artifacts for the validated Semrush audit fix package (`seo-ops/fixes/semrush-audit-fix-package.md`, snapshot `6a88fcd02ad9d2ae5009fa80`, 2026-08-22). Prepared 2026-08-27 while Phase 0 write access (WP-CLI/SSH or app-password+REST) is still pending from Saurav — see `seo-ops/logs/exec/phase0.md`.

Every file below is self-contained: goal, exact discovery/dry-run commands, apply commands, validation, rollback. None have been executed — no write access exists yet. All URLs and current on-page state (titles, canonical targets, 4xx status) were pulled fresh from the live Semrush Site Audit snapshot on 2026-08-27, not copied from the summary doc — two findings came out more precise than the summary as a result (see F5).

| File | Fix | Pre-authorization | Batch size |
|---|---|---|---|
| `F1-menu-trailing-slash.md` | Site-wide nav menu links → `/skid-steer-loader/`, `/telehandler/` (trailing slash) | No approval gate — content/menu edit, not a redirect rule | 2 menu items |
| `F2-product-schema-suppression.md` | Suppress Product JSON-LD on unpriced products (168 pages) | Pre-authorized (schema hygiene) | 1 site-wide mu-plugin |
| `F3-self-compare-removal.md` | Remove the X-vs-X self-compare page + add generator guard | Pre-authorized (delete a single 404'd artifact + code guard, not a page/content deletion at scale) | 1 page + 1 code guard |
| `F4-canonical-fixes.md` | 9 compare pages canonicalizing to non-existent reversed URLs | Pre-authorized ("per-page canonical fixes are pre-authorized") | 9 URLs |
| `F5-title-dedup-fixes.md` | Duplicate titles on compare variants | Pre-authorized (non-product template titles) | 6 URLs confirmed real dupes (of 16 flagged — see file for the split) |

## Sequence (matches the fix package's own plan)

1. **Today, once access lands:** F1 (menu slashes) + F3 (kill X-vs-X page) — cheapest, highest-count-per-edit wins (~21.8k notices + the site's only 4xx).
2. **This week:** F4 (9 canonicals) + F5 (title dedup) + F2's suppression rule (F2's price-fill half is Saurav's, independent of this session).
3. **Next Semrush audit (~2026-08-29):** re-pull the same 5 issue IDs (214, 45, 2, 38, 6) to confirm each cleared, and read the slow-page count (issue 111, baseline 7,544) as the independent before/after for Saurav's 2026-08-19 CWV changes — no action needed there, just read.

## Standing safety protocol (applies to every file here)

- Dry-run / discovery query before every write.
- Snapshot old values to `seo-ops/data/meta-snapshots/YYYY-MM-DD-<fix>-before.csv` before writing.
- Batch ≤50 URLs (all of these are far under that).
- Validate (schema parser, redirect check, or Exa re-fetch) immediately after.
- Kill switch: if GSC clicks on affected URLs drop >20% WoW while site-wide is flat, roll back same day and log it in `seo-ops/logs/exec/`.
- Nothing here touches robots.txt, sitemaps, redirect *rules*, or product-page titles/metas (the veto'd 722).
