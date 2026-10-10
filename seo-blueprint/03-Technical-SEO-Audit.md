# 03 — Technical SEO Audit

> **Scope note:** The live site returns 403 to the automated fetch agent, so page-level on-page checks (rendered HTML, exact schema, CWV field data) could not be machine-verified in this session. The findings below combine (a) what *is* verifiable from Ahrefs' crawled-URL inventory and SERP data, and (b) the high-probability issues for a JS-rendered equipment catalog of this size and age. **Each item flags whether it is [FACT], [EST], or [needs verification].** Run a full crawl (Screaming Frog / Ahrefs Site Audit / Semrush Site Audit) against these as the Week-1 technical task.

## Priority legend
- **P0** = do this week, blocks revenue or risks indexation
- **P1** = within 30 days, high impact
- **P2** = within 90 days, compounding
- Effort: S (≤1 day), M (≤1 week), L (multi-week)

---

## A. Crawlability & indexability

| # | Issue | Sev | Status | Business/SEO impact | Recommendation | Effort | Priority |
|---|---|---|---|---|---|---|---|
| A1 | **Verify XML sitemap completeness & freshness** | High | needs verification | Model/compare pages are the lead engine; if new ones aren't in the sitemap they index slowly → lost lead-pages | Ensure `/sitemap.xml` (segmented: categories, models, compare, blog) auto-updates on publish; submit all segments in GSC; include `lastmod` | S | **P0** |
| A2 | **robots.txt audit** | High | needs verification | A stray `Disallow` on faceted params can deindex value pages | Confirm robots.txt allows all money pages, blocks only true infinite spaces (sort/filter params), and references sitemap | S | **P0** |
| A3 | **JS rendering / hydration of specs & prices** | High | [EST] | If specs, CTAs, or RFQ widgets are client-rendered only, Google may not see them and AI Overviews can't cite them | Server-render (SSR/SSG) all spec tables, FAQs, and CTA copy; verify via GSC URL Inspection "rendered HTML" | M | **P0** |
| A4 | **Crawl budget on `/compare/` combinatorics** | Med | [EST] | Compare pages scale as N² — can balloon into thin/near-dup combos | Generate compare pages only for *meaningful* pairs (same class, real demand); noindex auto-generated low-demand pairs | M | P1 |
| A5 | **Orphan model pages** | Med | [EST] | New model pages with no internal links rank slowly and capture no leads | Auto-link every model page from its category hub + 3 sibling/compare pages (see `06` internal-linking) | M | P1 |

## B. On-page & content hygiene

| # | Issue | Sev | Status | Impact | Recommendation | Effort | Priority |
|---|---|---|---|---|---|---|---|
| B1 | **Head terms ranking #4–#7, not #1–#3** | High | [FACT] | `jcb price` #5, `crane price` #6, `poclain machine` #4, `jcb price in india` #6 — each is thousands of visits + leads left on the table | On-page refresh of the ranking URL: title/H1 alignment, price tables, freshness date, FAQ schema, internal links, more entities. See `04` quick-win table | M | **P0** |
| B2 | **Keyword cannibalization risk (JCB price cluster)** | Med | [FACT/EST] | `jcb price` is served by `/blog/jcb-excavators-in-india/`, `/backhoe-loader/jcb/`, model pages, compare pages — they compete for the same head term | Define one canonical target per head term; differentiate intent (blog=overview, /backhoe-loader/jcb/=buy/price, model=spec); cross-link with clear anchors | M | P1 |
| B3 | **"Price" pages may not satisfy price intent** | High | [EST] | Buyers search "X on road price"; if the page shows specs but no price/price-band + quote CTA, it under-serves intent and under-converts | Add an on-road price band ("₹XX–YY lakh, varies by state/finance — get exact quote") + RFQ CTA on every price page (see `08`) | M | **P0** |
| B4 | **Thin compare pages** | Med | [FACT] | Some `/compare/` pages have very few keywords (7–16) → risk of thin-content | Templatize compare pages with min. content blocks: spec delta table, price delta, "which to buy if…", FAQ, verdict; merge/noindex the thinnest | M | P1 |
| B5 | **Image SEO** | Med | [FACT] | `hitachi photo` (8,600) and `hitachi photos` (3,300) rank #1 — images drive real traffic here | Descriptive alt text with brand+model+"price/India", image filenames, image sitemap, `ImageObject` schema; this niche is image-hungry | S | P1 |

## C. Structured data / schema

| # | Issue | Sev | Status | Impact | Recommendation | Effort | Priority |
|---|---|---|---|---|---|---|---|
| C1 | **Product/Offer schema on model pages** | High | needs verification | Enables price/rich results + feeds AI Overviews & Google's `organic_shopping` (already appearing on these SERPs) | Add `Product` + `Offer` (price band or "priceSpecification" with "contact for quote"), `aggregateRating` if reviews exist, `brand`, `model`, image | M | **P0** |
| C2 | **FAQPage schema on all price/compare pages** | High | needs verification | PAA ("question") appears on nearly every target SERP; FAQ schema wins those slots and AI citations | Add 4–8 buyer FAQs per page (price, mileage, EMI, dealer, warranty) with FAQPage schema | S | **P0** |
| C3 | **BreadcrumbList schema** | Med | needs verification | Improves SERP appearance + crawl context for the deep taxonomy | Implement breadcrumbs Home › Category › Model with schema | S | P1 |
| C4 | **Organization / LocalBusiness + sameAs** | Med | needs verification | Trust signal + entity consolidation for AI/Knowledge Graph; supports branded SERP | Site-wide `Organization` schema with logo, sameAs (LinkedIn, YouTube, etc.), contact points (phone, WhatsApp) | S | P1 |
| C5 | **VideoObject schema** | Low-Med | [FACT] | `video_th` appears on most SERPs; video is a ranking surface in this niche | Add VideoObject for embedded YouTube reviews/demos | S | P2 |

## D. Performance & Core Web Vitals

| # | Issue | Sev | Status | Impact | Recommendation | Effort | Priority |
|---|---|---|---|---|---|---|---|
| D1 | **Mobile CWV (LCP/INP)** | High | needs verification | Audience is Tier 2–5 India on mid-range Android/3G-4G — speed = bounce = lost leads | Pull CrUX/PageSpeed field data; target LCP <2.5s, INP <200ms; lazy-load below-fold images, compress hero images, defer non-critical JS | M | **P0** |
| D2 | **Image weight** | Med | [EST] | Image-heavy catalog; large machine photos hurt LCP | Serve AVIF/WebP, responsive `srcset`, CDN, explicit width/height to kill CLS | M | P1 |
| D3 | **Third-party script bloat** | Med | needs verification | Chat widgets/analytics can wreck INP | Audit and async/defer all third-party tags; load WhatsApp/chat widget on interaction | S | P1 |

## E. Indexation governance & duplication

| # | Issue | Sev | Status | Impact | Recommendation | Effort | Priority |
|---|---|---|---|---|---|---|---|
| E1 | **Canonicalization across price-variant URLs** | Med | needs verification | "on road price", "price in india", "price" variants can spawn near-dup URLs | One canonical per model; self-referencing canonicals; consolidate variant intents on one URL with sections | S | P1 |
| E2 | **Faceted navigation / filter params** | Med | [EST] | Category filters (by brand, tonnage, price) can create infinite crawlable URLs | `noindex,follow` or `rel=canonical` to base category; block sort params in robots; keep only SEO-valuable facets indexable (e.g. brand, tonnage class) — these are programmatic gold (see `04`) | M | P1 |
| E3 | **Pagination on category hubs** | Low | needs verification | Deep model lists may paginate | Use crawlable `<a href>` pagination, self-canonical per page, ensure all models reachable within 3 clicks | S | P2 |
| E4 | **HTTPS / redirects / broken links** | Low-Med | needs verification | Standard hygiene | Confirm full HTTPS, single redirect hops, no chains; fix 404s (esp. from disavowed/old link sources); 301 retired model pages to successor model or category | S | P1 |

---

## Top 8 technical actions, ranked by (Impact × Confidence ÷ Effort)

1. **[P0] Add Product/Offer + FAQPage schema to all model & price pages** (C1, C2) — unlocks rich results, `organic_shopping`, and AI-Overview citation on SERPs that already show those features.
2. **[P0] Refresh the #4–#7 head-term pages** (B1) — direct traffic + lead gain on pages that already rank (full list in `04`).
3. **[P0] Add price-band + RFQ CTA to satisfy "price" intent** (B3) — the conversion lever; overlaps with `08`.
4. **[P0] Verify SSR of specs/CTAs/FAQs** (A3) — ensures Google & AI engines see the money content.
5. **[P0] Mobile CWV pass** (D1) — Tier 2–5 mobile audience; speed is conversion.
6. **[P0] Sitemap + robots integrity** (A1, A2) — protects fast indexation of new lead-pages.
7. **[P1] Kill cannibalization in the JCB-price cluster** (B2) — consolidates authority on the highest-value head term.
8. **[P1] Govern faceted nav** (E2) — turn filters into *controlled* programmatic pages, not crawl-budget waste.
