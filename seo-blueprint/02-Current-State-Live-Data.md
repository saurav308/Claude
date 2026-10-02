# 02 — Current State: Live Data Snapshot

> All figures [FACT] from Ahrefs API v3, target `desimachines.com`, mode=subdomains, country=IN, date 25 Jun 2026, unless tagged [EST].

## 1. Authority & footprint

| Metric | Value |
|---|---|
| Domain Rating (DR) | **41** |
| Ahrefs Rank | 1,387,524 |
| Organic keywords (IN) | 2,369 |
| — in positions 1–3 | **1,176** |
| Est. organic traffic (IN) | ~39,070 / mo [EST] |
| Est. organic traffic value | ~$2,483 / mo equivalent [EST] |
| Paid keywords | 1 (negligible) |
| Live backlinks | 3,569 |
| All-time backlinks | 4,058 |
| Live referring domains | **573** |
| All-time referring domains | 724 |

**Read:** This is a genuinely strong young domain. DR 41 with 573 referring domains in ~16 months is well above the typical Indian OEM-dealer or classifieds upstart. The top-3 keyword count (1,176) is the standout asset — half the ranking portfolio is already in the positions that get clicks.

## 2. Site architecture (inferred from Ahrefs crawled-URL inventory) [EST]

The URL structure is already a clean, scalable taxonomy:

```
/                                   (home)
/excavator/                         (category hub)
/excavator/{brand-model}/           (model/product pages)  e.g. /excavator/tata-hitachi-ex-210-infra/
/backhoe-loader/                    (category hub)
/backhoe-loader/{brand-model}/      e.g. /backhoe-loader/jcb-3dx/
/crane/                             (category hub)  + /crane/{model}/, /crane/hydra/
/compactor/                         (category hub)  + /compactor/{model}/
/concrete-mixer/  /transit-mixer/  /self-loading-concrete-mixer/  /concrete-pump/
/wheel-loader/   /motor-grader/   /skid-steer-loader/
/compare/{model-a-vs-model-b}/      (programmatic comparison pages)
/blog/{slug}/                       (guides & editorial)
/{category}-guide/{topic}/          e.g. /compactor-guide/road-rollers/
```

**This is excellent.** Category hub → model page → comparison page is exactly the architecture a buyer-intent equipment platform needs. The strategy in later files **scales this structure**, it does not rebuild it.

## 3. Top pages by organic traffic [FACT]

| # | URL | Est. traffic/mo | Top keyword (vol) | Best pos | Keywords |
|---|---|---|---|---|---|
| 1 | `/blog/jcb-excavators-in-india/` | 6,380 | jcb price (90,000) | 5 | 57 |
| 2 | `/backhoe-loader/jcb/` | 2,438 | jcb price in india (23,000) | 6 | 92 |
| 3 | `/blog/poclain-machines-in-india-the-ultimate-guide/` | 1,873 | poclain machine price (3,700) | 4 | 64 |
| 4 | `/compactor/` | 1,234 | road roller price (4,800) | 3 | 84 |
| 5 | `/crane/` | 1,063 | crane price (4,000) | 6 | 83 |
| 6 | `/excavator/tata-hitachi-ex-210-infra/` | 915 | tata hitachi 210 price (3,000) | 7 | 66 |
| 7 | `/crane/hydra/` | 895 | hydra crane (8,600) | 4 | 62 |
| 8 | `/compare/jcb-3dx-vs-jcb-3dx-plus-backhoe-loader/` | 752 | jcb 3dx 74 hp price (6,800) | 7 | 28 |
| 9 | `/excavator/` | 730 | poclain machine (10,000) | 4 | 33 |
| 10 | `/blog/hydra-vs-farana-cranes/` | 654 | farana hydra (1,700) | 4 | 16 |

**Critical observations:**
- **Traffic is concentrated.** The top 10 pages drive a large share of total traffic. A handful of blog "ultimate guide" pages and category hubs are the workhorses. **This concentration is good news for CRO** — you can transform the lead capture on ~30 URLs and touch the majority of high-intent traffic.
- **Best positions are mostly 3–7, not 1.** Even the flagship `/blog/jcb-excavators-in-india/` ranks the head term `jcb price` at **#5** while pulling 6,380 visits. Pushing these from 4–7 to 1–3 is the position-harvest opportunity in `04`.
- **`/compare/` pages punch above their weight** (page #8 with only 28 keywords). Comparison pages are a proven, high-converting, programmatically scalable format here.

## 4. Intent composition of the ranking portfolio [FACT, the key insight]

Across the top-traffic keywords sampled (n≈80), the intent flags are near-uniform:
- `is_commercial: true` — **dominant**
- `is_informational: true` — **dominant** (most "price" queries are flagged both)
- `is_transactional: true` — **rare** (only a few, e.g. "cement mixer machine", "concrete pump price")
- `is_branded: false` — almost all non-brand (i.e. demand is category/competitor-driven, not yet DesiMachines-brand-driven)

**Implication:** The audience is mid-funnel buyers researching price and specs. They are *ready to enquire* but the queries are phrased as research ("price", "on road price", "mileage", "vs"). **The conversion system must meet research intent with a soft, instant, low-friction enquiry path** (price-on-WhatsApp, "get exact on-road price", compare-then-quote) rather than a hard "Buy now." This shapes all of `08`.

## 5. SERP feature reality [FACT]
Almost every target SERP shows **`ai_overview`**, plus `image_th`, `question` (PAA), `video_th`, and frequently `organic_shopping` and `sitelink`. Two consequences:
1. **AI Overviews are everywhere in this niche** → AI-citation optimization (`09`) is not optional.
2. **Visual + video + PAA dominate** → image SEO, short video, and FAQ schema are direct ranking/visibility levers, not nice-to-haves.

## 6. The brand-demand gap [FACT/EST]
`is_branded: false` across the portfolio means DesiMachines wins on category terms but has little branded search yet. Branded search is the strongest trust/return signal and the cheapest converting traffic. The digital-PR and AI-citation work in `07`/`09` is also a **brand-demand-generation** play, not only a links play.
