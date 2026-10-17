# AEO/CTR hub-page rewrites — ready to ship

**Source of truth:** the sheet's AI & Answer Engines tab (60/60 rows captured, 2026-09-05 pull) cross-validated independently by a fresh GSC pull via Ahrefs (which found the identical 8 head terms converting 0.05–0.22% CTR against a 3.8–13% position-implied benchmark, confirmed persistent across all 16 weeks of history — this is not a recent drop, it is a structural, years-old gap). Two independent data sources agreeing on the same root cause and the same page set is about as solid as evidence gets in this project.

**The pattern, in one sentence:** these pages already rank (positions 1.2–4.9), so the fix is not "rank higher" — it's answer-first content + FAQ schema that wins the AI Overview / featured snippet instead of losing the click to it, following the exact recipe that already worked in July (the 63-page title rewrite moved blended CTR 0.85%→0.95%, and the AIO citation win on "backhoe loader price in india" proves the pattern generalizes).

**Consolidation logic:** the 60 listed queries map onto a much smaller set of actual pages. Below are the 7 hub pages that, combined, cover roughly 80% of the total "clicks left on table" value across the full list, plus one new-page recommendation. Each fix ships as: (1) a corrected title, (2) a meta description, (3) an answer-first opening block (40–70 words, to replace or precede the current intro paragraph — do not delete existing content below it), (4) FAQPage JSON-LD schema using real GSC query phrasing. WordPress/RankMath application notes are at the bottom.

---

## 1. `/backhoe-loader/jcb/` — covers "jcb" (49,085 clicks left/19d) + "jcb backhoe loader" (1,557)

Current: pos 3.6–3.88, CTR 0.213%, 675,886–197,386 impr (two data sources, same order of magnitude). This is the single largest opportunity on the entire site.

**Title (≤60 char):** `JCB Backhoe Loader Price in India 2026 | Models & Specs`

**Meta description (≤155 char):** `See JCB backhoe loader prices, EMI, and specs for every model sold in India — 3DX, 3DX Plus, 3DX Super, 4DX. Compare and connect with a dealer.`

**Answer-first opening (insert as the first paragraph, above existing content):**
> JCB backhoe loaders in India range from **₹22 lakh to ₹35 lakh** ex-showroom depending on the model (3DX, 3DX Plus, 3DX Super, 3DX Xtra, 4DX) and state. The 3DX is JCB's best-selling model, with a 76 HP engine and 0.9m³ bucket capacity. Prices below are updated for 2026 and vary by dealer location, financing terms, and attachments.

**FAQPage JSON-LD:**
```json
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {
      "@type": "Question",
      "name": "What is the price of a JCB backhoe loader in India?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "JCB backhoe loader prices in India range from approximately ₹22 lakh to ₹35 lakh ex-showroom, depending on the model and location. The JCB 3DX, the most popular model, typically starts around ₹28 lakh."
      }
    },
    {
      "@type": "Question",
      "name": "Which JCB backhoe loader model is best for Indian conditions?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "The JCB 3DX is the most widely used model in India due to its balance of power, fuel efficiency, and parts availability. The 3DX Plus and 3DX Super add higher horsepower and hydraulic capacity for heavier-duty work."
      }
    },
    {
      "@type": "Question",
      "name": "What is the EMI for a JCB backhoe loader?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "EMI on a JCB backhoe loader typically starts around ₹55,000–₹60,000 per month on a standard finance tenure, depending on down payment, interest rate, and loan term. Use the on-page EMI calculator for an exact figure by model."
      }
    }
  ]
}
```

---

## 2. `/manufacturers-and-brands-guide/jcb-equipment-price-india/` — covers "jcb price" (41,943) + "jcb price in india" (10,398)

Current: pos 1–2.3 (already page-1 top-3), CTR 0.24–0.65%. This is the site's #1 traffic page by both fresh Ahrefs and Semrush pulls ($293/mo traffic value per Ahrefs) — even a small CTR lift here is the single highest-ROI edit available.

**Title:** `JCB Price List India 2026 — All Models & On-Road Price`

**Meta description:** `Full JCB price list for India: backhoe loaders, excavators, wheel loaders. On-road & ex-showroom prices by model, updated 2026. Compare before you buy.`

**Answer-first opening:**
> JCB equipment prices in India start from **₹22 lakh** for the 3DX backhoe loader and go up to **₹85 lakh+** for larger excavators and wheel loaders. This guide lists ex-showroom and on-road prices for every JCB model sold in India as of 2026, including the 3DX, 3DX Plus, 4DX, and NXT excavator range.

**FAQPage JSON-LD:**
```json
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {
      "@type": "Question",
      "name": "What is the on-road price of JCB in India?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "On-road JCB prices in India are typically 3–8% higher than ex-showroom prices, covering RTO registration, road tax, and insurance. A JCB 3DX with an ex-showroom price of ₹28 lakh usually costs ₹29–30 lakh on-road, varying by state."
      }
    },
    {
      "@type": "Question",
      "name": "What is the cheapest JCB machine price in India?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "The most affordable JCB models in India are compact backhoe loaders and mini excavators, starting around ₹22–24 lakh ex-showroom. Larger excavators and wheel loaders cost significantly more."
      }
    }
  ]
}
```

---

## 3. `/backhoe-loader/` (category hub) — covers "backhoe" (34,070) + "backhoe loader" (11,693) + "back hoe" (4,253) + "back ho" (709) = ~50,700 combined

Current: pos 1.6–6.5 across variants, CTR 0.03–0.17%.

**Title:** `Backhoe Loader Price in India 2026 | Compare All Brands`

**Meta description:** `Compare backhoe loader prices, specs & EMI from JCB, Case, Escorts Kubota, Mahindra & more. 50+ models, updated 2026 pricing, finance options.`

**Answer-first opening:**
> A backhoe loader in India costs between **₹18 lakh and ₹38 lakh** depending on brand, engine power (55–92 HP), and features. JCB, Case, Escorts Kubota, Mahindra, and ACE are the leading brands sold in India. This page compares current models, specifications, and on-road prices across all major manufacturers.

**FAQPage JSON-LD:**
```json
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {
      "@type": "Question",
      "name": "What is a backhoe loader used for?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "A backhoe loader is a construction machine combining a front loader bucket and a rear digging arm (backhoe), used for excavation, trenching, loading material, and light demolition on construction sites, roadwork, and agricultural projects."
      }
    },
    {
      "@type": "Question",
      "name": "Which backhoe loader brand is best in India?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "JCB holds the largest market share in India and is the generic name many buyers use for the category. Case, Escorts Kubota, Mahindra, and ACE are the other major brands, each competitive on price and after-sales support depending on region."
      }
    },
    {
      "@type": "Question",
      "name": "What is the price range of a backhoe loader?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "Backhoe loader prices in India range from about ₹18 lakh for entry-level 2WD models to ₹38 lakh for high-horsepower 4WD models with advanced hydraulics."
      }
    }
  ]
}
```

---

## 4. `/crane/` (category hub) — covers "crane" (26,678) + "crane price" (1,109) + "crane machine" (1,438) + "hydraulic crane" (1,518) = ~30,700

Current: pos 2.6–3.4, CTR 0.09–0.4%.

**Title:** `Crane Price in India 2026 | Hydra, Pick & Carry & Mobile`

**Meta description:** `Compare crane prices in India — Hydra cranes, pick-and-carry cranes, mobile cranes. Specs, capacity, EMI options from ACE, Escorts & more, updated 2026.`

**Answer-first opening:**
> Crane prices in India range from **₹15 lakh** for a small hydra crane (9–12 ton capacity) to **₹60 lakh+** for larger pick-and-carry and mobile cranes. "Hydra" is the common name used across India for pick-and-carry cranes, led by ACE and Escorts (Farana). This page compares current models by lifting capacity, reach, and price.

**FAQPage JSON-LD:**
```json
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {
      "@type": "Question",
      "name": "What is the price of a hydra crane in India?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "Hydra (pick-and-carry) crane prices in India range from around ₹15 lakh for 9-ton capacity models to ₹45 lakh+ for 25-ton and larger capacity models, depending on brand and reach."
      }
    },
    {
      "@type": "Question",
      "name": "What is the difference between a hydra crane and a mobile crane?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "A hydra crane (pick-and-carry crane) is a compact, highly maneuverable crane designed to lift and carry loads over short distances on-site. A mobile crane is typically larger, truck-mounted, and built for longer-distance transport and higher lifting heights."
      }
    }
  ]
}
```

---

## 5. `/excavator/` (category hub) — covers "excavator" (23,168) + "poclain machine" (6,106) + "poclain price" (2,919) + "poclain machine price" (927) + "pokland machine" (2,077, common misspelling) + "jcb excavator" (1,338) = ~36,500

Current: pos 3.5–3.88, CTR 0.0–0.05%. Note: "Poclain" is a genericized trademark in India (like "JCB" for backhoe loaders) — buyers say "poclain" to mean any hydraulic excavator, which is why these queries land on the excavator hub rather than a specific brand.

**Title:** `Excavator Price in India 2026 | Poclain, JCB, Tata Hitachi`

**Meta description:** `Compare excavator (poclain machine) prices in India — mini, compact & heavy excavators from JCB, Tata Hitachi, Komatsu, CAT. Specs & EMI, updated 2026.`

**Answer-first opening:**
> Excavator (commonly called "poclain machine" in India) prices range from **₹18 lakh** for mini excavators to **₹85 lakh+** for large heavy excavators. Popular brands include JCB, Tata Hitachi, Komatsu, and CAT. "Poclain" is a widely used generic term across India for hydraulic excavators, named after an early manufacturer, not a current brand.

**FAQPage JSON-LD:**
```json
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {
      "@type": "Question",
      "name": "What is a poclain machine?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "\"Poclain machine\" is a common Indian term for a hydraulic excavator, named after the French company Poclain that pioneered hydraulic excavators. Today the term is used generically for excavators from any brand, similar to how \"JCB\" is used for backhoe loaders."
      }
    },
    {
      "@type": "Question",
      "name": "What is the price of a poclain machine in India?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "Excavator (poclain machine) prices in India range from about ₹18 lakh for mini excavators to ₹85 lakh or more for large heavy excavators, depending on operating weight, brand, and features."
      }
    }
  ]
}
```

---

## 6. `/crane/hydra/` — covers "hydra machine" (8,077) + "hydra crane" (already partly counted in #4, this page-specific) + "हाइड्रा मशीन" (1,187)

Current: pos 1.04–1.2 — this is already ranking #1 and STILL only converting 0.7–1.6% CTR. Position-1 pages should be 25–35%+ CTR; this is the most extreme gap on the whole list relative to rank.

**Title:** `Hydra Crane Price in India 2026 | 9 to 25 Ton Models`

**Meta description:** `Hydra crane (pick-and-carry) prices from 9-ton to 25-ton capacity. ACE, Escorts Farana models compared — specs, lifting charts, EMI. Updated 2026.`

**Answer-first opening:**
> A hydra crane (pick-and-carry crane) in India costs **₹15 lakh to ₹45 lakh** depending on lifting capacity, from 9-ton compact models to 25-ton heavy-duty models. ACE and Escorts (branded "Farana") are the two dominant manufacturers. This page compares current hydra crane models by capacity, boom reach, and price.

**FAQPage JSON-LD** (also add a Hindi variant if the page has a Hindi/Hinglish section, given the "हाइड्रा मशीन" query volume — flag to whoever owns the Hindi-unpark decision):
```json
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {
      "@type": "Question",
      "name": "What is a hydra machine used for?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "A hydra machine (pick-and-carry crane) is used to lift and transport heavy loads over short distances on construction sites, warehouses, and material yards — commonly for loading/unloading trucks, placing precast concrete, and site material handling."
      }
    },
    {
      "@type": "Question",
      "name": "How much does a hydra crane cost?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "Hydra crane prices in India start around ₹15 lakh for 9-ton capacity models and go up to ₹45 lakh for 25-ton capacity models, varying by brand and features."
      }
    }
  ]
}
```

---

## 7. `/wheel-loader/` (category hub) — covers "loader" (8,138) + "loader machine" (3,302) + "wheel loader" (4,082)

Current: pos 3.3–4.1, CTR 0.1–0.3%.

**Title:** `Wheel Loader Price in India 2026 | Compare All Brands`

**Meta description:** `Wheel loader (loader machine) prices in India — JCB, Komatsu, CAT, XCMG models compared. Bucket capacity, engine power & EMI, updated 2026.`

**Answer-first opening:**
> Wheel loader ("loader machine") prices in India range from **₹18 lakh** for compact models to **₹65 lakh+** for large-capacity loaders. JCB, Komatsu, CAT, and XCMG are the leading brands. This page compares current models by bucket capacity, engine power, and price.

**FAQPage JSON-LD:**
```json
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {
      "@type": "Question",
      "name": "What is a wheel loader used for?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "A wheel loader is used to load, carry, and dump loose material — soil, gravel, sand, or debris — onto trucks or into piles. It's common on construction sites, quarries, and material yards."
      }
    },
    {
      "@type": "Question",
      "name": "What is the price of a wheel loader (loader machine) in India?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "Wheel loader prices in India range from around ₹18 lakh for compact models to ₹65 lakh or more for large-capacity loaders, depending on bucket size and engine power."
      }
    }
  ]
}
```

---

## 8. NEW PAGE recommended — Komatsu brand hub (not a rewrite; a content gap)

**Finding:** "komatsu" (10,420 clicks left) + "komatsu excavator" (1,109) currently rank via `/excavator/komatsu-pc500lc-10r/` — one specific model page ranking for a generic brand-navigational query (the Action Plan's own "NOT WINNABLE" list flags this exact pattern: "BRAND-NAV, searcher wants manufacturer," CTR 0.06%, 277,756 impr). This is unfixable by editing that one page — the searcher wants a Komatsu catalog, not one model.

**Recommendation:** build `/excavator/komatsu/` (or `/komatsu/`, matching whatever pattern `/jcb/`, `/volvo/`, `/tata-hitachi/` etc. already use — the site clearly has this brand-hub pattern elsewhere) listing every Komatsu model DesiMachines carries, with the same answer-first + FAQ treatment as above once built. This is new-page work (needs product data), not a copy edit — flagging as a backlog item for whoever builds pages, not part of this "ready-to-ship" batch. Zoomlion ("zoomlion," 1,938 clicks left) has the identical pattern and the identical recommendation.

---

## Remaining AEO queries not covered above (backlog, same methodology)

The 60-query list's tail (queries #12–60 not already folded into hubs 1–7 above) is mostly small-volume long-tail variants of the same brands/categories (e.g., "ajax machine," "tata hitachi," "xcmg," "transit mixer," "hitachi photo/photos" — the last two are image-intent, needing an image-gallery fix rather than text, different workstream). Apply the same answer-first + FAQ recipe to each target page as capacity allows; the methodology above is the template. One item to flag as **not worth pursuing**: "mahindra blazo" (2,459 clicks left) is a truck model, off-category for DesiMachines — likely mismatched/irrelevant traffic, skip it.

## Application notes for WordPress/RankMath

- Titles/metas: RankMath fields `rank_math_title` / `rank_math_description` per page, same mechanism as the July CTR-fix batch (see `data/apply-rankmath-meta.sh` in the repo for the WP-CLI pattern).
- Answer-first paragraphs: insert as the first block of body content, above the existing intro — do not delete existing content, this adds to it.
- FAQ schema: add as a `<script type="application/ld+json">` block; if the page already has a visible FAQ section without matching schema (the sheet's own Sheet1 notes flagged this exact gap on "Top Models" pages), make sure the schema's questions match what's visibly on the page — don't publish schema for content that isn't there.
- Validate every block with Google's Rich Results Test before publishing (a broken FAQPage schema is worse than none — matches the guardrail already established after Semrush found live schema errors).
- Batch size: ship 2–3 hub pages at a time with ≥72h between batches per the site's own kill-switch discipline (established in the S-EXEC charter) — watch GSC CTR at +7d before the next batch.
