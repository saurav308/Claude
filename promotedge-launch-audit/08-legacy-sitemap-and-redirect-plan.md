# Legacy Site Inventory & Full Redirect Plan (v2)

**Date:** 30 Jul 2026 · Supersedes the pattern table in `06-redirect-map-launch-runbook.md` §2 (runbook sequencing in 06 still applies).
**Working files:** `data/redirect-map-v2.csv` (107 mapping rows) · `data/legacy-urls-harvested.txt` (97 verified URLs)

## 1. How the inventory was pulled (and what remains)

The live sitemap (`sitemap_index.xml`, Yoast) cannot be fetched remotely right now: the host WAF 403s non-browser fetchers, the browser-rendering fetcher rejects XML content types, Wayback's CDX API timed out on repeated attempts, and Ahrefs (which crawled all 2,708 URLs on 25 Jul) is unit-locked until **9 Aug**. So the inventory was rebuilt from search indexes — which is the *indexed subset*: exactly the URLs that carry equity and must be redirected. 97 unique URLs were harvested and normalised, which exposed **every URL family** on the legacy site.

**To finish the instance-level list (10 minutes, any browser):**
1. Open `https://www.promotedge.com/sitemap_index.xml` → open each child sitemap (`page-sitemap.xml`, `post-sitemap.xml`, likely `case-study-sitemap.xml`, `knowledge-sitemap.xml`…) → copy URL lists into `data/legacy-urls-harvested.txt`.
2. GSC → Performance → Pages (12 months) → export → every URL with clicks gets a row in the CSV.
3. After 9 Aug (or from the Ahrefs UI now): Site Audit project 9226493 page list + Site Explorer "Best by links" → add any URL with referring domains.
Then fill the remaining `pattern` rows in `redirect-map-v2.csv` with concrete instances.

## 2. The legacy architecture (8 URL families found)

| Family | Examples found | Est. size | Default disposition |
|---|---|---|---|
| Core pages | `/about-us/`, `/contact-us/`, `/career/`, `/services/`, `/industries/`, `/location/`, `/knowledge-hub/` | ~10 | 301 1:1 (two are same-path ✅) |
| Service hubs + sub-services | `/digital-marketing/search-engine-optimization/`, `/web-solutions/e-commerce-portals/`, `/audio-visual/tv-commercials/`, `/creative-designing/brand-campaign/` | ~25 | 301 to `/services/{...}` |
| Service × industry | `/digital-marketing/industrial-machinery-equipment/`, `/web-solutions/fmcg-fmcd/`, `/audio-visual/real-estate/` | ~30–60 | 301 to `/industries/{mapped}/` |
| Top-level industry pages | `/professional-services/`, `/ipo-and-listed-companies/`, `/building-material/`, `/automobile-dealership/` | ~10 | 301 to `/industries/{mapped}/` |
| **City × service** | `/kolkata/digital-marketing/`, `/mumbai/advertising-agency/`, `/pune/seo-company/`, `/ranchi/…`, `/jamshedpur/…`, `/dubai/…`, `/singapore/…`, `/us/…` | **~20–30** | **DECISION REQUIRED — see §3** |
| Old blog | `/blog/{slug}/` + `/blog/page/20/` pagination | **~200+** | Triage: port / 301 / 410 |
| Knowledge hub (new-era posts) | `/knowledge/user-generated-content-strategy/` (Jul 2026!) | ~10–65 | **Port to `/blog/{same-slug}/`** |
| Case studies | `/case-study/weichai-india/`, `/case-study/alumaze/`, `/case-study/desi-machines/` | ~14 | 301 to `/work/{slug}/`; port unmatched |

Plus junk (`/faq/`, `/testimonial/`, `/feed/`, paginated archives) → 410, and hotlinked `wp-content` assets → keep serving or 301 (check best-by-links).

## 3. The three big "old URL dropped" decisions

### A. City × service pages — the largest equity at risk
The legacy site deliberately built **local landing pages** (Kolkata ×4 incl. TVC/VFX/3D-animation, Mumbai ×4, Pune ×4, Delhi ×2, Bangalore, Hyderabad, Guwahati, Ranchi ×2, Jamshedpur, Dubai, Singapore). The new site has **zero** city pages — "37 cities" is marketing copy, not URLs. These pages are exactly how the agency wins "digital marketing agency in {city}" queries.

**Recommendation (tiered):**
- **Tier 1 — rebuild, don't redirect:** `kolkata/digital-marketing` (HQ + brand SERP), plus the top 3–5 cities by GSC clicks (likely Mumbai, Pune, Delhi, Bangalore). Build them in the new IA as `/locations/{city}/` (or keep the legacy paths verbatim in the new build — zero redirect, zero risk), written to the new site's quality bar with real local proof (GBP, city case studies, city testimonials). Until built, 301 to the closest service page — **never to a 404, never blanket-to-home.**
- **Tier 2 — consolidate:** single-service city pages (`pune/seo-company` → `/services/seo/`, `mumbai/e-commerce-website-design-agency` → `/services/web-design/`, `kolkata/tvc-agency` → `/services/audio-visual/` once built). The service page inherits the equity; add a "cities we serve" block there.
- **Tier 3 — international:** `/dubai/`, `/singapore/` → 301 to home (or keep-and-port if GSC shows real Gulf/SEA leads). `/us/*` → **301 cross-domain to promotedgedigital.com** — the US entity now owns that market; keeping US service pages on promotedge.com competes with your own sister site and muddies both entities for AI engines. (Strategic call — flagged, my recommendation is the cross-domain 301.)

The tiering is data-gated: rank all city pages by GSC clicks + Ahrefs referring domains before locking targets. The CSV carries them as `decide: port or 301` with proposed targets.

### B. The old `/blog/` corpus (~200+ posts) vs the new `/blog/` namespace
The new site reuses the **same `/blog/` path** with entirely new slugs — so every old post 404s at launch by default. Triage rule per old post:
- **Has clicks (GSC) or referring domains (Ahrefs)** → if a new post covers the topic, 301 to it; if not and the topic is still commercial (e.g., `what-is-programmatic-advertising`, `search-everywhere-optimization…`), **port and refresh** under the new template (byline/date/schema), keeping the old slug so no redirect is needed;
- **No clicks, no links, thin/dated** (most 2019–2022 social-media-tips posts) → **410**. A clean 410 on dead weight speeds up the migration re-crawl and concentrates authority — 2,708 URLs → ~270 is this plan working as intended, not a problem to avoid.
- All `/blog/page/{n}/` pagination → 301 to `/blog/`.

### C. `/knowledge/` posts — port, don't redirect
These are the *current-era* posts (several from 2025–2026, e.g., `user-generated-content-strategy` published **14 Jul 2026** — three weeks ago — with author bio "Anindita Barik, SEO Executive"). They match the new content strategy and likely hold your freshest links.
**Port each one verbatim into the new build at `/blog/{same-slug}/`** (new template: byline, dates, Article schema), then 301 `/knowledge/{slug}/ → /blog/{slug}/` and `/knowledge-hub/ → /blog/`. Nothing from this family should be dropped. Bonus: add Anindita Barik to the author-entity set (doc 03/04) — the byline pattern already exists on the live site.

## 4. New pages with no legacy equivalent (the other half of the delta)

~200 of the new site's ~270 URLs are **brand-new**: all 60 `/industries/`, ~87 sub-services, ~50 of the 65 blog posts, and the anonymized case studies. No redirects involved — their risk is *indexation*, not equity transfer:

1. **Sitemap:** all new URLs in `sitemap.xml` day 0; watch GSC "Discovered/Crawled — currently not indexed" as the health gauge for the programmatic layers (60 industries + 87 sub-services is exactly the scale Google tests for scaled-content quality).
2. **Staged expectations:** hubs and top services index in days; the industry/sub-service long tail over 4–8 weeks *if* internal links work — which is why P0-3 (broken industry→service links) gates this.
3. **Do not add more programmatic pages** (city × service × industry) until the current 200 prove indexation and engagement (see doc 07's scale-discipline note).
4. Priority internal-link boosts: link Tier-1 rebuilt city pages and the AV service from the home page and footer so the new families aren't orphan-adjacent.

## 5. Gaps the new site should fill BEFORE launch (from this inventory)

| Missing on new site | Why it matters | Action |
|---|---|---|
| `/services/audio-visual/` | Whole legacy AV practice (7+ URLs incl. TVC/VFX/3D) has no landing target; it's also a real differentiator | Build the service page (sub-pages optional post-launch) |
| Kolkata commercial page | Legacy `kolkata/digital-marketing` + brand equity "digital marketing agency in kolkata" | Tier-1 rebuild (§3A) |
| IPO & listed companies / investor-relations industry | Legacy top-level + AV combo pages; unusual, low-competition niche they've already claimed | Consider `/industries/ipo-listed-companies/`; else map to BFSI |
| "Professional services" equivalent | 3 legacy URLs point at it | Decide: map to chartered-accountants/legal, or add the industry |
| `/digital-marketing-company-india/` successor | Ranks for "digital marketing company india" (page refreshed Sep 2025) | Recreate as a landing page or accept consolidation into home |

## 6. Validation protocol (extends `scripts/verify-at-launch.sh`)

At T-0 after the rule set is live: run every row of `redirect-map-v2.csv` through a list-mode crawl (Screaming Frog list mode, or `while read url; do curl -s -o /dev/null -w "%{http_code} %{redirect_url} <- $url\n" -A "Mozilla/5.0" "$url"; done < legacy-urls.txt`) and assert: exactly one hop, 301 (not 302), target returns 200, no chain through apex/http variants. Then daily GSC Coverage + server 404 log for 14 days — every new 404 with external referrer gets a row appended to the map within 24h.

---
### Decision summary for you (everything else is executable as-is)
1. City pages: which get rebuilt (Tier 1) vs consolidated (Tier 2)? — needs the GSC clicks ranking, or your gut knowledge of which cities generate leads.
2. `/us/*` (and Dubai/Singapore): cross-domain 301 to promotedgedigital.com — yes/no?
3. Build `/services/audio-visual/` before launch — yes (recommended)/no?
4. `/digital-marketing-company-india/`: recreate vs consolidate into home?
5. Old-blog triage threshold: agree "no clicks + no links in 12 months → 410"?
