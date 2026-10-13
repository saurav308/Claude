# 06 — Content & Topical Authority Strategy

> Goal: become *the* authoritative, all-brand, India-real-price destination for construction equipment buying decisions — and engineer every piece to produce an enquiry. Topical authority is the SEO mechanism; **lead capture is the purpose.**

## 1. The topical authority map (hub-and-spoke)

DesiMachines should organize around **equipment categories as pillars**, each with five spoke types. The structure already exists for some categories — this systematizes and completes it.

```
PILLAR: Excavators in India  (/excavator/)
├── Spoke 1 — Model pages        /excavator/{brand-model}/        (price, specs, EMI, RFQ)
├── Spoke 2 — Brand hubs         /excavator/{brand}/              (model grid + price list)
├── Spoke 3 — Compare pages      /compare/{A}-vs-{B}/             (verdict + RFQ)
├── Spoke 4 — Buying guides       /blog/best-excavators-…/         (decision content)
└── Spoke 5 — Application/cost    /excavator-guide/{topic}/        (use-case, ownership cost)
        ↑ all spokes link up to the pillar; pillar links down to top spokes
```

Replicate for each category pillar: **Backhoe Loaders, Cranes (pick-and-carry/hydra/farana, tower, crawler), Compactors/Road Rollers, Wheel Loaders, Motor Graders, Concrete (mixers/SLCM/transit/pumps/batching), Skid Steers, Telehandlers, Dozers, Pavers, Dumpers/Tippers.**

### Priority pillars (by demonstrated demand, `02`/`04`)
1. **Backhoe Loaders / JCB** — crown jewel (90k+ head term). Complete every JCB & rival model + all price variants.
2. **Excavators (poclain/hitachi)** — 27k/10k/13k head terms.
3. **Cranes (hydra/farana)** — high CPC ($17–22), strong volume.
4. **Compactors/Road Rollers** — 8,100 head term.
5. **Concrete equipment** — Ajax/SLCM, transit mixers, pumps.

## 2. Content types to build (mapped to funnel + lead path)

| Type | Funnel stage | Primary lead path | Priority |
|---|---|---|---|
| **Model price pages** | Decision | RFQ + WhatsApp price | **P0** (extend) |
| **Compare pages** | Decision | "which to buy → quote" | **P0** (scale) |
| **Brand price-list hubs** | Consideration→Decision | dealer/OEM enquiry | P1 |
| **Buying guides** ("best X for Y budget/use") | Consideration | soft RFQ + newsletter | P1 |
| **On-road price + EMI pages** | Decision | finance + machine lead | P1 |
| **Used-equipment listings** | Decision | buyer + seller leads | P1 |
| **City/state dealer pages** | Decision (local) | local dealer enquiry | P1 |
| **Glossary / vernacular entity pages** | Awareness | top-funnel capture + AIO citations | P2 |
| **Application guides** ("excavator for trenching/mining") | Awareness→Consideration | soft CTA | P2 |
| **Cost-of-ownership / maintenance** | Ownership | service-partner leads + retention | P2 |
| **Market reports / price index** (first-party data) | Authority/PR | links + brand + leads | P2 (high moat) |

## 3. Interactive tools & calculators (lead magnets + link magnets)

| Tool | What it does | Lead mechanic | Link/AIO value | Effort |
|---|---|---|---|---|
| **EMI / loan calculator** | Monthly EMI by price, down payment, tenure, rate | Gated "get exact finance offer" → financier lead | High (linkable, AIO-citable) | M |
| **On-road price estimator** | Ex-showroom → on-road by state (RTO, insurance, finance) | "Get verified quote" RFQ | Very high (unique data) | M |
| **Ownership / TCO calculator** | Fuel + maintenance + resale over N years | "Talk to an expert" lead | High (no OEM has this) | M |
| **Fuel-cost calculator** | L/hr × hours × diesel price | Soft capture | Medium | S |
| **Machine selector / "which machine for my job"** | Quiz → recommended models | RFQ on results | High (engagement + leads) | M |
| **Resale-value / valuation tool** | Used-machine price estimate | "Sell your machine" seller lead | Very high (two-sided) | M |

**[REC]** Tools are disproportionately valuable here because (a) they earn editorial links (digital PR in `07`), (b) AI Overviews love citing calculators/data, and (c) they convert at the exact decision moment. Build the **EMI calculator first** — highest demand (`{model} emi` gap) and clearest lead.

## 4. Existing-content audit framework (apply to every important URL)

Categorize each page; the live data already flags the obvious actions:

| URL (from live data) | Verdict | Why | Action |
|---|---|---|---|
| `/blog/jcb-excavators-in-india/` | **Keep + Expand + Convert** | 6,380 visits, `jcb price` #5 | Push to #1–3 (B1, `04`); add RFQ; split intent vs `/backhoe-loader/jcb/` to fix cannibalization |
| `/backhoe-loader/jcb/` | **Improve + Convert** | `jcb price in india` #6, 92 keywords | On-road price by state + RFQ; make this the canonical "buy JCB" hub |
| `/blog/poclain-machines-…guide/` | **Keep + Convert** | 1,873 visits, vernacular gold | Add price band + RFQ; map slang→models (AIO magnet) |
| `/compare/*` (thin ones, 7–16 kw) | **Expand or Merge** | thin-content risk (B4) | Templatize: spec delta + verdict + FAQ + RFQ; merge lowest-demand pairs |
| `/excavator/`, `/crane/`, `/compactor/` hubs | **Improve + Convert** | head terms at pos 3–7 | Strengthen hubs, add price bands + dealer CTA |
| Model pages ranking 4–12 | **Improve + Convert** | quick-win list (`04`) | The Quick-Win Sprint |
| Any orphan/thin model page | **Expand or Redirect** | crawl/lead efficiency | Link in or 301 to successor |

General per-page checklist: missing **Product/Offer + FAQ schema**, missing **price band**, missing **RFQ/WhatsApp CTA**, missing **internal links** (3+ in, 3+ out), missing **freshness date**, missing **entities** (variants, tonnage, BS6, EMI), missing **images with alt text**.

## 5. Internal linking architecture [REC]

- **Hubs distribute authority:** each category hub links to its top 10–15 model pages and top compares with descriptive anchors ("JCB 3DX on-road price", not "click here").
- **Models link laterally:** every model page links to (a) its category hub, (b) 3 sibling models in the same class/tonnage, (c) 2 compare pages featuring it, (d) the relevant buying guide.
- **Compare pages link to both model pages** and to a "see all {category}" hub.
- **Guides link down to money pages:** every blog/guide links to the model/category pages it discusses (the `/blog/jcb-excavators-in-india/` → JCB model pages flow is the proven pattern — formalize it everywhere).
- **Fix orphans:** auto-link any new model page from its hub on publish (also a technical fix, A5).
- **Anchor-text discipline:** use exact + semantic commercial anchors; avoid over-optimizing the single head term across hundreds of internal links (cannibalization, B2).

## 6. 12-month publishing roadmap (lead-weighted, not volume-weighted)

| Phase | Focus | Output | Lead rationale |
|---|---|---|---|
| **M1** | Convert + quick wins | RFQ system live on top 30 pages; Tier-1 quick-win refreshes; Product/FAQ schema rollout | Fastest leads from existing traffic |
| **M2** | Complete the crown-jewel pillars | Finish JCB/backhoe + excavator model & compare coverage; brand price-list hubs; EMI calculator | Deepen highest-demand commercial clusters |
| **M3** | Open new funnels | Used-equipment MVP, city×category dealer pages (top 10 cities), finance lead form | New lead sources (used + local + finance) |
| **M4–M6** | Scale programmatic | City×category to 40 cities; compare-page expansion; on-road price estimator; vernacular glossary | Local + long-tail lead volume |
| **M7–M9** | Authority & data moat | DesiMachines Price Index / quarterly market report; ownership-cost tools; review system | Digital PR links + brand demand + AIO citations |
| **M10–M12** | Rental + two-sided + retention | Rental funnel; seller/used two-sided marketplace; maintenance/AMC content | Recurring + two-sided leads, defensibility vs tractorjunction |

## 7. Video / YouTube strategy [REC]
`video_th` appears on nearly every target SERP — video is a ranking surface, not a side channel.
- Produce short (60–120s) **model walkarounds, price explainers, and compare verdicts** for the top 50 demand models.
- Embed on the matching page (VideoObject schema, C5) → wins `video_th` slots and increases dwell/conversion.
- YouTube titles mirror buyer queries ("JCB 3DX on-road price & review 2026").
- Each video description deep-links to the model page's RFQ → YouTube becomes a second lead funnel and a branded-search generator.
