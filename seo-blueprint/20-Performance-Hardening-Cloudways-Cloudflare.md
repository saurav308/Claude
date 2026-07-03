# 20 — Performance Hardening: Full-Page Caching, Cloudflare, Images, Plugins, CWV (Cloudways edition)

> **Goal:** execute the P0 Core Web Vitals pass from `03` (D1–D3) and capture ~90% of the performance benefit a replatform would promise, at ~1% of the risk — **without leaving WordPress**.
> **Stack this is written for:** WordPress + RankMath on **Cloudways** (Nginx → Varnish → Apache → PHP-FPM), with **Cloudflare attached via Cloudways**.
> **Why it matters here:** 84% of clicks are mobile (verified, `13`), audience is Tier 2–5 India on mid-range Android and 3G/4G. Speed is ranking *and* conversion: the WhatsApp/RFQ system in `08` only converts if the page is interactive before the buyer bounces.
> **Companion scripts (in `data/`):** `cwv-priority-urls.txt`, `psi-cwv-baseline.sh`, `convert-images-webp.sh`, `htaccess-webp-avif.txt`, `plugin-audit.sh`, `defer-third-party.php`.

---

## Data-provenance note (read first)

Verified live in this session (3 Jul 2026):
- **Ahrefs API: plan lapsed** — every call now returns `Insufficient plan`. All Ahrefs-sourced numbers in this doc are from the June 2026 pulls already recorded in `13`/`14`.
- **Semrush API: zero units remaining** (`Api units balance is zero`) — unusable until topped up.
- **desimachines.com is blocked by this workspace's network policy**, and the PageSpeed/CrUX APIs require an API key not provisioned here.

**Consequence:** the *live baseline measurement* (Phase 0) must be run by your team with a free Google API key (5-minute setup, §0.1), or re-run by me once the key + network access are provisioned. Everything else in this doc is executable as written.

---

## The order of operations (do not shuffle)

| Phase | What | Why this order | Effort |
|---|---|---|---|
| **0** | Baseline measurement (PSI/CrUX on 20 priority URLs) | You cannot claim a win you didn't measure. Run **before touching anything.** | 30 min |
| **1** | Origin caching: Varnish + Breeze + Redis object cache | Fix the origin first; edge caching on a slow origin just caches slowness for cache-miss URLs (you have ~12k pages — the long tail will miss). | ½ day |
| **2** | Cloudflare edge: full-page HTML caching + Brotli + HTTP/3 | Multiplies Phase 1; India mobile users get HTML from a nearby PoP instead of your origin. | ½ day |
| **3** | Images: WebP/AVIF + `srcset` + LCP hero fixes | The largest CWV lever on an image-heavy machine catalog. | 1–2 days |
| **4** | Plugin prune + PHP/DB hygiene | Reduces TTFB on cache misses and admin overhead. | ½ day |
| **5** | Third-party script deferral (chat, GTM, embeds) | The INP lever; protects the WhatsApp CTA responsiveness. | ½ day |
| **6** | Re-measure + QA + GSC CWV monitoring | Prove it, then let the 28-day CrUX window catch up. | 30 min + 28 days |

Every phase is independently reversible (rollback notes inline). Nothing here changes URLs, content, titles, or schema — **zero ranking-volatility risk** if the QA gates (§7) pass.

---

## Phase 0 — Baseline measurement (30 minutes, do this first)

### 0.1 One-time setup (free)
1. In Google Cloud Console create (or reuse) a project → **APIs & Services → Enable**: "PageSpeed Insights API" and "Chrome UX Report API" → **Credentials → Create API key**. Free tier is 25k queries/day — far more than needed.
2. `export PSI_API_KEY=<the key>` on whatever machine runs the script.

### 0.2 Run the baseline
```bash
cd seo-blueprint/data
bash psi-cwv-baseline.sh cwv-priority-urls.txt baseline-$(date +%F).csv
```
The URL list is the 20 highest-stakes pages from the verified GSC data in `13` (top pages by clicks, the three huge-impression/low-CTR pages, all category hubs, homepage). The script records, per URL, **field data** (real-user CrUX: LCP, INP, CLS — what Google actually ranks on) and **lab data** (Lighthouse: LCP, TBT, CLS, perf score) for mobile.

### 0.3 Interpret
- **Field LCP > 2.5s / INP > 200ms / CLS > 0.1** on mobile = failing CWV = this doc pays for itself.
- Also open **GSC → Experience → Core Web Vitals → Mobile** and screenshot the current failing-URL counts — that's the graph you'll watch recover.

Keep the CSV in `data/` (commit it) — it's the before/after evidence.

---

## Phase 1 — Origin caching (Cloudways panel, ~½ day)

Cloudways already ships the pieces; most sites just don't have them all on and tuned.

### 1.1 Varnish (full-page cache at origin)
- **Cloudways panel → Application → Application Settings → Varnish: Enable.**
- Install/verify the **Breeze** plugin (Cloudways' own, free) — it purges Varnish automatically on post publish/update, which is the piece people forget. Settings:
  - Basic: Cache system ON, Gzip ON, browser cache ON.
  - Varnish: "Auto Purge Varnish" ON.
  - **Do NOT enable Breeze's file-level minification of JS if you deploy `defer-third-party.php` (§5)** — one system managing script loading, not two.
- **Exclusions** (Breeze → Advanced → Never cache these URLs): `/wp-admin/*`, any RFQ/thank-you endpoint, and any URL that ever renders per-user content. On this site (no cart, no login for buyers) the exclusion list is tiny — which is exactly why full-page caching is safe here.

### 1.2 Redis object cache
- **Cloudways panel → Server → Manage Services → Redis: ON**, then application → install **Object Cache Pro** (Cloudways bundles it free on 2GB+ plans; otherwise the free "Redis Object Cache" plugin).
- Why you specifically: ~12k indexable pages + 49k crawled URLs (`14`) means crawlers constantly hit cold pages. Redis cuts the DB cost of every cache-miss render — it's the long-tail TTFB fix, and it also speeds wp-admin for your content team.

### 1.3 PHP
- Cloudways panel → confirm **PHP 8.2+** and OPcache enabled (default on Cloudways). If the app is on PHP 7.x, staging-test then bump — typically a free 20–30% TTFB cut.

**Rollback:** every item is a panel toggle. Varnish off / Breeze deactivate / Redis off restores prior state in minutes.

---

## Phase 2 — Cloudflare edge (½ day)

"Cloudflare attached to Cloudways" is one of two setups. Identify yours first (Cloudways panel → Application → **Cloudflare** tab = the Enterprise add-on; if instead your DNS is orange-clouded in your own Cloudflare dashboard, it's Scenario B). The goal in both: **serve full HTML from Cloudflare's Indian PoPs**, not just static assets.

### Scenario A — Cloudways Cloudflare Enterprise add-on (managed from the Cloudways panel)
1. **Cloudflare tab → enable for the domain** (if not already). This alone gives Enterprise-grade CDN, Brotli, HTTP/3, WAF, and **Polish + Mirage** (automatic WebP/AVIF conversion + mobile image optimization at the edge — note this for Phase 3: it may do most of the image-format work for you).
2. **Edge Page Caching: ON** (same tab). This is the full-page HTML cache at the edge. It integrates with Breeze for purge-on-publish — verify: edit a post, confirm the live page updates within ~a minute.
3. Confirm **Polish/Mirage ON** and **Brotli ON** in the same panel.
4. Nothing else to configure — Cloudways manages the rules. The trade-off of Scenario A is less rule control; the benefit is it's ~impossible to misconfigure.

### Scenario B — your own Cloudflare account in front of Cloudways
1. **Fastest good option: APO** (Automatic Platform Optimization for WordPress, $5/mo, free on Pro). Install the official Cloudflare WP plugin → enable APO. It caches full HTML at the edge, auto-purges on publish/update, and handles the logged-in/cookie bypass logic for you. **This is the recommended path** — it's the managed equivalent of hand-rolled cache rules.
2. Hand-rolled alternative (free plan): **Caching → Cache Rules**:
   - Rule "bypass-dynamic": `(http.request.uri.path contains "/wp-admin/") or (http.cookie contains "wordpress_logged_in") or (http.cookie contains "wp-postpass") or (http.request.uri.path contains "/wp-login")` → **Bypass cache**.
   - Rule "cache-html": everything else → **Eligible for cache**, Edge TTL **4 hours**, respect origin `Cache-Control` OFF for HTML.
   - Purge: Breeze's Varnish purge does NOT purge Cloudflare — add the Cloudflare WP plugin for auto-purge on publish, or you will serve stale pages. (This footgun is why APO is recommended.)
3. **Speed → Optimization**: Brotli ON, HTTP/3 ON, Early Hints ON. **Rocket Loader OFF** (it re-orders JS and conflicts with §5; test-only if curious).
4. **Speed → Optimization → Image Resizing / Polish** (Pro+): Polish = Lossy + WebP ON.

### 2.x Verification (both scenarios)
```bash
curl -sI https://desimachines.com/crane/hydra/ | grep -iE "cf-cache-status|cf-apo-via|age|content-encoding"
# Want: cf-cache-status: HIT (second request), content-encoding: br
```
And the **GEO-critical check**: `curl -s https://desimachines.com/crane/hydra/ | grep -c "rank_math\|schema"` — titles, meta, schema must be present in the cached HTML (they will be; RankMath renders server-side — this check guards against an edge rule accidentally serving a stripped variant). AI crawlers (GPTBot, PerplexityBot, ClaudeBot) don't execute JS; edge-cached server HTML is *ideal* for them — this phase helps GEO, it doesn't threaten it. One caveat: **verify Cloudflare's Bot Fight Mode / WAF isn't blocking AI crawlers** (Security → Events, filter by user-agent GPTBot/PerplexityBot) — you have 491 verified LLM-referred visitors (`13`); don't firewall the channel.

**Rollback:** disable Edge Page Caching / APO / the cache rule; DNS and origin are untouched.

---

## Phase 3 — Images: AVIF/WebP + `srcset` + the LCP hero (1–2 days)

The catalog is image-heavy (23,648 images missing alt text per `14` — same inventory this phase touches).

### 3.1 Decide the conversion layer (don't do it twice)
- **If Scenario A (CF Enterprise with Polish/Mirage) or Polish on Pro:** the edge already serves WebP/AVIF to supporting browsers. **Skip origin conversion** (`convert-images-webp.sh` becomes optional insurance) and go straight to §3.2–3.4, which Polish cannot do for you.
- **If no Polish:** run origin conversion:
  ```bash
  # on the Cloudways server, over SSH:
  bash convert-images-webp.sh /home/master/applications/<app>/public_html/wp-content/uploads --dry-run
  bash convert-images-webp.sh /home/master/applications/<app>/public_html/wp-content/uploads
  ```
  (Creates `image.jpg.webp` siblings, skips already-converted, reports byte savings; `--avif` flag adds AVIF if `avifenc` is present.) Then append `htaccess-webp-avif.txt` to the app's `.htaccess` so Apache serves the sibling file to browsers that `Accept` it, with correct `Vary: Accept`. Purge Varnish + Cloudflare after.

### 3.2 `srcset` / responsive sizes (theme level — Polish can't fix this)
WordPress generates `srcset` automatically for images inserted via the media system. Audit one model page's rendered HTML:
- Every `<img>` in content should carry `srcset` + `sizes`. If the theme's model-page template hardcodes full-size images (`wp_get_attachment_url()`), switch to `wp_get_attachment_image( $id, 'large', false, ['loading'=>'lazy'] )` so core emits `srcset`/`sizes`/dimensions.
- `sizes` should reflect the mobile layout (e.g. `(max-width: 768px) 100vw, 800px`) — 84% of your users render the mobile breakpoint.

### 3.3 The LCP element (the single biggest CWV number)
On model pages the LCP element is almost certainly the hero machine photo:
- **Do NOT lazy-load it.** WP core skips `loading="lazy"` on the first image since 5.9, but themes/optimizer plugins often re-add it. Verify in rendered HTML.
- Add `fetchpriority="high"` to the hero `<img>` (WP 6.3+ attempts this automatically; verify).
- Explicit `width`/`height` on every image (kills CLS).
- Hero image target: ≤ 100–150 KB at mobile width in WebP/AVIF.

### 3.4 Bundle the alt-text fix
You're touching every image anyway: run the alt-text backfill (`{brand} {model} {type} price India` pattern, per `14` P4) in the same pass. One inventory sweep, two audit items closed.

**Rollback:** `.webp` siblings are additive (originals untouched); remove the `.htaccess` block to revert serving. Template changes go through staging (§7).

---

## Phase 4 — Plugin prune + DB hygiene (½ day)

```bash
# on the server, in the WP root:
bash plugin-audit.sh          # inventory + red flags + autoload/cron/transient checks
```
The script flags, against a known-offender list:
- **Redundant caching/optimization plugins** (WP Rocket, W3TC, WP Super Cache, Autoptimize, Smush/ShortPixel-type image plugins if Polish is on) — with Varnish+Breeze+Cloudflare, a second cache layer causes conflicts, not speed. Keep exactly one system per job.
- **Known heavyweights** (Revolution Slider, broken-link checkers, related-posts plugins that table-scan, Wordfence live-traffic logging when the Cloudflare WAF already fronts the site, stats plugins that write on every pageview).
- **Autoloaded options bloat** (> ~800 KB autoload = every request pays; the script prints the top offenders), **wp-cron pile-ups**, and **expired transients**.

Rules of thumb: deactivate → observe a week → delete. Anything providing "minify/combine/defer JS" gets replaced by §5. Anything providing security duplicated by Cloudflare WAF gets slimmed to malware-scan-only duty. Target: **every remaining plugin has a job no other layer already does.**

**Rollback:** reactivate the plugin. (Take the DB backup first regardless.)

---

## Phase 5 — Third-party scripts: the INP lever (½ day)

Symptoms this fixes: sluggish first tap (INP), main-thread blockage from chat widgets/GTM/analytics — deadly on mid-range Android, and it's your conversion surface (the WhatsApp bar must respond instantly).

Deploy `defer-third-party.php` as an **mu-plugin** (`wp-content/mu-plugins/` — no activation step, can't be disabled by accident from wp-admin):
1. **Defers all enqueued scripts** except a configurable allowlist (jQuery by default), for logged-out visitors only.
2. **Loads heavy third parties on first interaction** (first touch/scroll/keydown, or a 6-s idle fallback): chat widgets, GTM, social/video embeds. Configure the handle/URL patterns at the top of the file — placeholders and instructions inline.
3. Ships with `DTP_ENABLED` kill-switch constant.

Two rules to keep it honest:
- The **WhatsApp deep-link bar itself must NOT be deferred** — it's `<a href="https://wa.me/...">` markup, zero JS, instant. Only a chat *widget* (drift/tawk/etc.) gets the on-interaction treatment.
- GA4/GTM loaded on interaction still records the users who matter (anyone who scrolls/taps); the lead events from `08` fire on interaction by definition, so **zero lead-tracking loss**.

**Rollback:** delete the file (or set `DTP_ENABLED` false), purge caches.

---

## Phase 6 — Re-measure, monitor, done

1. Re-run `psi-cwv-baseline.sh` → `after-<date>.csv`; diff against baseline. Expect lab LCP/TBT improvements immediately.
2. **Field data lags ~28 days** (CrUX rolling window) — watch **GSC → Core Web Vitals → Mobile** failing-URL count trend down over the following month. That chart is the deliverable.
3. Add to the `12` KPI sheet: monthly p75 LCP/INP/CLS (mobile) from the script, alongside the existing CTR/lead KPIs.

### Expected impact (honest ranges, [EST])
| Fix | Metric moved | Typical gain on this profile |
|---|---|---|
| Edge HTML caching (Ph 1–2) | TTFB India mobile | 600–1,500 ms → 50–200 ms on cache hits |
| Image formats + hero fix (Ph 3) | LCP | commonly −30–50% on image-LCP pages |
| Plugin prune (Ph 4) | TTFB (cache miss), admin speed | site-specific; autoload fixes alone can be −100–300 ms |
| Script deferral (Ph 5) | INP / TBT | commonly −40–70% TBT on mobile |

---

## §7 QA gates (run after every phase — 15 minutes)

1. **Meta/schema intact in server HTML:** `curl -s <model page> | grep -E "og:title|application/ld\+json" | head` — RankMath output present, exactly one title tag. (Protects the `19` CTR work.)
2. **Cache bypass works:** logged-in admin sees uncached pages (`cf-cache-status: BYPASS`); logged-out sees `HIT` on second load.
3. **Purge-on-publish works:** edit a post title → live URL updates within a minute.
4. **RFQ/WhatsApp path works on a real phone:** tap the CTA on a model page over mobile data; form submits; GA4 event fires.
5. **AI crawlers not firewalled:** Cloudflare Security Events show no blocks for GPTBot/PerplexityBot/Googlebot.
6. **No mixed cache layers:** exactly one minify/defer system (the mu-plugin), one page cache per tier (Varnish origin / CF edge), one image optimizer (Polish *or* origin WebP).
7. Template/theme changes (§3.2/3.3) go through **Cloudways staging** first — one-click clone in the panel.

## What needs provisioning for me to execute this directly
- **SSH to the Cloudways app** → I run Phases 1 (verify), 3, 4, 5 myself (scripts above).
- **Cloudways API key or panel access** → Phase 1–2 toggles.
- **Google API key (free) + allow `desimachines.com` + `googleapis.com` in this workspace's network policy** → I run Phases 0 and 6 (measurement) myself.
- Semrush units top-up (optional) → refresh the site-audit numbers that came from the now-lapsed Ahrefs plan.
