# 10 — Lead & Revenue Model

> **Read the assumptions first.** Verified inputs are [FACT]; everything else is [EST]/[ASSUMPTION] and is built to be **overwritten with real GA4/CRM numbers** the moment the Google Sheets / analytics are connected (`01`). These are planning ranges, not promises.

## 1. Verified inputs [FACT]
- Est. organic traffic (IN): **~39,070 / mo** (Ahrefs).
- Top-3 commercial keywords: **1,176**.
- Traffic concentrated in top ~30 pages (price/model/category/compare).
- DR 41, 573 referring domains.
- Public business signals: "25,000+ monthly users", "600+ buyers/month", "100% MoM growth", "approaching breakeven".

## 2. Assumptions to confirm [ASSUMPTION]
| Input | Assumed value | Confirm via |
|---|---|---|
| Share of traffic that is high-intent (price/model/compare) | ~55% (~21,500 visits) | GA4 landing-page report |
| Current lead-conversion rate (high-intent sessions → enquiry) | ~1.5% | GA4 events / CRM |
| Current qualified enquiries / mo | ~150–300 | GA4/CRM (note: "600+ buyers" public figure suggests upper end) |
| Avg enquiries → qualified RFQ | ~50% | CRM |
| Lead → sale close rate (across DesiMachines + dealer) | ~3–8% | CRM/dealer feedback |
| Avg revenue value per closed sale **to DesiMachines** (commission/lead fee/ad value) | **₹ to be supplied** | Business model |

> The revenue rupee figures are intentionally left as a formula, because DesiMachines' monetization (lead fees vs commission vs listing/ad revenue) is the missing input. The **lead-count** projections below are robust; multiply by your realized value-per-lead to get revenue.

## 3. Lead model — three scenarios (Day 90)

Drivers: (a) CRO lift on existing high-intent traffic, (b) traffic growth from quick wins + programmatic, (c) new funnels (finance/used/local).

**High-intent sessions/mo** = traffic × high-intent share. **Leads** = high-intent sessions × conversion rate.

| | Conservative | Expected | Aggressive |
|---|---|---|---|
| Organic traffic (IN), Day 90 | 45,000 | 60,000 | 75,000 |
| High-intent share | 50% | 55% | 58% |
| High-intent sessions/mo | 22,500 | 33,000 | 43,500 |
| Lead conv. rate (post-CRO) | 2.5% | 4.0% | 6.0% |
| **Qualified enquiries / mo** | **~560** | **~1,320** | **~2,610** |
| of which RFQ/quote requests (~40%) | ~225 | ~530 | ~1,045 |
| of which WhatsApp chats (~35%) | ~195 | ~460 | ~915 |
| of which calls (~15%) | ~85 | ~200 | ~390 |
| of which finance/other (~10%) | ~55 | ~130 | ~260 |
| Confidence | High | **Medium-High** | Medium |

**Interpretation:** Even the **Conservative** case (~560 qualified enquiries/mo) is a step-change vs the assumed ~150–300 baseline — and it comes **mostly from CRO on traffic that already exists**, not from speculative new rankings. That's what makes it high-confidence. The Expected/Aggressive upside layers on the quick wins (`04`) and new funnels.

## 4. Where the incremental leads come from (Expected scenario attribution)

| Source | Incremental enquiries/mo | Confidence | Lever |
|---|---|---|---|
| **CRO on existing top-30 price pages** | +400–600 | **High** | `08` — WhatsApp/RFQ/CTA |
| Position 4–20 quick wins → top-3 | +150–250 | High | `04` Tier-1 sprint |
| Programmatic (city×category, brand hubs, compares) | +150–300 | Medium | `04`/`06` |
| New funnels (EMI/finance, used, dealer-locator) | +100–250 | Medium | `06` gaps |
| AI-Overview citations defended/expanded | indirect | Medium | `09` |

## 5. Revenue formula (plug in your value-per-lead)

```
Monthly organic-lead revenue
  = Qualified enquiries/mo
  × Lead→qualified-RFQ rate
  × RFQ→sale close rate
  × Avg DesiMachines revenue per closed sale
        (commission OR lead-fee OR equiv. ad value)

Example (Expected, illustrative — replace ₹ with real value):
  1,320 enquiries × 50% qualified × 5% close × ₹{value_per_sale}
  ≈ 33 closed sales/mo attributable to organic
  × ₹{value_per_sale} = monthly organic revenue
```

Plus **non-machine recurring revenue** (finance leads, parts RFQs, rental leads, listing/subscription fees from dealers/OEMs) which the funnel work in `06` opens up.

## 6. ROI logic [REC]
- The **CRO workstream** (`08`) is near-zero marginal cost (dev + copy on 30 pages) for the largest lead lift → **highest ROI in the plan; do it first.**
- The **quick-win sprint** (`04`) is cheap (refresh existing pages) with high confidence → second.
- **Programmatic + new funnels** cost more (build) but unlock the durable, scalable lead base and the moat vs tractorjunction → staged into Month 2–3+.

## 7. The one thing that makes these numbers real
**Instrument the funnel in Week 1 (`08` §5 + `12`).** Without GA4 lead events + CRM, the model stays an estimate. With it, within 30 days you'll have a *measured* baseline conversion rate, and these scenarios collapse into a single, defensible forecast you can manage to.
