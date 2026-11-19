# 04 — Keyword & Opportunity Analysis

> All volumes/positions [FACT] from Ahrefs (IN, 25 Jun 2026). "Priority score" is a [REC] composite of volume × commercial intent × proximity-to-page-1-top × lead potential.

## 1. The position 4–20 harvest — fastest leads in the building

These are keywords where DesiMachines **already ranks but is below the top click positions**. Moving each up 2–5 spots is the single fastest traffic+lead source because the page already has authority — it needs an on-page refresh, internal links, and schema, not a new build.

### Tier 1 — high volume, high commercial value, one push from the top

| Keyword | Vol | Cur. pos | Ranking URL | CPC ($) | Why it matters | Action |
|---|---|---|---|---|---|---|
| **jcb 3dx price** | 9,200 | 12 | `/backhoe-loader/jcb-3dx/` | 5 | Flagship backhoe price term stuck on p2 | Refresh model page: price band, EMI, FAQ schema, internal links from `/backhoe-loader/jcb/` + compares |
| **jcb on road price** | 7,500 | 10 | `/backhoe-loader/jcb/` | 4 | Pure buy intent, bottom of p1 | Add "on-road price by state" section + RFQ CTA |
| **crane machine** | 7,600 | 7 | `/crane/` | 3 | Category head term | Strengthen hub: model grid, price bands, internal links |
| **jcb 3dx on road price** | 5,800 | 8 | `/backhoe-loader/jcb-3dx-super/` | 11 | High CPC ($11) = high lead value | Consolidate JCB-3dx intent; on-road price block |
| **mahindra jcb price** | 1,300 | 6 | `/compare/jcb-3dx-vs-mahindra-earthmaster-sx…` | 4 | Compare page ranking a price term | Build/boost a Mahindra EarthMaster model page to capture brand-price |
| **pokland machine price** | 1,900 | 6 | `/blog/poclain-…guide/` | 10 | Misspelling of poclain, $10 CPC | Add "pokland/poclain" entity + price band to guide; internal link to `/excavator/` |
| **jcb 4dx price** | 1,900 | 4 | `/compare/ace-ax-124-vs-jcb-4dx…` | 5 | Compare page ranks; model page should | Strengthen `/backhoe-loader/jcb-4dx/` as canonical price target |
| **hydra crane** | 8,600 | 4 | `/crane/hydra/` | 3 | Just outside top-3 on a huge term | Refresh; add tonnage variants, price bands, FAQ |
| **hydra crane price** | 2,000 | 4 | `/crane/hydra/` | 18 | **$18 CPC** — very high lead value | Same page; price band + RFQ |
| **cat jcb price** | 1,800 | 4 | `/backhoe-loader/caterpillar-cat-424/` | 14 | $14 CPC | Model page price refresh |
| **crane machine price** | 800 | 3 | `/crane/ace-f270/` | 6 | Edge of top-3 | Point to `/crane/` hub or strong model |

### Tier 2 — strong commercial terms in striking distance (pos 4–12)

| Keyword | Vol | Pos | CPC | Keyword | Vol | Pos | CPC |
|---|---|---|---|---|---|---|---|
| crane price in india | 2,300 | 3 | 4 | farana crane 25 ton price | 1,200 | 3 | 18 |
| ace hydra 14 ton price | 800 | 2 | 20 | hitachi jcb price | 1,100 | 3 | 5 |
| road roller price | 4,800 | 2 | 3 | concrete pump price | 800 | 2 | 3 |
| loader price | 2,500 | 2 | 5 | jcb 3dx price (dup intent) | — | — | — |
| tata hitachi price | 3,300 | 1* | 6 | backhoe loader price | 1,300 | 1* | 12 |

\*Already #1 but on high-CPC terms — protect and add conversion, don't just celebrate ranking.

**[REC] Execution:** Batch the Tier-1 list into a **"Quick-Win Sprint"** (Weeks 1–4). For each: (1) align title/H1 to the exact query, (2) add a price band + RFQ/WhatsApp CTA, (3) add 4–8 FAQ + FAQ schema, (4) add 3–5 internal links from the relevant category hub and 2 sibling/compare pages, (5) refresh the visible "updated" date and a fresh price-as-of-month line. Expected: most Tier-1 terms move into top-3 within 2–6 weeks given existing DR.

> ⚠️ **Calibration note:** The *true* highest-ROI quick-win list is the GSC "high impressions, position 4–20, low CTR" report — which lives in the inaccessible Google Sheet. The table above is the Ahrefs-modeled equivalent and is directionally reliable, but **overlay GSC data when available** to catch terms Ahrefs under-samples.

---

## 2. Keyword universe — cluster map

The brief asks for thousands of keywords clustered by intent and category. The practical, scalable way to express "thousands" for this site is **a generated matrix**, not a hand-typed list. Below is the cluster framework + the seed→scale logic that produces the full universe programmatically. (A starter seed set is in `appendix-A-keyword-seeds.md`.)

### 2.1 Intent clusters (and how each maps to a page type + lead path)

| Cluster | Pattern | Example | Page type | Lead path |
|---|---|---|---|---|
| **Transactional / price** (highest priority) | `{model} price`, `{model} on road price`, `{model} price in {city}` | jcb 3dx on road price | Model page | RFQ + WhatsApp price |
| **Commercial category** | `{category} price`, `best {category} in india`, `{category} dealers` | excavator price in india | Category hub | "Get quotes from dealers" |
| **Comparison** | `{model A} vs {model B}`, `{brand} vs {brand}` | jcb vs cat backhoe | `/compare/` | "Which fits you → enquire" |
| **Alternative** | `{model} alternatives`, `like jcb 3dx` | poclain alternatives | Compare/list | RFQ |
| **Brand/OEM** | `{brand}`, `{brand} machines`, `{brand} price list` | poclain, ace cranes | Brand hub | Dealer/OEM enquiry |
| **Spec/info** | `{model} mileage`, `{model} specifications`, `{model} weight` | jcb mileage | Model page (spec tab) | Soft CTA |
| **Rental** (gap) | `{category} on rent {city}`, `{category} rental price` | excavator on rent delhi | Rental landing | Rental enquiry |
| **Used** (gap) | `used {category} for sale`, `second hand {model}` | used jcb 3dx | Used listings | Buyer enquiry |
| **Spare parts** (gap) | `{model} spare parts`, `{brand} parts price` | jcb spare parts | Parts hub | Parts RFQ |
| **Finance** (gap) | `{model} emi`, `{category} loan`, `{model} down payment` | jcb 3dx emi | EMI calculator | Finance lead |
| **Application** | `{machine} for {use}` | excavator for trenching | Application guide | Soft CTA |
| **Compliance/safety** | `bs6 vs bs4`, `cmvr crane`, `{machine} safety` | bs4 vs bs6 engine | Guide | Brand authority |
| **Geo** | `{category} dealers in {city/state}` | excavator dealers in up | Location page | Local dealer enquiry |
| **Informational/glossary** | `what is {term}`, `{machine} types` | types of cranes | Glossary/guide | Top-funnel capture |

### 2.2 The scale matrix (how "thousands" is generated)

```
Brands (≈25):  JCB, Tata Hitachi, Caterpillar, Komatsu, Hyundai, Volvo, Sany, XCMG,
               Kobelco, Case, Mahindra, ACE, Escorts, Terex, Ajax, Schwing Stetter,
               Putzmeister, BEML, L&T, Bobcat, Doosan/Develon, LiuGong, Sdlg, Manitou…
Categories (≈15): excavator, backhoe loader, wheel loader, motor grader, crane,
               compactor/road roller, concrete mixer, transit mixer, concrete pump,
               skid steer, telehandler, dozer, paver, batching plant, dumper/tipper
Models (≈300+): per brand×category (e.g. JCB 3DX/3DX Plus/3DX Super/4DX/2DX…)
Modifiers (≈20): price, on road price, price in india, price in {city}, specifications,
               mileage, review, vs {X}, emi, on rent, used, second hand, dealers,
               spare parts, weight, tonnage, fuel consumption, hp, 2025/2026
Cities (≈40):  Delhi, Mumbai, Pune, Hyderabad, Bengaluru, Chennai, Kolkata, Ahmedabad,
               Jaipur, Lucknow, Patna, Indore, Nagpur, Surat, Coimbatore, Raipur,
               Bhubaneswar, Guwahati… (weighted to infra/mining/Tier2-5 hubs)
States (≈20):  UP, MH, Gujarat, Rajasthan, MP, Bihar, Karnataka, TN, Telangana, Odisha…
```

`Models × price-modifiers` alone = **~1,500+ commercial keywords.** Add `models × cities` and `categories × cities/states` and the addressable universe is **well into the tens of thousands** — which is exactly why the strategy is **programmatic** (`06`), not manual.

### 2.3 Where the volume + money actually concentrates [FACT-derived]
From the live data, demand is heaviest and most commercial in:
1. **Backhoe loaders (JCB-dominated)** — `jcb price` 90k, `jcb price in india` 23k, `jcb 3dx price` 9,200, plus dozens of model/price variants. *This is the crown jewel cluster.*
2. **Excavators (poclain/hitachi vernacular)** — `poclain machine` 10k, `hydra machine` 13k (cranes), `excavator` 27k, model-price terms 700–3,000 each.
3. **Cranes (hydra/farana vernacular)** — `hydra crane` 8,600, `farana crane` 7,400, high-CPC tonnage variants ($17–22 CPC).
4. **Compactors/road rollers** — `road roller` 8,100, `road roller price` 4,800.
5. **Concrete (mixers/SLCM/pumps)** — `ajax machine price`, `cement mixer machine` 3,100, RMC/transit terms.

> **Vernacular insight (high value):** Indian buyers use *category-as-brand* language — "poclain" = excavator, "JCB" = backhoe, "hydra"/"farana" = pick-and-carry crane. DesiMachines already ranks for these. **Own the vernacular** deliberately: build entity pages that map slang → real models (e.g. "Poclain machine = hydraulic excavator; here are the models and prices") — this is both an SEO moat and an AI-Overview citation magnet.

---

## 3. Keyword gaps — demand DesiMachines does NOT yet serve (priority order)

| Gap cluster | Why it's a gap | Lead potential | Build |
|---|---|---|---|
| **Used / second-hand equipment** | Massive India demand; competitors (Cars24-style, motorbazee, machanx) monetize it; DesiMachines is OEM-new focused | **Very high** — used buyers convert fast | Used listings + "sell your machine" lead form (two-sided leads) |
| **Equipment rental** | Huge Tier 2–5 contractor demand ("excavator on rent {city}"); recurring leads | **Very high** | Rental landing pages by category × city + rental-partner enquiry |
| **Finance / EMI** | "jcb 3dx emi", down payment, loan — buyers are pre-decision; financiers already onboard per PR | **High** (financier + machine lead) | EMI calculator + finance lead form |
| **Spare parts & attachments** | Recurring, high-margin; "jcb spare parts", buckets, breakers | **High, recurring** | Parts hub + attachment pages + parts RFQ |
| **Dealer / OEM directory by location** | "{brand} dealers in {city}" — DesiMachines can be the directory layer | **High** (dealer enquiries = your customer) | Programmatic dealer/location pages |
| **Tenders / govt procurement** | Infra contractors search tenders; authority + B2B lead magnet | Medium-high | Tender aggregation + alerts (lead capture) |
| **AMC / maintenance / service cost** | Ownership-stage, builds authority + retention | Medium | Maintenance schedule pages + service-partner leads |

---

## 4. Programmatic SEO opportunity set (full detail in `06`)

| Page set | Scale | Template | Traffic potential | Lead potential | Effort | Maint. |
|---|---|---|---|---|---|---|
| Model price pages (`/{cat}/{brand-model}/`) | 300→1,000+ | spec + price band + EMI + RFQ + FAQ | High | **Very high** | Already built; extend | Low |
| Compare pages (`/compare/A-vs-B/`) | 200→2,000 (curated) | spec delta + verdict + RFQ | High | High | M | Low |
| City × category (`/{cat}-in-{city}/`) | 15×40 = 600 | local dealers + price + rental + RFQ | High | **Very high (local)** | M | Med |
| Brand price-list hubs (`/{brand}/`) | ≈25 | model grid + price list + dealer CTA | High | High | S–M | Low |
| EMI / cost calculators | 1 tool, many embeds | interactive + lead gate | Medium (links/AIO) | High | M | Low |
| Used listings | scalable | listing + buyer/seller forms | Medium→High | **Very high** | L | Med |
| Glossary / vernacular entity pages | ≈150 | term → models → price | Medium (AIO magnet) | Low-Med | S | Low |

**Sequencing rationale:** extend the **already-proven** model + compare templates first (lowest risk, fastest leads), then city × category (highest local-lead upside), then used/rental (new funnels, higher build cost).
