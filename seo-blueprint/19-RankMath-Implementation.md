# 19 — Implementing the CTR Fix in WordPress + RankMath

> desimachines.com runs on **WordPress with RankMath**. RankMath stores per-page SEO title/description in two post-meta keys — `rank_math_title` and `rank_math_description` — and schema via its Schema module. That gives three implementation paths, fastest first. The rewrites are pre-exported to **`data/ctr-rewrites-rankmath.csv`** (63 pages, Batch 1 + 2).

> **Note:** I still can't reach your WordPress from this session (no SSH/Cloudflare creds are provisioned here — verified). Everything below is ready for your team to run, or for me to run **if** SSH access is provisioned into the environment later.

---

## Path 1 — Sitewide title/description **templates** (fastest, fixes the bulk, RankMath free)

This fixes the ~10k over-long titles and ~12k missing/over-long descriptions **at the template level**, instantly, for every current and future page. Do this **first**.

**WP Admin → RankMath → Titles & Meta →** for each relevant post type (e.g. your equipment/model CPT, plus Categories):

- **Single Post (model pages) — Title template:**
  `%title% Price in India %currentyear% – Specs, EMI & Offers`
  *(If `%title%` already contains "Price"/"India", use `%title% %currentyear% – Specs, EMI & Offers` to avoid duplication. Keep the rendered title ≤60 chars — RankMath shows a live pixel meter.)*
- **Single Post — Description template:**
  `%title% price in India (%currentyear%): on-road price, specs, mileage & EMI. Get deals, finance & insurance — free on DesiMachines.com.`
- **Category/Archive — Title:** `%term% Price in India %currentyear% – Models & EMI`
- **Category/Archive — Description:** `%term% price in India (%currentyear%): compare models by price, specs & EMI. Get deals, finance & insurance on DesiMachines.com.`
- Turn **OFF** any setting that auto-appends `%sep% %sitename%` if it pushes titles past 60 chars (or shorten the template).

✅ Result: every page gets a correct, non-truncated, CTA-bearing title + description with zero per-page work. The per-page overrides in Path 2 then refine your **highest-impression** pages.

---

## Path 2 — Per-page **overrides** for the priority pages (the exact Batch 1+2 copy)

The CSV `data/ctr-rewrites-rankmath.csv` has `url, rank_math_title, rank_math_description` for the 63 top pages. Pick the method that fits your RankMath tier:

### 2a. RankMath PRO — CSV bulk import (easiest)
**RankMath → Status & Tools → Import & Export → "Import in Bulk" / CSV Import** → upload `ctr-rewrites-rankmath.csv`.
- RankMath matches rows to posts by **URL** and writes `rank_math_title` / `rank_math_description`.
- Run on staging first; spot-check 5 pages; then production.

### 2b. WP-CLI over SSH (works on free + PRO, no plugin features needed)
Use the script **`data/apply-rankmath-meta.sh`** (in this repo). It reads the CSV, resolves each URL → post ID via WordPress's own `url_to_postid()`, and sets the two meta keys. Dry-run first:
```bash
# on the server, in the WP root:
bash apply-rankmath-meta.sh ctr-rewrites-rankmath.csv --dry-run   # preview
bash apply-rankmath-meta.sh ctr-rewrites-rankmath.csv             # apply
```

### 2c. RankMath free, no SSH — manual
Open each page in the editor → **RankMath "Edit Snippet"** → paste Title and Description from the CSV. Only ~63 pages; an afternoon. Do the top 10 (highest impressions) first.

---

## Path 3 — Schema (clears the 510 schema errors, wins price/FAQ rich results)

In RankMath, schema is per-post-type via the **Schema Generator** (or PRO Schema templates with display conditions):

1. **RankMath → Titles & Meta → (model CPT) → Schema Type = `Product`.** Map fields to your existing data:
   - Price → a **price range** (use your price-low / price-high custom fields; never a fake single price).
   - Brand, Name, Image → existing fields. Currency `INR`. Availability `InStock`.
   - **Seller / Organization = DesiMachines.com** (you're the OEM-connected channel).
2. **FAQ:** add the **RankMath FAQ Block** to the model template (or a Schema FAQ) with the buyer Qs from `15` — first answer dated + ₹-specific + ending on DesiMachines.com (AI-Overview-quotable).
3. **Validate** a sample of 5 pages in **Google Rich Results Test** → must show **0 errors** before scaling. This is what clears the 510 schema-validation errors from the audit.
4. Add `BreadcrumbList` (RankMath → General → Breadcrumbs, enable + insert in template) — also helps the orphan/internal-linking fix in `18`.

---

## Order of operations (recommended)
1. **Path 1 templates** → instant sitewide baseline fix.
2. **Path 2 (2a or 2b)** → override the 63 priority pages with the tuned copy (start with the top-impression Section A pages from `15`/`16`).
3. **Path 3 schema** on the model CPT.
4. **GSC → URL Inspection → Request indexing** for the top ~15 pages to speed re-crawl.
5. **Measure** CTR by page at week 2 + 4 (`17` checklist). Then let Path 1 templates carry the long tail.

## QA (don't skip — from `17`)
- Live pixel-meter check: every title ≤60 chars on **mobile** width (84% of your traffic).
- Confirm titles/meta are in the **server HTML** (View Source / GSC "View crawled page"), not JS-only.
- Self-canonical intact; don't let a price-variant URL canonical away an optimized page.
- Back up the DB before any bulk import or WP-CLI run.
