# g5_hyundai_volvo_kobelco_minis – research notes (checked 2026-11-04)

Output: `parts/g5_hyundai_volvo_kobelco_minis.csv` (1,061 rows, 89 of 89 models have at least capacity/engine rows; 79 models have at least one part-number row).
Confidence mix: High 104 / Medium ~745 / Low ~213. Every row carries the URL actually read. "spec" rows (capacities, battery, track shoe, tyre size) come from the DesiMachines model pages (OEM brochure data) unless stated otherwise.

## Sources used, per brand

**Bobcat (strongest coverage)**
- Bobcat EU "Excavator filter & maintenance kits" reference guide B4501630-EN (04-22): https://api.bobcat.eu/media/serve/42883 – OEM document, per serial-number prefix. Used for E20z (B4PH), E27 (B4BA), E50z (B4HT).
- Bobcat EU "Loaders filter & maintenance kits" guide (05-20): https://api.bobcat.eu/media/serve/29809 – S70 (B38V/B38W), S450 (AV9V/B1E6 Kubota V2203 and later B4J7 Bobcat engine), S770 (B3BV).
- Bobcat S590 T4 maintenance chart (AR9R11001 & above): https://www.scribd.com/document/666620061/s590-t4-Maintenance-Chart-1 (incl. belts, battery 7269857, tyre options).
- Cross-references: https://mowersweb.com/bobcat-filter-cross-reference-chart/ (Baldwin/Fleetguard/WIX/Donaldson).
- E37 Ultra HD / Xtra HD: no document names the E37; rows are INFERRED (Low) from the Bobcat E34 (B3Y3-11001, Kubota D1803) maintenance-items list at chronotp-pieces.fr. shop.bobcat.com supersessions: 7012303 -> 7343102 (oil), 7023589 -> 7400454 (fuel), 7319444 -> 46923666.
- **Gap:** Bobcat E30 (India model, Kubota D1305) – no public filter list found; E27 (B4BA) numbers are the likely match but were NOT written. Bobcat E37 Xtra HD has no DesiMachines page, so no capacity rows.
- "CAT 424" is listed under brand Bobcat in the model file but is a Caterpillar India backhoe (DesiMachines page /backhoe-loader/caterpillar-cat-424/). Filter numbers come from Cat's 415-450 parts reference guide (current C3.6-engined 415/416/420/430); the 424 is not named -> Medium, verify by serial with Gmmco/Gainwell.

**Yanmar**
- Official Yanmar dealers (Machine Serve UK, MTS Plant UK) genuine service-kit contents: ViO50-6B 500h/1000h kits (High), ViO33-6/ViO38-6 kit (used to corroborate ViO35-6/ViO30-6B numbers), genuine air filter 119808-12520 (ViO25-6/6B named).
- Yanmar USA maintenance-kit page (kit contents, no numbers) + Quality Equipment & Parts KIT-VIO35-6NO contents (fits ViO35-6/6A -> Medium for ViO35-6B, Low for ViO30-6B).
- MANN+HUMMEL excavator guide (ViO20/ViO25 3TNV76: W 67/1, P 4001/P 45, C 1196/2) for ViO20-6/ViO25-6 (engine-level, Medium).
- **Verify:** India ViO20-6/ViO25-6/ViO30-6B/ViO35-6B genuine Yanmar numbers were not found in a kit that names the "-6B" India variants explicitly except the air filter.

**Hyundai**
- Engine/capacity data: DesiMachines pages for all 23 models (R210/R215 family = Cummins 6BT5.9-C; R215L/R220LS/R230LM = 6BTAA-5.9C; R85A/R130/R140L/R150L = Kirloskar 4R1040NA/T; HX360L/HX380L = HCEC HM8.3; HX520L = Cummins X12; R340L = Hyundai D6AC-C1; HX30AZ/R30Z-9AK = Kubota D1305; HX35AZ = Kubota D1703; HL630I-V/HL930I = Weichai WP4.6N; HL650I-V = Weichai WP8G; HL950I = Weichai WP7G).
- R210/R215/R220LS/R230LM/R245LR SMART (Plus/X Plus): Indian sellers quoting OEM numbers for "R210/R215" (IndiaMART North East Overseas: 11N6-24520/24530 air, E131-0212 hydraulic; sealkits.in Raipur: E131-0212/31E3-0212) plus the R210LC-7 filter table (Ankon Group) and Cummins B5.9 numbers (11E1-70010 = 3931063/FF5052, 11E1-70210 = 3930942/FS1280, 11E1-70140 = 3932217/LF3349). The India SMART-series parts catalogue is not public; HD Hyundai India brochure (in.hd-hyundaice.com/uploads/r215-smart-x-plus.pdf) has no part numbers. Hyundai operator manuals for India models exist on hd.buyaftermarketparts.com (folder "2. India", e.g. RD220LS) but could not be opened (crawl timeouts) – publisher should open the "6-1 Maintenance" chapter for R210/R215 Smart to confirm.
- Kirloskar 4R1040 machines: KOEL parts lists (oil filter 06.436.01.0.00, twin-bowl fuel filter 3H.132.10.0.00, belt XPA1250) – engine-level, Low.
- HX520L: HIFI pack (cotrac.fr) gives hydraulic OEM numbers (31N4-01460, E131-0214, 31Q6-20340, 31K6-01320) – EU HX520L uses Scania DC13; India uses Cummins X12, so engine filters not covered.
- HL930I/HL950I/HL630I-V: Weichai engine-family numbers from a Weichai service table (sinosoon.com) – Low. **Gaps:** HX360L/HX380L (HM8.3) and HL650I-V (WP8G) – no public filter numbers found.

**Volvo**
- Volvo authorised dealer (Peru) genuine PM kit for EC380D/EC480D/EC750D/EC950E: 2x21707133 + 21707132 + 15126069 + 11110683 (High for 380D/480D).
- VMP Spares (Volvo CE parts, serial-range tables): 15035179 pilot element (EC120D/140D/200D/210D), 14622355 fuel pre-filter element (EC200D…EC950E), 14509379 return element (EC200D).
- Fortis (Volvo dealer, IE) EC210D/EC200D/EC480D parts pages; BA Trading (SE) L120H and EC220D pages; Kespa (SE) L90H page; Broken Tractor and b2bcogito fit lists; IndiaMART Kolkata sellers for 17500251/17500253 and 17500260/17500263 air filter sets.
- EC550E, L150H/L180H/L220H/L260H/L350H oil filters are INFERRED from D13/D16 kits (Low). EC220 (India, D5E) inferred from EC210D (Low).
- **Gaps:** EC210 / EC215 (VECV E494 engine), SD110 / DD90 / PT220 compactors (VECV E483/E494 CEV-V engines) and EC500 Electric – no public filter numbers found; VECV engine numbers exist only in Eicher truck catalogues (not mapped to these machines). EC350D only has 14622355.

**Kobelco**
- Kobelco India brochure SK220-10/SK220XD-10/SK220XDLC-10 (capacities, battery) – High.
- Filter numbers for the Hino J05E family from Lucas Parts (YN21P01157R100, names SK200-10/SK210LC-10), Inline Filters and FridayParts SK200-8/SK210-8 kits – India SK220-10 not named (Medium/Low).
- SK850LC: it is the Komatsu PC800-8 platform (SAA6D140E-5); Komatsu PC800-8 operator-manual wear-parts list used (Medium).
- SK80: Kobelco EPC filter list for SK75-8/SK75SR-7 (Yanmar) via winsparts.com (Low). SK30SR/SK35SR: Lucas Parts return filter YR52V01004R300 names SK30SR-6E/SK35SR-6 (Medium); engine filters only via MANN cross-reference for 3TNV82A (Low).
- SK140/SK145XDLC: Isuzu 4JJ1 engine-level numbers only (Low). SK380XDLC/SK520XDLC: weak (Low) – Kobelco India parts catalogue S3LCB0003ZE10 (SK380XDLC-10 MINE INDIA) exists but is paywalled.

**Leeboy** – DesiMachines pages (523/525M Cummins 6BTA5.9 BSII; 525E QSB6.7). No Leeboy India parts catalogue online; Cummins/Fleetguard engine-level numbers only (LF3349/FF5052/FS1280; LF16015/FF5612/FS19732) – Medium.

**Fine Equipments** – DesiMachines pages (FM20 Kubota D1105, FM38 Kubota D1703, FMG130/180 Ashok Leyland H4C4/H6C4 BS-IV, FMG585HD Ashok Leyland 4-cyl CRDI, FMG985HD Cummins QSB6.7 CEV-IV). Only engine-level numbers: Kubota oil-filter guide (HH164-32430 / HH150-32094), Leyparts fuel filters FHJ00700 / PHJ00004 (H-series), Fleetguard QSB6.7 numbers. No Fine parts list online.

## Things the publisher must verify before publishing
1. All "Low" rows (213) – most are engine-level or sibling-model inferences; fitment_notes say exactly which model the source names.
2. Hyundai SMART-series numbers vs the Hyundai India operator manual (hd.buyaftermarketparts.com "2. India" folder) or HD Hyundai India dealer (toll-free 1800 209 8600).
3. Volvo EC210D/EC200D secondary fuel filter: sources disagree (20805349 kit listing vs MANN 8193841 on Fortis page); air filter set differs by serial (11110175/176 early vs 17500251/253 later).
4. Bobcat S450: two serial generations (Kubota V2203 vs Bobcat engine) – India spec per DesiMachines is Kubota V2203 (AV9V/B1E6 numbers).
5. Kubota oil filter for D1105/D1305: Kubota industrial guide lists HH160-32093 for 05-series while dealers list HH150-32094 – confirm by engine spec plate.
6. CAT 424 rows are taken from the Cat 415-430 (C3.6) guide.
7. Capacities for Hyundai SMART Plus vs SMART X Plus differ slightly between DesiMachines pages (e.g. hydraulic system 260 vs 280 L); they are copied as published.

## Best source URLs
1. https://api.bobcat.eu/media/serve/42883 (Bobcat excavator filter & maintenance kits, OEM)
2. https://api.bobcat.eu/media/serve/29809 (Bobcat loader filter & maintenance kits, OEM)
3. https://volvorepuestos.com.pe/kit-de-mantenimiento-preventivo-bombona-pe1-20001277.html (Volvo dealer genuine kit EC380D/EC480D/EC750D/EC950E)
4. https://www.vmpspares.com/product/voe-14622355-filter-element/ (Volvo CE parts with serial-range compatibility tables; also /voe-15035179-filter-element/ and /voe-14509379-filter-element/)
5. https://machineserve.co.uk/product/yanmar-genuine-service-kit-500hr-vio50-6a-2/ and https://store.mtsplant.co.uk/shop/plant-spares/filter-kits/service-kit-1000h-vio50-6b/ (official Yanmar dealers, ViO50-6B kit contents)
6. https://www.kobelco-in.com/wp-content/uploads/2025/11/SK220-SK220XD-SK220XDLC-India.pdf (Kobelco India brochure, capacities)
7. https://www.easymanua.ls/komatsu/pc800-8/manual?p=231 (Komatsu PC800-8 wear parts list – basis for SK850LC)
8. https://www.indiamart.com/northeastoverseas/air-filter.html and https://sealkits.in/product/it30849/ (Indian sellers quoting Hyundai R210/R215 OEM numbers)
