# AEO / GEO Readiness — Being the Answer, Not Just the Ranking

You sell "SEO & AI Search." The new site's *writing* is already AEO-shaped (definition-first sections, question H2s, FAQ blocks — genuinely better than 95% of agency sites). What's missing is the **machine layer**: crawler access, schema, entity consistency, and discovery files. This file is the punch list.

---

## 1. AI crawler access — fix at the Cloudflare/production level (P0-adjacent)

**Current reality measured during this audit:**

| Fetcher | promotedge.net (staging host) | www.promotedge.com (live) |
|---|---|---|
| Anthropic fetcher (Claude users' retrieval) | **403 (WAF)** | **403 (WAF)** |
| Exa crawler (browser-rendered) | 200 ✅ | 200 ✅ |
| GPTBot / ClaudeBot / CCBot / Google-Extended / Amazonbot / Applebot-Extended / Bytespider / meta-externalagent | **robots.txt Disallow: /** (Cloudflare-managed block) + `ai-train=no` signal | robots.txt allows (explicit `OAI-SearchBot: Allow`) but WAF still 403s at the edge |

The live domain's robots.txt *says* welcome while the edge *serves* 403 — the worst combination: you don't even get the "respectful decline" benefit, just silent invisibility in retrieval-based answers.

**Launch policy decision (recommend):**
- **Allow retrieval/search agents**: Googlebot, Bingbot, GPTBot + OAI-SearchBot, ClaudeBot + Claude-User, PerplexityBot, Applebot. These produce citations → pipeline.
- **Your call on training-only agents**: CCBot, Google-Extended, Applebot-Extended, meta-externalagent, Bytespider. Blocking these costs little today; many brands allow Google-Extended because Gemini grounding uses it. As an AI-search agency, the on-brand move is allowing all of them — decide and document.
- **Implement in BOTH layers**: robots.txt rules AND Cloudflare Security → Bots (disable "block AI crawlers" / Bot Fight Mode for verified bots on the production zone). Test with the UA matrix in `scripts/verify-at-launch.sh` — from outside the office network.

## 2. Rendering: content must be in the initial HTML

AI crawlers don't execute JavaScript. Verify server-rendered/static HTML contains the full text (02 §5). If any section hydrates client-side only (testimonial carousel, FAQ accordions), ensure the text is present in source and merely enhanced by JS. **Accordion content hidden via CSS is fine; content injected by JS is invisible.**

## 3. Structured data plan — ⚠️ nothing verifiable remotely; treat as to-build

Minimum viable schema set (JSON-LD, per template):

| Template | Schema |
|---|---|
| Sitewide (once, on every page) | `Organization` — legalName "Promotedge Global Services Private Limited", name "PromotEdge", url, logo, foundingDate 2015, founder Person("Saurav Agarwal"), address (see NAP below), contactPoint (tel +91-98363-34345, email), `sameAs`: LinkedIn (10k followers), Instagram, Facebook, YouTube, X, Crunchbase/Tracxn, DesignRush profile, Wikipedia-grade citations when available. Consider `@id` anchoring (`https://www.promotedge.com/#organization`) referenced by all other nodes |
| Home | `WebSite` + `Organization`; (SearchAction only if site search exists) |
| Service & sub-service | `Service` (provider → Organization @id, areaServed IN, serviceType) + `BreadcrumbList` + `FAQPage` where FAQ blocks exist + author `Person` on sub-services (bylines already visible ✅) |
| Industry | `Service` (serviceType "Healthcare marketing" etc.) + `BreadcrumbList` + `FAQPage` (healthcare/GST pages already have Q&A blocks) |
| Case study | `Article` (or `CreativeWork`) + `BreadcrumbList`; embed outcome stats in body text (already done) |
| Blog post | `Article` with author Person (link to about/team anchor or /team/{person} pages), datePublished/dateModified, publisher → Organization @id + `BreadcrumbList` |
| About | `AboutPage` + `Person` for each named team member (24 currently) — name, jobTitle, sameAs (LinkedIn) for at least the leadership six |
| Contact | `ContactPage` + LocalBusiness/Organization contactPoint |
| Careers | `JobPosting` only when concrete roles are listed (current page is evergreen — skip JobPosting until real postings exist) |

**LocalBusiness decision:** You serve pan-India from one Kolkata HQ. Use `Organization` (or `ProfessionalService`) with a single `address` + `areaServed: IN`, and keep the Kolkata GBP as the local anchor. Don't fabricate per-city LocalBusiness entities for the "37 cities" — that's the kind of thing that gets agencies flagged.

Validate every template in Google's Rich Results Test + Schema.org validator before launch (can't be done from staging if the WAF blocks Google's fetcher — one more reason to fix §1 first, or validate via code-snippet paste).

## 4. Entity & NAP consistency (GEO core)

One entity, one set of facts, everywhere:

| Field | Canonical value to standardise |
|---|---|
| Brand | PromotEdge |
| Legal | Promotedge Global Services Private Limited · CIN U74999WB2018PTC225777 (live /contact-us/ has this; new site currently omits it — add to footer + privacy policy) |
| HQ address | Live site: "Suite# 508, Floor- 5, Eco-Centre, Ambuja Neotia, Block- EM, Plot- 4, Sector- V, Salt Lake City, Kolkata- 700 091" · New site: "Eco-Centre, EM-4/1, Sector V, Salt Lake, Kolkata 700091" — **pick the GBP-registered format and use it verbatim** on site footer, Contact, schema, GBP, LinkedIn, Justdial, DesignRush, Clutch |
| Phone | +91 98363 34345 (consistent ✅) |
| Email | Currently unreadable to machines everywhere (Cloudflare obfuscation). Expose at least one plain address (or schema contactPoint) — an entity with no discoverable email is weaker in knowledge graphs |
| Founder | Saurav Agarwal, Founder & CEO (consistent ✅ — press coverage reinforces it) |
| Founded | 2015 (consistent ✅) |
| Team size | pick one: "55+" or "56" |
| Sister entity | **PromotEdge Digital** (promotedgedigital.com, North America). Cross-link the two sites in both Organizations' `sameAs`/`subOrganization` and in footers ("PromotEdge Digital — our North America practice"). Without explicit linking, AI engines will either conflate or fragment the two entities; with it, the Feb 2026 PR coverage (PRNewswire/Morningstar) compounds to both |

## 5. Discovery files

**`/llms.txt` (ship at launch):** a concise markdown map for LLM agents. Draft:

```markdown
# PromotEdge
> Integrated marketing agency in Kolkata, India (est. 2015). One senior-led team for SEO & AI-search
> optimisation, performance marketing, branding, web design, content, social, PR and marketplace growth.
> 200+ brands served across India. Sister agency for North America: PromotEdge Digital (promotedgedigital.com).

## Services
- [All services](https://www.promotedge.com/services/): 15 practices, 100+ capabilities
- [SEO](https://www.promotedge.com/services/seo/) · [AI Search Optimisation (AEO/GEO)](https://www.promotedge.com/services/ai-search-optimisation/) · [Web design](https://www.promotedge.com/services/web-design/) · [Performance marketing](https://www.promotedge.com/services/performance-marketing/) · [PR](https://www.promotedge.com/services/pr/) · [Marketplace](https://www.promotedge.com/services/marketplace/)

## Industries
- [60 industry practices](https://www.promotedge.com/industries/) incl. [Real estate](https://www.promotedge.com/industries/real-estate/), [Healthcare](https://www.promotedge.com/industries/healthcare/), [BFSI](https://www.promotedge.com/industries/bfsi/)

## Proof & knowledge
- [Case studies](https://www.promotedge.com/work/) — Weichai India, SANY India, Skipper, B.P. Poddar Hospital, more
- [Insights](https://www.promotedge.com/blog/) — India-first playbooks on SEO/AEO/GEO, RERA/NMC/SEBI-compliant marketing

## Contact
- Kolkata HQ · +91 98363 34345 · https://www.promotedge.com/contact/
```

**IndexNow:** the stack is static — add an IndexNow ping (Bing/Yandex; also feeds some AI indices) to the deploy pipeline. Cheap, compounding.

## 6. Citability of claims (what AI engines quote)

Your own `/blog/seo-vs-aeo-vs-geo/` says it best: *"models reward verifiable, compliant claims and penalise unsupported ones."* Apply it to yourselves:

- "38% of buyer research queries now mediated by AI" (`/services/ai-search-optimisation/`) — **add the source or cut it.** This exact sentence is what a rival will screenshot.
- "175 cities reached", "102 capabilities", "₹200cr marketplace revenue" — anchor each to the canonical stat sheet (P0-7), phrase with "as of 2026".
- The compliance content (RERA/NMC/SEBI/ICAI citations with rule specifics) is your GEO moat — those pages cite regulators by name and will be quoted. Protect quality there above all.
- Anonymized case studies ("SaaS Platform" ×7) are weak citation material — AI engines prefer nameable entities. Even "a Bengaluru B2B SaaS in the HR-tech space" beats "SaaS Platform".

## 7. Off-site entity reinforcement (first 60 days post-launch)

- Reconcile and refresh: Google Business Profile (align NAP + new site URL), LinkedIn page website field, Justdial, DesignRush, Clutch/GoodFirms profiles, Crunchbase/Tracxn.
- The Feb 2026 PRNewswire coverage (Morningstar, Yahoo Finance syndication) is strong third-party corroboration — link to it from About ("Featured in", currently an empty section — P0-5) so crawlers connect the entity to the coverage.
- Wikipedia/Wikidata: a Wikidata item (agency, founded 2015, founder, HQ) is legitimate and helps knowledge-graph grounding. Don't attempt a Wikipedia article yet.
