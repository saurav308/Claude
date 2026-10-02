# ORCH full refresh + solve cycle — 2026-09-05

Triggered by Saurav: "refresh your research, and entire sheet using gsc, ga4, semrush, ahrefs. solve the issues covered by semrush, ahrefs. then from the list of all alerts/quick-wins/decays/low-CTR, etc. start working." 6-agent research workflow (`wf_aba9a5c8-6e5`) + direct follow-up verification, then a content-production pass. Full detail in the files listed below; this log is the summary.

## Headline finding — bigger than anything data-side today

**S-EXEC no longer exists**, and the account has **~100 other DesiMachines-related Claude sessions** running on recurring schedules that this registry never tracked — including one literally named "Desimachines weekly audit fix." Full detail in `seo-ops/registry.md`'s new top section. This means: today's technical-fix production may duplicate work another session already does, and several open questions this registry has carried for weeks (Hindi unpark, used/rental parked status) may already have answers in sessions ORCH can't read. Flagged to Saurav as the top priority to resolve, not buried under the data below.

## Data refresh — verified state as of 2026-09-05

- **GSC (via Ahrefs, 0-unit endpoints):** genuine sustained growth confirmed independently of the sheet — clicks +85%, impressions +26%, CTR +47% over 15 complete weeks (May–Aug). Average position softened 4.7→5.3-5.5 as the keyword footprint expanded into positions 4–10 (not a ranking loss). **Data lag: Ahrefs' GSC sync is ~10 days behind live (reliable only through 2026-08-25 as of this pull) — wider than GSC's native 2–3 day lag, a sync-cadence issue worth flagging separately from GSC's own delay.**
- **Web Analytics (Ahrefs — the GA4-equivalent available in this session; there is no direct GA4 API connector here, told to Saurav explicitly):** traffic accelerated +47.9% visitor-rate in the last 28d vs the prior 62d. Two real data-quality flags: (a) ~35% of traffic is non-India (Singapore/China/Vietnam/Brazil unusually prominent) — likely bot/proxy contamination, strip before any conversion-rate modeling; (b) CAPTCHA image files are being tracked as pageviews, confirming some bot/spam activity in the raw stream. New UX finding: every high-exit-rate page (>80%) is blog/news/opportunities content with no path into the product catalogue — `/blog/top-10-epc-companies-in-india/` (650 visitors, 81.9% exit) is the single highest-priority cross-link fix.
- **Ahrefs Site Explorer:** DR 40, 43,401 est. organic traffic/mo, 970 referring domains (net +92.5% over 90 days). The disavow from the July toxic-link incident appears to have worked — a real 5.2% refdomain correction 3-4 weeks after the flagged window, consistent with disavow processing lag, not a new problem. A small Sep 1-3 uptick (+3.2% in 3 days) needs one more read before judging. Session spend: 4,914 Ahrefs units (4.9% of monthly pool).
- **Semrush: fully blocked, API units exhausted** — could not refresh domain overview, organic research, competitor research, position tracking, or site audit. Confirmed the account's position-tracking campaign status is unknown (last known: zero targets configured) — needs a fresh check once units are restored.
- **Ahrefs Site Audit: no recrawl since 2026-08-28** — all issue counts are the frozen baseline. Dozer 404s and motor-grader broken images independently re-verified present via `site-audit-page-explorer` sampling; live HTTP re-verification blocked by this environment's network egress restrictions.

## Technical issues — finalized to deployable content (not just diagnosed)

`seo-ops/fixes/technical-fixes-final.md`: all 16 duplicate compare-page titles corrected and written; full alt-text mapping for the ~57 shared template images (logo, category icons, UI icons, all bank/insurance partner logos) that explain the 20,027-page warning. Both are mechanical, ready to apply the moment someone has WP access. Everything else re-confirmed unfixed and unchanged.

## Quick-wins / decays / low-CTR — worked, not just listed

Per Saurav's instruction to "start working," not just report:
- `seo-ops/content/aeo-hub-rewrites.md` — 7 hub-page rewrites (title + meta + answer-first opener + FAQPage JSON-LD) covering roughly 80% of the value across the sheet's full 60-query AEO list (100% captured) — independently double-confirmed by a fresh GSC pull that found the identical 8 head terms converting 0.05–0.22% CTR against a 3.8–13% position-implied benchmark, persistent across 16 weeks. Plus a new-page recommendation (Komatsu brand hub) for the pattern that can't be fixed by editing existing pages.
- `seo-ops/content/quickwin-model-pages.md` — JCB 3DX cluster + road-roller fixes from the 65-row QUICK-WIN list (100% captured).
- `seo-ops/content/cannibalization-consolidation.md` — canonical-target decisions for the top 15 clusters by clicks-at-stake (413 of 1,639 total rows captured, covering everything above meaningful volume).
- `seo-ops/content/decay-page-fixes.md` — tiered by severity × lead volume; flagged a likely single root cause across 3 Escorts/hydra crane pages declining together rather than treating them as unrelated; flagged 2 rows with sheet export data-loss and 1 row with a genuine cross-tab number conflict (`/hinduja-leyland-finance`) that need a clean re-pull before any fix is prescribed.

## What's still blocked, honestly

None of the content above can ship itself — there is currently no session with WP write access in this registry's view (S-EXEC is gone). The dozer finish-vs-suppress decision and the 169 unpriced products both still need Saurav directly, unchanged from prior cycles.

## Next
Resume the normal daily-cycle cadence. First priority next cycle: get Saurav's answer on the session-fleet question above before producing further content, to avoid duplicating whatever "Desimachines weekly audit fix" and "Dm vernacular pages plan" already do.
