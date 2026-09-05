# 10 — Lead & Revenue Model

> **Read the assumptions first.** Verified inputs are [FACT]; everything else is [EST]/[ASSUMPTION] and is built to be **overwritten with real GA4/CRM numbers** the moment the Google Sheets / analytics are connected (`01`). These are planning ranges, not promises.

## 1. Verified inputs [FACT] — now first-party (see `13`)
- **Total visits: ~33,800 / mo** (Web Analytics); **organic clicks: ~24,400 / mo** (GSC, all countries); **~20,200 / mo from India.**
  - *(Supersedes the earlier Ahrefs estimate of ~39k — first-party GSC is authoritative.)*
- **84% of clicks are mobile** (`13` §2) — the conversion system must be mobile/WhatsApp-first.
- **Channel mix:** organic search 55%, direct 36%, AI/LLM 491 visitors/period, **email ≈ 0** (`13` §5).
- Bounce 82.9%, 1.56 pages/session, ~5-min avg duration (typical price-lookup profile).
- Top-3 commercial keywords: **1,176** (Ahrefs); **31,935 keywords sit in positions 4–10** with 2.8M impressions (GSC `13` §3).
- DR 41, 573 referring domains.
- Public business signals: "25,000+ monthly users", "600+ buyers/month", "100% MoM growth", "approaching breakeven".

## 2. Assumptions to confirm [ASSUMPTION] — now partly anchored to first-party data
| Input | Value | Basis |
|---|---|---|
| Total visits / mo | **~33,800** | [FACT] Web Analytics (`13`) |
| Share high-intent (price/model/compare) | ~55% (~18,600 visits) | [EST] from page mix in `13` §4 |
| Current lead-conversion rate (visits → enquiry) | **~1.7%** | [EST] anchored: "600+ buyers/mo" ÷ ~33,800 visits ≈ 1.8% |
| Current qualified enquiries / mo | **~500–600** | Business-cited "600+ buyers/month" (now corroborated by traffic math) |
| Avg enquiries → qualified RFQ | ~50% | [ASSUMPTION] — confirm in CRM |
| Lead → sale close rate (DesiMachines + dealer) | ~3–8% | [ASSUMPTION] — confirm in CRM |
| Avg revenue value per closed sale **to DesiMachines** (commission/lead fee/ad value) | **₹ to be supplied** | Business model |

> **Material correction:** the original blueprint assumed a ~150–300/mo enquiry baseline. First-party traffic (~33.8k visits) × the business's own "600+ buyers/month" implies the baseline is **already ~500–600 qualified enquiries/mo at ~1.7% conversion.** The CRO opportunity is therefore **lifting an already-working ~1.7% toward 3–5%**, not building from near-zero — higher confidence, and the scenarios below are set accordingly.

> The revenue rupee figures are intentionally left as a formula, because DesiMachines' monetization (lead fees vs commission vs listing/ad revenue) is the missing input. The **lead-count** projections below are robust; multiply by your realized value-per-lead to get revenue.

## 3. Lead model — three scenarios (Day 90)

Drivers: (a) CRO lift on existing high-intent traffic, (b) traffic growth from quick wins + programmatic, (c) new funnels (finance/used/local).

**High-intent sessions/mo** = traffic × high-intent share. **Leads** = high-intent sessions × conversion rate.

Baseline (first-party): **~33,800 visits/mo, ~1.7% conversion ≈ ~575 qualified enquiries/mo.**

| | Conservative | Expected | Aggressive |
|---|---|---|---|
| Total visits/mo, Day 90 | 38,000 | 48,000 | 60,000 |
| High-intent share | 52% | 55% | 58% |
| High-intent sessions/mo | 19,760 | 26,400 | 34,800 |
| Lead conv. rate (post-CRO) | 2.5% | 3.8% | 5.5% |
| **Qualified enquiries / mo** | **~700** | **~1,200** | **~2,300** |
| vs ~575 baseline | +22% | +109% | +300% |
| of which RFQ/quote requests (~40%) | ~280 | ~480 | ~920 |
| of which WhatsApp chats (~35%) | ~245 | ~420 | ~805 |
| of which calls (~15%) | ~105 | ~180 | ~345 |
| of which finance/export/other (~10%) | ~70 | ~120 | ~230 |
| Confidence | High | **Medium-High** | Medium |

**Interpretation:** Baseline is now anchored to first-party data (~575 enquiries/mo, not the earlier ~150–300 guess). The growth comes from two compounding, **already-proven** mechanisms — (1) lifting a working ~1.7% conversion toward 3–5% via mobile WhatsApp/RFQ CRO (`08`, and 84%-mobile is verified in `13`), and (2) traffic growth from the position 4–10 harvest + CTR fixes on high-impression pages (`04`/`13`). Even **Conservative (+22%)** is high-confidence because it rides existing traffic; Expected/Aggressive layer on new funnels (finance, used, export, B2B/EPC).

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
