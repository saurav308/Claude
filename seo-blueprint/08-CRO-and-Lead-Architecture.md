# 08 — CRO & Lead Architecture  ⭐ THE HIGHEST-ROI WORKSTREAM

> This is where traffic becomes revenue. DesiMachines already has the audience (`02`): high-intent buyers researching prices. Today they read and leave. This section is the system that turns them into RFQs, calls, and WhatsApp conversations. **Sequenced into Week 1.**

## 1. The core problem, stated precisely

- The ranking portfolio is **research-intent price queries** (`is_transactional: false` almost everywhere — `02`/`04`).
- A buyer searching "jcb 3dx on road price" is **ready to enquire** but expects to *research first*, not "Add to cart."
- The page must therefore offer a **low-friction, high-trust, instant** enquiry path that feels like *getting information* (a quote, the real price, a callback) — not a hard sale.

**Conversion principle:** *Meet research intent with an information-shaped CTA.* "Get the best deal + finance + insurance on DesiMachines" converts far better than "Buy now" for this audience.

> **⭐ Positioning (drives all CTA copy):** DesiMachines is **part of the dealer channel itself and connects buyers directly to OEMs** — it does *not* hand users off to third-party dealers. A dealer's phone number is easy to Google; the reason to come to **DesiMachines.com** is that the **deal + finance/loan + insurance** all happen here, in one place. **Every CTA must pull the buyer to DesiMachines (the OEM-connected channel) and lead with the deal + finance + insurance value — never "get a dealer quote."** WhatsApp remains a contact *mechanism*, but the message is always DesiMachines' offer, not a dealer hand-off.

### 2.1 Primary CTAs (every model & price page)
1. **Sticky WhatsApp deal bar (mobile-first):** persistent bottom bar — *"💬 Get the best deal + finance + insurance on the [model]"* → opens WhatsApp deep-link pre-filled: *"Hi, I want the best price, finance & insurance on the JCB 3DX in [city] from DesiMachines."* (Pre-fill model + city from the page.) **This is the #1 lever for a Tier 2–5 mobile audience that lives on WhatsApp.**
2. **2-field RFQ form** (inline + on click): Name + Phone (+ optional city). Headline: *"Get the best deal on the [model] — plus finance & insurance. Free, on DesiMachines."* Fewer fields = more leads; enrich later.
3. **Click-to-call** button (tel: link) — many buyers prefer to call; track as a conversion.
4. **"Compare & get the best deal" CTA** on compare pages — *"Get the best deal on both → pick the winner."*

### 2.2 Trust accelerators next to every CTA
- "Free, no obligation" • "Response within X mins" • **"Connected directly with OEMs"** • "Used by 600+ buyers/month" • OEM logos • a real human/expert name (founder's dealership credibility — EEAT, `09`).

### 2.3 Secondary / progressive capture
- **Price-drop / deal alerts:** "Get notified when the price changes / get DesiMachines' best offer" → email/WhatsApp opt-in (captures not-ready-yet buyers).
- **Downloadable spec sheet / brochure (lite gate):** phone number to receive PDF on WhatsApp.
- **EMI calculator → finance lead** (`06`): "See your monthly EMI → get a finance + insurance offer on DesiMachines."
- **Exit-intent (desktop):** "Leaving? Get DesiMachines' best deal + finance on this machine."

## 3. Page-type conversion templates

| Page type | Hero CTA | Mid-page | Sticky | Special |
|---|---|---|---|---|
| **Model price page** | WhatsApp deal bar + 2-field RFQ | EMI calc + click-to-call | WhatsApp bar | "On-road price by state" expander → RFQ |
| **Category hub** | "Get the best deal on top {category}" | "talk to an expert" CTA | WhatsApp bar | Filter → "can't decide? talk to expert" |
| **Compare page** | "Get the best deal on both" | verdict box + RFQ | WhatsApp bar | "Which fits your budget?" → RFQ |
| **Brand hub** | "Get {brand} price list + best deal on DesiMachines" | — | WhatsApp bar | OEM-connected enquiry form |
| **Blog/guide** | soft inline RFQ after price section | newsletter/alerts | WhatsApp bar | Contextual model-page links + CTA |

## 4. Lead routing & qualification (so leads become revenue, not noise)

1. **Capture → CRM** with full context (page, model, city, source = organic, keyword if available). Even a simple CRM/Google Sheet + WhatsApp Business is fine to start.
2. **Instant auto-response** on WhatsApp (template) so the buyer doesn't go cold.
3. **Qualify:** budget, timeline, new/used, buy/rent, location → match to the right OEM + finance/insurance partner (DesiMachines is the channel, so the lead stays with you end-to-end).
4. **Lead scoring [REC]:** phone+intent keyword (e.g. "on road price") + city = hot. Tag dealer/distributor/OEM/bulk enquiries separately (these are the high-value B2B leads the brief prioritizes).
5. **Close the loop:** track which leads convert to sales → feed back which pages/keywords produce *revenue*, not just leads (`12`).

## 5. Measurement (wire this up Week 1, before optimizing)

You cannot optimize leads you don't measure. **This is the prerequisite for the entire revenue model in `10`.**

| Event (GA4) | Trigger | Why |
|---|---|---|
| `whatsapp_click` | WhatsApp CTA tap | Primary lead proxy |
| `rfq_submit` | RFQ form submit | Core conversion |
| `call_click` | tel: tap | Call lead |
| `emi_calculate` / `emi_lead` | calculator use / finance submit | Finance lead |
| `brochure_download` | gated download | Mid-funnel |
| `alert_signup` | price/quote alert opt-in | Nurture pool |

- Mark RFQ, WhatsApp, call, finance as **GA4 key events (conversions)**.
- Segment by **landing page + organic** to see which keywords/pages produce leads.
- **Server-side / offline conversion import** for closed sales → true revenue attribution.

## 6. A/B test backlog (after baseline is measured)
1. Sticky WhatsApp bar copy: "exact price" vs "best price" vs "dealer price".
2. RFQ fields: 2-field vs 3-field (phone-only vs +city).
3. Price display: hidden-until-RFQ vs price-band-shown + RFQ ("show a band, gate the exact" usually wins trust *and* leads).
4. CTA placement: hero vs after spec table vs sticky-only.
5. Social proof variant: "600+ buyers/month" vs dealer logos vs review stars.

## 7. Expected impact (the lever quantified) [EST]
- Existing high-intent price traffic is large (top 30 pages carry the majority of ~39k visits).
- A disciplined WhatsApp + RFQ system on these pages can move blended lead-conversion from an assumed **~1–2%** to **~3–6%** of high-intent sessions (WhatsApp deep-links alone routinely 2–4× form-only baselines for mobile Indian B2B audiences). [ASSUMPTION — confirm against GA4 baseline]
- **This is why CRO outranks new content for the next 90 days:** it multiplies the value of every visit you already have, with no dependence on new rankings. Full numbers in `10`.
