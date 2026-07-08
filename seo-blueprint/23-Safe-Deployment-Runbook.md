# 23 — Safe Deployment Runbook: Protect the Site Without Losing UX, Rankings, Impressions or Traffic

> **Mandate:** deploy the protection + performance work in docs `20` (performance), `21` (bot control), `22` (security) — **with a hard constraint: zero regression to user experience, rankings, impressions, or organic traffic.**
> **How that constraint is enforced:** (1) a strict *order* — safest/highest-value first, anything with regression risk last and staged; (2) a **measurement gate** between phases — you never proceed if a guardrail metric moved the wrong way; (3) conservative *defaults* — challenge over block, report-only over enforce, exceptions for every ranking-critical crawler; (4) one-command *rollback* per phase.
> **Golden rule:** **change one layer, measure, then proceed.** Never deploy all three kits in one sitting. If a KPI dips, the last phase is the cause — roll it back, don't debug live.

---

## 0. The guardrail metrics (watch these the entire time)

Before touching anything, record today's values. After every phase, re-check. **Any red = stop and roll back that phase.**

| Guardrail | Where | Green (proceed) | Red (roll back last phase) |
|---|---|---|---|
| Googlebot crawl rate / errors | GSC → Settings → Crawl stats | Flat or better; no error spike | Crawl requests drop or 5xx/blocked spike |
| Indexed pages | GSC → Pages | Flat or rising | Sudden de-indexing |
| Verified AI/search bot blocks | Cloudflare → Security → Events (filter GPTBot/PerplexityBot/Googlebot/Bingbot) | **Zero** blocks/challenges | Any verified crawler challenged/blocked |
| Organic clicks & impressions | GSC → Performance (compare 7-day) | Within normal variance | Step-down after a phase |
| `llm` channel visitors | Analytics (per `13` §5) | Flat or rising | Drop after bot rules |
| Core Web Vitals (mobile) | GSC → Core Web Vitals + `psi-cwv-baseline.sh` | Flat or better | Regression |
| Live UX smoke test | Real phone, model page | Loads, WhatsApp/RFQ works, no layout jump | Anything broken/slower |
| Uptime | Cloudflare / Cloudways | 100% | Any 5xx bump |

> **Attribution note:** organic ranking/traffic effects lag 1–4 weeks (crawl + CrUX windows). So phases are sequenced *days apart*, and the fast signals (crawl stats, Cloudflare events, live smoke test, CWV lab) are the real-time gate; the slow signals (clicks, impressions, positions) are the confirmation you watch before the *next* kit.

---

## 1. Deployment order (why this exact sequence protects rankings)

The order is chosen so the **highest-safety, highest-value** work lands first, and the **regression-capable** work (edge HTML caching, script deferral, security headers, WAF) lands last, one at a time, each behind a gate.

### PHASE A — Zero-risk security + backups (do first, nothing to lose)
*From `22`. None of this is visible to users or crawlers.*
1. **Full backup + one test restore to staging.** Nothing else proceeds until you can restore. This is the ultimate rollback for everything below.
2. **Run `wp-security-audit.sh`** — get the real inside-state baseline.
3. **Update WP core + all plugins/themes; delete deactivated ones; enable auto-updates.** (Do it on **staging first**, smoke-test, then production — an update is the *one* security step that can rarely break a theme, so it's staged.)
4. **2FA on all admins; remove stale accounts; kill `admin`-type usernames.** Invisible to SEO/UX.
5. **`wp-config-hardening.php`** (DISALLOW_FILE_EDIT, FORCE_SSL_ADMIN, salts). Invisible to SEO/UX.
6. **Enable Cloudways malware scanner + GSC security email alerts.**
> **Gate A:** live smoke test + crawl stats still green. All of A is SEO/UX-neutral by construction — this is pure downside-protection with no rankings exposure. ✅ Proceed.

### PHASE B — Origin performance (pure UX/SEO *gain*, low risk)
*From `20` Phases 1 + 3–5, minus the edge cache.*
1. **Varnish + Breeze + Redis** (origin caching) → faster TTFB. Exclusions for wp-admin/RFQ endpoints already specified.
2. **Images: WebP/AVIF + `srcset` + LCP hero fix** → faster mobile, *helps* CWV and image rankings. Keep the Google-Images-safe hotlink exceptions.
3. **Plugin prune** (staged) → less weight, faster.
4. **Third-party script deferral** (`defer-third-party.php`) → **the one UX-regression risk in B.** Deploy to **staging**, click every interactive element (menu, filters, WhatsApp bar, RFQ form, gallery), confirm nothing breaks, *then* production. jQuery excluded by default; logged-out only.
> **Gate B:** CWV lab numbers improved, live smoke test perfect, crawl green. Wait 48h; confirm clicks/impressions steady. ✅ Proceed.

### PHASE C — Edge caching (big win, needs the purge check)
*From `20` Phase 2.*
1. **Cloudflare full-page HTML caching** (APO or Edge Cache / CF Enterprise).
2. **Immediately verify purge-on-publish** and that **titles/meta/schema are in the cached HTML** (protects the `19` CTR work and GEO). AI crawlers *love* edge-cached server HTML — this helps GEO.
> **Gate C:** `cf-cache-status: HIT`, meta/schema present, edit-a-post-updates-live works, verified bots not challenged. Wait 48h; confirm impressions/clicks steady. ✅ Proceed.

### PHASE D — Bot control (protective, highest crawler-risk — most caution)
*From `21`. This is where an over-broad rule could hurt rankings, so it's late and heavily gated.*
1. Deploy **robots.txt policy** (explicit allow for all ranking/AI crawlers first).
2. Deploy Cloudflare rules **as Managed Challenge, not Block**, starting with Super Bot Fight Mode → "Definitely automated = Managed Challenge." **Verified bots = Allow.**
3. **`htaccess-antiscrape.txt`** + **`feed-attribution.php`** (feeds → excerpt).
> **Gate D (the critical one):** Cloudflare Security Events show **zero** challenges to Googlebot/Bingbot/GPTBot/ClaudeBot/PerplexityBot/OAI-SearchBot. Crawl stats flat. `llm` channel steady. Watch **daily for 1 week.** Only after a clean week, consider escalating "Definitely automated" from Challenge → Block. ✅ Done.

### PHASE E — Security headers + WAF tightening (last, most breakable)
*From `22` P2.*
1. **CSP in report-only mode first** (`htaccess-security.txt` ships it commented/report-only). Collect violations for 1–2 weeks, tune to your real scripts (GTM, WhatsApp, gallery), *then* enforce. A wrong CSP silently breaks scripts — never enforce blind.
2. **Cloudflare OWASP managed ruleset** → start in *Log/Challenge*, watch for false positives on RFQ form submits, then enforce.
3. HSTS, security headers (these are safe; CSP is the only delicate one).
> **Gate E:** RFQ/WhatsApp/forms all work; no CSP console errors after enforce; no WAF false-positives blocking real users. ✅ Complete.

---

## 2. The "never do these" list (each would cost rankings/traffic)

| ❌ Don't | Why it hurts | ✅ Instead |
|---|---|---|
| Enable Cloudflare "Block AI bots" | Kills GPTBot/ClaudeBot/CCBot = your GEO channel | Welcome verified AI bots; block *undeclared* automation (`21`) |
| Block/challenge before allowlisting verified bots | Challenges Googlebot → deindexing | Rule 1 (verified-bot skip) goes in FIRST |
| Enforce CSP without report-only | Silently breaks GTM/WhatsApp/forms | Report-only → tune → enforce (Phase E) |
| Deploy all kits at once | Can't attribute a KPI dip to a cause | One phase, measure, proceed |
| Full-content RSS feeds | Auto-repost = duplicate-content competitors | Excerpt feeds + attribution (`21`) |
| Hotlink-block images with no crawler exceptions | Breaks Google Images (#1 rankings) | Exceptions for Google/Bing/AI already in the .htaccess |
| Skip staging for script-defer / plugin changes | Live breakage in front of buyers | Cloudways staging clone first |
| Block xmlrpc while using Jetpack/WP app | Breaks those tools | Confirm not in use first (it's rarely needed) |
| Rate-limit so low humans hit it | Real buyers challenged | Limits set well above human browsing (60/min catalog) |

---

## 3. Global rollback (if anything goes red)

Each phase is independently reversible in minutes; you never need to unwind the whole stack:
- **A (updates):** restore staging-tested state / plugin rollback; salts/2FA are non-breaking.
- **B (origin cache):** Cloudways panel toggles off; delete the mu-plugin; `.webp` siblings are additive (originals untouched).
- **C (edge cache):** disable APO / Edge Cache rule; DNS + origin untouched.
- **D (bot rules):** disable the WAF/rate rules; robots.txt revert; delete mu-plugins.
- **E (headers/WAF):** remove the header block / set CSP back to report-only; managed ruleset → Log.
- **Nuclear option:** restore the Phase-A backup (why it's step 1).

---

## 4. Execution status & handoff

**What's ready:** every phase above maps to a doc + tested artifacts already in this repo (`20`–`22` + `data/`). Defaults are pre-set to the SEO/UX-safe choice (challenge not block, report-only CSP, verified-bot allowlist, image-search exceptions, logged-out-only deferral, additive image conversion).

**What execution needs** (unchanged from `20`): SSH to the Cloudways app + Cloudflare panel/API access + this workspace's network policy allowing the server — **or**, simplest, a **local Claude Code session** on a machine that already SSHes into Cloudways, pointed at this repo, told "execute doc 23 phase by phase." A local session has the access this cloud container is denied, and this runbook is written so it (or your team) proceeds only through green gates.

**Recommended cadence:** Phase A (day 1) → B (day 2, after Gate A + 24h) → C (day 4) → D (day 6, then watch a week) → E (after D's clean week). ~2 weeks end-to-end, each step behind a measurement gate. Slower than a big-bang deploy, and that slowness *is* the rankings protection.
