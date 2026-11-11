# Cannibalization consolidation plan — top clusters

Source: Cannibalization tab, 413 of 1,639 total rows captured (top slice by total clicks, sheet pull 2026-09-04) — this covers every cluster large enough to matter; the untapped 1,226 rows are long-tail variants below meaningful volume. Ranked by total clicks at stake. Per the S-EXEC charter, page-level canonical fixes are pre-authorized (not on the ask-first list) — redirects, if any cluster needs one instead of a canonical tag, go to Saurav first.

| # | Query cluster | URLs competing | Total clicks | Recommended canonical target | Rationale |
|---|---|---|---|---|---|
| 1 | jcb | 7 | 1,601 | `/backhoe-loader/jcb/` | Already the best-ranking URL (pos 1.6); brand-nav intent belongs on the brand hub |
| 2 | jcb price | 12 | 1,048 | `/manufacturers-and-brands-guide/jcb-equipment-price-india/` | Already pos 1, $293/mo traffic value — the money page, other 11 URLs should point here |
| 3 | jcb price in india | 11 | 794 | same as #2 | Same query family, same target — merge with #2's fix |
| 4 | poclain price | 2 | 644 | `/excavator/` (interim) | See note below — may justify a dedicated page instead of a canonical |
| 5 | hydra machine | 3 | 527 | `/crane/hydra/` | Already pos 1.1–1.2, already the AEO-fix target in `aeo-hub-rewrites.md` |
| 6 | poclain machine price | 2 | 354 | `/excavator/` (interim) | Same note as #4 |
| 7 | desi machine (brand) | 13 | 338 | `/` (homepage) or `/about-us/` | 13 URLs splitting a brand-navigational query is the most chaotic cluster on the list |
| 8 | crane | 2 | 286 | `/crane/` | Straightforward, already the AEO-fix target |
| 9 | hydra crane | 9 | 274 | `/crane/hydra/` | Same target as #5 — the 9-URL split here is the largest single cluster by URL count |
| 10 | road roller price | 2 | 264 | `/compactor/` | Pairs with the quick-win fix in `quickwin-model-pages.md` |
| 11 | desi machines (brand) | 5 | 225 | `/` (homepage) | Same brand-split issue as #7, smaller |
| 12 | poclain machine | 3 | 205 | `/excavator/` | Same note as #4/#6 |
| 13 | backhoe | 5 | 195 | `/backhoe-loader/` | Already the AEO-fix target |
| 14 | concrete mixer machine price | 3 | 189 | `/concrete-mixer/` | — |
| 15 | farana crane | 10 | 177 | `/crane/hydra/` or dedicated (see note) | 10-URL split, second-largest cluster by URL count |

**Note on Poclain (#4/#6/#12, 644+354+205 = 1,203 combined clicks across 7 URLs):** this volume may justify building a dedicated `/excavator/poclain/` brand-style page rather than just consolidating onto the generic `/excavator/` hub — "poclain" is a genericized trademark (see `aeo-hub-rewrites.md` #5) but 1,203 clicks is real enough to warrant its own answer-first treatment rather than sharing space with the broader excavator hub content. Flag as a build candidate alongside Komatsu/Zoomlion/Hitachi.

**Note on Farana (#15, plus "farana" alone which also appears with 10 URLs and 104 clicks in the fuller list, combined ~281 clicks across the two query variants):** same logic — Escorts' "Farana" hydra-crane sub-brand may deserve its own page distinct from the generic `/crane/hydra/` hub, given the 20-URL total split across both query variants.

**Mechanics for #1–3, #5, #8–9, #13 (the straightforward hub-consolidation cases):** add `rel=canonical` on every non-canonical URL in each cluster pointing to the recommended target; do not delete or redirect the non-canonical URLs unless they carry zero unique content — if a URL is a genuinely different page (e.g., a specific model page that happens to also rank for the generic query), leave it live and un-canonicalized, and instead strengthen internal linking to the canonical target to help Google understand the primary page. The Action Plan's own note on this cluster (P2, "OPEN — carried from 1-Aug plan") already flagged this needs Agency review before execution — this file is that review.

**Not addressed here:** the remaining ~398 lower-volume rows in the captured 413, and the un-captured 1,226 rows beyond that. Apply the same logic (canonical to whichever URL already ranks best) as a standing rule for any cluster crossing ~50+ combined clicks, rather than re-analyzing the full 1,639-row list by hand.
