# Data Baseline & Gaps — GA4 / GSC / Semrush / Ahrefs

The brief asked for existing data from GA4, GSC, Semrush and Ahrefs. Here is exactly what was retrievable in this session, what was not and why, and the precise pull-list to complete the baseline before launch.

---

## 1. What WAS captured (hard data)

### Ahrefs Site Audit — live www.promotedge.com (project 9226493, crawl 25 Jul 2026)
| Metric | Value |
|---|---|
| Health score | **85 / 100** |
| URLs crawled | 2,708 |
| URLs with errors | **400** |
| URLs with warnings | 728 |
| URLs with notices | 370 |

Reading: the legacy site carries a meaningful error mass (≈15% of URLs). At migration, **do not blind-301 the whole crawl** — map the valuable subset (traffic/backlink pages) deliberately and let genuinely dead URLs 410. The 2,708-URL count vs ~270 on the new site also means the new IA is a 10× consolidation: good for authority concentration, dangerous if the redirect map is sloppy.

### Other verified projects in your Ahrefs workspace
- Promotedgedigital (promotedgedigital.com) — health 98, 918 URLs (well-kept).
- Desimachines — health 79, 25,902 URLs (not this engagement's scope).

### Live-site structure facts (for the redirect map)
- robots.txt: disallows `/faq/`, `/testimonial/`, `/promotedge-career/`, `/feed/`, `/wp-content/uploads/wpcf7_captcha/`; sitemap declared at `https://www.promotedge.com/sitemap_index.xml` (Yoast; WordPress + Contact Form 7 stack).
- Confirmed live URL patterns: `/about-us/`, `/contact-us/`, `/career/`, `/case-study/`, `/digital-marketing/`, `/digital-marketing/{industry}/`, `/web-solutions/{industry}/`, `/digital-marketing-company-india/`, `/knowledge/{slug}/` (blog).
- Live homepage title: "Digital Marketing Agency in Kolkata - Trusted by 200+ Clients" — the "digital marketing agency in kolkata" equity must be inherited by the new home/title strategy (see 03 §1, 06).

## 2. What was NOT retrievable, and why

| Source | Blocker | Unblock path |
|---|---|---|
| **Ahrefs API** (domain metrics, organic keywords, top pages, referring domains) | Workspace units exhausted: 107,654 used / 100,000 limit | Resets **2026-08-09** (Lite plan). Re-run the pull-list below then — or read the same reports in the Ahrefs UI now (UI usage ≠ API units) |
| **GSC via Ahrefs** (`gsc-keywords` etc.) | Returned empty — the Promotedge project isn't GSC-connected in Ahrefs | Ahrefs → Project settings → connect Google Search Console; or export directly from GSC UI (no API needed) |
| **Semrush API** | Account has no MCP API units | https://www.semrush.com/mcp-access to add units; or pull from Semrush UI |
| **GA4** | No GA4 connector available in this session | Export from GA4 UI (checklist below), or connect a GA4 MCP/connector in a future session |
| **PageSpeed lab data** | PSI API rate-limits keyless calls (429 ×2) | Run PSI from browser at T-1, or use an API key |
| **Raw HTML of staging** | Host WAF 403s non-browser fetchers; sandbox egress allowlist blocks the domain | `scripts/verify-at-launch.sh` from any normal machine; optionally add promotedge.net/promotedge.com to this environment's allowed domains for future sessions |

## 3. The exact pull-list to complete the baseline (run before launch; keep as the "before" snapshot)

### From GSC (last 12 months + last 28 days, live property)
1. Top 500 queries by clicks (Query, Clicks, Impressions, CTR, Position) — the keyword continuity set.
2. Top 200 pages by clicks — **every page here MUST have a 301 target in the redirect map.**
3. Countries split (expect IN-dominant; note US/AE/SG for the PromotEdge Digital boundary).
4. Coverage report: valid/excluded counts (baseline for post-launch anomaly detection).
5. Core Web Vitals report status (mobile) — the "old site" benchmark the new site must beat.
6. Manual actions & security: confirm clean before migrating.

### From GA4 (last 12 months)
1. Sessions & engaged sessions by default channel group (Organic Search baseline).
2. Landing pages by organic sessions (top 100) — cross-check against the redirect map.
3. Key events (form submits) by landing page — the lead-attribution baseline the new form must at least match.
4. Device split (mobile share will justify the CWV budget).

### From Ahrefs (UI now, or API after 9 Aug)
1. Site Explorer → promotedge.com: DR, referring domains, backlinks count.
2. **Best by links** (top 100 pages by referring domains) — pages with external equity get priority 301 targets; any link pointing to a soon-dead URL is negotiable outreach later.
3. Organic keywords (IN) top 500 with positions — merge with GSC list.
4. Top pages by traffic — sanity-check the GSC top-200.
5. After launch +30d: re-run 1–4 and diff.

### From Semrush (once units exist)
1. Domain Overview (IN db): Authority Score, keywords, traffic trend.
2. Organic Research → Positions (IN) top 500.
3. Backlink Analytics: referring domains delta vs Ahrefs (union the two).
4. Position Tracking: set up a campaign for the keyword continuity set (below) the day the new site goes live.

## 4. Keyword continuity set (protect these at migration)

Minimum set to track from day 0, based on live-site titles/structure (extend with the GSC export):

| Keyword theme | Current ranking asset |
|---|---|
| digital marketing agency in kolkata / digital marketing company in kolkata | Homepage |
| digital marketing company india | /digital-marketing-company-india/ |
| branding agency kolkata / creative agency kolkata | /about-us/ + service pages |
| web design/development kolkata | /web-solutions/… |
| {industry} digital marketing (professional services etc.) | /digital-marketing/{industry}/ |
| brand-name queries: promotedge, promotedge kolkata, promotedge reviews | Home/About/DesignRush profile |
| knowledge-base long-tail (65 live /knowledge/ posts incl. fresh 2026 ones like user-generated-content-strategy) | /knowledge/{slug}/ |

Rule: **no keyword in the top-3 pages of GSC clicks may lose its destination** — either the new page targets the same intent (then 301 old→new) or the old URL is kept temporarily.

## 5. Post-launch measurement plan (first 90 days)

- **Week 0:** GSC: submit sitemap, request indexing of the 10 money pages. Baseline dashboards frozen (before/after).
- **Daily week 1–2:** GSC Coverage (watch: "Redirect error", "Duplicate without user-selected canonical", "Crawled — currently not indexed" spikes), 404 report in server logs, form-event count in GA4 (any day at 0 = alarm).
- **Weekly to day 90:** keyword continuity set positions (Semrush/Ahrefs), organic sessions vs baseline (expect a 2–6 week dip ≤15% on a clean migration; investigate anything deeper), CWV field data trickling into GSC, AI citation spot-checks (ask ChatGPT/Perplexity/Gemini: "best integrated marketing agency in Kolkata", "RERA compliant real estate marketing agency India", "healthcare marketing agency India NMC" — log who gets cited; you have blog posts targeting exactly these).
- **Day 30/60/90:** Ahrefs/Semrush full re-pull; report deltas against this file.
