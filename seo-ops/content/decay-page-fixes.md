# Decay-page fixes — top severity × value

Source: Action Plan §3b + Pages tab DECAY flags, 43 of 87 total unique URLs captured (sheet pull 2026-09-04). Ranked below by a blend of decay severity and current lead volume (a -30% decline on a page with 79 leads matters more than a -92% decline on a page with 0 leads).

## Tier 1 — real lead volume, needs immediate content refresh

| URL | Decay | Clicks (prev28→28d) | Leads | Diagnosis / fix direction |
|---|---|---|---|---|
| `/crane/escorts-f15-fighter` | -41% | 161→95 | **97** | Highest lead count of any decaying page. Refresh spec table, price band, and check for a competing internal URL (cross-reference cannibalization list before assuming pure content decay). |
| `/crane/escorts-hydra-14` | -32% | 111→76 | **79** | Same crane cluster as above — likely the same root cause (content staleness or internal cannibalization from the hydra/crane consolidation gap flagged in `cannibalization-consolidation.md`). Fix both together. |
| `/backhoe-loader/bull-sd76-bs5-super-smart` | -39% | 136→83 | 63 | Model page decay with real lead volume — check price accuracy (Insights Log elsewhere flagged stale price bands as a recurring issue on Bull/SD76 pages) and refresh the spec table. |
| `/crane/escorts-hydra-12` | -33% | 94→63 | 47 | Same pattern as the other Escorts crane pages — this looks like a cluster-wide issue, not three unrelated declines. Prioritize a single root-cause investigation across all Escorts/hydra crane pages before fixing individually. |
| `/backhoe-loader/ace-ax-124` | -36% | 72→46 | 32 | — |
| `/excavator/jcb-nxt-140` | -63% | 30→11 | 14 | Steepest decline with meaningful leads remaining — investigate first among the smaller pages. |
| `/self-loading-concrete-mixer/schwing-stetter-slm-4600` | -39% | 104→63 | 25 | Also flagged as an AEO "winnable clicks" page in the sheet — this page has two separate open issues; fixing the AEO/CTR side (per the winnable-clicks methodology) may address both at once. |
| `/self-loading-concrete-mixer/fiori-dbs-4300` | -39% | 142→87 | 16 | — |

## Tier 2 — brand-nav pages where decay may not be fixable by content (verify before spending effort)

| URL | Decay | Leads | Note |
|---|---|---|---|
| `/excavator/jcb` | -80% | 11 | Also on the Action Plan's own "NOT WINNABLE" list (brand-nav mismatch) — the decay here may be an extension of the same structural problem (searchers want a JCB catalog, this is one model), not a fixable content issue. Don't spend a content-refresh cycle here; if anything, this strengthens the case for the JCB brand-hub consolidation in `cannibalization-consolidation.md` rather than a standalone fix. |
| `/hinduja-leyland-finance` | -50% to -66% (source conflict — see below) | 8–12 | **Data-quality blocker: the Action Plan and Pages tab disagree on this page's own numbers as of the same pull.** Before prescribing a fix, get a clean re-read from the sheet owner — don't act on either figure blind. |

## Missing data — re-pull needed before diagnosis

`/concrete-pump/ajax-asp-7011` and `/excavator/cat-345-gc` lost their numeric columns to a Google Sheets export artifact in this pull (URL survived, decay%/clicks/impressions did not). Both were ranked #4 and #9 respectively in the Action Plan's top-15 severity list, meaning they're likely significant — re-pull the sheet and re-extract these two rows before treating this list as complete.

## Backlog

29 additional decay-flagged URLs were captured but not written up individually here (full list in the research digest) — smaller decline magnitudes or lower lead counts than the Tier 1/2 items above. 44 of the claimed 87 total decaying pages remain entirely unenumerated in this pull (the sheet's Decay tab appears to be showing a partial slice) — a fresh, complete extraction is needed to know what's not yet visible.

## Cross-cutting recommendation

Three of the Tier-1 items (`escorts-f15-fighter`, `escorts-hydra-14`, `escorts-hydra-12`) are all Escorts/hydra crane pages declining together. Investigate this as **one root cause** — check whether a template change, a pricing update, or a competing internal page (see the Farana/hydra cannibalization notes in `cannibalization-consolidation.md`) hit all three simultaneously — before treating them as three separate content-refresh tasks.
