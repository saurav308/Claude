# Redirect Map & Go-Live Runbook

The new IA consolidates ~2,708 legacy URLs into ~270. Done right this concentrates authority; done sloppily it burns 11 years of equity. The map below covers every confirmed legacy pattern; complete it with the GSC top-200 pages + Ahrefs "best by links" exports (05 §3) before T-0. Draft CSV: `data/redirect-map-draft.csv`.

## 1. Redirect principles

- 301 (permanent), **one hop**, HTTPS+www normalised in the same rule set. No chains (old → apex → www → new).
- Map to the **most specific equivalent**, never blanket-to-home (Google treats mass home-redirects as soft-404s and drops the equity).
- Pages with backlinks (Ahrefs best-by-links) get hand-checked targets.
- Genuinely obsolete thin pages → let them 410 or 301 to the closest hub, decided per page, not per pattern.
- Keep the map file in the repo; every future URL change appends to it.

## 2. Confirmed legacy → new mapping (pattern level)

| Legacy (www.promotedge.com) | New target | Notes |
|---|---|---|
| `/` | `/` | Title/intent continuity: new home must keep "…marketing agency in Kolkata" in title (03 §1) |
| `/about-us/` | `/about/` | |
| `/contact-us/` | `/contact/` | |
| `/career/` and `/promotedge-career/` | `/careers/` | legacy robots blocked /promotedge-career/ — check if indexed at all |
| `/case-study/` | `/work/` | |
| `/case-study/{slug}/` | `/work/{matching-slug}/` | Named ones map 1:1 (weichai, sany, skipper, bp-poddar, kolkata-thunderbolts, utkarsh, ilead, nitya, alumaze…). Legacy case studies with no new equivalent (e.g., Alumaze, KNI Airport, PSPL, Desi Machines) → `/work/` hub or build the page |
| `/digital-marketing/` | `/services/` (or `/services/performance-marketing/` — decide by GSC query mix on that URL) | |
| `/digital-marketing/{industry}/` | `/industries/{industry}/` | e.g. professional-services → closest new industry (chartered-accountants / legal / it-services) — needs the industry-mapping table below |
| `/web-solutions/` | `/services/web-design/` | |
| `/web-solutions/{industry}/` | `/industries/{industry}/` | same mapping table |
| `/brand-strategy/` | `/services/branding/` | verify exact legacy slug from sitemap |
| `/creative-designing/` | `/services/branding/` (or a creative sub-service if built) | |
| `/audio-visual/` | closest new service (video under content?) — **the new site has no AV service page**; decide: build `/services/audio-visual/` or map to `/services/content-marketing/`. AV is a differentiator on the live site & LinkedIn — recommend building the page |
| `/digital-marketing-company-india/` | best new equivalent = home or `/services/` | This page ranks for "digital marketing company india" (created 2025-09) — give it a deliberate target; consider recreating it as a landing page in the new IA |
| `/knowledge/` | `/blog/` | |
| `/knowledge/{slug}/` | `/blog/{matching-slug}/` where a topic match exists; otherwise **keep serving the old post under /blog/{old-slug}/** (port the content) | 65 legacy posts incl. 2026-dated ones with fresh links — do NOT let these die; port-and-301 |
| `/faq/`, `/testimonial/`, `/feed/` | 410 (robots-blocked already, low equity) | |
| `/wp-content/uploads/...` (linked images/PDFs with backlinks) | keep serving or 301 to new asset paths | check Ahrefs best-by-links for hotlinked assets |
| Convenience: `/case-studies/`, `/insights/`, `/services` (no slash), `/index.html` twins | 301 to `/work/`, `/blog/`, canonical forms | cheap insurance |

**Industry-mapping table to complete:** list every live `/digital-marketing/{x}/` and `/web-solutions/{x}/` from the Yoast sitemap and assign each to one of the 60 new `/industries/{y}/` pages (or the relevant service page when no industry fits).

## 3. Launch runbook

### T-7 to T-2 (freeze week)
1. All P0s cleared; content QA sweep done (`data/content-qa-fixlist.csv` all ✅).
2. `scripts/verify-at-launch.sh https://promotedge.net/promotedge-next2` → all green except the intentional staging noindex.
3. Redirect map finalised (GSC top-200 + best-by-links all mapped); implemented in server/Cloudflare rules on a test hostname; spot-check 30 URLs.
4. GA4: events (page_view, generate_lead on /thank-you/ + submit), tested on staging build. GSC: confirm access to the domain property.
5. Content freeze on the live WordPress site (no new /knowledge/ posts after the map is cut).
6. Cloudflare production zone: AI-bot policy configured per 04 §1 (and verified robots.txt has no Cloudflare-managed AI block unless intended).
7. Full pre-launch data snapshot (05 §3) archived.

### T-0 (launch day — sequence matters)
1. Deploy new site to promotedge.com docroot / switch origin.
2. **Immediately verify NO noindex leaked to production:** `curl -s https://www.promotedge.com/ | grep -i 'noindex'` → must be empty. (Single most common migration disaster.)
3. Activate 301 rule set; run `scripts/verify-at-launch.sh https://www.promotedge.com` — all sections green.
4. Canonicals now self-referencing on www.promotedge.com (script checks); OG/schema URLs absolute to final domain.
5. Publish `robots.txt` (with sitemap line) + `sitemap.xml` + `llms.txt`; submit sitemap in GSC + Bing WMT; IndexNow ping.
6. GSC: Request indexing for: home, /services/, /services/seo/, /services/ai-search-optimisation/, /industries/, /industries/real-estate/, /industries/healthcare/, /work/, /blog/, /contact/.
7. Test the lead form in production → CRM + email + GA4 event.
8. Staging: keep `/promotedge-next2/` noindexed + robots-disallowed; plan takedown at T+30.
9. Update GBP website link, LinkedIn, Justdial, DesignRush, key directories to the new URLs (they're mostly `/` — but deep links like /case-study/ appear in profiles).

### T+1 to T+14 (watch window)
- Daily: GSC Coverage + server 404 log → patch map gaps within 24h (this is where the remaining equity is saved).
- Daily: GA4 organic sessions + lead events vs baseline.
- Day 3: crawl the live site (Ahrefs Site Audit re-point project 9226493 target if needed / Screaming Frog) → zero internal 404s, zero redirect chains, no orphan money pages.
- Day 7: PSI on the 6-template set; fix regressions.
- Day 14: first keyword-continuity check (expect noise; act only on losses >5 positions on money terms).

### T+30/60/90
- Re-pull full baseline (Ahrefs units reset 9 Aug — conveniently right in this window), diff, report.
- Take staging down (T+30).
- Start the content Routines (07) once Coverage is stable.

## 4. Rollback criteria

Rollback (repoint DNS/origin to old site) if within 72h: indexing coverage collapses >50% on submitted sitemap with rising "noindex/blocked" errors you can't explain, or lead events flatline at zero with form verified broken and not hot-fixable. Redirect-map gaps are NOT rollback events — they're daily patches. Keep the old docroot intact and cold for 60 days.
