# P0 — Launch Blockers (fix before DNS flip / go-live)

Every item here was observed directly during the 28 Jul 2026 crawl of `promotedge.net/promotedge-next2/`. Each includes evidence, why it blocks, and the exact fix.

---

## P0-1. The contact form is a demo

**Evidence:** `/contact/` renders: *"This is a demo form and does not submit. Call +91 98363 34345 to reach us directly."* The homepage and every service/industry page funnel to "Book a strategy call" → this form.

**Why it blocks:** It is the site's only conversion mechanism. If it ships un-wired, every rupee of launch traffic converts at zero, and the disclaimer text tells prospects the site is unfinished.

**Fix:**
- Wire the form to a real backend (CRM webhook / email pipeline) with server-side validation and spam protection that doesn't block crawlers (honeypot + rate-limit rather than visible CAPTCHA if possible).
- Add a dedicated `/thank-you/` page (noindexed) so GA4 can register a `generate_lead` conversion on page view, plus a form-submit event as backup.
- Remove the demo disclaimer everywhere (search the build for the string "demo form").
- Test: submit → CRM record + auto-acknowledgement email + GA4 event, on mobile and desktop.

## P0-2. No privacy policy, terms, or cookie disclosure

**Evidence:** `/privacy-policy/`, `/terms/`, `/terms-of-service/` all return 404. No footer legal links found on any page.

**Why it blocks:**
- The form collects name + work email → personal data under India's **DPDP Act 2023** (notice & consent required). The About page itself lists DPDP as a regime you operate within.
- Google Ads / Meta ads accounts (you will run them for yourselves eventually) require a linked privacy policy.
- Enterprise procurement teams (your SANY/Weichai-class clients) check for it.

**Fix:** Publish `/privacy-policy/` and `/terms/` before launch; link both from the footer sitewide; include the legal entity ("Promotedge Global Services Private Limited", CIN U74999WB2018PTC225777) to match the live site's registered identity. If any analytics/marketing cookies fire, add a lightweight consent notice consistent with DPDP.

## P0-3. Literal `(/path)` link tokens rendered as body text — and the paths are wrong

**Evidence (sampled, pattern repeats across industry pages):**
- `/industries/real-estate/`: "Read more on our SEO services **(/seo)** page or our wider search visibility approach **(/seo)**." — same token twice with different anchor phrasing (an LLM-draft artifact).
- `/industries/gst-consultants/`: "Content marketing **(/content-marketing)** and B2B SEO **(/seo/b2b-seo)**", "Local SEO **(/seo/local-seo)**", "LinkedIn marketing **(/social-media/linkedin-marketing)**", "Lead-gen programmes **(/performance-marketing/lead-generation-services)**", "Website **(/web-design)**".
- `/industries/healthcare/`: eleven occurrences — `(/seo)`, `(/web-design)`, `(/performance-marketing)`, `(/branding)`, `(/content-marketing)`, `(/pr)`, `(/social-media)`, `(/influencer-marketing)`, `(/email-marketing)`, `(/cro)`, `(/seo-audit)`.

**Two distinct bugs:**
1. The tokens render as visible text instead of hyperlinks.
2. The target paths are root-relative and **do not exist** — verified `/promotedge-next2/seo/` and `/promotedge-next2/web-design/` return 404. Real pages live at `/services/seo/`, `/services/web-design/`, `/services/seo/local-seo/`, etc.

**Why it blocks:** Visible to every reader on ~60 industry pages; destroys the "senior-led craft" positioning; wastes the single best internal-linking layer in the site (industry → service cross-links are exactly what topical authority needs); and if a later fix naively converts them to links without fixing paths, you ship hundreds of 404 internal links instead.

**Fix:** One sweep over the content source: replace each token with a real `<a>` to the canonical page under `/services/…`. Build a token→URL lookup once (`/seo` → `/services/seo/`, `/seo/local-seo` → `/services/seo/local-seo/`, `/pr` → `/services/pr/`, `/seo-audit` → `/services/seo-audit/`, …) and apply it across the corpus. Then grep the built HTML for `(/` to confirm zero remaining.

## P0-4. Placeholder tokens swallowed by HTML — broken sentences shown to users

**Evidence:**
- `/industries/real-estate/`: 'Project pages built to rank for **" project name price"**, **" locality flats"**, **" city residential projects"**. Builder brand pages ranking for trust queries (**" builder name reviews"**, **" builder name past projects"**)'
- `/industries/healthcare/`: 'Google Ads for high-intent specialty queries (**"best specialty doctor in city "**)'
- `/industries/gst-consultants/`: '"GST consultant city "', and a bracket variant '"GST consultant in [city]"' appearing unprocessed.

**Diagnosis:** The drafts used angle-bracket placeholders like `<project name> price`. Unescaped, browsers parse `<project name>` as an unknown HTML tag and drop it — leaving a leading space inside the quotes. A second authoring pass used `[city]` and that variant survived as raw brackets. Both patterns are visible to users and to AI engines quoting the page.

**Fix:** Re-render these as escaped text — e.g., "{project name} price" or *'“Sunrise Heights price”-style queries'*. Grep the source for `<` inside prose blocks, and for `[city]`, `[role]` (the Contact page uses "Careers — [role]" intentionally — that one is fine as an instruction, keep it).

## P0-5. Empty template sections

**Evidence:**
- `work/weichai-india/`, `work/active-acres/`, `work/dtc-southern-heights/` — all three sampled case studies render `## The work behind it.` (section "What we ran") with **no content**, then "More work". On Weichai even the "Other results" list is empty.
- `/about/` renders a `Featured in` heading with nothing under it (logo wall likely images-only or missing; either way it reads as a hole in the page's text layer — and AI crawlers read exactly that layer).

**Fix:** Either populate (list the services/deliverables each engagement ran — you have this data) or remove the section from the template until populated. For "Featured in": if logos exist as images, add alt text naming the publications (that's how the section becomes machine-readable); if no placements yet, remove the section.

## P0-6. Staging path is exposed — protect it now and through launch

**Evidence:**
- `promotedge.net/robots.txt` disallows ~180 dev folders (including `/desi-machines/`, `/promotedge-2024/` etc.) but **`/promotedge-next2/` is absent** → crawlable.
- No `noindex` could be verified remotely (the WAF blocks non-browser fetchers; Exa's text layer can't see meta robots).
- Live proof of leak risk: `promotedge.net/ultra-max-dev/network/` currently surfaces in web search results even though it *is* robots-disallowed (robots blocks crawling, not indexing of discovered URLs).

**Fix (both layers, now):**
1. Add `Disallow: /promotedge-next2/` to promotedge.net robots.txt.
2. Serve `<meta name="robots" content="noindex,nofollow">` (or `X-Robots-Tag: noindex` header) on every staging page — robots.txt alone is not deindexing protection.
3. At launch: the *production* copy on promotedge.com must NOT carry the noindex (top launch-day check — see runbook), and the staging copy should remain blocked, then be taken down after the migration settles to avoid a live duplicate of the whole site.

## P0-7. One canonical stat sheet — the numbers currently disagree

**Evidence collected across pages:**

| Claim | Values found | Where |
|---|---|---|
| Cities | **37** · **175** | Home/Work ("37 Cities") vs `/services/seo/` ("175 cities reached") |
| Industries | **30+** · **60 listed** · **"+ 20 more" after 11** | Industries header vs its own list vs homepage chips |
| Capabilities/services | **10+** · **102 / 102+** · **50+** | Homepage vs Services hub vs About ("View all 50+ →") |
| Team | **55+ specialists** · 24 named on About | About stats vs team grid (LinkedIn says 56 — 55+ is fine; consider "56 people" for precision) |
| Same result, two projects | **"320 qualified EOIs"** on both Active Acres and DTC Southern Heights (both real-estate launches, both "in launch window/60 days") | `/work/active-acres/`, `/work/dtc-southern-heights/` |
| Weichai organic web traffic | 44% (home, case study) vs case-study hero also citing 178% Facebook reach — consistent, but ensure each stat appears with the same unit everywhere | Home vs `/work/weichai-india/` |
| AI mediation stat | "38% of buyer research queries now mediated by AI" — **unsourced** | `/services/ai-search-optimisation/` |

**Why it blocks:** Prospects notice; competitors screenshot; and AI engines ingest contradictions and repeat whichever they saw first — entity consistency is a core GEO ranking factor and this is the single cheapest fix on the list. The duplicated "320 EOIs" reads as fabricated even if both are real.

**Fix:** Create `stats.json`/single source of truth: cities, industries, services count, team size, brands served, years. Render every stat from it. If both real-estate projects truly generated 320 EOIs, differentiate the framing (e.g., one becomes "₹2.4cr pipeline in 60 days" only); if one number is a template inheritance error, correct it. Source or soften the 38% AI stat (link the study; unsourced stats are exactly what your own GEO blog post says AI engines penalise).

---

## Suggested clearing order (fastest path to GO)

1. P0-3 + P0-4 together (same content sweep, same grep patterns) — 1 dev-day with the lookup table.
2. P0-5 (populate or hide sections) — content team, parallel.
3. P0-7 (stat sheet) — 2 hours + find/replace.
4. P0-1 (form wiring + thank-you + GA4 event) — 1 dev-day incl. testing.
5. P0-2 (legal pages) — draft from your existing client-side templates, same day.
6. P0-6 (robots + noindex on staging) — 30 minutes, do it first actually; it's independent.

Then run `scripts/verify-at-launch.sh` against staging, fix anything red, and you're ready for the runbook in `06-redirect-map-launch-runbook.md`.
