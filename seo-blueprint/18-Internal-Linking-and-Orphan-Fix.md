# 18 — Internal Linking & Orphan-Page Fix (Audit Priority 2)

> **The lever:** the Site Audit found **1,365 indexable orphan pages** (no incoming internal links) + **337 canonical pages with no internal links**, inside a crawl of **49,237 URLs vs ~12,000 indexable**. Authority isn't reaching your money pages — which is a big reason strong pages sit at position 4–7 instead of 1–3. Fixing internal links is the second-highest-ROI lever after the CTR fix, and it compounds it (better-linked pages rank higher → more impressions for the new snippets to convert).

## 1. Why this matters for traffic + leads (plain version)
- **Orphan page = a page Google can only reach via the sitemap, with zero internal "votes."** It gets crawled rarely and ranks weakly. If 1,365 of these are model/compare/spec pages, that's potentially hundreds of lead-pages running at half power.
- **Crawl bloat (≈37k non-indexable URLs)** spends Google's mobile crawl budget on junk (filter/sort/param URLs) instead of your money pages — you're 84% mobile, where crawl budget is tightest.
- Fix both and your existing authority (DR 41) redistributes to the pages that earn enquiries.

## 2. Step 1 — Export the exact orphan list (your team, 30 min)
*(I could not pull the URL list via API — it needs a higher Ahrefs plan tier — but it's a one-click export in the UI.)*
- **Ahrefs:** Site Audit → project **Desimachines** → **Issues** → open **"Orphan page (has no incoming internal links)"** (Error, 1,365) → **Export** to CSV. Repeat for **"Canonical URL has no incoming internal links"** (337).
- **Or Screaming Frog:** crawl the site, connect the GSC + GA API, then **Bulk Export → Orphan Pages** (pages in sitemap/GA/GSC but not found via internal links).
- **Triage the CSV into 3 buckets:**
  1. **Money pages** (model `/{cat}/{brand-model}/`, compare `/compare/`, category, brand) → **link them in** (Step 3).
  2. **Low-value/auto-generated** (thin param pages, dead variants) → **noindex or 301** (Step 4).
  3. **Genuinely retired** → **301** to the closest live successor.

## 3. Step 2 — The internal-linking architecture (the permanent fix)

Make these links **automatic in the page template**, so no page can be born an orphan again.

### Per-page-type linking rules
| Page type | Must link OUT to | Must receive links FROM |
|---|---|---|
| **Category hub** `/excavator/` | top 15–20 model pages + top 5 compares + brand hubs in the category | header/footer nav, home, related guides |
| **Model page** `/excavator/{brand-model}/` | (a) its category hub, (b) **3 sibling models** same class/tonnage, (c) **2 compare pages** featuring it, (d) the relevant brand hub, (e) 1 buying guide | category hub, sibling models, compares, brand hub, guides |
| **Compare page** `/compare/A-vs-B/` | **both** model pages + the category hub | category hub "popular comparisons", both model pages ("compare this with…") |
| **Brand hub** `/{brand}/` | all that brand's model pages + price-list | category hubs, home, guides |
| **Blog/guide** | every model/category it names (contextual, descriptive anchors) | related guides, category hub |

### Anchor-text rules
- Use **descriptive commercial anchors**: *"JCB 3DX on-road price"*, *"Tata Hitachi EX 210 vs Sany SY210"* — not "click here" / "read more".
- **Vary** anchors; don't point 500 internal links at one head term with the identical exact-match anchor (re-triggers cannibalization, see audit B2).
- Each model page should have **≥3 incoming** internal links once fixed (target: 0 pages with `incoming_links = 0`).

### The highest-impact "related" modules to add (build once, applies sitewide)
1. **"Similar machines" block** on every model page → 3–6 siblings by category + tonnage/HP band. *(Kills the most orphans automatically.)*
2. **"Compare this machine" block** → links to existing compare pages featuring this model (and prompts creating the missing ones).
3. **"Popular in {category}"** block on category hubs → top model pages by demand.
4. **Breadcrumbs** Home › Category › Model (with `BreadcrumbList` schema) → guaranteed hub→model link path + crawl context.

## 4. Step 3 — Cut the crawl bloat (so authority/budget concentrate)
- [ ] **Identify the ~37k non-money URLs:** Ahrefs Site Audit "Internal pages" + URL patterns. Usual suspects: `?sort=`, `?filter=`, `?price=`, pagination beyond what's needed, low-demand auto-compares.
- [ ] **Parameter/sort/filter URLs:** `noindex, follow` (or `rel=canonical` to the clean base) — keep only **SEO-valuable facets** indexable (e.g. brand, tonnage class), noindex the rest.
- [ ] **Low-demand auto-generated compare pages** (cross-class, no search demand): `noindex, follow` or don't generate them — only build compares for **same-class, real-demand** pairs (the audit flagged thin compares).
- [ ] **Clean, segmented XML sitemaps:** separate sitemaps for `categories`, `models`, `compares`, `blog`, each listing **only indexable, canonical, 200-status** URLs with accurate `lastmod`. Submit all in GSC.
- [ ] **Fix the structural errors** the audit found while you're in here: 5XX (×10), 500 (×1), timeouts (×3), 404s (×4), canonical→5XX (×5), pages-linking-to-broken (×330).

## 5. Prioritized 2-week plan

| When | Task | Why |
|---|---|---|
| **Day 1–2** | Export orphan + unlinked-canonical CSVs; triage into money / noindex / 301 | Know the exact targets |
| **Day 2–4** | Ship the **"Similar machines" + "Compare this" + breadcrumb** template modules | Auto-fixes the bulk of the 1,365 orphans + prevents new ones |
| **Day 4–6** | Manually link in the **high-value money orphans** the modules don't cover (brand hubs → models, guides → models) | Highest-traffic-potential pages first |
| **Day 6–8** | `noindex`/canonical the param/sort/filter + low-demand compare URLs; fix 5XX/404/timeouts | Reclaim crawl budget |
| **Day 8–10** | Rebuild + submit segmented sitemaps; GSC "Validate fix" on the orphan + canonical issues | Confirm + speed re-crawl |
| **Day 10–14** | Re-crawl in Ahrefs Site Audit; verify orphan count → near 0, indexable-URL count tightens toward ~12k | Measure |

## 6. Success metrics
- **Orphan indexable pages: 1,365 → < 50.**
- **Pages with `incoming_links = 0`: → 0** for all model/compare/category pages.
- **Crawled-vs-indexable ratio** tightens (49k → closer to the ~12k real pages).
- **Avg position** of previously-orphaned model pages improves over 4–8 weeks (track in GSC).
- Knock-on: better-linked pages gain impressions → the `15`/`16` snippet rewrites convert more of them.

## 7. How it compounds with the CTR fix
The CTR work (`15`–`17`) wins more clicks from the impressions you **already** have. This internal-linking work **increases the impressions** by lifting positions. Done together: more impressions × higher CTR × snippet-level deal/finance/insurance CTA = the biggest traffic-and-lead step-change available without new content.
