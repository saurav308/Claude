# 14 — DesiMachines.com Website SEO Audit (traffic + leads focus)

> **Goal of this audit:** win more organic **traffic and qualified leads** — not vanity rankings.
> **Data:** all [FACT] from the live, connected Ahrefs project "Desimachines" (9518353) — Site Audit crawl (12 Jun 2026, 49,237 URLs), Google Search Console + Web Analytics (1 Mar–25 Jun 2026). Pulled 27 Jun 2026.
> **Companion files:** deep technical detail in `03`, quick-win keywords in `04`, first-party data in `13`, conversion system in `08`.

---

## The verdict in 3 lines
Your site is **technically healthy per-page (health score 96/100) and already ranks well** — the issue isn't rankings, it's three leaks: **(1)** you bleed clicks at the search result through **truncated titles/descriptions + broken schema** (≈10k–12k pages), **(2)** you waste authority through **1,365 orphan pages and crawl bloat** (49k URLs for a ~12k-page site), and **(3)** you don't convert the high-intent price traffic you already win. Fix these and traffic *and* leads rise together.

## Scorecard

| Dimension | State | Grade |
|---|---|---|
| Domain authority | DR 41, 573 referring domains | 🟢 Strong (young site) |
| Per-page health | Health score 96 | 🟢 Good |
| Rankings | 1,176 keywords in top 3; 31,935 in pos 4–10 | 🟢 / 🟡 upside |
| **SERP CTR** | pos 4–10 = 2.8M impressions @ **0.43% CTR** | 🔴 Big leak |
| **On-page meta (titles/descriptions)** | ~10k long titles, ~12k long descriptions | 🔴 Root cause of CTR leak |
| **Internal linking** | 1,365 orphan + 337 unlinked canonical pages | 🔴 Authority leak |
| **Crawl/index efficiency** | 49,237 crawled vs ~12k indexable | 🟠 Bloat |
| Structured data | 510 schema validation errors | 🟠 Losing rich results |
| Images | 23,648 missing alt text | 🟠 Lost image traffic |
| Mobile | 84% of clicks; avg pos 4.16 | 🟢 audience clear, build mobile-first |
| **Lead conversion** | research traffic, near-zero RFQ capture | 🔴 Biggest revenue leak |

---

## 🔴 PRIORITY 1 — The CTR leak (you own the impressions; you're not getting the clicks)

**Symptom (GSC):** positions 4–10 generate **2,795,908 impressions but only 12,082 clicks (0.43% CTR)**. Even positions 1–3 sit at 0.73%. You're being shown to buyers and not getting the click.

**Root cause (Site Audit) — now pinpointed:**
| Issue | Pages affected | Effect |
|---|---|---|
| **Title too long** | ~10,253 (5,639 indexable + 4,614) | Title truncated in SERP → weaker, cut-off snippet |
| **Meta description too long** | ~12,187 (6,728 indexable + 5,459) | Description truncated → less compelling result |
| **Structured data schema.org errors** | 510 | Losing rich results (price, FAQ, ratings) |
| **Page & SERP titles don't match** | 422 | Google rewrites your title → it wasn't relevant/compelling enough |

**Worst-offender pages (GSC — huge impressions, tiny CTR):**
- `/excavator/jcb-nxt-215-lc-fuel-master/` — **910,170 impressions, pos 3.6, 0.16% CTR**
- `/excavator/cat-345-gc/` — 379,167 impressions, **0.06% CTR**
- `/excavator/tata-hitachi-zaxis-490h-ultra/` — 535,944 impressions, **0.03% CTR**

**Fix (no new content, no ranking change required — pure incremental traffic):**
1. **Rewrite titles to ≤60 chars with the price + year + intent up front:** `JCB NXT 215 LC Price in India 2026 – On-Road Price & Specs`. Put the number the buyer searched for in the title.
2. **Rewrite meta descriptions to ≤155 chars** with a price band + a reason to click (free quote / on-road price / compare).
3. **Fix the 510 schema errors** and add valid `Product` + `Offer` + `FAQPage` schema → win price/FAQ/rating rich results that lift CTR and feed AI Overviews.
4. Start with the 3 worst-offender pages above (largest impression pools), then templatize across all model pages.

**Why first:** this converts impressions you *already earn* into clicks. Highest ROI, fastest payback, zero dependency on new rankings.

---

## 🔴 PRIORITY 2 — Internal linking & crawl bloat (authority isn't reaching your money pages)

**Symptoms (Site Audit):**
| Issue | Count | Effect |
|---|---|---|
| **Orphan pages (indexable, no incoming internal links)** | **1,365** | Pages Google can barely find/rank; receive ~no authority |
| **Canonical URL has no incoming internal links** | 337 | Important pages starved of link equity |
| **Crawled URLs vs indexable** | 49,237 vs ~11,996 | ~37k low-value URLs (params, redirects, dupes) eat crawl budget |
| **Pages linking to a broken page** | 330 | Wasted equity + bad UX |
| **Nofollow / noindex pages in the crawl** | ~200 each | Some intentional, audit for mistakes |

**Why it matters for traffic/leads:** 1,365 orphan indexable pages is enormous — many are likely model/compare pages that *should* be earning leads but get no internal links, so they're stuck deep in the SERP. Meanwhile ~37k non-money URLs dilute the crawl budget Google spends on your site (and you're 84% mobile, where crawl budget is tighter). The strong pages sitting at position 4–7 instead of 1–3 are a classic symptom of authority not flowing to them.

**Fix:**
1. **Eliminate orphans:** every model page must be linked from (a) its category hub, (b) 3 sibling/same-class models, (c) 2 comparison pages, (d) any relevant guide. Automate this on publish. Pull the orphan list from Site Audit (Ahrefs → the 1,365 list) and link them in.
2. **Cut crawl bloat:** `noindex,follow` or canonical-to-base all filter/sort parameter URLs and low-demand auto-generated compare pages; keep only in-demand, meaningful pages indexable. Submit a clean, segmented XML sitemap (categories / models / compares / blog).
3. **Fix the 330 pages linking to broken pages** and repoint/remove the broken targets.

---

## 🔴 PRIORITY 3 — The lead leak (you rank for "price", then let the buyer walk)

**Symptom:** virtually every ranking keyword is **research-stage price intent** (`is_transactional: false` across the portfolio), and **84% of visitors are on mobile**, yet there's no frictionless capture. Your own math — ~33,800 visits/mo × cited "600+ buyers/mo" ≈ **1.7% conversion** — proves capture works; it's just not optimized.

**Fix (mobile-first, see `08` for the full system):**
1. **Sticky WhatsApp price bar** on every model/price page, pre-filled: *"Hi, I want the on-road price for [model] in [city]."*
2. **2-field RFQ** (name + phone) + **click-to-call**, with trust cues ("free", "verified dealers", "600+ buyers/month").
3. **Show a price band, gate the exact figure** behind the enquiry ("₹XX–YY lakh — get your exact on-road price").
4. Add a **B2B / bulk enquiry CTA** on the EPC-companies page (your highest traffic-value page, $269) and category hubs — capture dealer/distributor/enterprise leads.
5. **Wire GA4 lead events** (`whatsapp_click`, `rfq_submit`, `call_click`) first — you can't optimize what you don't measure.

**Target:** lift the working ~1.7% toward 3–5% → roughly doubles qualified enquiries from the *same* traffic.

---

## 🟠 PRIORITY 4 — Image SEO (a proven traffic source you're under-using)

- **23,648 images are missing alt text** (Site Audit).
- Image queries already rank #1 and drive real traffic for you (`hitachi photo` 8,600 vol, `hitachi photos` 3,300 — both #1).

**Fix:** programmatically generate descriptive alt text (`{brand} {model} {type} price India`), set descriptive filenames, add an image sitemap, and add `ImageObject`/`Product` image schema. Low effort, compounding image-search traffic + accessibility.

---

## 🟠 PRIORITY 5 — Crawl-error hygiene (small but real)

| Issue | Count | Action |
|---|---|---|
| 5XX / 500 server errors | 10 + 1 | Investigate server stability; fix |
| Timed-out pages | 3 | Performance fix |
| 4XX / 404 pages | 4 + 4 | 301 to the right successor page |
| Canonical points to 5XX | 5 | Repoint canonicals |
| Page > Googlebot 2 MB limit | 2 | Slim the page |
| Image file size too large | 1 | Compress |

These are few in number — knock them out in a single sprint.

---

## 🟢 What's already working (protect these)
- **DR 41 / 573 referring domains** — strong authority base for a ~16-month-old site. *(But disavow the toxic link cluster — see `07`.)*
- **1,176 keywords in the top 3** and a clean category → model → compare architecture.
- **Mobile dominance (84%)** and an emerging **brand search + AI/LLM traffic** signal (491 AI-referred visitors) — leading indicators of durable demand.
- **Vernacular ownership** ("poclain", "hydra", "farana") — a real moat; extend it.

---

## Do this in the next 2 weeks (ranked by Impact × Ease)

| # | Action | Lever | Effort |
|---|---|---|---|
| 1 | **WhatsApp + RFQ system on top 30 pages** + wire GA4 lead events | Leads ↑↑ | M |
| 2 | **Fix titles/descriptions + schema on the 3 worst-CTR pages**, then templatize | Traffic ↑↑ (no new content) | M |
| 3 | **Link in the 1,365 orphan pages** from hubs/siblings/compares | Rankings ↑ | M |
| 4 | **Cut crawl bloat** — noindex param/sort URLs + low-demand compares; clean sitemap | Rankings ↑ (sitewide) | M |
| 5 | **Bulk alt-text** on 23,648 images | Image traffic ↑ | S (scripted) |
| 6 | **Fix 5XX/404/timeout errors** (≈25 URLs) | Hygiene | S |

**One-line summary:** you've already won the hard part (authority + rankings). The money is in **(a) fixing truncated titles/descriptions + schema to capture the clicks you're shown, (b) linking your orphan pages so authority reaches them, and (c) putting a mobile WhatsApp/RFQ capture on the price traffic you already own.**

---

## Cross-validation — Semrush (independent second source)

To make sure these conclusions aren't a single-tool artifact, here is Semrush's independent read of the domain (India database, pulled 27 Jun 2026) next to Ahrefs and your first-party GSC:

| Metric | Ahrefs | **Semrush** | First-party (GSC/GA4) |
|---|---|---|---|
| Organic keywords | 2,369 | **6,176** | ~86k (GSC, incl. long-tail) |
| Est. organic traffic / mo | ~39,070 | **42,770** | **~24,400 clicks (authoritative)** |
| Traffic value / mo (paid equiv.) | ~$2,483 | **~$6,948** | — |
| Paid/Adwords keywords | 1 | 0 | minor paid in GA4 |

**Two things this confirms:**
1. **Tool estimates agree with each other (~39k–43k) but run ~1.6× higher than first-party reality (~24k clicks).** Plan to the **GSC number** — the tool figures are modeled, not measured. (This is why `13`/`10` use first-party data.)
2. **Semrush values the traffic at ~$6,948/mo equivalent — ~2.8× Ahrefs' estimate.** Independent confirmation that this is **high commercial-value traffic** (expensive-to-buy "price"/buyer keywords) — which is exactly why the lead-capture leak (Priority 3) is the most expensive problem on the site: you're sitting on ~₹6 lakh+/month of equivalent paid-search value and converting a fraction of it.

> Semrush's higher keyword count (6,176 vs Ahrefs 2,369) also reinforces Priority 2: a large, long-tail page footprint makes **internal linking and crawl-budget discipline** more important, not less.

---

### Data note
Issue counts are from the Ahrefs Site Audit crawl dated 12 Jun 2026 (re-crawl to refresh). Traffic/keyword figures cross-checked against Semrush (India database) and Google Search Console + Web Analytics — all live, this session. The exact URL lists for each issue (e.g. the 1,365 orphan pages, the 510 schema errors) are available in the Ahrefs Site Audit project and can be exported for the implementation team. Detailed per-issue technical guidance is in `03-Technical-SEO-Audit.md`.
