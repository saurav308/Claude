# Content Pillars & Post-Launch Routines

You said: *"Once we go live, we will create a few routines to generate new content pillars and scale the website further."* This file maps what already exists (so routines extend rather than duplicate), where the gaps are, and gives ready-to-wire Routine specs with the QA gates this audit proves you need.

---

## 1. What the 65 launch posts already cover (pillar map)

| Pillar | Posts at launch (count) | Examples |
|---|---|---|
| SEO / AEO / GEO | 11 | SEO vs AEO vs GEO · Cited in ChatGPT & Perplexity 2026 · Perplexity vs Google ranking · AI Overviews · CWV · Tier-2 city SEO · 56-point technical audit framework |
| Compliance marketing (the moat) | 9 | RERA ×2 · NMC ×2 · SEBI · Fintech/RBI · Healthcare fines · BFSI rules · ICAI (via GST industry page) |
| Paid media | 7 | Meta creative testing · Google Ads CPC India · Instagram playbook · Meta vs Google D2C · PPC failure modes |
| D2C & marketplace commerce | 7 | Amazon listing optimisation · Flipkart vs Amazon · Amazon vs D2C · checkout conversion · D2C retention flows |
| Content & brand | 8 | Content ROI · SaaS content strategy · long vs short form · naming for Indian markets · rebrand vs refresh · brand systems teardown |
| Web & CRO | 5 | Websites that work in India · 4G performance · mobile-first · A/B testing on Indian traffic · WordPress vs headless |
| PR | 3 | Digital PR India playbook · founder PR · PR ROI beyond AVE |
| Social & influencer | 4 | LinkedIn B2B pipeline · influencer ROI · micro vs macro · posting cadence |
| Email | 3 | Email India playbook · Klaviyo vs Mailchimp · D2C flows |
| Sector playbooks | 8 | Manufacturers B2B · RFQ funnels · technical-spec content · property launch · real-estate 2026 · SaaS SEO/PLG |

This is a real library, not a placeholder blog. The strategy is visibly "India-first + regulator-aware + AI-search-native" — correct and defensible.

## 2. Gaps worth filling first (highest intent-to-money)

1. **Kolkata/local commercial layer** — you rank today for "digital marketing agency in kolkata" on the OLD home page; the new site has no Kolkata-specific commercial page beyond the brand line. Add one strong `/digital-marketing-agency-kolkata/`-style page (or fold into home title) *before* the map-pack/brand SERP shifts.
2. **Pricing/cost content** — zero posts answer "digital marketing agency cost India", "SEO pricing India", "how much does a website cost in India". Highest-intent AEO queries in the category; you already have the candour voice for it.
3. **Comparison/alternatives pages** — "in-house vs agency", "freelancer vs agency", "PromotEdge vs typical single-channel shop" — the queries AI assistants get asked ("which agency should I hire…") resolve through comparison content.
4. **Audio-visual practice** — live site has an AV service + LinkedIn lists it; new site doesn't. Build `/services/audio-visual/` (also needed by the redirect map).
5. **Case-study depth** — populate "What we ran" (P0-5) then add one named case study per quarter with hard numbers; these are your strongest GEO citation assets.
6. **Author entities** — bylines exist on sub-services only. Create 3–5 author profiles (Saurav, Satesh, Vikash, + content lead), add to every post (03 §7). Routine output without named authors undercuts the whole E-E-A-T position.

## 3. Routine specs (wire after Coverage stabilises, ~T+30)

> Lesson from this audit baked into every routine: **generation must ship with QA gates** — the staging corpus's `(/seo)` tokens, swallowed placeholders and stat drift are exactly what unreviewed generation produces at scale.

### Routine A — Weekly pillar article (1×/week, rotate pillars)
- Input: pillar queue (above) + GSC query-gap report (queries with impressions, no clicks, position 8–20).
- Output: 1,200–2,000-word draft in the house style (definition-first, direct answers in first 2 sentences per H2, India specifics, regulator citations where relevant, FAQ block, internal links **to real `/services/…` URLs from the lookup table**, author + date + Article schema).
- QA gate (hard fail → human review): no `(/` literal tokens; no `<` or `[placeholder]` in prose; all internal links resolve 200; stats only from `stats.json` or with a cited source; spellcheck pass; title ≤60 chars distinct from H1.
- Human step: practice-lead review + publish; IndexNow ping on deploy.

### Routine B — Monthly compliance-watch updates (the moat compounds)
- Watch RERA/NMC/SEBI/RBI/ASCI/ICAI/DPDP notification feeds; when a rule changes, update the affected evergreen post (change `dateModified`, add a "What changed in {month}" section) rather than writing a new thin post. AI engines strongly favour maintained, dated, regulator-cited pages.

### Routine C — Monthly AI-citation tracking
- Query set: ~25 prompts across ChatGPT, Perplexity, Gemini, Google AI Overviews ("best integrated marketing agency Kolkata", "RERA compliant marketing agency", "healthcare marketing agency India NMC", "GST consultant marketing", each pillar's money question).
- Log: cited? which page? which competitor got cited instead? → feeds Routine A's queue with "citation-gap" topics.
- This also gives the *sales* team screenshots for the AI Search Optimisation service pitch.

### Routine D — Quarterly stat-sheet + case-study refresh
- Re-verify `stats.json` numbers (brands, cities, team, per-service claims); regenerate affected pages; add one new named case study; refresh testimonials.

### Routine E — Weekly technical pulse (post-launch guard)
- GSC Coverage delta, new 404s from logs, broken internal links crawl, CWV field trend, sitemap freshness. Alert only on regressions; monthly summary otherwise.

Note on scale discipline: with 60 industry pages + ~87 sub-service pages live from day 1, **do not** point routines at generating more programmatic service×industry×city pages until the existing corpus proves indexation (GSC "Crawled — currently not indexed" is the tell). Google's scaled-content policies punish exactly that expansion pattern when pages don't earn engagement. Depth-first (update, interlink, cite) beats breadth for the next two quarters.

## 4. Where I can help next (separate sessions, post-launch)

- Wire Routines A–E as scheduled sessions once the site is live and Coverage is stable.
- Re-pull the full Ahrefs baseline after 9 Aug units reset and produce the "before/after" migration report.
- Build the industry-mapping table for the redirect map from the Yoast sitemap export.
