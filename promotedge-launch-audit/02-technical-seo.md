# Technical SEO Findings — Staging Crawl + Launch Requirements

Scope note: the host WAF (Cloudflare on promotedge.net) returns 403 to non-browser fetchers, so this audit's crawler was Exa (browser-rendered text layer). That means **head-level tags (meta robots, canonical, JSON-LD, OG) could not be inspected remotely** — those checks are encoded in `scripts/verify-at-launch.sh` and marked ⚠️ VERIFY below. Everything else here was observed directly.

---

## 1. Architecture & URL design — ✅ good, keep

Confirmed structure (all fetched live, 200):

```
/                              → Home
/services/                     → hub (4 groups, ~15 services)
/services/{service}/           → e.g. /services/seo/, /services/web-design/, /services/pr/, /services/marketplace/
/services/{service}/{sub}/     → e.g. /services/seo/local-seo/, /services/seo/technical-seo/  (the "102 capabilities")
/industries/                   → hub (60 listed)
/industries/{industry}/        → e.g. /industries/real-estate/, /industries/healthcare/, /industries/gst-consultants/
/work/                         → hub (~31 case studies)
/work/{case-study}/            → e.g. /work/weichai-india/, /work/active-acres/
/blog/                         → hub (~65 posts)
/blog/{slug}/                  → e.g. /blog/seo-vs-aeo-vs-geo/
/about/  /contact/  /careers/  → single pages
```

- Descriptive, lowercase, hyphenated slugs; trailing-slash style consistent. ✅
- Unknown URLs return a **hard 404** (`/this-page-does-not-exist-xyz/` → 404). ✅
- Estimated total: **~270 URLs** (7 core + ~15 services + ~87 sub-services + 60 industries + ~31 work + ~65 posts + careers). Inventory in `data/crawl-inventory.csv`.

Watch-outs:
- `/case-studies/` and `/insights/` 404 — fine, but since the old site and human intuition use those names, 301 them to `/work/` and `/blog/` at launch (cheap insurance; included in redirect map).
- 7 case studies share the display name "SaaS Platform" and 2 share "D2C Beauty Brand" — their slugs must differ; confirm no slug collisions/auto-suffixes like `saas-platform-2` (I could not guess them; `/work/saas-platform/` 404s). Differentiate display titles regardless (see 03).

## 2. Duplicate content from static export — 🔧 P1

- `…/index.html` serves the same page as the directory URL with 200: confirmed `promotedge-next2/index.html` ≡ `promotedge-next2/`. Assume every folder has this twin.
- **Fix:** 301 `*/index.html → */` at the server/CDN level (one rewrite rule), plus self-referencing canonicals on every page (⚠️ VERIFY canonicals exist and point to the **final domain** `https://www.promotedge.com/...` at launch — a staging-domain canonical is a classic launch killer).
- Also normalise: no-trailing-slash → trailing-slash 301 (or vice versa, but pick the deployed convention — pages resolve with slash today), and HTTP→HTTPS + apex→www in one hop each.

## 3. Sitemap & discovery files — 🔧 required at launch

| File | Staging status | Launch requirement |
|---|---|---|
| `sitemap.xml` | ❌ absent under `/promotedge-next2/` (404/timeout on all standard names) | Generate at build time; must list final-domain URLs only, exclude thank-you/404; submit in GSC + Bing WMT on day 0 |
| `robots.txt` | n/a at subfolder (root file governs) | On promotedge.com: allow all + AI bots (see 04), point to sitemap, keep the current live disallows that still apply (`/wp-admin/` etc. become irrelevant if the stack changes) |
| `llms.txt` | ❌ absent | Ship one at `/llms.txt` — you sell AI Search; practice it. Spec draft in `04-aeo-geo-readiness.md` |
| favicon/OG image | ⚠️ VERIFY | OG/Twitter images must use absolute **final-domain** URLs |

## 4. Crawler & AI-bot access — ❗ the biggest strategic risk (detail in 04)

Observed now:
- `promotedge.net` robots.txt (Cloudflare-managed block) disallows **ClaudeBot, GPTBot, CCBot, Google-Extended, Amazonbot, Applebot-Extended, Bytespider, meta-externalagent** and signals `ai-train=no`.
- The WAF served **403 to Anthropic's fetcher on BOTH promotedge.net and www.promotedge.com** during this audit, while robots.txt on promotedge.com *claims* to allow OAI-SearchBot etc. → an edge/WAF setting (likely Cloudflare "AI crawlers" blocking or Bot Fight Mode) is overriding your stated policy **on the live domain today**.
- Consequence if this carries to the new site: ChatGPT/Claude/Perplexity cannot read promotedge.com in real time → you become uncitable in exactly the engines your flagship service sells. This would also invalidate the "SaaS platform cited in Perplexity for 60+ queries" playbook for your own brand.

**Fix:** In Cloudflare for promotedge.com — Security → Bots: disable "Block AI bots" (or configure per-bot allows for GPTBot, OAI-SearchBot, ClaudeBot/Claude-User, PerplexityBot, Google-Extended per your training-vs-retrieval policy); ensure the managed robots.txt "content signals" block is not injected on the production zone, or configure signals deliberately (e.g., `search=yes, ai-input=yes, ai-train=no` if that's the policy you want — but understand `ai-input=no`/blocks kill retrieval citations). Then verify with the UA matrix in the script.

## 5. Rendering (SSR vs client-side) — ⚠️ VERIFY, high stakes

Exa renders JavaScript, so the crawl cannot distinguish server-rendered HTML from client-rendered content. **GPTBot, ClaudeBot, PerplexityBot and most AI crawlers do not execute JS** — if the build is a JS-rendered SPA, the site is invisible to them regardless of robots settings. Given the "next2" naming, this is likely a Next.js static export (which would be fine — full HTML), but it must be proven:

```
curl -A "Mozilla/5.0" https://www.promotedge.com/ | grep -c "integrated marketing"   # >0 → content in initial HTML ✅
```
(Encoded in the verify script; run from any machine once the WAF allows it — that's also the test that the WAF fix worked.)

## 6. Performance / Core Web Vitals — ⚠️ measure at T-1

PageSpeed Insights API rate-limited this session (429 without key), and the sandbox egress could not reach the site directly, so no lab numbers are included. Plan:
- Run PSI (mobile) on: home, one service, one sub-service, one industry, one case study, one blog post. Budget: LCP ≤ 2.5s on 4G, CLS < 0.1, INP < 200ms — the site's own `/services/web-design/` page promises "under 2 seconds on 4G"; hold the launch to the promise.
- The design is text-forward with few hero images — likely fast. Risks to check: font loading (multiple display weights), the testimonial carousel JS, WhatsApp widget, and any layout shift from the numbered section animations.
- Ensure images ship in AVIF/WebP with explicit width/height, lazy-load below the fold only (never the LCP element), and preload the hero font.
- After launch, CrUX field data takes ~28 days to populate; watch GSC CWV report from day 1 of data.

## 7. Misc technical items

| Item | Status | Action |
|---|---|---|
| 404 page | Hard 404 confirmed | ⚠️ VERIFY it returns HTTP 404 (not 200 soft-404) on the production host |
| Email addresses | Cloudflare-obfuscated (render as `[email protected]` to crawlers) | Intentional trade-off; but AI engines then cannot cite your contact email. Recommend plain-text on Contact page + `mailto:` (spam volume is manageable with filtering) or at minimum keep email in Organization schema `contactPoint` |
| Trailing WhatsApp widget | Present sitewide | Fine; ensure it's not the CLS/INP offender and doesn't block the mobile CTA |
| hreflang | Single locale (en, India) | Not needed on promotedge.com. Set `<html lang="en-IN">`. Coordinate with promotedgedigital.com (en-US) via distinct targeting, not hreflang (different entities/domains) |
| Analytics | Unverifiable remotely | GA4: new property or existing? Recommend keeping the existing GA4 property + GSC property continuity (same domain), re-verify tags fire on the new templates before launch |
| HTTPS/HSTS, compression, HTTP/2+ | Unverifiable from sandbox | In verify script |
