# 17 — CTR Fix: Implementation Checklist (for the dev + content team)

> One-page, do-this-in-order checklist to ship the title/meta/schema rewrites in `15` (Batch 1) and `16` (Batch 2). Goal: lift positions 4–10 CTR from 0.43% → ~1.2%+ (~+20–30k clicks/mo) and carry the DesiMachines deal/finance/insurance CTA into every search snippet. No re-ranking required — Google re-renders the snippet within days–weeks.

## 0. Pre-flight (½ day)
- [ ] Confirm who owns each layer: **CMS/templates (dev)**, **per-page copy (content)**, **schema (dev)**, **measurement (analytics)**.
- [ ] Confirm the CMS lets you set `<title>` and `<meta name="description">` **per page** (and ideally per-template with token variables like `{model}`, `{price_low}`, `{year}`).
- [ ] Snapshot the baseline: export **GSC → Search results → Pages**, last 3 months (clicks, impressions, CTR, position) for the Batch 1 + 2 URLs. This is your before/after benchmark.

## 1. Titles (Batch 1 + 2) — 1–2 days
- [ ] Paste the **Title** value from `15`/`16` into each page's `<title>`.
- [ ] Verify every title is **≤60 characters** (≈575px). Front-load: `{Model} Price in India {Year}` first, hooks after.
- [ ] One `<title>` per page (the audit found pages flagged for title issues — confirm no duplicates/multiples).
- [ ] Don't keyword-stuff; each title unique.

## 2. Meta descriptions (Batch 1 + 2) — 1–2 days
- [ ] Paste the **Meta** value from `15`/`16` into `<meta name="description">`. **Many pages currently have none** (verified on the JCB NXT 215 page) — this is the biggest single CTR miss.
- [ ] Verify every description is **≤155 characters** and ends on the CTA: `Get deals, finance & insurance — free on DesiMachines.com.`
- [ ] Unique per page — never ship a template that outputs identical descriptions across models (that re-triggers the "duplicate description" audit flag).

## 3. Schema (model pages) — 2–4 days (dev)
- [ ] Implement the `Product` + `AggregateOffer` + `FAQPage` JSON-LD template from `15` (§ "Schema block").
- [ ] Set `offers.seller` = **DesiMachines.com** (you're the OEM-connected channel).
- [ ] Use a **price band** (`lowPrice`/`highPrice`) — never a fake single price.
- [ ] Include `AggregateRating` **only** where real reviews exist (fake review markup = Google penalty).
- [ ] First FAQ answer must be the dated, ₹-specific, AI-quotable sentence ending on DesiMachines.com.
- [ ] **QA every template in [Google Rich Results Test]** before rollout — this clears the **510 schema validation errors** from the audit. Zero errors/warnings on a sample of 5 pages before scaling.

## 4. Deploy — 1 day
- [ ] Ship to production in two waves: **Batch 1 Section A + Batch 2 Section A first** (highest-impression pages: jcb-nxt-215, cat-345-gc, hitachi-zaxis, what-is-a-backhoe-loader 292k impr, komatsu-pc500). Then the rest.
- [ ] Confirm titles/meta/schema render in **server HTML** (view-source / GSC URL Inspection → "View crawled page"), not only after JS — Google and AI engines must see them without executing scripts.
- [ ] In **GSC → URL Inspection → Request indexing** for the top ~15 pages to speed re-crawl. (Optional: IndexNow — the audit shows ~12k IndexNow-eligible pages.)

## 5. Measure — week 2 and week 4
- [ ] Re-pull GSC Pages report for the same URLs; compare **CTR** and **clicks** vs the baseline snapshot.
- [ ] Confirm **rich results** are appearing (GSC → Enhancements → Products / FAQ; and live SERP checks for price/FAQ/star).
- [ ] Track **rendered SERP titles** — if Google is rewriting your new title (the audit flagged 422 such pages), it means the title still isn't matching intent; revise toward the exact GSC query.
- [ ] Success bar: Section A pages move from <0.2% toward >1% CTR; blended pos 4–10 CTR trends to ~1.2%+.

## 6. After proof (week 4+)
- [ ] Once Batch 1+2 show lift, apply the **CMS title/meta formula** (`15`, final section) to auto-generate titles/descriptions for the **remaining long-tail** model pages sitewide.
- [ ] Add the title/meta/schema rules to the **page-publish template** so new model pages ship correct by default (no regression).

## QA gotchas (don't skip)
- **Truncation:** test on mobile SERP width (you're 84% mobile) — mobile truncates titles slightly shorter.
- **Quotes/encoding:** ensure `&`, `–`, `₹` render correctly in `<title>`/`<meta>` (HTML-encode where needed).
- **Canonical:** the rewritten page must be self-canonical (don't let a price-variant URL canonical away the page you just optimized).
- **Don't touch H1/body in this pass** — this is a snippet-only change; keep it isolated so the CTR impact is cleanly measurable.

---
**Owner sign-off:** Titles ☐ · Meta ☐ · Schema (0 errors in Rich Results Test) ☐ · Deployed Section A ☐ · Baseline snapshot saved ☐ · Week-2 re-check scheduled ☐
