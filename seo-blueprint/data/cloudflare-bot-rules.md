# Cloudflare bot rules — copy-paste expressions (doc 21 §2)

Own-account: **Security → WAF → Custom rules** (rules 1–3), **Security → Rate limiting rules** (rule 4).
Cloudways CF Enterprise add-on: paste this file into a Cloudways support ticket and ask them to apply it to the zone.

Order matters — create them top to bottom.

---

## Rule 1 — "allow-verified-bots" (action: **Skip** → skip all remaining custom rules + Super Bot Fight Mode)

```
(cf.client.bot)
```

Every crawler on the doc-21 allowlist (Googlebot, Bingbot, GPTBot, OAI-SearchBot, ClaudeBot,
Claude-SearchBot, PerplexityBot, CCBot, Applebot, Amazonbot, AhrefsBot, SemrushBot, …) is in
Cloudflare's verified-bots directory and passes this check from its real IPs.

## Rule 2 — "block-bot-spoofers" (action: **Block**)

Scrapers pretending to be search/AI crawlers from non-verified IPs:

```
(http.user_agent contains "Googlebot" or http.user_agent contains "Bingbot" or http.user_agent contains "GPTBot" or http.user_agent contains "OAI-SearchBot" or http.user_agent contains "ChatGPT-User" or http.user_agent contains "ClaudeBot" or http.user_agent contains "Claude-SearchBot" or http.user_agent contains "PerplexityBot" or http.user_agent contains "Applebot" or http.user_agent contains "Amazonbot" or http.user_agent contains "CCBot" or http.user_agent contains "AhrefsBot" or http.user_agent contains "SemrushBot") and not cf.client.bot
```

## Rule 3 — "challenge-script-automation" (action: **Managed Challenge**)

```
(http.user_agent contains "python-requests" or http.user_agent contains "python-httpx" or http.user_agent contains "aiohttp" or http.user_agent contains "Scrapy" or http.user_agent contains "Go-http-client" or http.user_agent contains "node-fetch" or http.user_agent contains "axios" or http.user_agent contains "okhttp" or http.user_agent contains "libwww" or http.user_agent contains "Java/" or http.user_agent contains "HeadlessChrome" or http.user_agent contains "PhantomJS" or http.user_agent contains "Puppeteer" or http.user_agent contains "Playwright" or http.user_agent contains "curl/" or http.user_agent contains "Wget" or http.user_agent eq "")
```

Managed Challenge (not Block): a rare legitimate tool passes the challenge; harvest scripts cannot.

## Rule 4 — "rate-limit-catalog" (Rate limiting rule)

- **If incoming requests match:**
  ```
  (http.request.uri.path matches "^/(excavator|backhoe-loader|crane|compactor|self-loading-concrete-mixer|compare|blog)/") and not cf.client.bot
  ```
- **Rate:** more than **60 requests / 1 minute** per IP  *(free plan: use 10s window ≈ scale to >10/10s)*
- **Action:** Managed Challenge, duration 1 hour.

Humans browse ~a few pages/min. Only harvesters sweep the catalog faster.

## Rule 5 — "block-known-offender" (action: **Block**) — fill in after identifying the scraper

Identify in **Security → Events** + Cloudways access logs: one IP/ASN walking catalog URLs
sequentially. Then:

```
(ip.src in {203.0.113.0/24 198.51.100.7}) or (ip.src.asnum eq 64496)
```

(Replace with the real ranges/ASN. Prefer ASN if the IPs rotate within one provider.)

---

## Super Bot Fight Mode settings (Pro plan) — Security → Bots

| Setting | Value | Why |
|---|---|---|
| Verified bots | **Allow** | The entire allowlist rides on this |
| Definitely automated | **Managed Challenge** (escalate to Block after 2 clean weeks) | Watch Events first — don't hard-block day 1 |
| Likely automated | Allow initially | Too noisy to challenge blindly |
| Static resource protection | Off | Breaks image hotlink exceptions |
| **"Block AI bots" toggle** | **OFF — never enable** | It blocks GPTBot/ClaudeBot/CCBot = kills the GEO channel |

## Weekly check (first month)

Security → Events → filter user-agent `GPTBot`, `PerplexityBot`, `ClaudeBot`, `Googlebot`, `Bingbot`:
**expect zero Block/Challenge events for these.** Any hit = a rule is mis-scoped; fix same day.
