# PromotEdge New Website — Pre-Launch Gatekeeper Audit (28 Jul 2026)

Full SEO / AEO / GEO / content / launch-readiness audit of the new PromotEdge site staged at
`https://promotedge.net/promotedge-next2/` (audited strictly within that path), ahead of its migration to
`https://www.promotedge.com/`.

**Verdict: CONDITIONAL GO — 7 P0 blockers to clear first.** Start with `00-EXECUTIVE-SUMMARY.md`.

| Read order | File |
|---|---|
| 1 | [Executive summary + scorecard](00-EXECUTIVE-SUMMARY.md) |
| 2 | [P0 launch blockers](01-launch-blockers-P0.md) |
| 3 | [Technical SEO](02-technical-seo.md) |
| 4 | [On-page & content QA](03-onpage-content-qa.md) |
| 5 | [AEO / GEO readiness](04-aeo-geo-readiness.md) |
| 6 | [Data baseline & gaps (GA4/GSC/Semrush/Ahrefs)](05-data-baseline-gaps.md) |
| 7 | [Redirect map & go-live runbook](06-redirect-map-launch-runbook.md) |
| 8 | [Content pillars & post-launch Routines](07-content-pillars-routines.md) |

Working data: [`data/crawl-inventory.csv`](data/crawl-inventory.csv) · [`data/content-qa-fixlist.csv`](data/content-qa-fixlist.csv) · [`data/redirect-map-draft.csv`](data/redirect-map-draft.csv)
Launch-day tooling: [`scripts/verify-at-launch.sh`](scripts/verify-at-launch.sh)

Method note: the staging host's WAF blocks non-browser fetchers, so the crawl used a browser-rendering fetcher
(text layer). Head-level tags (meta robots, canonicals, JSON-LD) are therefore encoded as automated checks in the
verify script rather than asserted. Ahrefs & Semrush API units were exhausted during this session (Ahrefs resets
9 Aug 2026); `05-data-baseline-gaps.md` lists the exact pulls to complete the baseline.

*This audit is independent of, and does not modify, the `seo-blueprint/` (DesiMachines) directory.*
