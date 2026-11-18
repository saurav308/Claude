# g6_indian_oems – research notes (checked 2026-11-04)

Output: `parts/g6_indian_oems.csv` – 1,364 rows, 165 of 177 listed "models" covered. The 12 uncovered rows in the model list are not machines (see "Junk rows"). Every real model in the group has at least engine identity + service capacities + tyre/battery spec; 66 models also carry OEM/engine-OEM part numbers.

Confidence mix: High 40 / Medium 1,115 / Low 209. "Medium" is the default for DesiMachines/OEM-brochure capacity rows and for single reputable dealer/cross-reference listings. "Low" is used wherever a number was taken from a sibling model, an engine-level catalogue whose machine build is not stated, or a government-tender BOQ that names the engine but not the machine.

## Sources used, per brand

**ACE (46 rows in list, 44 real models)**
- Capacities/tyres/battery: desimachines.com model pages (backhoe-loader, crane, compactor, motor-grader, telehandler, skid-steer-loader, wheel-loader) – ACE brochures as republished there.
- ACE genuine numbers: GeM BOQ (GREF 1071 Field Workshop, Nov 2024) quoting ACE part catalogue "AX124, AX130 & Phantom 4WD Mahindra BS-V" (200593400300 transmission filter, 200593424200/424100 air filters, F002H22025 Bosch fuel cartridge) and the ACE AG 176 grader BOQ (260193505604, 260193537511, 260193422420/410, 955800164600); ACE F150 101 HP build BOQ (003SC2040, 018CE10025, ID002922, ID377754).
- Engine-level numbers: Kirloskar 4R1040 ISPL (06.436.01.0.00 oil filter, 3H.132.10.0.00 fuel filter, 3H.132.01/02.0.00 elements, 4H.069.01.0.00 belt) for AX130/Phantom; Donaldson P550185/P551167 for Simpson S433 cranes (14XW/15XW/15XWE/HXP150); Delphi-TVS 9188-545/9183-462 + VECV 5009275 (Fleetguard LF0905300) + IB999850 filter set for the E483-engined FX 230 / NX 360 20T; Ashok Leyland/Leyparts FPA00300/FHJ01000/FHN00400 for AL-engined cranes; Cummins B/C-series Fleetguard numbers for ALN 300/500.
- Gaps: no ACE machine-level numbers for F170/F210/F230/F250/F270/F350/FP210/FX150/FX210/FX250/FX300/HY130/NX360 15T/NXP150/Rhino 90C/110C/SX150/TX130/SS75/AT30/ADD-95/ASD115/ALN100/AX124 Eco Master – only spec rows. ACE 14XW engine identity ambiguous (Simpson S433 vs Tata 497 depending on year) – verify.

**BEML (25 rows, 22 real models)**
- Capacities: desimachines.com pages + BEML product PDFs/GeM catalogue sheets (BD155 spec sheet on mkp.gem.gov.in).
- Part numbers: BE220/BS6D105-1 parts catalogue (scribd 723170016) – oil cartridges 30Z5180495 / 11Z5180094, centrifugal insert 11Z5190495, air elements 11Z1280049 / 30Z1280158 / 11Z1280065, breather 30Z2180392 with serial breaks; Indian government tender BOQs on tenderdetail.com / sigmatenders / GeM quoting BEML numbers for BS6D105 (BE-220/BD50: 30Z7180369, 10Z7180132, 11Z7180235, 30Z7181024, 10Z1280035/019, 30Z1280158/141, 155HS02074, 171HS91209, 110HS91608, CFF0100045, V-belts 10Z8280178 / 04121-21757), BS6D125/BS6D125-1 (BD65-1/BD80/BD85/BE300LC/BG605A: 31Z5180443/31Z5180743, 41Z7181537/51Z7185908, 11Z7180235, 31Z1200272, 31Z1280139/155, 0412122273, 0412122261, 30Z6280101, 41Z5181022, 9441037202, 250-hr kit 30Z9900495) and BS6D170-1 (BD155/BD355: 31Z5180443, 51Z5181498, 51Z7185908, 51Z7185884, 125FL92676, 51Z9900906, Komatsu alternates 6002-11-1230 / 6003-11-8291, air element 41Z1200244). Cummins QSK19 (BE1000-1) and QST30 (BD475-2) numbers from the Cummins/Fleetguard genuine-filtration application guide (maxiparts.com.au) and a QST30 spares list (dieselpartdirect).
- Gaps: no numbers for BE75, BE700, BE1800D/E, BE1000E-1 (electric), BG405A, BG605I, BG825, BL9H 4x4 (BL9H 4x2 has KOEL kit numbers only). Tender numbers are buyer-quoted BEML numbers (source_type "Forum/other") – publisher should verify with BEML before printing as genuine. BD155 fuel tank is quoted 590 L (GeM sheet) vs 620 L (DesiMachines) – both recorded.

**Bull Machines (11 rows, 9 real models)**
- Capacities/tyres/battery: bullindia.com official spec pages (HD76 2WD/4WD, HD76 BS4 Heavy Duty, HD96), desimachines.com (HD96 4WD, HD100 4WD, SD76 BS4/BS5, CH76, Grandia).
- Engine-level numbers: Kirloskar 4R1040 (HD76/HD96), KOEL 4R1190 BS-IV consumables kits 5H.999.22/23/24/25.0.SP (SD76 BS4/BS5, HD76 BS4), Perkins 1104D-44TA (Grandia, HD100: 2654407, 26560201, 26510342/343), Leyparts AL numbers for CH76 (H4CSE5520) and the AL-engined SD76 BS5 variant.
- Gaps: Bull does not publish machine-level part numbers; everything is engine-OEM. No desimachines page existed for HD76 2WD/4WD/BS4/HD96/HD100 under the obvious slugs at first – found later as bull-hd-76-2wd / bull-hd-76-4wd / bull-hd-76-bs4-heavy-duty / bull-hd-96-4wd / bull-hd-100-4wd.

**CASE (20 rows, 18 real models)**
- Capacities: casece.com India brochures (770NX, 851NX via IndiaMART/Sitecore PDFs), desimachines.com pages.
- Part numbers: CASE 770EX/Magnum parts catalogue 47573035 (scribd 726199590) – air 47362223/47362227, 84599401, 47359377, fuel 47801835/87803444/87612472, transmission 278534A1/47484443/1530028C1, alternator 47359078, V-belt 98473706, radiator cap 47574805, pre-cleaner 47635036; Leyland-engine filter kit 73392135 (safesparesonline: 90462638, 91756080, 91756083, 90373728, 90495241/242, 47833564, BU4430027, 47484442) for 770 EX/EX Plus; MyCNH kit 92280375 (845B/865B FPT: 48138563, 47710533, 84217229, 87682999, 92129321, 84565926); MyCNH kit 73348376 for CX220C (87327673L, KHH12030L, 47947003, KBH0921, 87683001, 47757762, 47635916, 47587350, 47986270) + KRJ10590/KRJ15830/KHJ17730; 1107NX air 47931042/47931043.
- Gaps: no public numbers for the F28 (CEV-V) NX family (770 NX, 770 NX Magnum, 851 NX, 952NX), 845C/865C (F4HE613B), 1150L/1650L/2050M dozers, 450NX. 770 NXe rows are Low (inferred from 770EX catalogue, same S8000 engine family).

**Escorts Kubota (28 rows, 27 real models)**
- Capacities: desimachines.com pages, Escorts brochures (CraneMarket PDF for Hydra 12), tractorjunction for Digmax II XP/Super.
- Part numbers: Escorts F-15 2019 parts catalogue (C7303819E.042/.154/.137/.298 via fpstechnologies); BBJ tender for Hydra 14 EX (D10657110, D10400230/240, D10218970); FS1275/Tata 278607989916 water-separator cross for Tata-497 TRX 15.
- Gaps: Escorts Kubota E4.391NA / E4.346CRS4 / E4.3468 / E3.249 engine filters – no public numbers found (Escorts sells only through dealers; fpstechnologies lists 11,910 Escorts part numbers without descriptions). VECV E494 (F15/F17/F20/F23/F23 2WD/TRX 2319) – no E494 numbers found; the Delphi E483 numbers were deliberately NOT applied to E494 machines. Tata 497 numbers (TRX 15/17/1550, F15 55XT, F17 73XT) – only the water-separator cross found.

**Indo Farm (16 models)** – capacities/tyres from indofarm.in product pages and desimachines.com; engine is Indo Farm's own 3052/3065/3090 DI tractor engine – no filter part numbers published anywhere public (aftermarket catalogues list "Indofarm" fitments without OEM numbers). All 60 rows are spec rows.

**Mahindra CE (9 models)** – capacities from desimachines.com (EarthMaster SX/SXE/VX, G9075, G9595, G75 Smart) and mahindraconstructionequipment.com (G9595, G90 spec page). Filter numbers from Elofic Industrial Catalogue 2018 (0303BAC01031N, 0313AAC04712N, 0313AAA04072N, 006022696H1, 2106AAA00070N) + Mechanic Bazaar (0703BAN00041N) + eBay (2106SAA00040N) – all Low because the Elofic application is the DITEC-engine EarthMaster, not the current NEF3508 CEV-V/mCRD build; several Mahindra numbers in the Elofic PDF are OCR-garbled, verify character by character. SX IV / VX IV / SX Smart 50 have no DesiMachines page (CRAWL_NOT_FOUND) so they carry only the Low filter rows. Graders: no engine filter numbers (3.532 L Mahindra CEV-IV engine).

**Manitou (14 rows, 12 real models)** – capacities from desimachines.com and tractorjunction (MBL 745 S). MRT-X 1645 Deutz TCD 3.6 numbers from ECE filter application list (799966, 799968, 799967, 923593, 299937 with Donaldson crosses) + Deutz 04504440 (Low); 1340R Yanmar numbers (129150-35153, 119802-55801, 119802-55710, 119808-12520). MXT 840 K IND is inferred from MXT 840 K (Low); MBL 745 HT Ranger BSV and HT+ BS-V have no DesiMachines page – rows inferred from MBL 745 HT (Low). MRT-X 2570/3570 – spec rows only.

**TIL (4 rows = 2 models under two names)** – MOBILOAD 315 and PIXEF 215 rows duplicated under both list spellings; desimachines capacities only. Engine make not identified publicly; no part numbers.

**Terex Franna (4 rows = 2 models under two names)** – FR17/FR20 duplicated under both spellings. FR20 (VECV E483) carries the Delphi/VECV E483 engine-level numbers (Medium/Low); FR17 (E494) spec rows only.

## No public data found (not in CSV)
- Part numbers for: all Indo Farm models; TIL Mobiload 315 / Pixef 215; Escorts Kubota E-series engines; VECV E494 engines; CASE F28 NX series, 845C/865C, 1150L/1650L/2050M, 450NX; BEML BE75/BE700/BE1800D/BE1800E/BG405A/BG605I/BG825/BL9H 4x4; Mahindra graders; Manitou MRT-X 2570/3570, MBL 745 HT family (Kirloskar 4R1190 – only KOEL kit numbers exist, not applied because HT engine variant unconfirmed); ACE models listed under "Gaps" above.
- DesiMachines pages missing (CRAWL_NOT_FOUND): mahindra-sx-iv, mahindra-sx-smart-50, mahindra-vx-iv, ace-ag-176, manitou-mbl-745-ht-ranger-bsv, manitou-mbl-745-ht-bs-v.

## Junk rows in the model list (not machines – no CSV rows written)
BEML "MACHINE WEIGHTS", "Mining Dozers", "PERFORMANCE"; CASE "Soil Compactor", "WEIGHT"; Escorts Kubota "EXCAVATOR PERFORMANCE"; ACE "Lifting Capacity", "Service Capacity"; Bull Machines "HYDRAULIC SYSTEM", "Radial Lift"; Manitou "HYDRAULIC SYSTEM", "Radial Lift". These are spec-table headings scraped as model names and should be removed from the inventory.

## Publisher must verify before publishing
1. All BEML tender-derived numbers (source_type Forum/other) – confirm with BEML parts division; tenders sometimes print alternates (e.g. 31Z5180443 vs 31Z5180743, 41Z7181537 vs 51Z7185908) for the same slot.
2. Mahindra EarthMaster filter numbers (Elofic OCR) and their applicability to the current NEF3508 CEV-V build.
3. CASE 770 EX catalogue numbers are from the 2016 FPT-S8000 build; the current CEV-IV Ashok Leyland build uses the 73392135 kit numbers – both sets are in the CSV with engine noted.
4. Escorts EC 5250 engine-oil capacity (5 L on DesiMachines) looks too low for a 4-cyl Kirloskar – verify.
5. ACE 14XW engine (Simpson S433 vs Tata 497), BEML BD155 fuel tank (590 vs 620 L), Manitou MRT-X 1645 emission variant (Deutz TCD 3.6 Stage V numbers were listed for the EU MRT 1645; the Indian MRT-X may use the Stage IIIA/mechanical variant).
6. Engine-OEM numbers (Kirloskar, Perkins, Cummins, Deutz, VECV/Delphi, Yanmar, Ashok Leyland) are valid for the engine family only; machine-mounted air cleaners and hydraulic filters are not covered by them.
7. Duplicate model names (TIL / Terex Franna with and without brand prefix) were kept as separate rows per the brief; merge in the inventory.
