# 28 — Where SKU-scale parts & fitment data lives, and how DesiMachines gets in

**Prepared:** 18 Nov 2026 · **Companion to:** `27-OEM-Part-Numbers-and-Machine-Fitment.md` (what public research alone yields: 735 machines, 516 with at least one OEM number, mostly consumables) · **Question answered here:** which sources hold *deep* catalogue data — thousands of SKUs per brand, every model and serial range, cross-references and supersessions — and what each access route costs, permits and forbids.

> **Bottom line.** No single public source gives cross-brand, SKU-scale fitment. The data sits in five places: (1) OEM electronic parts catalogues, which are dealer- or subscription-gated except for a few public e-stores; (2) aftermarket OE-quality makers' application catalogues (filters, batteries, belts, undercarriage, lubricants), which are public and *want* distribution; (3) a handful of commercial data licensors that have already normalised OEM catalogues; (4) big distributors whose shops carry fitment for tens of millions of references but only for account holders; (5) the dealer network itself, reachable through DesiMachines' existing lead relationships. The practical path is a layered one: licence or partner for the backbone, use public OEM stores for the top brands, and build the serial-level long tail through the RFQ loop DesiMachines already runs.

---

## 1. What "deep-rooted" means in data terms

| Layer | Field | Why it matters for publishing |
|---|---|---|
| Machine identity | brand · model · variant · **serial range / production years** · engine model | Filter and pin numbers change at serial breaks; a model-only table is wrong for part of the fleet |
| Part identity | OEM part number · description · group/system · supersession chain · quantity per machine | Supersessions are where most "wrong part" complaints come from |
| Fitment | part → list of machines (and serial ranges) it fits | The "fits these machines" table is the SEO asset: one page per part number, hundreds of machine links |
| Interchange | OEM ↔ aftermarket brand numbers (Fleetguard, Donaldson, MANN, Baldwin, Elofic, UFI…) | Lets the 23 parts makers already listed on the site be matched to each machine |
| Commercials | list price, availability, dealer | Only OEM stores and distributors hold this; needed for RFQ pre-qualification, not for publishing |

A source only counts as deep if it covers the first three layers at catalogue scale (thousands of SKUs per brand, not a service-kit list).

---

## 2. Source landscape (verified Nov 2026)

### 2.1 OEM electronic parts catalogues and e-stores

| OEM | Where the catalogue is | Public access? | Depth | How DesiMachines could use it |
|---|---|---|---|---|
| **JCB India** | parts.jcb.com/in — JCB Parts Online, run by JCB India Ltd, serial-number "find parts that fit", part numbers and dealer prices, category browse (filters, GET, engine, cab…) | Yes, without login. Terms describe a **B2B platform for buyers purchasing through dealers**; no explicit data-licence or API | Full genuine-parts range for the India line-up | Best public OEM source in India. Structured capture of consumables + GET per serial prefix is technically possible; **ask JCB India for a data/affiliate arrangement first** (JCB already runs an independent-operator subscription on servicepro.jcb.com, so they have a commercial model for sharing) |
| **Caterpillar** | parts.cat.com (serial-number and model filter, 1.4M+ genuine parts, parts manuals view); free **Parts Reference Guides** PDFs per machine family on cat.com; SIS2GO paid app for owners | Store browsable; manuals and SIS behind account; SIS2GO is a paid owner subscription | Complete | Parts Reference Guides are already the High-confidence rows in doc 27. Owner-level SIS2GO subscriptions are legitimate for verification, but their licence does not allow republishing the catalogue |
| **Bobcat** | shop.bobcat.com parts catalogs — serial-number search, diagrams, public | Yes | Complete for Bobcat line | Public capture of consumables for E-series minis, S-series, B900 |
| **Komatsu / L&T Komatsu** | My Komatsu (mykomatsu.komatsu) parts ordering with price by ZIP (US); Komatsu India genuine-parts pages; CSS-Net/LinkOne parts books (dealer) | Regional; India parts books are dealer-only | Complete | Route is L&T/Komatsu India dealer partnership; Komatsu Quick Reference Guides (maintenance parts) are public PDFs for many models |
| **Tata Hitachi** | tatahitachiparts.com (e-DOST) — model-wise parts catalogues for every Shinrai, EX, ZAXIS, NX, TMX, ZW, TL and attachment, with serial-range splits (e.g. ZAXIS 490H MSN 50101–50157 / 50158~) | Catalogue index is public; **part data behind login** | Complete, India-specific, serial-ranged | Highest-value single ask: a dealer or Tata Hitachi parts-marketing export of the FILTERS / TOOTH POINTS / PINS & BUSHES groups per model, under NDA, in exchange for lead flow |
| **Volvo CE** | Volvo Connect / regional Marketplace (part numbers and prices, e.g. marketplace.volvoce.com) ; PROSIS parts & service system (subscription) | Marketplace public in some regions, India via dealer; PROSIS dealer/subscription | Complete | Dealer partnership; PROSIS subscription for verification only |
| **CASE / CNH** | MyCNH Store (partstore) — all CASE CE parts catalogues online, model + serial lookup | Public browse, account to buy | Complete | Public capture for 770/851/CX/compactors; CNH NGPC is the dealer tool |
| **Hitachi CM (global)** | Parts Manager Pro (subscription software, also behind John Deere/Hitachi Parts ADVISOR) | Paid | Complete | Only via Tata Hitachi route in India |
| **Hyundai CE** | HCE e-Catalogue2 (dealer software); HD Hyundai parts portal | Dealer | Complete | Dealer partnership |
| **Kubota / Escorts Kubota** | Kubota Dealer Online price-file export (dealer); Kubota PartsLink/KE-SP (dealer) | Dealer | Complete | Escorts Kubota dealer partnership |
| **SANY, XCMG, LiuGong, SDLG, Shantui, SEM** | No public OEM catalogue; numbers circulate via exporters, Donaldson's Asian-equipment catalogue, marketplace listings | No | Fragmented | Partner with India distributors; rely on engine-OEM (Cummins/Weichai/Isuzu) numbers |
| **Mahindra CE, ACE, BEML, Bull, Indo Farm, Manitou India, AJAX, Schwing Stetter, Putzmeister, Aquarius, Venus, Conmat** | Printed/PDF parts books issued with the machine; no online catalogue found | No | Complete offline | Ask each OEM's parts head for the service-parts list per model (small, finite ask); BEML numbers also appear in government tender BOQs |

**Grey market to avoid.** epcatalogue.com, epcdepo.com and similar resell copies of Volvo PROSIS, Komatsu CSS-Net, CNH NGPC, Hitachi Parts Manager Pro, Kubota KE-SP, JCB Service Parts Plus+ and Hyundai e-Catalogue2 for US$35–300. 777parts.net/.com and AVSpare mirror OEM parts books (777parts claims 6M+ parts, 1 TB). These contain exactly the data needed, but they are unlicensed copies of OEM copyright works; using them to seed a published database exposes DesiMachines to takedown and damages and would poison the OEM relationships the lead business depends on. Use them, at most, to *know what exists* before asking the OEM.

### 2.2 Aftermarket OE-quality makers with public application catalogues

These are the deepest *legitimately public* fitment data, because the makers publish machine → part applications as marketing. Several are already among the 23 parts makers listed on desimachines.com/spare-parts/.

| Maker | What is published | Scale | Access |
|---|---|---|---|
| **Fleetguard (Atmus) / Fleetguard Filters Pvt Ltd India** | catalog.cumminsfiltration.com — search by equipment make/model, part, cross-reference; Fleetguard Catalog app (equipment search, custom lists, export); offline Master Catalog with equipment applications by segment | Global; India JV (Pune) with 48,000+ retailers | Web catalogue returns HTTP 403 to non-browser clients; app and web are free for humans. **Partnership ask:** application data export for the Indian machine list + co-branded filter finder |
| **Donaldson (Donaldson India)** | shop.donaldson.com application lookup; e-catalogues (Truck & Bus, Asian Equipment, Construction) with model → engine → filter tables and a cross-reference report; **monthly New Product Release PDF + Excel** listing new part numbers with OEM and competitor cross-refs | Global; the Asian-equipment catalogue is the best public source for SANY/XCMG/LiuGong numbers | Public PDFs and XLS; distributor programme |
| **MANN+HUMMEL (MANN-FILTER)** | Online catalogue (6,800 filters, >60,000 vehicles/machines, >205,000 cross-refs), Construction & Industrial catalogue PDF, Cross Reference List 2024-26 PDF (1,450 pp), **Industrial Engine Guide 2.0** (≈380 engine models, 4.7M applications incl. Chinese construction machines) | Global | Public PDFs. **Licence notice in the CRL forbids reproduction without written approval** and reverse-mapping MANN numbers to OE numbers for consumers; so use via partnership, not copy |
| **Baldwin (Parker)** | Form 124 Off-Highway Applications, Form 560 Manufacturers' Cross-Reference (984 pp), Form 570 Quick Cross | Global | Public PDFs |
| **SF-Filter** | Cross-reference database, ~900,000 OEM and aftermarket numbers, web lookup | Global | Public lookup, no bulk |
| **Elofic (India)** | Automotive and Industrial catalogue PDFs with OEM equivalents for JCB, Tata Hitachi, L&T, Kirloskar, Ashok Leyland engines | India | Public PDFs; 1,000+ distributors — partnership candidate |
| **UFI Filters India** | Catalogue by OEM number | India/Global | Public |
| **Amaron (Amara Raja)** | Earth-moving battery pages per machine brand and model (e.g. Caterpillar list of ~70 models), downloadable **Application Chart** | India | Public; already a listed maker — ask for the chart as data |
| **Exide** | Battery Finder by make/model/year for construction (global); Exide India application charts | Global/India | Public finder |
| **Gates** | Industrial power transmission and agricultural belt programme catalogues with OE-reference → Gates reference tables | Global | Public PDFs; off-highway construction coverage thinner than agri |
| **ITR / USCO** | Undercarriage and GET catalogues by machine model (via dealers such as ConEquip) | Global | Via distributor |
| **Olyslager (LIS, Product Selector) · Infopro Digital lubricant data · Infomedia Netlube** | OEM-verified lubricant recommendation and capacity databases, 2,700+ OEMs, heavy-duty equipment covered; sold as SaaS/API to oil companies and web "oil finder" widgets; **Shell LubeMatch** is a free public front-end to the same kind of data | Global | Licence (Olyslager quotes on request); the oil makers listed on the site may already hold a licence and can embed a finder |

### 2.3 Commercial data licensors (normalised, cross-brand)

| Vendor | Product | Coverage | Delivery / price | Fit for DesiMachines |
|---|---|---|---|---|
| **DOT Data Labs** | HLSM Parts Catalog — "4.2M+ SKUs, 40+ OEM brands, 6.8M aftermarket↔OEM pairs, fitment (`fits_models`), monthly refresh" | Construction, forestry, mining, marine, material handling | JSONL/CSV/Parquet; sold as a perpetual commercial licence; sample under NDA; price on request | Closest thing to a one-shot backbone. **[VERIFY]** provenance of the fitment field and India-market model coverage before buying |
| **Power Systems Research** | OE Link / PartsLink databases + Components & Consumables modules: engine model, engine oil spec and capacity, change intervals, transmission make, turbo, **starter battery group/CCA/qty**, **standard front/rear tyres**, per equipment model worldwide incl. construction | Specs, not part numbers | Annual subscription or one-time extract; price on request | Fills the capacities/tyres/battery layer for every model in one go; also the source behind Auto Care's off-highway tables |
| **Auto Care Association** | Off-Highway & Equipment VCdb/PCdb (ACES/PIES reference databases): 16,500+ off-highway vehicles and equipment, 172 application areas, engine configurations | Taxonomy and machine identity, US/Canada/Mexico market | US$3,150–12,075/yr by company revenue; JSON API, SQL | Useful as the *schema* for machine identity and part classification, not as India fitment data |
| **TecAlliance (TecDoc)** | Parts catalogue with ~300,000 agricultural linkages; construction coverage limited; user licence ~£144/yr (2018 figure) | Agri/CV | Licence | Low fit for Indian construction machines |
| **MOTOR (Hearst)** | Commercial Parts / All-Makes Cross-Reference, "hundreds of millions" of crosses, medium/heavy truck focus "with some off-highway", REST/SOAP APIs, ACES/PIES | Trucks | Licence | Relevant only for the truck-chassis transit mixers (Tata, AL, BharatBenz, Eicher) |
| **LECTURA** | 200,000+ machine models: specs, list prices, images, residual values; API | Machines, not parts | Licence | Machine-identity enrichment, not fitment |
| **parts-crossreference.com** | 500,000+ cross-reference numbers, 50+ brands (agri, construction, forklifts) | Interchange | Paid web access | Small; useful for checking |

### 2.4 Distributors and marketplaces with fitment behind login

| Who | Scale claim | Access | India |
|---|---|---|---|
| **TVH** | "database of 49,500,000 part numbers, 930,000 in stock"; shop lets customers register machines and see fitment; distributes Fleetguard and Donaldson | Customer account after company verification; integration into customer software | **TVH India Pvt Ltd, Pune** (sales.saarc@tvh.com) |
| **Costex (CTP)** | Cat, Komatsu, Perkins, Deere replacement parts; search by serial; distributor in India listed | Dealer/customer account | Yes |
| **AMS Parts, ConEquip (ITR dealer), Flyntlok (dealer DMS with 400+ OEM price files)** | Fitment and price files for North America | Account / SaaS | Reference only |

### 2.5 Public records already mined (doc 27)

Government e-Marketplace and state tender BOQs print OEM part numbers against machines (Tata Hitachi TE/TB/TC numbers, BEML, ACE, JCB JS-series). Free, legitimate, uneven. Keep harvesting them; they are the only public documents that print *Indian-OEM-native* numbers.

---

## 3. Access routes, ranked

| # | Route | What it yields | Effort / cost | Risk | Verdict |
|---|---|---|---|---|---|
| 1 | **Parts-maker data partnerships** (Fleetguard India, Donaldson India, Elofic, UFI, MANN+HUMMEL India, Amaron, Exide, Gates, SKF, Trelleborg, Parker) — ask each for its application file for the 735-model list and permission to publish "fits" tables with their numbers alongside the OEM number | Filters, batteries, belts, seals, hydraulics for most models; the cross-reference layer in one move | Low cost; commercial conversation (they gain qualified demand and the RFQ routes to their distributor) | Low: they publish this data for exactly this purpose; respect each catalogue's reproduction notice by getting it in writing | **Do first** |
| 2 | **OEM/dealer catalogue exports under NDA** — Tata Hitachi e-DOST, JCB India, L&T-Komatsu, Volvo CE India, Escorts Kubota, CASE India, Hyundai CE India; lead with the fact that DesiMachines already routes parts RFQs to their dealers | Serial-ranged OEM numbers for the Indian line-up; the only way to get Indian-OEM native numbers (Tata Hitachi TE/TB, BEML, Mahindra) | Relationship work; often free in exchange for exclusivity or lead volume; may require "genuine parts through authorised dealer" framing | OEMs may refuse or restrict publication to consumables; expect per-OEM terms | **Do in parallel**, start with Tata Hitachi and JCB |
| 3 | **Licence a normalised dataset** — DOT Data Labs HLSM (SKU + fitment + cross-refs), Power Systems Research components modules (capacities, tyres, batteries) | Cross-brand backbone in weeks instead of years | Five- to six-figure USD per year likely **[VERIFY with quotes]**; needs a data engineer to map to DesiMachines model names and India variants | Global catalogues under-represent India-specific variants (3DX ecoMAX 444 vs CEV V 430; EX 200 Infra; Shinrai) | **Trial both**; buy if ≥60 % of the 735 models map |
| 4 | **Owner-level OEM subscriptions for verification** — JCB Service Pro independent-operator subscription, Cat SIS2GO, Volvo PROSIS via dealer, Hitachi Parts Manager Pro | Authoritative check of every ‡ row; serial-break detail | Modest annual fees per OEM | Licences permit internal use, not republication: use to *verify* rows and to answer RFQs, never to bulk-copy | **Buy for the top 6 brands** once routes 1–2 are moving |
| 5 | **Structured capture from public OEM e-stores** — parts.jcb.com/in, parts.cat.com, shop.bobcat.com, MyCNH Store, Volvo marketplaces | Consumables, GET and wear parts with "fits" by serial prefix for the brands that run public stores | Engineering time; polite rate limits; attribute and link to the store | Terms of use (JCB's is a B2B trading platform agreement) and copyright in catalogue arrangements; India's IT Act does not bless scraping that breaches ToS. Capture *facts* (numbers, fitment), link out, and seek written consent | **Only after asking (route 2)**; keep to consumables |
| 6 | **The RFQ loop as a data engine** — every parts enquiry already captures machine model, year, serial and the part; every dealer quote returns the exact OEM number. Store it. | Proprietary, serial-level, India-specific fitment that no vendor sells; compounds with lead volume | Product change: structured fields on the RFQ form + a "confirmed by dealer" flag per row | Low; it is first-party data. PII rules apply to the enquirer, not the part data | **Build now**; it is the long-term moat |
| 7 | **Public documents** — tender BOQs, OEM brochures/O&M manuals, Donaldson monthly XLS, MANN engine guide | Free, legitimate, uneven | Analyst time | Low | **Continue** (already the basis of doc 27) |

Not recommended: buying EPC dumps or scraping 777parts/AVSpare for publication (unlicensed OEM copyright; reputational risk with the OEMs DesiMachines sells leads to).

---

## 4. Compliance notes that shape the product

- **Nominative use.** OEM names and numbers may be used to identify the machines and parts they fit (the site already carries this disclaimer). Several makers' catalogues (MANN-FILTER's cross-reference list explicitly) state that OE numbers are "for comparison only, not a designation of origin" and forbid reproducing the list without consent: publish *your* table built from licensed/partner data, not their PDF.
- **Catalogue copyright.** OEM parts books and EPC databases are copyright works; facts (a number fits a machine) are not protected in India, but wholesale copying of the arrangement is. Prefer licences, partner feeds and first-party RFQ data; where public stores are used, capture narrowly and link back.
- **Platform terms.** JCB Parts Online's terms frame it as a B2B dealer-trading platform; parts.cat.com and shop.bobcat.com have their own terms. Read before any automated access; ask for an API or affiliate relationship first.
- **Dealer confidentiality.** Dealer price files and NGPC/CSS exports are confidential to the dealer contract; take them only through the OEM's parts-marketing team, under NDA, with publication scope agreed (typically consumables, GET, pins/bushes, not full assemblies).
- **Publishing rule carried over from doc 27.** Nothing marked ‡ goes live without dealer or OEM confirmation; every published number carries its source type and `checked_on` date.

---

## 5. Recommended programme (90 days)

| Weeks | Action | Owner | Output / metric |
|---|---|---|---|
| 1–2 | Send the 735-model list (doc 27 `machine_inventory.csv`) to Fleetguard Filters Pvt Ltd, Donaldson India, Elofic, UFI India, MANN+HUMMEL India, Amaron, Exide, Gates India with a one-page partnership proposal (co-branded finder + RFQ routing to their distributors) | Saurav / partnerships | ≥4 application files received; published cross-reference layer for ≥300 models |
| 1–4 | Tata Hitachi: request e-DOST FILTERS/TOOTH POINTS/PINS & BUSHES export for the 44 listed models; JCB India: request data/affiliate terms for parts.jcb.com/in; L&T-Komatsu, Volvo CE India, Escorts Kubota, CASE India, Hyundai CE India: same ask via existing lead-programme contacts | Saurav | Two signed NDAs; serial-ranged tables for Tata Hitachi + JCB (the two highest-traffic brands) |
| 2–6 | Request samples and quotes from DOT Data Labs (HLSM) and Power Systems Research (OE Link/PartsLink components modules); map a 100-model sample to the inventory; decide | Data | Coverage % and cost per mapped model; go/no-go |
| 3–8 | Add structured fields to the parts RFQ: model (from inventory), year, serial, part category, photo; add "dealer-confirmed part number" field on the response side; write every closed RFQ into `oem_parts_fitment.csv` with source_type "Dealer quote" and confidence High | Product / dev | RFQ-derived rows per month; share of ‡ rows upgraded |
| 4–10 | Buy owner-level verification access for the top brands (JCB Service Pro independent operator, Cat SIS2GO, Volvo PROSIS via dealer) and clear the ‡ backlog for the 100 most-viewed model pages | Content | ‡ rows on top-100 pages → 0 |
| 6–12 | Ship the "Parts & fitment" block on the top-100 model pages and the first 50 shared-part pages ("fits these machines"), generated from the CSV, with `Product`/`isAccessoryOrSparePartFor` schema | Dev / SEO | Parts RFQs per month by landing page (Leads Sheet); re-check at day 30 and 90 |

**Metric this moves:** spare-parts RFQs per month and dealer-confirmed share of published part numbers. **Re-check:** 30 days after the first partner file is published.

---

## 6. Source register (URLs)

| Source | URL |
|---|---|
| JCB Parts India (public store, B2B terms) | https://parts.jcb.com/in/ · https://parts.jcb.com/in/terms-and-conditions |
| JCB Service Pro (independent-operator subscriptions) | https://servicepro.jcb.com/part-lookup |
| Cat Parts Store · Parts Reference Guides · parts diagram by serial | https://parts.cat.com/en/catcorp · https://www.cat.com/en_US/support/maintenance/parts-reference-guides.html · https://parts.cat.com/en/catcorp/parts-diagram |
| Bobcat parts catalogs (public, serial search) | https://shop.bobcat.com/parts-catalogs |
| My Komatsu · Komatsu India genuine parts | https://mykomatsu.komatsu/ · https://www.komatsuindia.in/genuine-parts/komatsu-genuine-parts |
| Tata Hitachi e-DOST parts catalogue index | https://www.tatahitachiparts.com/frmOverallListNew.aspx/frmPartsCatalog.aspx |
| Volvo CE parts · Marketplace · Volvo Connect | https://www.volvoce.com/en-us/products/parts/ · https://marketplace.volvoce.com/as/ · https://www.volvoce.com/en-us/services/volvo-connect/ |
| CASE parts / MyCNH Store | https://www.casece.com/en-us/northamerica/solutions/parts |
| Kubota Dealer Online price-file export (dealer-only, for reference) | https://kubotaau.zendesk.com/hc/en-us/articles/22308316541081 |
| Fleetguard catalogue · app · Fleetguard Filters India | https://catalog.cumminsfiltration.com/catalog/ · https://play.google.com/store/apps/details?id=com.cummins.filtration · https://www.fleetguard-filtrum.com/ |
| Donaldson e-catalogues · monthly new-product XLS | https://ecatalog.donaldson.com/ · https://www.donaldson.com/content/dam/donaldson/engine-hydraulics-bulk/literature/emea/eafm-new-products/2026/New-Product-Releases-March-2026.pdf |
| MANN-FILTER catalogue · cross-reference list · industrial engine guide | https://www.mann-filter.com/en/catalog.html · https://www.mann-filter.com/content/dam/mann-filter/communication-media/brochures-catalogs/mann-filter-cross-reference-list-2024-26-interactive.pdf · https://www.mann-hummel.com/en/filtration-company/news-press/2026/discover-industrial-engine-filter-solutions.html |
| Baldwin cross-reference forms | https://www.baldwinfilters.com/content/dam/Parker-com/Literature/EMAM/EMAM_Baldwin_Manufacturers_Cross-Reference_Form560.pdf |
| SF-Filter cross-reference | https://www.sf-filter.com/en/cross-reference-list |
| Elofic catalogues | http://www.elofic.in/downloads |
| Amaron earth-moving application chart · Exide battery finder | https://www.amaron.com/earth-moving-equipment · https://www.exidegroup.com/en/battery-finder/make-model/construction/CV |
| Gates catalogues | https://www.gates.com/us/en/knowledge-center/resource-library/product-catalogs.html |
| Olyslager (LIS, Product Selector) · Infopro lubricant data · Netlube | https://www.olyslager.com/ · https://www.infopro-digital-automotive.com/us/lubricant-data/ · https://www.infomedia.com.au/products/oil-lubricants/netlube-data/ |
| DOT Data Labs HLSM Parts Catalog | https://dotdatalabs.ai/ots-datasets/hlsm-parts-catalog |
| Power Systems Research components modules · PartsLink | https://www.powersys.com/data-forecasts/component-modules/ · https://www.powersys.com/data-forecasts/partslink/ |
| Auto Care OHE VCdb subscriptions | https://www.autocare.org/data-standards/subscriptions |
| TecAlliance TecDoc | https://shop.tecalliance.net/root/products/tecdoc/tecdoc-catalogue/5637170079.c |
| MOTOR Commercial Parts | https://www.motor.com/products-services/data-products/commercial-parts/ |
| LECTURA API | https://www.lectura.de/api/ |
| TVH India · become a customer | https://www.tvh.com/en-in/parts · https://www.tvh.com/en-us/parts/become-a-customer |
| Costex | https://www.costex.com/ |
| parts-crossreference.com | https://parts-crossreference.com/about-us |
| Grey EPC resellers / catalogue mirrors (identify only, do not use) | https://www.epcatalogue.com/ · https://epcdepo.com/ · https://777parts.net/ · https://avspare.com/ |
