# 15 — CTR Fix: Title + Meta + Schema Rewrites (Batch 1, top 20 pages)

> **Purpose:** recover clicks on pages already ranking in positions 2–9 but losing clicks to truncated titles, missing descriptions, and broken schema (see `14` Priority 1).
> **Method:** titles ≤60 chars (front-load the searched term + price + year); meta descriptions ≤155 chars with a price hook **and the WhatsApp lead CTA baked in** (so the CTR fix also feeds leads); valid `Product`+`Offer`+`FAQPage` schema on model pages.
> **Data:** page impressions/positions/target queries from Google Search Console (project 9518353); pages ranked by recoverable clicks. Verified example: `/excavator/jcb-nxt-215-lc-fuel-master/` currently has an 84-char title (truncated) and **no meta description** at all.
> **Implementation:** paste the Title and Meta columns into the page's `<title>` and `<meta name="description">`. Char counts are in brackets. Replace year as it rolls.

## Priority pages (by impressions × recoverable CTR)

### 1. `/excavator/jcb-nxt-215-lc-fuel-master/` — 910k impr · pos 3.6 · 0.16% CTR
- **Title [54]:** `JCB NXT 215 LC Price in India 2026 – Specs, EMI, Offers`
- **Meta [146]:** `JCB NXT 215 LC Fuel Master price in India (2026): on-road price, specs, mileage & EMI. Get the best dealer quote on WhatsApp — free, no obligation.`

### 2. `/excavator/cat-345-gc/` — 379k impr · pos 3.0 · 0.06% CTR
- **Title [52]:** `CAT 345 GC Price in India 2026 – Specs, Mileage & EMI`
- **Meta [143]:** `Caterpillar 345 GC excavator price in India (2026): on-road price, specs, fuel use & EMI. Compare and get the best dealer quote on WhatsApp — free.`

### 3. `/excavator/tata-hitachi-zaxis-490h-ultra/` — 536k impr · pos 8.8 · 0.03% CTR
- **Title [56]:** `Tata Hitachi ZAXIS 490H Price in India 2026 – Specs, EMI`
- **Meta [142]:** `Tata Hitachi ZAXIS 490H Ultra price in India (2026): on-road price, specs, bucket size & EMI. Get the best dealer quote on WhatsApp — free.`

### 4. `/backhoe-loader/jcb/` — 210k impr · pos 4.6
- **Title [52]:** `JCB Price in India 2026 – On-Road Price, Models & EMI`
- **Meta [146]:** `JCB backhoe loader price in India (2026): on-road prices for 3DX, 4DX & more, specs, mileage & EMI. Get the best dealer quote on WhatsApp — free.`

### 5. `/crane/ace-16xw/` (ranks "crane" pos 2.8 · 152k impr)
- **Title [51]:** `ACE 16XW Hydra Crane Price 2026 – 16 Ton Specs & EMI`
- **Meta [147]:** `ACE 16XW pick-and-carry crane price in India (2026): 16-ton on-road price, specs & EMI. Get the best dealer quote on WhatsApp — free, no obligation.`

### 6. `/blog/poclain-machines-in-india-the-ultimate-guide/` — 165k impr · pos 2.9
- **Title [57]:** `Poclain Machine Price in India 2026 – Models & Buyer Guide`
- **Meta [147]:** `Poclain (excavator) machine price in India 2026: what 'poclain' means, top models, on-road prices & buying tips. Get real dealer quotes on WhatsApp.`

### 7. `/crane/` — 102k impr · pos 5.8
- **Title [55]:** `Crane Price in India 2026 – Hydra, Mobile & Tower Cranes`
- **Meta [147]:** `Crane price in India (2026): compare hydra, pick-and-carry, mobile & tower cranes by price, tonnage & specs. Get the best dealer quote on WhatsApp.`

### 8. `/crane/hydra/` — 95.7k impr · pos 5.4
- **Title [52]:** `Hydra Crane Price in India 2026 – 12/14/25 Ton & EMI`
- **Meta [145]:** `Hydra crane price in India (2026): on-road prices by tonnage (12–25T), specs & EMI. Compare ACE, Escorts & more — get the best quote on WhatsApp.`

### 9. `/excavator/tata-hitachi-ex-210-infra/` — 72.9k impr · pos 3.8
- **Title [54]:** `Tata Hitachi EX 210 Price in India 2026 – On-Road & EMI`
- **Meta [147]:** `Tata Hitachi EX 210 Infra price in India (2026): on-road price, specs, mileage & EMI. Compare with rivals and get the best quote on WhatsApp — free.`

### 10. `/self-loading-concrete-mixer/ajax-argo-4500/` — 58.8k impr · pos 4.7
- **Title [48]:** `Ajax Argo 4500 Price in India 2026 – Specs & EMI`
- **Meta [146]:** `Ajax Argo 4500 self-loading concrete mixer price in India (2026): on-road price, specs, output & EMI. Get the best dealer quote on WhatsApp — free.`

### 11. `/blog/hydra-vs-farana-cranes/` — 57k impr · pos 3.3
- **Title [52]:** `Hydra vs Farana Crane 2026 – Difference, Price & Pick`
- **Meta [148]:** `Hydra vs farana crane (2026): key differences, price comparison and which to buy for your site. See models and get the best quote on WhatsApp — free.`

### 12. `/compactor/` — 56.5k impr · pos 5.7
- **Title [54]:** `Road Roller Price in India 2026 – Soil & Tandem Rollers`
- **Meta [144]:** `Road roller & compactor price in India (2026): soil, tandem & mini rollers by price and specs. Compare brands and get the best quote on WhatsApp.`

### 13. `/crane/escorts-hydra-15/` — 46.7k impr · pos 2.6
- **Title [50]:** `Escorts Hydra 15 Price in India 2026 – Specs & EMI`
- **Meta [143]:** `Escorts Hydra 15 (F15) crane price in India (2026): on-road price, 15-ton specs & EMI. Compare and get the best dealer quote on WhatsApp — free.`

### 14. `/excavator/` — 45.9k impr · pos 5.9
- **Title [55]:** `Excavator Price in India 2026 – Mini to 50T, Specs & EMI`
- **Meta [149]:** `Excavator price in India (2026): compare mini, 20T & 50T excavators by price, specs & EMI across JCB, Tata Hitachi, CAT & more. Best quote on WhatsApp.`

### 15. `/blog/top-10-epc-companies-in-india/` — 38.6k impr · pos 5.0 (B2B/bulk audience)
- **Title [48]:** `Top 10 EPC Companies in India 2026 – Ranked List`
- **Meta [147]:** `Top 10 EPC companies in India (2026): ranked by projects, revenue & sectors. Procuring equipment for a project? Get bulk machine quotes on WhatsApp.`

### 16. `/crane/ace-f230/` — 37.7k impr · pos 2.2
- **Title [47]:** `ACE F230 Farana Crane Price 2026 – 23 Ton & EMI`
- **Meta [138]:** `ACE F230 farana crane price in India (2026): 23-ton on-road price, specs & EMI. Get the best dealer quote on WhatsApp — free, no obligation.`

### 17. `/self-loading-concrete-mixer/ajax-argo-3000/` — 27.3k impr · pos 5.1
- **Title [48]:** `Ajax Argo 3000 Price in India 2026 – Specs & EMI`
- **Meta [146]:** `Ajax Argo 3000 self-loading concrete mixer price in India (2026): on-road price, specs, output & EMI. Get the best dealer quote on WhatsApp — free.`

### 18. `/crane/ace-f150/` — 28.2k impr · pos 3.4
- **Title [47]:** `ACE F150 Farana Crane Price 2026 – 15 Ton & EMI`
- **Meta [142]:** `ACE F150 farana crane price in India (2026): 15-ton 4x4 on-road price, specs & EMI. Get the best dealer quote on WhatsApp — free, no obligation.`

### 19. `/blog/10-most-advanced-electric-excavators/` — 18.9k impr · pos 6.2
- **Title [58]:** `10 Most Advanced Electric Excavators 2026 – Specs & Price`
- **Meta [151]:** `The 10 most advanced electric excavators in 2026: specs, range, charging & price. Compare models and get dealer quotes on WhatsApp — free, no obligation.`

### 20. `/self-loading-concrete-mixer/ajax-argo-2000/` — 9.1k impr · pos 2.4
- **Title [48]:** `Ajax Argo 2000 Price in India 2026 – Specs & EMI`
- **Meta [146]:** `Ajax Argo 2000 self-loading concrete mixer price in India (2026): on-road price, specs, output & EMI. Get the best dealer quote on WhatsApp — free.`

---

## Schema block to add to every model page (fixes the 510 schema errors)

Add valid JSON-LD `Product` + `Offer` + `FAQPage`. Template (replace `{{...}}`):

```json
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Product",
  "name": "{{Brand}} {{Model}}",
  "image": "{{primary_image_url}}",
  "description": "{{Brand}} {{Model}} price in India, specs, mileage and EMI.",
  "brand": { "@type": "Brand", "name": "{{Brand}}" },
  "sku": "{{model_slug}}",
  "offers": {
    "@type": "AggregateOffer",
    "priceCurrency": "INR",
    "lowPrice": "{{price_low}}",
    "highPrice": "{{price_high}}",
    "availability": "https://schema.org/InStock",
    "offerCount": "{{dealer_count}}",
    "url": "{{page_url}}"
  },
  "aggregateRating": {            // include ONLY if you have real reviews
    "@type": "AggregateRating",
    "ratingValue": "{{rating}}",
    "reviewCount": "{{review_count}}"
  }
}
</script>
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    { "@type": "Question", "name": "What is the price of {{Brand}} {{Model}} in India?",
      "acceptedAnswer": { "@type": "Answer", "text": "The on-road price of the {{Brand}} {{Model}} in India is approximately ₹{{price_low}}–{{price_high}} (2026), varying by state, finance and dealer. Request an exact quote on WhatsApp." } },
    { "@type": "Question", "name": "What is the mileage/fuel consumption of {{Brand}} {{Model}}?",
      "acceptedAnswer": { "@type": "Answer", "text": "{{fuel_answer}}" } },
    { "@type": "Question", "name": "What is the EMI for {{Brand}} {{Model}}?",
      "acceptedAnswer": { "@type": "Answer", "text": "{{emi_answer}}" } },
    { "@type": "Question", "name": "Which dealers sell {{Brand}} {{Model}} near me?",
      "acceptedAnswer": { "@type": "Answer", "text": "{{dealer_answer}}" } }
  ]
}
</script>
```

**Notes:**
- Use a **price band** (`lowPrice`/`highPrice`), not a fake single price — honest and rich-result-eligible while preserving the "get exact quote" lead hook.
- The first FAQ answer is written to be **AI-Overview-quotable** (`09`): a direct, dated, ₹-specific sentence.
- Never use `AggregateRating` unless real reviews exist (Google penalizes fake review markup).
- Validate every template change in Google's Rich Results Test before rollout.

## Title & meta formula (for the CMS team — apply sitewide)

- **Model page title (≤60):** `{Brand} {Model} Price in India {Year} – {hook1}, {hook2}`
  hooks pool: `On-Road Price`, `Specs`, `EMI`, `Mileage`, `Offers`, `{tonnage/HP}`.
- **Category page title (≤60):** `{Category} Price in India {Year} – {sub-types}`
- **Meta (≤155):** `{Brand} {Model} price in India ({Year}): on-road price, specs, {mileage/output} & EMI. {compare hook} Get the best dealer quote on WhatsApp — free.`
- Rules: searched term + price + year **first**; never exceed limits; one clear CTA; no keyword stuffing; unique per page (no template that produces identical metas).

## Measurement
Re-pull GSC **CTR by page** at **week 2 and week 4** post-deploy. Expect movement without re-ranking — Google just re-renders the snippet. Target: positions 4–10 blended CTR 0.43% → 1.2%+ (≈ +20–30k clicks/mo), with the WhatsApp CTA in the description lifting enquiries in parallel.
