# 21 — Bot Access Control: Block Scrapers, Welcome Ranking Crawlers (SEO/AEO/GEO)

> **Goal:** stop third-party scrapers from lifting the catalog, **without harming** the crawlers that make DesiMachines rank and get cited — Google/Bing (SEO), answer engines (AEO: AI Overviews, ChatGPT search, Perplexity), and AI training crawlers (GEO: being in the training data = being in AI answers).
> **Stack:** WordPress on Cloudways behind Cloudflare — enforcement lives at Cloudflare; WordPress hardening underneath; content-level defenses last.
> **Companion files (in `data/`):** `robots-bot-policy.txt`, `cloudflare-bot-rules.md`, `htaccess-antiscrape.txt`, `feed-attribution.php`.

---

## 0. The mental model (read this or the rest gets misapplied)

| Layer | Controls | Obeyed by |
|---|---|---|
| `robots.txt` | *Politeness requests* | Good bots only. **Scrapers ignore it.** |
| Cloudflare WAF / bot rules | *Enforcement* — who gets HTML at all | Everyone (it's the front door) |
| WordPress hardening | Closes side doors (feeds, APIs, image hotlinks) | Everyone |
| Content/legal | Makes stolen copies worthless or removable | Google + hosts |

Two facts that shape everything below:
1. **Scrapers spoof good bots.** Half the "Googlebot" traffic on a scraped site isn't Google. Cloudflare cryptographically **verifies** real Googlebot/Bingbot/GPTBot/etc. by IP (`cf.client.bot` / verified-bot flag) — so the core rule is: *allow verified bots, challenge or block automation that claims to be a browser or a bot but verifies as neither.*
2. **You WANT the AI crawlers.** You have 491 verified LLM-referred visitors (`13`), citations from grokipedia/accio (`09`), and AI Overviews on nearly every target SERP. Blocking GPTBot/ClaudeBot/CCBot to "stop scraping" would amputate the GEO channel while the actual scraper — a script with a fake Chrome user-agent — walks right past. Don't fight the last war.

---

## 1. The allowlist (never block these — they are the ranking/citation engine)

| Category | User-agents | Why |
|---|---|---|
| **SEO (search)** | `Googlebot`, `Googlebot-Image`, `Storebot-Google`, `Google-InspectionTool`, `Bingbot` | Rankings, image traffic (you rank #1 on image queries), GSC inspection |
| **AEO (answer engines / AI search — send you cited traffic)** | `OAI-SearchBot`, `ChatGPT-User` (OpenAI), `PerplexityBot`, `Perplexity-User`, `Claude-SearchBot`, `Claude-User` (Anthropic), `DuckAssistBot`, `MistralAI-User` | These fetch pages to **cite them in answers** — this is the `llm` channel in your analytics |
| **GEO (training corpora — being in the model = being in answers)** | `GPTBot`, `ClaudeBot`, `Google-Extended`, `Applebot` + `Applebot-Extended`, `Meta-ExternalAgent`, `Amazonbot`, `CCBot` (Common Crawl — feeds many models) | Long-term AI visibility. CCBot especially: one crawler, many downstream models |
| **Your own tools** | `AhrefsBot`, `AhrefsSiteAudit`, `SemrushBot`, `SiteAuditBot`, `Screaming Frog SEO Spider` | Your audits (`14`) depend on them |

Policy: **verified = full access.** Impersonators of these names get blocked by rule 2 below. (Bot roster changes quarterly — sanity-check new names against Cloudflare Radar's verified-bots directory twice a year.)

Deliberately *not* allowlisted (decide per taste): `Bytespider` (TikTok — notoriously aggressive, marginal India B2B value), `PetalBot`, `YandexBot`, `Baiduspider`, `MJ12bot`, `DotBot`, `Diffbot`/`Omgilibot` (commercial data resellers — this is "legal scraping"; block).

---

## 2. Cloudflare enforcement (the layer that actually stops the scraper)

Full copy-paste rule expressions are in **`data/cloudflare-bot-rules.md`**. The five rules, in order:

1. **Skip/allow verified bots** — `cf.client.bot` → Skip remaining bot rules. (In Super Bot Fight Mode: "Verified bots = Allow".)
2. **Kill spoofers** — user-agent claims `Googlebot|Bingbot|GPTBot|ClaudeBot|PerplexityBot|OAI-SearchBot|...` **AND NOT** verified → **Block**. This single rule removes the most common scraper disguise.
3. **Block script-library automation** — UA matches `python-requests|python-httpx|aiohttp|scrapy|go-http-client|node-fetch|axios|libwww|Java/|okhttp|curl|wget|HeadlessChrome|PhantomJS|Puppeteer|Playwright` and not verified → **Managed Challenge** (not hard block — challenges let any false positive through while stopping scripts cold).
4. **Rate-limit the catalog** — the scraper's signature is *breadth*: hundreds of `/excavator/*`, `/crane/*`, `/compare/*` pages per minute from one IP. Rate rule: >60 page-requests/min per IP on catalog paths (excluding verified bots) → Managed Challenge for 1 hour. Humans never hit this; harvesters always do.
5. **Block the *known* offender** — identify the current scraper in **Security → Events** and the Cloudways access logs (panel → Monitoring → Access Logs): recurring IP ranges/ASN hammering catalog URLs sequentially. Block by **ASN or IP range**, not user-agent (UAs are disposable). If the copies appear on a specific site, its fetch infrastructure is usually 1–2 ASNs.

**Bot Fight Mode settings:** Free plan "Bot Fight Mode" is a blunt on/off — it can interfere with unverified-but-legitimate fetchers; prefer the explicit rules above. Pro's **Super Bot Fight Mode**: Definitely automated = **Managed Challenge** (start there, not Block — watch Security Events for a week, then escalate), Likely automated = Allow initially, Verified bots = **Allow**.

**Scenario note (same split as `20` Phase 2):**
- **Cloudways Cloudflare Enterprise add-on:** you get true Bot Management (bot scores). The panel exposes limited rule controls — open a Cloudways support ticket to add rules 2–4; they configure custom WAF rules on the Enterprise zone. Ask for exactly: "managed challenge for bot-score < 30 AND NOT verified bot; block UA-spoofed search bots; rate limit as specified."
- **Own Cloudflare account:** paste the rules from `data/cloudflare-bot-rules.md` yourself (Security → WAF → Custom rules; Security → Rate limiting).

**⚠️ The one way this project can shoot itself in the foot:** after enabling anything in this section, run the QA in §6 — a mis-scoped rule that challenges *verified* AI crawlers silently kills the AEO/GEO channel and you won't notice for weeks. Check Security → Events for challenged/blocked `GPTBot`/`PerplexityBot`/`Googlebot` **weekly for the first month**.

---

## 3. robots.txt (the politeness layer — declare intent, welcome the good bots)

Deploy **`data/robots-bot-policy.txt`** (adapt paths, then WP Admin → RankMath → General Settings → Edit robots.txt). What it does:

- **Explicitly allows** every crawler in §1 (an explicit `Allow: /` per agent is also a public signal to AI vendors that you welcome citation crawling).
- **Disallows** the data-reseller bots (`Diffbot`, `Omgilibot`, `MJ12bot`, `DotBot`, `PetalBot`, `Bytespider`…) — polite ones comply, impolite ones get caught by §2 anyway.
- Keeps the standard WP disallows (`/wp-admin/` except `admin-ajax.php`) and the crawl-bloat rules from `14` P2 (param/filter URLs), and lists the segmented sitemaps.
- **Does NOT disallow money pages to anyone you want ranking you.**

---

## 4. WordPress side doors (scrapers rarely use the front door)

Most WP content theft never parses your HTML — it harvests the machine-readable endpoints. Close them (artifacts: `data/htaccess-antiscrape.txt` + `data/feed-attribution.php`):

| Side door | Fix |
|---|---|
| **RSS/Atom full-content feeds** (auto-blog plugins repost your entire articles) | Settings → Reading → "For each post in a feed, include: **Excerpt**". Plus `feed-attribution.php` (mu-plugin) appends a canonical-source line + link to every feed item — any auto-republisher now links back to you and self-identifies as a copy |
| **REST API content dump** (`/wp-json/wp/v2/posts?per_page=100` = your whole blog in JSON) | The mu-plugin rate-limits anonymous REST reads and blocks user enumeration (`/wp-json/wp/v2/users`) |
| **xmlrpc.php** (legacy API + amplification) | Blocked in `.htaccess` (keep open only if you use Jetpack/remote publishing) |
| **Image hotlinking** (copies embed *your* images from *your* server) | `.htaccess` hotlink rules **with explicit exceptions for verified search/AI bots and Google Images** — breaking image search would cost you real #1 rankings (`hitachi photo`, 8.6k vol) |
| **Author/user enumeration** (`?author=1`) | Redirected in `.htaccess` |

---

## 5. Content-level defense: make stolen copies worthless (the SEO-native layer)

Even a perfect firewall won't stop manual copying. This layer makes copies lose *in the SERP*:

1. **Index first, win by default.** Google attributes originality largely by first-seen. Segmented XML sitemaps with accurate `lastmod` (already in `14` P2), + **IndexNow** for Bing (Rank Math → Instant Indexing) so your version is indexed within minutes of publishing. A scraper republishing hours later is structurally the duplicate.
2. **Absolute self-referencing internal links + entity density.** Model pages should link to sibling models/hubs with **absolute URLs** and mention "DesiMachines" in copy (the `15`/`16` rewrites already do this). Auto-republished copies then carry links *to you* — turning theft into backlinks — and RankMath's self-referencing canonicals travel with any full-HTML copy.
3. **Dated, branded facts.** "₹XX–YY lakh — DesiMachines price index, June 2026" — AI engines and Google both prefer the attributed original; stale copies self-discredit (this is the `09` freshness play doing double duty).
4. **Takedowns for persistent offenders:** Google's *Report Content Removal* (DMCA) tool delists the copy from search — usually all that matters commercially; a host abuse report (WHOIS → host's abuse@) kills the mirror itself. Template the complaint once, reuse per URL batch.

---

## 6. QA gates — prove you didn't block the bots that pay you

Run after deploying §2–§4, then weekly for a month:

1. **GSC → Settings → Crawl stats**: Googlebot crawl rate unchanged (no spike in "server errors"/"blocked").
2. **GSC URL Inspection** on a model page: "Crawl allowed? Yes; Page fetch: Successful."
3. **Bing Webmaster Tools** equivalent check.
4. **Cloudflare Security → Events**, filter by user-agent `GPTBot`, `PerplexityBot`, `ClaudeBot`, `OAI-SearchBot`, `Googlebot`: **zero Block/Challenge events for verified hits**.
5. Feeds render as excerpts with the attribution line (`curl -s https://desimachines.com/feed/ | head -50`).
6. `/wp-json/wp/v2/users` returns 403; `/wp-json/wp/v2/posts` still returns 200 (single, throttled) — some legit tools use it.
7. Watch the **`llm` channel** in analytics (`13` §5): it should keep growing. A sudden drop after these changes = a rule is over-blocking; check Event logs same day.
8. Images still appear in Google Images (site:desimachines.com in image search) after hotlink rules.

## 7. What this does NOT do (honesty section)

- A determined scraper using residential proxies + real-browser automation can still copy pages one at a time. Nothing stops that — not even a replatform. §5 makes it not matter: their copy can't outrank or out-cite you.
- Cloudflare "Block AI bots" one-click toggle: **do not enable it** — it blocks GPTBot/ClaudeBot/CCBot wholesale, i.e., your GEO channel. Your posture is the deliberate opposite: *welcome declared AI crawlers, block undeclared automation.*
- If the current scraper is republishing you today: capture 3–5 example URLs of their copies now (screenshots + archive.org saves) — you'll want the evidence trail for the §5.4 takedowns.
