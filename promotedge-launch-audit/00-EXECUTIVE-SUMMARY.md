# PromotEdge.com New Website — Pre-Launch Gatekeeper Audit

**Audit date:** 28 July 2026
**Staging target:** `https://promotedge.net/promotedge-next2/` (audited strictly within this path — no other slug on the mother domain was crawled)
**Destination domain at launch:** `https://www.promotedge.com/` (assumed www, matching the live sitemap declaration)
**Auditor:** Claude (Claude Code session, PromotEdge workspace — isolated from all DesiMachines sessions)

---

## Verdict: **CONDITIONAL GO — not ready today. Ready after the P0 list is cleared.**

The new site is a **large step up** from the current promotedge.com in positioning, information architecture, content depth and AEO-ready writing style. The bones are genuinely good: clean hub-and-spoke architecture (Services → sub-services, Industries, Work, Insights), ~270 pages at launch, definitional "What is X?" sections on every commercial page, FAQ blocks, India-first compliance-angle content that competitors don't have.

But there are **7 launch blockers (P0)** — the most serious being a lead form that does not submit, missing legal pages, and site-wide LLM-generation artifacts (literal `(/seo)` link tokens and swallowed `<placeholder>` text rendered to users). For an agency whose homepage sells "SEO & AI Search," shipping those would be a credibility own-goal in front of every prospect who inspects the work — and prospects of an SEO agency *do* inspect.

## Scorecard

| Dimension | Score | Notes |
|---|---|---|
| Information architecture | 8.5/10 | Clean silos: `/services/{s}/{sub}/`, `/industries/{i}/`, `/work/{cs}/`, `/blog/{slug}/`. Proper hard 404s. |
| Content depth & originality | 7.5/10 | Industry pages (GST, Healthcare) are excellent and specific. Case-study copy strong. Dragged down by template artifacts and empty sections. |
| On-page SEO | 6/10 | Titles are headline-length (70–95 chars), H1 duplicated into title & breadcrumb, blog posts lack bylines/dates. |
| AEO readiness (answer extraction) | 8/10 | Definition-first sections, FAQ blocks, question-style H2s — genuinely well structured for snippets/AI answers. |
| GEO readiness (AI crawler access + entity) | 4/10 | Cloudflare currently 403s non-browser fetchers on BOTH domains; promotedge.net robots.txt blocks GPTBot/ClaudeBot/CCBot/Google-Extended; emails obfuscated; NAP inconsistent with live site; no llms.txt; schema unverified. Must be fixed at the *production* domain level. |
| Technical launch readiness | 4/10 | Demo form, no sitemap.xml, no legal pages, index.html duplicates, staging path not protected by robots. |
| Trust & E-E-A-T | 7/10 | Real team page with 24 named people, founder note, named clients & testimonials. Weakened by 7 case studies all titled "SaaS Platform" and unsourced big claims. |
| Data instrumentation | n/a | Could not verify GA4/GSC wiring remotely; both must be re-pointed at launch. |

## The 7 launch blockers (P0) — full detail in `01-launch-blockers-P0.md`

1. **Lead form is a demo** — "This is a demo form and does not submit" on `/contact/` (the primary conversion of the entire site).
2. **No privacy policy or terms pages** (404 at all standard slugs) — DPDP Act 2023 exposure for a form that collects PII, ad-platform policy risk, trust signal for enterprise clients.
3. **Literal link tokens in body copy** — `(/seo)`, `(/web-design)`, `(/seo/b2b-seo)`, `(/content-marketing)`, `(/performance-marketing/lead-generation-services)`, etc. rendered as visible text across industry pages; the targets are also wrong (those root paths 404 — real pages live under `/services/…`).
4. **Swallowed placeholder text** — angle-bracket tokens stripped by HTML: `" project name price"`, `" locality flats"`, `" builder name reviews"`, `"best specialty doctor in city "` — broken sentences visible to users on industry pages.
5. **Empty template sections** — every sampled case study renders "What we ran → The work behind it." with no content; About page "Featured in" section renders empty.
6. **Staging is not protected** — `/promotedge-next2/` is *not* in promotedge.net's robots.txt disallow list (≈180 other dev folders are), and no noindex could be verified. Another dev folder (`/ultra-max-dev/`) already surfaces in search results — proof of the leak pattern.
7. **Number consistency** — cities: 37 vs 175; industries: "30+" vs 60 listed; capabilities: "10+" vs "50+" vs "102"; the same "320 qualified EOIs" claimed for two different real-estate projects. One canonical stat sheet needed before an AI engine memorises the contradictions.

## What is genuinely strong (keep, don't touch)

- The **compliance-marketing content moat**: RERA / NMC / SEBI / ICAI / ASCI / DPDP-angle pages and posts. No Kolkata competitor has this. It is exactly the "verifiable, regulator-anchored claims" pattern that gets cited by AI engines.
- **65 blog posts at launch** across 10 coherent pillars — a real content base, not a placeholder blog.
- Definition-first page pattern ("What is SEO?" / "What is healthcare marketing?") — ideal for AI Overviews extraction.
- Named team (24 people) + founder note on Contact + named clients with named testimonial authors.
- Sub-service pages carry **author bylines** (e.g., "Satesh Kumar Shaw · SEO Lead") — extend this to blog posts (P1).

## Data-source status for this audit

| Source | Status | Detail |
|---|---|---|
| Ahrefs API | ❌ Units exhausted (107,654 / 100,000) | Resets **9 Aug 2026**. Free endpoints used: projects list, site-audit summaries. |
| Ahrefs Site Audit (live www.promotedge.com) | ✅ Snapshot | Crawl 25 Jul 2026: health **85**, 2,708 URLs, 400 errors, 728 warnings — see `05-data-baseline-gaps.md`. |
| GSC (via Ahrefs) | ❌ Empty | Project not GSC-connected in Ahrefs. Connect it, or export from GSC UI. |
| Semrush API | ❌ Out of API units | Options: https://www.semrush.com/mcp-access |
| GA4 | ❌ No GA4 connector in this session | Pull manually; checklist provided. |
| Crawl of staging | ✅ Full | Via Exa fetcher (the host WAF 403s other fetchers — itself a GEO finding). Text layer only; head-level tags could not be inspected remotely → `scripts/verify-at-launch.sh` covers them. |

## File map

| File | Contents |
|---|---|
| `01-launch-blockers-P0.md` | The 7 blockers with evidence and exact fixes |
| `02-technical-seo.md` | Indexability, duplicates, sitemap/llms.txt, WAF & AI-crawler access, SSR verification, CWV plan |
| `03-onpage-content-qa.md` | Template-by-template on-page findings + full fix list |
| `04-aeo-geo-readiness.md` | Schema plan, entity/NAP, AI-access matrix, citability |
| `05-data-baseline-gaps.md` | Tool status, live-site baseline, exact pull-list when units reset |
| `06-redirect-map-launch-runbook.md` | Old→new 301 map, T-minus launch sequence, post-launch monitoring |
| `07-content-pillars-routines.md` | Pillar map of the 65 posts, gap list, Routine specs for scaling |
| `data/*.csv` | Crawl inventory, content QA fix list, redirect map draft |
| `scripts/verify-at-launch.sh` | Automated head-tag / redirect / AI-UA verification to run at T-1 and T0 |
