# 12 — KPI & Measurement Framework

> Principle: **measure leads and revenue, not just rankings.** Rankings are a leading indicator; qualified enquiries are the scoreboard.

## 1. The KPI hierarchy

### Tier 1 — Business outcome KPIs (the scoreboard)
| KPI | Definition | Source | Target trend |
|---|---|---|---|
| **Qualified organic enquiries / mo** | Leads from organic that pass qualification | GA4 + CRM | ↑ to 560–1,320 (`10`) |
| **RFQ / quote requests / mo** | Form/WhatsApp price requests | GA4 events | ↑ |
| **WhatsApp conversations / mo** | whatsapp_click → real chats | WhatsApp Business + GA4 | ↑ |
| **Calls / mo** | call_click + actual calls | call tracking | ↑ |
| **Dealer/distributor/OEM/bulk enquiries** | tagged high-value B2B leads | CRM tags | ↑ (priority leads) |
| **Lead → sale close rate** | qualified → closed | CRM/dealer | ↑/stable |
| **Organic revenue / pipeline** | value of closed organic-sourced deals | CRM + value-per-lead | ↑ |
| **Cost per qualified lead (organic)** | SEO spend ÷ leads | finance + GA4 | ↓ |

### Tier 2 — Conversion KPIs (the lever)
| KPI | Source |
|---|---|
| Lead-conversion rate (high-intent sessions → enquiry) | GA4 |
| Conversion rate by page type (model/compare/category/blog) | GA4 |
| WhatsApp CTR by page | GA4 |
| Form completion / abandonment | GA4 |
| EMI-calculator → finance-lead rate | GA4 |

### Tier 3 — Traffic & ranking KPIs (leading indicators)
| KPI | Source |
|---|---|
| Organic sessions (IN) | GA4 / GSC |
| Top-3 commercial keywords (count) | Ahrefs (1,176 → 1,500+) |
| Position 4–20 keywords converted to top-3 | Ahrefs/GSC |
| Impressions & CTR by query (the real quick-win list) | **GSC** |
| Keyword cannibalization incidents | GSC/Ahrefs |
| Indexed money-pages | GSC Coverage |

### Tier 4 — Authority, AI & technical KPIs (compounding)
| KPI | Source |
|---|---|
| Domain Rating / referring domains | Ahrefs (41 / 573 baseline) |
| Toxic referring domains (count → 0) | Ahrefs + disavow |
| AI-Overview / AI-engine citations of DesiMachines | Ahrefs Brand Radar + manual prompts |
| Core Web Vitals (LCP/INP/CLS pass rate) | CrUX/PageSpeed/GSC |
| Pages with valid Product/FAQ schema | GSC Enhancements |
| Branded search volume | GSC/Ahrefs (brand-demand signal) |

## 2. Attribution — connecting organic to leads to revenue
1. **GA4 key events** = whatsapp_click, rfq_submit, call_click, emi_lead, brochure_download, alert_signup (`08`§5).
2. **UTM / channel tagging** so organic is cleanly separated.
3. **Landing-page-level conversion** report → which pages/keywords produce leads (not just traffic).
4. **CRM lead source = page + keyword + city** captured at submission.
5. **Offline/closed-loop import** → push closed-sale outcomes back to GA4 for true revenue-per-page/keyword.
6. **Lead tagging** for dealer/distributor/OEM/bulk so the priority B2B leads in the brief are tracked distinctly.

## 3. Reporting cadence
| Cadence | Report | Audience |
|---|---|---|
| **Weekly** | Lead count by type + by top pages; quick-win rank movement; CRO test results | Growth team |
| **Monthly** | Full KPI dashboard (all 4 tiers); DR/links/AI-citation; conversion-rate trend vs baseline | Founder |
| **Quarterly** | Revenue attribution, competitor re-benchmark (91infra/tractorjunction), strategy reforecast, Price Index publication | Founder/board |

## 4. The single most important measurement action
**Establish the Week-1 baseline conversion rate** (`08`§5, `11` W1). Every projection in `10` is an estimate until this exists. Once you can see "high-intent sessions → enquiries," the entire model becomes a managed, optimizable number — and the SEO program is judged on **leads and revenue**, exactly as the brief demands.

## 5. Definition of done for the 90 days
- ✅ Lead measurement live and trustworthy.
- ✅ Conversion system on all high-intent pages; measured lift vs baseline.
- ✅ Top-3 commercial keywords ↑ materially (1,176 → 1,500+).
- ✅ Spam links disavowed; profile clean.
- ✅ ≥3 new lead funnels live (finance, used, local/dealer).
- ✅ AI-citation footprint growing; schema coverage broad.
- ✅ A reforecast lead/revenue model built on **real** GA4/CRM data, replacing the estimates in `10`.
