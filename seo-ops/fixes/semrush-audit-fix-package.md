# Semrush Site Audit — validated findings + fix package

Source: Semrush Site Audit API, project 22542129 "Desi Machines", snapshot `6a88fcd02ad9d2ae5009fa80` (finished 2026-08-22; 20,000 pages crawled, limit hit; audits run weekly, next ~2026-08-29).
Headline counters: 7,896 errors (**+1,125 WoW**), 120,311 warnings (−19,848), 141,026 notices. Only 23 pages "healthy" — driven by two site-wide template issues (see F1/F6), not 20k individually broken pages.

## VERDICTS BY ISSUE (validated against issue_details + page_info + known site state)

### REAL — fix now (the quick package)

**F1 · Site-wide nav links missing trailing slash → 21,776 "permanent redirect" notices (issue 214).**
Every crawled page contains internal links to `https://desimachines.com/skid-steer-loader` and `https://desimachines.com/telehandler` (no trailing slash) which 301 to the slash versions (confirmed via page_info: code 301 → /skid-steer-loader/). These are in a site-wide template (header/footer menu).
**Fix: edit the menu items — add the trailing slash to both. One edit, ~20k notices gone, every internal click saved a redirect.** Owner: agency/S-EXEC (WP Appearance → Menus). No approval gate (content edit, not a redirect rule).

**F2 · Product schema invalid on unpriced products → 168 structured-data ERRORS (issue 45).**
page_info shows: item `PRODUCT`, cause `REQUIRED`, missing `["aggregateRating","offers","review"]` — Google requires ≥1. Count (168) matches the 💰 Missing Prices register (169 products, generated 08-04) almost exactly; sample URLs (e.g. /wheel-loader/jcb-440-5/) appear in both lists.
**Fix (two parts): (a) Saurav fills the "PRICE TO ADD" column — P1 10 rows first — so Offer schema is emitted (this was already the #1 quick ask; Semrush independently confirms it); (b) template rule: when a product has no price, suppress the bare Product JSON-LD block (or output it only once a real offer/review exists). Do NOT paper over with fabricated aggregateRating — the hardcoded 4.5 pattern is already a schema-spam risk.** Owner: (a) Saurav, (b) agency/S-EXEC.

**F3 · Self-compare page generated: `/compare/manitou-1340r-vs-manitou-1340r-skid-steer-loader/` → the site's only 4xx (issue 2).**
A compare-generator bug created an X-vs-X page; it 404s but is internally linked.
**Fix: remove it + its inlinks; add a generator guard `left != right`.** Owner: agency/S-EXEC.

**F4 · 9 compare pages canonicalize to a non-existent reversed-order URL (issue 38 — canonical → broken page).**
The A-vs-B → B-vs-A canonical dedup points at orderings that were never generated. Affected (source → broken canonical target):
- /compare/xcmg-xe140i-infra-vs-sany-sy120c-9-excavator/ → sany-sy120c-9-vs-xcmg-xe140i-infra
- /compare/sany-sy390c-10hd-grama-vs-jcb-345lc-hd-excavator/ → jcb-345lc-hd-vs-sany-sy390c-10hd-grama
- /compare/sany-stg140c-10-vs-fine-fmg-985-hd-motor-grader/ → fine-fmg-985-hd-vs-sany-stg140c-10
- /compare/mahindra-earthmaster-vx-vs-escorts-digmax-super-backhoe-loader/ → escorts-digmax-super-vs-mahindra-earthmaster-vx
- /compare/mahindra-earthmaster-vx-vs-case-770-nx-magnum-backhoe-loader/ → case-770-nx-magnum-vs-mahindra-earthmaster-vx
- /compare/liugong-935e-hd-vs-liebherr-r-938-litronic-excavator/ → liebherr-r-938-litronic-vs-liugong-935e-hd
- /compare/liugong-935e-hd-vs-liebherr-r-928-litronic-excavator/ → liebherr-r-928-litronic-vs-liugong-935e-hd
- /compare/liebherr-r-938-litronic-vs-jcb-345lc-hd-excavator/ → jcb-345lc-hd-vs-liebherr-r-938-litronic
- /compare/jcb-455-5n-vs-cat-950gc-wheel-loader/ → cat-950gc-vs-jcb-455-5n
**Fix: per page, point the canonical at the URL that actually exists (usually self-canonical), or generate the canonical-order page. Per-page canonical fixes are pre-authorized.** Owner: agency/S-EXEC.

**F5 · 16 duplicate titles on compare variants (issue 6).**
All pairs where the title template collapses model variants: Manitou "MBL 745 HT" vs "MBL 745 HT Plus", Hyundai "Smart" vs "Smart-X", Bull "BS4 Champion" vs "BS5 Super Smart" (full 16-URL list in audit; all /compare/).
**Fix: title generator must use the full variant name (include "Plus"/"X"/BS-series token).** Owner: agency/S-EXEC.

### REAL — already-owned workstreams (Semrush independently confirms them)

**F6 · 7,544 pages "slow page load" = 95% of all errors, and the +1,125 error jump.** Load-time threshold breaches concentrated on PDP/brand/compare templates. This is the same finding as Web Vitals (Compare lab 34, Product INP 1100ms) and the standing "Compare bypasses WP Rocket" item. Saurav's 08-19 CWV changes target exactly this. **Action: no new work — use the next weekly Semrush audit (~08-29) as the independent before/after for the CWV ship. If the slow-page count doesn't fall materially, the fix didn't reach the right templates.**

**F7 · 720 missing ALT (issue 110): mostly THEME asset images** (e.g. `/wp-content/themes/construction-equipments/assets/img/product/add-to-cart.png` repeated across pages). **Fix: add alt attributes at theme level — a handful of template images clears most of the count.** Owner: agency.

**F8 · 733 "Read More" non-descriptive anchors (issue 217): template CTA.** Fix in template: "View [model] price & specs". Fold into internal-linking work.

**F9 · 131 hreflang conflicts (issue 24): all on parameter/filter URLs** (`/opportunities/?state=…&sort=…`, `?swoof=` filters) plus oddities: **`/tamil.nadu/` (malformed URL — should it exist?) and `/used-construction-equipment/` (a used page exists despite the pillar being parked)**. Fix: emit hreflang/locale tags only on canonical URLs; inspect the two odd URLs. Owner: agency/S-EXEC. Low urgency.

### NOISE / BY-DESIGN — do not spend time

- **135 unminified JS/CSS (100k, capped · warning):** WP Rocket minify/exclusion config question — verify config once (GTM is deliberately excluded from delay-JS); otherwise ignore.
- **202 nofollow external links (100k, capped · notice):** by design.
- **112 low text/HTML ratio (19,203):** spec/table pages by nature — ignore.
- **4 blocked from crawling (632):** pagination + /tag/ archives — intentional crawl control; ignore.
- **223 "content not optimized" (17,572):** generic contentAudit flag — ignore.
- **102 title too long (44):** long model names on compare pairs; conflicts with the no-bulk-title directive; matches the sheet's entity-decode finding that few are real. Leave.
- **105 duplicate H1/title (332 brand hubs), 212/213/215/216/122/25/204 (tiny counts):** cosmetic/small — fold into existing template/linking work, no dedicated effort.
- **9 pages not crawled (24):** timeouts on slow compare pages + 4 brand-category pages — will resolve with F6; recheck next audit.

## Sequence
1. Today: F1 (menu slashes), F3 (kill X-vs-X page).
2. This week: F2a (Saurav's 10 P1 prices) + F2b (schema suppression rule), F4 (9 canonicals), F5 (16 titles).
3. Next audit (~08-29): read F6 slow-page count as the CWV before/after; recheck F7–F9.

## Expected effect on the Semrush dashboard Saurav is looking at
F1+F2+F3+F4+F5 remove ~22k notices, 168 of 352 non-slow errors, and the only 4xx; "healthy pages" jumps from 23 as the site-wide template issues clear. The error counter will still be dominated by slow-pages until the CWV work lands — that number is the one to watch weekly.
