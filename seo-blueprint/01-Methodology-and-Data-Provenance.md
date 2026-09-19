# 01 — Methodology & Data Provenance

## 1. Evidence grading used throughout this blueprint

Every material claim is tagged so you can trust it appropriately:

| Tag | Meaning | Example |
|---|---|---|
| **[FACT]** | Pulled live from an authenticated data source (Ahrefs API, 25 Jun 2026) or directly observable | "DR 41" |
| **[EST]** | Modeled estimate from a data source's algorithm (e.g. Ahrefs traffic estimates) or a defensible calculation | "~39,070 organic visits/mo" |
| **[ASSUMPTION]** | A reasoned input not yet verified against first-party data — must be confirmed | "current lead conversion ~2%" |
| **[REC]** | A recommendation / judgment call | "Add sticky RFQ bar to all model pages" |

## 2. Data sources actually used

| Source | Status | What it gave us |
|---|---|---|
| **Ahrefs API v3** | ✅ Live, authenticated | Domain Rating, backlinks, referring domains, 2,369 organic keywords, top pages, organic competitors. **Primary source of truth for this document.** |
| Web search / public web | ✅ | Business model, launch history, PR coverage, founder background |
| **Google Search Console** (via Ahrefs project 9518353, verified) | ✅ **Live, connected** | **Real query/page/position/device/country data — see `13`.** The first-party source the brief asked for. |
| **Web Analytics** (GA4-equivalent, Ahrefs project 9518353) | ✅ **Live, connected** | **Real sessions, bounce, channels incl. LLM/AI, engagement — see `13`.** |
| Google Sheet #1 (Website/Internal) | ❌ **HTTP 403** | Sheet itself inaccessible (`drivesdk` needs auth), **but its underlying GSC/GA4 data is now available directly via the connected Ahrefs project (`13`)** — gap largely closed. |
| Google Sheet #2 (Competitor DB) | ❌ **HTTP 403** | Still inaccessible; competitor analysis built from Ahrefs organic-competitors instead (`05`). |
| Live site crawl (desimachines.com) | ⚠️ 403 to fetch bot | Site blocks the unauthenticated fetch agent. Architecture inferred from Ahrefs' crawled URL inventory + GSC pages (reliable for structure). |
| CRM / lead events (GA4 conversions) | ➖ Not yet wired | The one remaining gap — actual enquiry/RFQ/call counts. Instrument in Week 1 (`08` §5) to calibrate the lead model (`10`). |

### Why the Google Sheets matter and what to do
The brief names those two sheets as the **primary source of truth** (GSC queries, GA4 conversions, competitor research). They are the missing piece for two things only first-party data can give:
1. **True conversion baseline** — actual enquiries/RFQs/calls per month and per page (GA4 events / CRM).
2. **Query-level CTR & impressions** from GSC (the real "position 4–20 with high impressions, low CTR" list).

**To upgrade this blueprint from "elite estimate" to "elite + first-party-calibrated," do one of:**
- Set the two sheets to *"Anyone with the link → Viewer"* and re-share, **or**
- Export each tab to CSV and add to this repo under `/seo-blueprint/data/`, **or**
- Connect the GA4 + GSC properties to the Ahrefs project so the GSC API tools light up.

I have built the lead model in `10` to **slot real numbers in directly** — every estimate has a labeled assumption you can overwrite.

## 3. Geographic & market scope
All keyword/traffic figures are **India (country=in)** unless noted, because that is the entire commercial market for DesiMachines. Volumes are Ahrefs India volumes.

## 4. Tooling note
Ahrefs, SEMrush, and GSC MCP tools were available. Ahrefs was used as the primary engine. SEMrush and the GSC-specific tools were intentionally not spammed to conserve API units and because (for GSC) no linked property exists; they remain available for the team to deepen any section on request.

## 5. Refresh cadence recommendation [REC]
- Re-pull the live snapshot (`02`) **monthly** to track DR, top-3 count, and traffic.
- Re-run the position 4–20 harvest list (`04`) **fortnightly** during the 90 days — it changes fast at this site's velocity.
- Re-audit the backlink profile (`07`) **monthly** until the toxic cluster is disavowed and stable.
