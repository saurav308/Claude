# On-Page SEO & Content QA — Template-by-Template

Machine-readable version of every fix: `data/content-qa-fixlist.csv`.

---

## 1. Title tags — headline-length, need a SERP-length pass (P1)

Observed pattern: `{full H1 sentence} — PromotEdge`. Examples with lengths:

| Page | Current title | ~Chars |
|---|---|---|
| Home | PromotEdge — Brand, build & grow under one roof | 47 ✅ |
| /services/seo/ | SEO services in India — done the slow, logical way Google rewards. — PromotEdge | 80 ❌ |
| /services/ai-search-optimisation/ | AI Search Optimisation — getting cited in ChatGPT, Perplexity, and Google AI Overviews. — PromotEdge | 100 ❌ |
| /services/web-design/ | Web design for Indian businesses that need their site to actually work. — PromotEdge | 85 ❌ |
| /industries/real-estate/ | Real estate marketing for Indian builders who want their projects to actually sell. — PromotEdge | 96 ❌ |
| /industries/healthcare/ | Healthcare marketing for Indian hospitals, clinics, and healthtech brands that take trust seriously. — PromotEdge | 113 ❌ |
| /services/seo/local-seo/ | Local SEO Services in India \| PromotEdge | 40 ✅ |
| /services/seo/technical-seo/ | Technical SEO Services in India \| PromotEdge | 44 ✅ |
| /industries/gst-consultants/ | Digital Marketing for GST Consultants in India — PromotEdge | 59 ✅ |
| /work/weichai-india/ | Weichai India — Case study \| PromotEdge | 39 ✅ |
| /blog/seo-vs-aeo-vs-geo/ | SEO vs AEO vs GEO: How Search Actually Works Now in India — PromotEdge | 70 ⚠️ |

Note the split personality: **sub-service and GST-style pages already use the correct pattern** (`{Keyword} in India | PromotEdge`, ≤60 chars). Top-level services and several industries use the voice-y H1 as the title — Google truncates at ~580px (~60 chars) and will often rewrite these.

**Fix:** keep the voice-y sentence as the on-page H1 (it's good copy), and give every page a distinct ≤60-char `<title>` following the sub-service pattern:
- `/services/seo/` → "SEO Services in India | PromotEdge"
- `/services/ai-search-optimisation/` → "AI Search Optimisation (GEO/AEO) Services | PromotEdge"
- `/industries/healthcare/` → "Healthcare Marketing Agency in India | PromotEdge"
- `/industries/real-estate/` → "Real Estate Marketing Agency in India | PromotEdge"
Also decide one brand separator (currently mixes `—` and `|`).

Keyword note: the homepage title carries no category keyword at all. "Brand, build & grow under one roof" is lovely but says nothing an engine can classify. Recommend: `PromotEdge | Integrated Marketing Agency in Kolkata, India` (title) while the H1 keeps the brand line. The current *live* homepage ranks as "Digital Marketing Agency in Kolkata – Trusted by 200+ Clients" — don't throw away that equity wholesale (see redirect/keyword continuity in 06).

## 2. Meta descriptions — ⚠️ VERIFY presence

Exa surfaces a "description-like" line under each title that matches the hero sub-copy (e.g., SEO page: "We do SEO the slow, logical way Google rewards. 200+ Indian brands… Free 12-point audit in 48 hours."). If those are real meta descriptions: good instinct, right length on most, includes a CTA. Verify each template actually emits one (script checks), and de-duplicate where hero copy repeats across sub-services.

## 3. Breadcrumbs — industry template bug (P1)

Industry pages render the breadcrumb as `Industries / {full H1 sentence}`:
> "Industries/ Real estate marketing for Indian builders who want their projects to actually sell."

Services and work templates do it right (`Services/ SEO`, `Work/ Active Acres`). Fix the industry template to use the short entity name ("Real Estate"), and emit `BreadcrumbList` schema on all templates (see 04).

## 4. Industry hub labels — slug-to-title artifacts (P1, quick)

Rendered exactly as: **Fmcg**, **It Services**, **Ngos**, plus style questions: "Astrology Spiritual" (→ "Astrology & Spiritual"), "Salons Parlours" (→ "Salons & Parlours"), "Sportswear Fitness Equipment" (→ "Sportswear & Fitness Equipment"), "Travel Tourism" (→ "Travel & Tourism"), "Music Dance Academies" (→ "Music & Dance Academies"). Correct casing: FMCG, IT Services, NGOs. These labels are nav-visible on the hub and likely in nav/related components — pure title-casing of slugs; add an override map.

## 5. Typos & language (P1 sweep before launch)

| Where | Issue |
|---|---|
| /services/seo/ | "sustainance" → **sustenance** (the homepage gets it right: "Sustenance beats spikes") |
| /work/active-acres/ | "Magicbrickets" → **MagicBricks** |
| /industries/gst-consultants/ | H3s starting lowercase: "content authority on GST rules…", "local + sector specialism beats generic." — intentional style elsewhere is Sentence case; make consistent |
| Sitewide | "Optimisation/Optimization" — site uses British consistently ✅ keep; ensure title tags match |
| /services/seo/ hero | "people who're already deciding" — "who're" reads awkward; consider "who are" |

Run a full spellcheck pass over the built HTML corpus (aspell/LanguageTool) — with ~270 LLM-drafted pages there will be more than the sampled set.

## 6. Case-study template (P0-5 overlap + P1)

- "What we ran" / "The work behind it." — **empty on all three sampled** (Weichai, Active Acres, DTC Southern Heights). Populate or remove (P0-5).
- **7 × "SaaS Platform" and 2 × "D2C Beauty Brand" cards** on /work/: differentiate display titles by outcome — "SaaS Platform: 38% lower CAC", "SaaS Platform: cited in Perplexity for 60+ queries" — otherwise the hub reads templated, users can't choose between them, and duplicate anchor text dilutes internal linking. Where NDAs allow, name the client (named > anonymous for E-E-A-T and GEO citability; you have 12 named already — good).
- Add client logo/name, engagement period, and services-used tags (these become internal links to /services/… — currently case studies link out only via "The service" button).
- The duplicated "320 EOIs" stat across two projects: covered in P0-7.

## 7. Blog articles — missing authorship & dates (P1, high AEO value)

`/blog/seo-vs-aeo-vs-geo/` (full fetch): no visible author, no publish/updated date. Meanwhile sub-service pages *do* carry bylines ("Satesh Kumar Shaw · SEO Lead") — and your own `/services/ai-search-optimisation/` page promises "Author bylines with credentials. Update dates visible."

**Fix template:** byline (linking to a person entity — see 04), published + updated dates, reading time, and `Article` schema with `author`, `datePublished`, `dateModified`. With 65 posts this is the highest-leverage single template change for AEO/GEO on the content side.

Also: article body quality on the sampled post is genuinely good (direct answers, India specifics, no fluff). Depth ~700–900 words is fine for the format; the pillar pieces (e.g., "56-Point Technical SEO Audit Framework") should be the long ones — spot-check 5–6 more before launch using the same lens: does the first paragraph answer the title's question?

## 8. Stat-block consistency on commercial pages

Every service/industry page repeats the same three stats (200+ brands / 11+ years / 1 senior-led team) in the hero. Fine as a pattern, but page-specific stat blocks exist too ("22+ healthcare clients", "30+ projects launched", "70+ brands placed in tier-1", "250+ sites shipped", "₹200cr…") — none are sourced. Add a one-line qualifier convention ("as of 2026") and keep them in the central stat sheet (P0-7) so they don't drift.

## 9. Name consistency (minor)

- About team: "Satesh Shaw — Senior SEO Team Lead" vs sub-service byline "Satesh Kumar Shaw · SEO Lead". Pick one canonical form (matters once Person schema exists).
- Brand: always "PromotEdge" (camel case) — consistent so far ✅; legal footer should say "Promotedge Global Services Private Limited" (as registered).

## 10. UX notes from the text layer (verify visually)

- Header nav and footer are invisible to the text extraction on every page — likely stripped as boilerplate, but verify the header exposes real `<a>` links (not JS-only menu) and add a proper footer: primary nav, services columns, NAP + CIN, social links, legal links, sitemap link. A footer is also where Organization schema anchors visually.
- Contact page's "email [email protected]" rendering (Cloudflare obfuscation) — at minimum ensure the *visible* text for humans is the real address post-JS; consider plain text (02 §7).
- "Chat with us on WhatsApp" is the persistent trailing element — good for India; ensure tap target ≥48px and it doesn't cover the form submit on mobile.
- Homepage FAQ block is excellent (5 real objections, direct answers) — add `FAQPage` schema (04) and mirror the pattern on service pages (healthcare/GST industry pages already have FAQ sections ✅).
