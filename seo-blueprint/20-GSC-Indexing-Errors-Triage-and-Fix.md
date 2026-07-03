# 20 — GSC Indexing Errors (3 Jul 2026): Triage & Fix Runbook

> On 3 Jul 2026 Search Console sent three notifications for `https://desimachines.com/`:
> **(1) "Indexed, though blocked by robots.txt" (new reason)**, **(2) "Some fixes failed: Page with redirect"**, **(3) "Soft 404" (new reason)**.
> **Verdict: none is a penalty or site-wide deindexing.** One is urgent-ish (robots.txt — it can hide the Batch 1+2 CTR rewrites from Google), one is informational (redirect validation), one needs a page-by-page review (soft 404).
> This file is the complete fix runbook. The companion tooling lives in `data/robots-recommended.txt` and `data/gsc-error-audit.sh`.

## 0. TL;DR

| # | Notification | Severity | Most likely cause here | Fix (short) | Owner | Time |
|---|---|---|---|---|---|---|
| 1 | Indexed, though blocked by robots.txt | 🟠 Fix this week | A new `Disallow` added to robots.txt (likely while implementing the `14` "cut crawl bloat" item, or via RankMath's robots editor) now blocks URLs that are already indexed | Diff robots.txt; unblock real pages; for junk URLs switch from robots-block to `noindex` | Dev | 1–2 h |
| 2 | Fix failed: Page with redirect | 🟢 Informational | "Validate fix" was clicked on a status that includes *intentional* redirects, so validation can never fully pass | Clean redirecting URLs out of the sitemap + internal links; stop re-validating | Dev | 1–2 h |
| 3 | Soft 404 | 🟡 Review list | Thin/empty pages returning 200 — on this site most likely near-empty model/compare/archive pages (the audit found 1,365 orphans and ~37k low-value URLs) | Per URL: expand content, or return real 404/410, or `noindex` | Content + Dev | ½ day |

**Golden rule that connects #1 and the crawl-bloat cleanup:** `robots.txt` **blocks crawling, not indexing**. A URL blocked by robots.txt can stay in the index for months (as a "zombie" result with no snippet). To *remove* junk URLs from the index they must be **crawlable + `noindex`**. Blocking them in robots.txt before they're deindexed causes exactly the "Indexed, though blocked by robots.txt" warning we received.

---

## 1. What was verified vs. assumed

- **Verified:** the three notifications (screenshots, 3 Jul 2026); the site's prior crawl/GSC baseline in `13`/`14` (49,237 crawled URLs vs ~11,996 indexable; 1,365 orphan pages; ~200 noindex pages; 10× 5XX; 8× 4XX; 5 canonicals pointing at 5XX — all pulled live 26 Jun 2026).
- **Not verifiable from this session:** the current live robots.txt and the per-URL example lists inside each GSC report. The site's WAF returns 403 to requests from this cloud environment, and the Ahrefs/Semrush API plans available to this session no longer expose the crawl/GSC endpoints. **That's why `data/gsc-error-audit.sh` exists — run it from any machine that can open the site in a browser (your laptop or the server), and it produces the exact URL lists this runbook needs.**

---

## 2. Error 1 — "Indexed, though blocked by robots.txt" 🟠

**What it means.** Google has URLs in its index that robots.txt now forbids it to crawl. It arrived as a *new reason*, so a robots.txt change went live recently — almost certainly during the RankMath work (RankMath → General Settings → **Edit robots.txt**) or the `14` Priority-2 "cut crawl bloat" implementation.

**Why it matters now.** While blocked, Google cannot re-crawl those pages — so it cannot see the new titles/descriptions/schema from Batch 1+2 on any affected URL, and their snippets degrade to "No information is available for this page."

**Fix — decision tree per affected URL** (get the list from GSC → Indexing → Pages → "Indexed, though blocked by robots.txt", or from the script's `report-robots-blocked.csv`):

1. **Real page (model / category / blog / compare)** → the Disallow rule is a mistake. Remove or narrow the rule in robots.txt. Then GSC → URL Inspection → Request indexing for the top ones.
2. **Junk URL that should disappear from the index (filter/sort params, internal search, tag archives, feed URLs)** → do **not** keep it robots-blocked yet. Sequence matters:
   - **Step A:** remove the Disallow (make it crawlable again) and serve `<meta name="robots" content="noindex,follow">` on those URLs (RankMath does this per taxonomy/archive type under Titles & Meta, and for parameter URLs via your theme/plugin).
   - **Step B:** wait until GSC shows them moved to "Excluded by 'noindex' tag" (typically 2–6 weeks as Google recrawls).
   - **Step C:** *then* (optionally) re-add the Disallow to save crawl budget. Robots-blocking only *after* deindexing is the correct order.
3. **Junk URL nobody searches for and that has no index entry worth cleaning** → leaving it blocked is acceptable; the warning for those rows is cosmetic.

**Reference file:** `data/robots-recommended.txt` is a known-safe robots.txt for this site. **Do not paste it blindly** — diff it against the live one and keep any intentional rules; the point is that it contains *no* rule matching money-page paths (`/excavator/`, `/backhoe-loader/`, `/crane/`, `/compactor/`, `/self-loading-concrete-mixer/`, `/blog/`, category hubs).

**Hard guardrail:** none of the 63 Batch 1+2 URLs in `data/ctr-rewrites-rankmath.csv` may match any Disallow rule. The audit script checks exactly this and fails loudly if violated.

**Validate:** GSC → Settings → robots.txt report (shows the fetched file and parse errors) → then the Pages report's "Validate fix" **once**, after the robots.txt change is live.

---

## 3. Error 2 — "Some fixes failed: Page with redirect" 🟢

**What it means.** Someone clicked "Validate fix" on the *Page with redirect* status. Google re-checked the sample and found URLs that still redirect — so the validation "failed." **"Page with redirect" is not an error**: it is Google saying "this URL 301s somewhere, so I indexed the destination instead." For intentionally redirected old URLs that is the desired end state, and a validation on it will *keep* failing forever. That email is process noise, not a new problem.

**When it does matter:** only if a URL you *want* indexed is redirecting (e.g. an http→https or trailing-slash variant chain on a live page, or a model page accidentally 301'd to its category).

**Fix — hygiene pass (this is what actually makes the report shrink):**

1. **Sitemap must list only final, 200-status, self-canonical URLs.** Every redirecting URL listed in the XML sitemap re-feeds "Page with redirect" forever. The script's `report-redirects.csv` lists every sitemap URL that returns 3xx and where it points; replace each with its destination in the sitemap (RankMath regenerates sitemaps automatically once the underlying permalink/canonical settings are right — usually it's stale manual entries or an http/non-www variant sitemap that's at fault).
2. **Internal links should point at final URLs** — the `14` audit already flagged 330 pages linking to broken/redirecting targets; fix the top offenders while in there.
3. **Kill redirect chains** (old → interim → final). One hop max.
4. **Then stop.** Don't click "Validate fix" on this status again. Let intentional redirects sit in the report; that is normal for a 16-month-old site with retired model pages.

---

## 4. Error 3 — "Soft 404" 🟡

**What it means.** Some pages return HTTP 200 but look empty or error-like to Google, so it treats them as 404 and drops them from the index. On this site the likely candidates (consistent with the `14` audit: 1,365 orphans, ~37k low-value URLs, auto-generated compare pages):

- near-empty **model pages** (spec table never filled, no price data),
- **auto-generated compare pages** with no real content,
- empty **category/brand archives** ("No machines found"),
- internal **search-result pages** with zero results,
- pages whose content loads only via JS and renders empty for Googlebot.

**Fix — decision tree per affected URL** (list from GSC → Pages → "Soft 404", or the script's `report-soft404-candidates.csv`):

1. **Page should rank (a real model/category)** → fill it: spec table, price band, EMI line, 2–3 FAQ blocks (the `15` template). Then Request indexing. If the page is content-complete but flagged anyway, check it renders server-side (view-source must show the content without JS — same check as `17` §4).
2. **Page is genuinely dead** (discontinued model with no successor, empty auto-page) → return a real **404/410**, or 301 it to the closest successor/category **only if** that target genuinely covers the intent (blanket-redirecting everything to the homepage/category *causes* more soft-404 flags).
3. **Page must exist for users but not for Google** (zero-result search pages, empty filtered views) → `noindex,follow`.

**Guardrail:** as with Error 1, confirm none of the 63 priority URLs is in the Soft-404 list. If one is, treat it as case 1 — top priority.

---

## 5. The audit script — `data/gsc-error-audit.sh`

Run from **any machine that can open desimachines.com in a browser** (laptop is fine; needs `bash` + `curl`):

```bash
cd seo-blueprint/data
bash gsc-error-audit.sh                      # defaults to https://desimachines.com
# or: bash gsc-error-audit.sh https://desimachines.com ctr-rewrites-rankmath.csv
```

It produces, in `./gsc-audit-out/`:

| File | Contents | Feeds which fix |
|---|---|---|
| `robots.txt` | The live robots.txt, verbatim | §2 — diff against `robots-recommended.txt` |
| `report-robots-blocked.csv` | Every sitemap + priority URL matched by a Disallow rule (rule shown) | §2 decision tree |
| `report-redirects.csv` | Every sitemap URL returning 3xx, with target | §3 step 1 |
| `report-errors.csv` | Sitemap URLs returning 4xx/5xx | `14` Priority-5 hygiene |
| `report-soft404-candidates.csv` | 200-status pages with error-like titles or <120 words of text | §4 decision tree |
| `summary.txt` | Counts + pass/fail on the 63-priority-page guardrails | Everything |

The script is read-only against the site (GET/HEAD requests only, throttled); it changes nothing.

---

## 6. Order of operations

1. Run the audit script → get the four CSVs. *(½ h)*
2. Fix robots.txt (§2), deploy, check GSC robots.txt report. *(same day)*
3. Re-run `apply`-side checks: none of the 63 priority pages blocked; Request indexing on the top 15 (per `17` §4). *(same day)*
4. Sitemap/redirect hygiene (§3). *(this week)*
5. Soft-404 list triage (§4) — batch content fixes into the normal content sprint. *(this week)*
6. In GSC click **Validate fix** once on "Blocked by robots.txt" and once on "Soft 404". **Do not re-validate "Page with redirect".** *(5 min)*
7. Check back in 2–4 weeks: both validations should pass or shrink drastically; snippet/CTR measurement continues per `17` §5.

## 7. Why all three arrived together (and why that's reassuring)

Batch 1+2 shipped, indexing was requested, and a fix validation was started — that always triggers a fresh crawl wave, and a fresh wave surfaces indexing statuses in a burst. The notifications are the crawler *reacting to the work*, not a new site problem. The only genuinely new information in them is the robots.txt change (§2) — find that diff and the rest is routine hygiene.
