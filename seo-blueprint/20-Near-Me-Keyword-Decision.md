# 20 — "{Model} near me" on Product Pages: Decision & Data

**Question:** Can we place the keyword `"{product model} near me"` in the **location section of a product (model) page**?

**Date:** 14 August 2026
**Data source:** Ahrefs API, live pull (India), 14 Aug 2026
**Verdict:** ⚠️ **Technically yes — strategically no.** Do not target `{model} near me` on model pages. Put the "near me" intent on a **city layer** instead, and use the model page's location section to *link* into it.

---

## 1. Why not — the three findings

### Finding 1: At model level, the keyword does not exist

Live India volumes:

| Keyword | Volume/mo | KD | CPC |
|---|---|---|---|
| `jcb 3dx near me` | **no data returned** | — | — |
| `excavator dealer near me` | 10 | — | $0.20 |
| `backhoe loader near me` | 10 | — | — |
| `excavator near me` | 30 | — | — |
| `jcb 3dx showroom near me` | 50 | — | — |

`jcb 3dx near me` — our single biggest model — returned **no row at all** from Ahrefs. Optimising a section for it is optimising for zero.

Demand exists, but **one level up**, at brand/category:

| Keyword | Volume/mo | CPC | Read |
|---|---|---|---|
| `jcb near me` | **4,100** | $0.05 | Brand, not model |
| `jcb showroom near me` | **2,400** | **$0.35** | High commercial value |
| `crane service near me` | 5,200 | $0.05 | Service intent |
| `jcb service near me` | 1,300 | — | Service intent |
| `jcb dealer near me` | 450 | $0.15 | Dealer intent |
| `jcb on rent near me` | 450 | $0.06 | Rental intent |

**The modifier attaches to the brand, the category, or the service — never to the model number.** Nobody searches a specific SKU plus "near me"; they search the brand plus "near me" and then pick a model.

### Finding 2: We already rank #1 for "near me" terms and get zero traffic from them

Our own live rankings — this is the decisive evidence:

| Keyword | Vol | Our pos. | Ranking URL | Traffic |
|---|---|---|---|---|
| `jcb rent per hour near me` | 350 | **#1** | `/blog/equipment-rental-rate-card/` | **0** |
| `jcb on rent near me` | 300 | **#1** | `/blog/equipment-rental-rate-card/` | **0** |
| `jcb service near me` | 1,300 | **#3** | `/blog/equipment-rental-rate-card/` | **0** |
| `jcb machine on rent near me` | 30 | **#1** | `/blog/equipment-rental-rate-card/` | **0** |
| `jcb 3dx showroom near me` | 50 | **#4** | `/blog/top-10-backhoe-loaders-in-india/` | **0** |

We hold **position 1 on four "near me" keywords** and they deliver **nothing**. Ranking is not the constraint — the SERP layout is. Adding the phrase to a product page cannot beat a problem that #1 rankings already failed to beat.

### Finding 3: "Near me" is a geo query, and the SERP is local-pack territory

Live SERP for `jcb near me` (India) resolved to a **specific city (Hyderabad)** — Google rewrites "near me" into an implicit `in {user's city}` query using device location:

| Pos | Result | Type |
|---|---|---|
| 1 | Sri Shiva JCB Works / YDR JCB Civil Works | **Google Business Profile local pack** |
| 3 | "Which is the cheapest JCB?" etc. | People Also Ask |
| 2 | justdial.com **/Hyderabad/**JCB-Hire/ | Directory — *city URL* |
| 4 | dealer-locator.jcb.com/location/telangana/**hyderabad** | OEM locator — *city URL* |
| 5 | dir.indiamart.com/**hyderabad**/jcb-excavator-rental | Directory — *city URL* |
| 7 | transrentals.in/jcb-on-rent/**hyderabad** | DR **17** — *city URL* |
| 9 | gaadibazaar.in/…-in-**hyderabad**-for-sale | Marketplace — *city URL* |

Two things follow:

1. **The top of the page is GBP-only.** Local pack slots require a verified Google Business Profile with a real address near the searcher. DesiMachines is a national OEM-channel platform, not a branch network — that space is structurally unavailable, and no on-page text changes it.
2. **Every single organic winner ranks with a city-specific URL.** Not one ranks with a national product page. Note `transrentals.in` at **DR 17** outranking our DR 41 — they win on *page-geo match*, not authority. That is the actual ranking mechanism, and it is a URL/architecture property, not a keyword-placement property.

A single static model page cannot be "near" a user in Pune, Hyderabad, and Ludhiana simultaneously. The phrase in a location section does not create local relevance — proximity, GBP, and city-matched URLs do.

---

## 2. The additional risk: templated boilerplate at scale

If the location section is templated across the model catalogue, the literal string `{model} near me` gets stamped onto every model page with no differentiating local content behind it. That produces:

- **Near-duplicate sections at scale** — a recognised low-value/doorway pattern when pages assert local relevance they cannot back with real local data.
- **Dilution of what is actually working.** Per `00` and `04`, model pages convert on **price intent** (`jcb 3dx price`, 9,200/mo, currently p2). Trading section real estate on a proven price page for a zero-volume geo phrase is a straight downgrade.

---

## 3. What to do instead

**Keep the location section — change what it targets.** It becomes a navigation and lead-capture surface, not a keyword surface.

### On the model page (`/backhoe-loader/jcb-3dx/`)

- Frame the section around **"Where to buy"**, not "near me."
- Natural-language copy that links out, e.g. *"Looking for a JCB 3DX dealer near you? Check dealer availability and on-road price in your city →"*. The phrase reads naturally and is *not* the ranking target.
- Link into the city layer (below) — this is the internal-linking win noted in `18`.
- Attach the RFQ/WhatsApp CTA from `08`: **"Get on-road price in your city"** — a 2-field form (city + model) converts this intent far better than any ranking would.
- Keep **`{model} price in {city}`** as the real geo keyword for model pages — it has genuine volume, matches our proven price-intent portfolio (`04`, line 51), and does not fight the local pack.

### The city layer (where "near me" actually gets captured)

This is already scoped in `04` (line 119: city × category, ~600 pages; line 107: dealer/location directory). This decision **strengthens the case for it**:

- Build `/{category}-in-{city}/` and `/{brand}-dealer-in-{city}/` — matching the exact URL shape every winner in the SERP above uses.
- Target the terms that *do* have volume: `jcb showroom near me` (2,400, $0.35 CPC), `jcb dealer near me`, `jcb near me` — these resolve to city pages, which is why Justdial and IndiaMART rank.
- Populate with **real local data**: dealer names, addresses, service areas, city price bands, rental rates. Real data is what separates this from the doorway pattern in §2.

### Schema

- **Do not** add `LocalBusiness` schema to model pages — we are not the local business; false entity claims are a structured-data violation.
- Model pages: `Product` + `Offer` (with `priceRange` / area served where accurate).
- City/dealer pages: `ItemList` of dealer entities.

---

## 4. Bottom line

| | |
|---|---|
| **Can we?** | Yes — nothing blocks putting the phrase there. |
| **Should we?** | No. Zero model-level volume, local-pack-gated SERP, and our own #1 rankings for "near me" already return **0 traffic**. |
| **Instead** | Model page → **"Where to buy" + `{model} price in {city}` + RFQ CTA**, linking into a **city/dealer page layer** that carries the real "near me" demand. |

The intent is worth chasing — `jcb showroom near me` at $0.35 CPC is a buyer with a wallet out. It just has to be caught on a **city page**, not a model page.
