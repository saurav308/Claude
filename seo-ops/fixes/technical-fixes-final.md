# Technical fixes — finalized, deployable content (2026-09-05)

Completes `semrush-audit-fix-package.md` (2026-08-27) and `ahrefs-site-audit-fix-package.md` (2026-08-28) with actual ship-ready copy instead of specs. **Re-verified today: none of these have been applied** — a fresh Ahrefs crawl check (same 2026-08-28 snapshot, no recrawl since) confirms the dozer 404s (518 URLs), motor-grader broken images (283 URLs), and missing alt text (20,027 pages) are all still present, unchanged in count. **S-EXEC, the session chartered to apply these, no longer exists** (its session ID returns "not found" — likely reclaimed after 8+ days idle). These fixes need a new execution path: either WP access handed directly to whoever picks this up, or routed to one of the account's other active DesiMachines sessions (see the registry update for the full finding).

---

## Semrush F5 — 16 duplicate compare-page titles, corrected

The generator drops the distinguishing model token (Plus/Smart-X/BS-series) when two variants share a base name. Corrected titles below preserve the distinguishing token and stay in the site's established `X vs Y: question-format` pattern (confirmed live on 2 of 3 sampled compare pages back in August).

| URL | Corrected title |
|---|---|
| `/compare/case-770-ex-vs-manitou-mbl-745-ht-backhoe-loader/` | Case 770 EX vs Manitou MBL 745 HT: Which Backhoe Loader Wins? |
| `/compare/hyundai-r215-smart-plus-vs-xcmg-xe250lc-k-excavator/` | Hyundai R215 Smart Plus vs XCMG XE250LC-K: Excavator Compared |
| `/compare/jcb-3dx-super-vs-manitou-mbl-745-ht-plus-backhoe-loader/` | JCB 3DX Super vs Manitou MBL 745 HT Plus: Backhoe Loader Compared |
| `/compare/jcb-3dx-vs-manitou-mbl-745-ht-backhoe-loader/` | JCB 3DX vs Manitou MBL 745 HT: Which Backhoe Loader to Buy? |
| `/compare/hyundai-r220ls-smart-plus-vs-liugong-922ea-alpha-excavator/` | Hyundai R220LS Smart Plus vs LiuGong 922E-A Alpha: Excavator Compared |
| `/compare/bull-sd76-bs5-super-smart-vs-jcb-3dx-super-backhoe-loader/` | Bull SD76 BS5 Super Smart vs JCB 3DX Super: Backhoe Loader Compared |
| `/compare/hyundai-r220ls-smart-x-plus-vs-liugong-922ea-alpha-excavator/` | Hyundai R220LS Smart-X Plus vs LiuGong 922E-A Alpha: Excavator Compared |
| `/compare/case-851-nx-vs-manitou-mbl-745-ht-backhoe-loader/` | Case 851NX vs Manitou MBL 745 HT: Backhoe Loader Compared |
| `/compare/jcb-3dx-super-vs-manitou-mbl-745-ht-backhoe-loader/` | JCB 3DX Super vs Manitou MBL 745 HT: Which Backhoe Loader Wins? |
| `/compare/bull-sd76-bs4-champion-vs-jcb-3dx-super-backhoe-loader/` | Bull SD76 BS4 Champion vs JCB 3DX Super: Backhoe Loader Compared |
| `/compare/ace-phantom-4wd-vs-manitou-mbl-745-ht-plus-backhoe-loader/` | ACE Phantom 4WD vs Manitou MBL 745 HT Plus: Backhoe Loader Compared |
| `/compare/jcb-3dx-vs-manitou-mbl-745-ht-plus-backhoe-loader/` | JCB 3DX vs Manitou MBL 745 HT Plus: Which Backhoe Loader Wins? |
| `/compare/ace-phantom-4wd-vs-manitou-mbl-745-ht-backhoe-loader/` | ACE Phantom 4WD vs Manitou MBL 745 HT: Backhoe Loader Compared |
| `/compare/hyundai-r215-smart-x-plus-vs-xcmg-xe250lc-k-excavator/` | Hyundai R215 Smart-X Plus vs XCMG XE250LC-K: Excavator Compared |
| `/compare/case-770-ex-vs-manitou-mbl-745-ht-plus-backhoe-loader/` | Case 770 EX vs Manitou MBL 745 HT Plus: Backhoe Loader Compared |
| `/compare/case-851-nx-vs-manitou-mbl-745-ht-plus-backhoe-loader/` | Case 851NX vs Manitou MBL 745 HT Plus: Backhoe Loader Compared |

Apply via the same RankMath `rank_math_title` mechanism as the July batch. Each title is now unique — verify with a duplicate-title check before/after.

---

## Ahrefs F3 — sitewide alt-text fix, complete mapping (~57 shared images)

**Root cause (confirmed via raw HTML inspection, 2026-08-28):** every shared template image — logo, category nav icons, UI icons, all bank/insurance partner logos — carries `alt=""`. Because these render on nearly every page, this one fix collapses the 20,027-page warning count by the large majority. This is a **mechanical transformation** (filename → readable name + context), safe to apply as a lookup table rather than hand-editing each image.

**Logo:**
| File | Alt text |
|---|---|
| `cropped-desi-machines.webp` | Desi Machines logo |

**Category nav icons** (`/wp-content/uploads/2026/01/*.webp`):
| File | Alt text |
|---|---|
| `ex-1.webp` | Excavator category icon |
| `bl-1.webp` | Backhoe loader category icon |
| `mg-1.webp` | Motor grader category icon |
| `wl-1.webp` | Wheel loader category icon |
| `crane-1.webp` | Crane category icon |
| `roller-1.webp` | Road roller / compactor category icon |
| `sl.webp` | Self-loading concrete mixer category icon |
| `cn.webp` | Concrete pump category icon |
| `concrete-pump-icon-1.png` | Concrete pump icon |
| `desi-machines-telehanlder-small-icon.png` | Telehandler category icon |

**UI icons** (`/wp-content/themes/construction-equipments/assets/img/product/*`):
| File | Alt text |
|---|---|
| `add-to-cart.png` | Add to compare |
| `download.png` | Download brochure |
| `medal.png` | Verified listing badge |
| `userImg.png` | User profile placeholder |

**Bank & finance partner logos** (`/wp-content/uploads/2024/12/*` and `2026/*` — pattern: filename → "`<Bank Name>` logo"; apply this rule to every remaining partner logo not listed individually below, since the transform is fully mechanical):
| File | Alt text |
|---|---|
| `aditya-birla-capital-logo.png` | Aditya Birla Capital logo |
| `au-small-finance-bank-logo.png` | AU Small Finance Bank logo |
| `axis-bank-logo.png` | Axis Bank logo |
| `bajaj-finserv-logo.png` | Bajaj Finserv logo |
| `bandhan-bank-logo.png` | Bandhan Bank logo |
| `bank-of-baroda-bank-logo.png` | Bank of Baroda logo |
| `canara-bank-logo.png` | Canara Bank logo |
| `central-bank-of-india-logo.png` | Central Bank of India logo |
| `chola-mandalam-finance-logo.png` | Cholamandalam Finance logo |
| `cnh-capital-logo.png` | CNH Capital logo |
| `hdb-financial-services-logo.png` | HDB Financial Services logo |
| `hdfc-bank-logo.png` | HDFC Bank logo |
| `hinduja-leyland-finance-logo.png` | Hinduja Leyland Finance logo |
| `icici-bank-logo.png` | ICICI Bank logo |
| `idbi-bank-logo.png` | IDBI Bank logo |
| `idfc-bank-logo.png` | IDFC Bank logo |
| `iifl-finance-logo.png` | IIFL Finance logo |
| `kotak-mahindra-bank-logo.png` | Kotak Mahindra Bank logo |
| `mahindra-finance-logo.png` | Mahindra Finance logo |
| `pnb-logo.png` | Punjab National Bank logo |
| `poonawala-fincorp-logo.png` | Poonawalla Fincorp logo |
| `ratnaafin-logo.png` | Ratnaafin logo |
| `sakthi-financial-sercvices.png` | Sakthi Financial Services logo |
| `sbi-logo.png` | State Bank of India logo |
| `shriram-finance-logo.png` | Shriram Finance logo |
| `sundaram-finance-logo.png` | Sundaram Finance logo |
| `tata-capital-logo.png` | Tata Capital logo |
| `ubi-logo.png` | Union Bank of India logo |

**Insurance partner logos** (same mechanical rule → "`<Insurer Name>` logo"):
| File | Alt text |
|---|---|
| `axa-xl-insurance-logo.png` | AXA XL Insurance logo |
| `bajaj-allianz-logo.png` | Bajaj Allianz logo |
| `digit-insurance-logo.png` | Digit Insurance logo |
| `future-generali-insurance-logo.png` | Future Generali Insurance logo |
| `hdfc-ergo-insurance-logo.png` | HDFC ERGO Insurance logo |
| `icic-lombard-logo.png` | ICICI Lombard logo |
| `iffco-tokio-insurance-logo.png` | IFFCO Tokio Insurance logo |
| `kotak-mahindra-insurance-logo.png` | Kotak Mahindra Insurance logo |
| `liberty-insurance-logo.png` | Liberty Insurance logo |
| `magma-hdi-insurance-logo.png` | Magma HDI Insurance logo |
| `national-insurance-logo.png` | National Insurance logo |
| `new-india-insurance-logo.png` | New India Assurance logo |
| `oriental-insurance-logo.png` | Oriental Insurance logo |
| `raheja-qbe-insurance-logo.png` | Raheja QBE Insurance logo |
| `reliance-general-insurance-logo.png` | Reliance General Insurance logo |
| `royal-sundaram-insurance-logo.png` | Royal Sundaram Insurance logo |
| `sbi-general-insurance.png` | SBI General Insurance logo |
| `shriram-general-insurance-logo.png` | Shriram General Insurance logo |
| `tata-aig-insurance-logo.png` | Tata AIG Insurance logo |
| `united-india-insurance-logo.png` | United India Insurance logo |
| `universal-sompo-logo.jpg` | Universal Sompo Insurance logo |
| `cholamandalam-ms-logo.png` | Cholamandalam MS Insurance logo |

**OEM logo:**
| File | Alt text |
|---|---|
| `desi-machines-caterpillar-logo.webp` | Caterpillar logo |

**Implementation:** this is a theme/template-level fix, not per-post content — apply via the theme's image-render function or a one-time DB update matching `src LIKE` the filename patterns above. A single deploy should clear the vast majority of the 20,027-page count; re-run the Ahrefs audit afterward to confirm (target: drop to low hundreds — the residual will be genuine per-product photos still missing alt text, a separate, smaller cleanup).

---

## Reconfirmed unfixed, unchanged since original discovery (no new content needed, just re-flagging status)

- **F1 (Semrush):** nav trailing-slash bug on `/skid-steer-loader` and `/telehandler` menu links → ~21,776 notices. One menu edit. Unconfirmed either way this session (not re-checked).
- **F2 (Semrush):** 169 unpriced products blocking Product rich-result schema. Still 0/169 filled per the 2026-09-04 sheet pull — needs Saurav's price data, cannot be produced by any session.
- **F3 (Semrush):** self-compare page `/compare/manitou-1340r-vs-manitou-1340r-skid-steer-loader/`. Delete + add a `left ≠ right` generator guard.
- **F4 (Semrush):** 9 compare pages with canonicals pointing at never-generated reversed-order URLs — full 9-URL list in `semrush-audit-fix-package.md`, unchanged.
- **Ahrefs F1 — dozer compare-page 404s (518 URLs):** re-verified today, still 100% present, identical pattern. The `/dozer/` hub itself is fully built and live (41 products, real pricing, finance CTAs) — the compare-page generator was simply never run for this category. **This is not a content problem, it's a one-category config/generation gap** — genuinely the fastest fix on this entire list once someone with access looks at it.
- **Ahrefs F2 — motor-grader broken images (283 URLs):** re-verified today, still present. Root cause still not isolated (needs live DOM/CDN access, blocked from this environment both by no WP credentials and by network egress restrictions on live fetches).
- **Ahrefs F4 — compare-template schema errors beyond unpriced products:** unchanged, still needs a dedicated review once F2 (Semrush) ships and the residual schema errors can be isolated.
