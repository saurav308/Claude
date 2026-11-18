# g3_chinese – parts & fitment research notes (SANY, XCMG, LiuGong, SDLG, Shantui, SEM)

Checked on 2026-11-04. CSV: parts/g3_chinese.csv (1723 rows, 129 of 141 list entries covered; 10 list entries are not machines - see "Not real models").

## How the data was built
1. Engine fitted, fluid capacities, track-shoe width, tyre sizes, battery, transmission/axle oil, DEF and water-tank capacities were transcribed from each model's desimachines.com page ("Specifications" / "SERVICE CAPACITIES (L)") -> source_type "OEM brochure/spec sheet", confidence Medium, part_number_owner "spec". 128 of 131 real models have a readable page.
2. Part numbers were then taken from (a) OEM parts lists/catalogues where public, (b) the Donaldson "Filtration Solutions – Asian Equipment" application catalogue (lists machine-OEM numbers model by model), (c) dealer/parts-seller lists that print OEM numbers, (d) engine-OEM / Fleetguard numbers for the confirmed engine family, (e) IndiaMART/Alibaba/EquipmentShare marketplace listings (Low/Medium).
3. Where a source lists a sibling model (same engine/platform) rather than the DesiMachines model, the row is marked Low and the fitment_notes say "sibling inference".

## Sources used per brand (best first)
### SANY
- Donaldson Asian Equipment catalogue (PDF) – SANY 60xxxxxx / B2221xxxxxxx / A2221xxxxxxx numbers for SY35U, SY55, SY135, SY200C/SY215C, SY205C-9, SY225C-9, SY240C-9, SY265C, SY365, SY375, SY500H, SY750H: https://www.donaldson.com/content/dam/donaldson/engine-hydraulics-bulk/literature/emea/air/f210074/Filtration-Solutions-Asian-Equipment-Europe.pdf
- sanymach.com SY35U parts list: https://sanymach.com/sany-sy35u-parts
- forexcavator.com SANY filter listings (SY16C-10/SY35U, SY210C water separator 60033346): https://forexcavator.com/Fuel-Filter-60292521-PF-CO-01-01170-Use-for-Sany-Mini-Excavator-SY16C-10-SY35U-10-SY35U-Yanmar-3TNV8
- EquipmentShare SANY catalogue (60336531, 60101257, 160602020056A): https://shop.equipmentshare.com/collections/sany-parts-catalog
- ecefilter SY26U application list (3TNV80 minis): https://www.ecefilter.com/DetayliArama/ModelDetay/14726bd95a/SY-26-U
- buymachineryparts 60200365 return filter (SY215/SY265C/SY365C): https://www.buymachineryparts.com/products/hydraulic-return-filter-60200365-for-sany-sy215-sy265c-sy265lr-sy365c-sw405k
- Alibaba hydraulic filter showroom (60200363/60200364/60101256) – Low: https://www.alibaba.com/showroom/hydraulic-filter-for-sany.html
- sanyimachineparts STG grader filters 60328868 / 60260271: https://www.sanyimachineparts.com/index.php/product/60328868-fuel-water-separator-filter-element-for-sany-motor-grader-stg170c-stg190c-stg210c-stg230c/
- Fleetguard application tables for Cummins 6BT/4BT (cth.md), QSB6.7 / QSK19 (webcatalogs p428), QSL9 (p429): http://m.cth.md/en/Engine-Filters-Cummins-69n.html ; https://webcatalogs.info/fleetguard-all/files/basic-html/page428.html ; https://webcatalogs.info/fleetguard-all/files/basic-html/page429.html
- Kubota V2607 (gciron), Yanmar 3TNV88 (dieselpartsdirect), Yanmar 3TNV80 (sorilux), Isuzu (isuzureplacementparts, dieselpartsdirect, esilniki24), Scania DC16 (kingreatfilter, strongway), Deutz TD2.9/TCD3.6 (cpseuropean, kuduparts), KOEL KFP maintenance list, Ashok Leyland H-series Fleetguard (rightautospares, pssao PDF).
- SF-Filter and Rico Europe aftermarket kits for SY210C – cross-check only.

### XCMG
- OEM "List of XE215C" parts list (machineryline PDF) – full maintenance list incl. filters, belts, teeth, track shoes: https://machineryline.com/img/pdf/4/9/1680170943390407111/List%20of%20XE215C.pdf
- Donaldson Asian Equipment catalogue – XE215C, XE370C, XE490, XE135D numbers.
- xcmgsparts.com (XE140i FS1242, 803198487; XE520C breathers): https://xcmgsparts.com/excavator/filter/
- farseeparts XCMG filter list (XE20U/XE28U/XE35U/XE80C): https://www.farseeparts.com/filters-xcmg/filters-for-xcmg.html
- rentwithaim XE80U Kubota filters: https://rentwithaim.ca/products/xcmg-800173432-lube-filter
- rancle.com (Fleetguard AF25929/AF26076 for XE210i): https://www.rancle.com/category/product/xcmg-excavator-parts/
- forexcavator XE470D QSM11 filters; atmachineryparts / cm-sv / cgsc108 ZL50GN/ZL50GV loader lists; sp-auto XCMG loader list (XS143J roller).
- Weichai WP4.6N / WP7 engine numbers: sinosoon.com, liugongxcmgparts.com WP7 catalogue, sdocmachine WP7G fuel element.

### LiuGong
- Donaldson Asian Equipment catalogue – CLG922E (B5.9 and QSB6.7), CLG933E, CLG936E, CLG856H.
- newskyparts CLG922E parts list PDF (filters, GET, pins): https://newskyparts.com/uploadfile/202601/942bb70f397c740.pdf
- sp-auto.ru LiuGong excavator filter list (return/suction/breather by model): https://sp-auto.ru/catalog/liugong/exkavatorfilters
- sp-auto.ru LiuGong loader filter list (856H etc.): https://sp-auto.ru/catalog/liugong/loaderfilter
- mtsglobalparts 40C7018 / 53C0210: https://mtsglobalparts.com/product/liugong-40c7018-fuel-filter/
- kingreatfilter 40C2707 kit; sdoceanmachine 53C1530 transmission filter; IndiaMART SP236190/SP217876 oil filter (856H/848H/870H) and 856H MAX hydraulic filter 53C0720; loaderspareparts Yuchai YCK09 fuel filter.
- Engine-level: Fleetguard (6BT/4BT, QSB7, QSL9/L9, QSK19), Yanmar 3TNV80/3TNV88/4TNV98 water separator, Scania DC13, Weichai WD10 (via Shantui SD16 list), Cummins NT855 (via Shantui SD22/SD32 list), KOEL KFP list, Ashok Leyland H6 Fleetguard.

### SDLG
- sdpparts E6135F/E6150F list: https://sdpparts.com/product/sdlg-original-excavator-e6135f-e6150f-e6210f-e6250f-vecu-controller-4130015740/
- sdlgmall G9190 filter kit: https://www.sdlgmall.com/category/g9190-g1900l3244106a0-vlgg9190-j0600609-vlgg9190-j0600625/
- sdpparts 4110003496001/002 air filters (L958/G9190/G9138); Donaldson LG6210 / LG670 entries; Deutz BF4M2012/BF6M1013 engine numbers (agromaj, adrautoparts, kuduparts).

### Shantui
- intek43.ru Shantui SD13/SD16/SD22/SD32 filter list (Shantui + Weichai + Cummins numbers): https://intek43.ru/catalog/filtry-dlya-buldozerov-shantui-sd13-sd16-sd22-sd32/
- shantuispareparts.com SD16/SD22/SD32 filter page; rotor-plus 612600081334.
- Weichai WP6G / WP12G: sinosoon.com; Cummins X15: Cummins filter kit sheet https://mart.cummins.com/imagelibrary/data/assetfiles/0077101.pdf

### SEM
- SEM 818F Parts Reference Guide (OEM): https://www.semmachinery.com/EN/parts/pdf/818F_Dozer_Parts-Reference-Guide.pdf
- SEM 822D parts catalogue (scribd copy): https://fr.scribd.com/document/875166869/Catalogue-des-pieces-detachees-du-SEM-822D ; weserviceman 822D filter list.
- SEM 919 Motor Grader Parts Reference Guide (used for 917F as sibling): https://www.semmachinery.com/EN/parts/pdf/SEM919_Motor-Garder_Parts-Reference-Guide.pdf
- SEM 822D/824F/917F guides on semmachinery.com return empty content to the fetcher – publisher should download them directly; they will give High-confidence numbers for 822D/824F/917F.

## Not real models (list rows to drop)
XCMG Compactor "Medium (12-20 Ton)", "SPEED"; LiuGong Dozer "Medium (12-20 Ton)", "SPEED"; SEM Dozer "Construction Dozers", "MACHINE WEIGHTS", "PERFORMANCE"; Shantui Dozer "MACHINE WEIGHTS", "PERFORMANCE", "Undercarriage and Ground Pressure". These are section headings scraped as model names. No rows written.

## Gaps – no public data found / not covered
- XCMG XE230C LC: desimachines page not crawlable; no model-specific parts source found (IndiaMART lists it among XCMG India models without numbers). No rows.
- LiuGong 4180D grader: desimachines page not crawlable; no parts source. No rows.
- SDLG E6150F: desimachines page returns a bot-check; capacities missing. Parts rows written from the sdpparts E6135F/E6150F list (engine_make_model left blank – confirm Deutz BF4M2012 variant).
- Electric models (SANY SY215EP, SY375EP; LiuGong 9027FE EV, 908FE EV, 922FE Battery, 922FE Cable, 926FE EV, 939FE EV): spec rows only; no hydraulic filter numbers published.
- LiuGong 975E HD (Cummins QSM15), 950E (QSM11, only suction filter 53C0963), 908E (only Yanmar water separator): engine filter numbers not found with a usable source.
- SANY SSR220C-8H (Weichai WPG6200): spec rows only.
- Sany STG140C-10 (Cummins QSF4.5): spec rows only – Fleetguard QSF4.5 numbers could not be confirmed (QSF3.8 kit numbers found are NOT the same engine; not used).
- SANY SY155W (Isuzu 4HK1) and SY60C (4JG1): only Isuzu engine-level and Donaldson SY55 sibling numbers.
- LiuGong 836N / 838H MAX (Ashok Leyland H6), 818N / 611 / 6210E and SANY SSR110C-10 PRO (Kirloskar 4R1190), XCMG XE140i INFRA (Kirloskar 4R1040T), SANY STR90C-10 PRO (AL H4): no machine-OEM numbers found; only engine-family numbers at Low confidence.
- XCMG ZL33FV / ZL48GV / ZL55GV / GR1705 / XS115H (Weichai WP4.6NG / WP7G): no XCMG numbers for the current engine; ZL50GN/GV (WD10/WP12 era) hydraulic/transmission numbers given as Low.
- Shantui DH13B3 / DH24C3 / SG15-G: only Weichai engine-family numbers (Low).
- SANY telehandlers STH634A/STH844A/STH1056A: only Deutz engine-level numbers.
- Bucket teeth / adapters / pin-bush kits: only found for XCMG XE215C platform and LiuGong CLG922E; none for SANY/SDLG/Shantui/SEM.
- Tyre sizes: captured from desimachines for loaders/graders/compactors/telehandlers; no OEM tyre part numbers.

## Publisher must verify
1. Shantui SD13: intek43 labels D638-002-02 as oil filter and D17-002-02 as fuel filter; SDEC (Shangchai) sources label D638-002-02 FUEL and D17-002-02 OIL. CSV follows SDEC labelling; confirm before publishing.
2. India-built SANY SY210C-9 / SY215C-9LC SPARC / SY245C-9LR / SY220C-9XL use Cummins 6BT5.9/6BTAA5.9 (Cummins India). Engine filters given are Fleetguard engine-level numbers (LF3345/FF5052/FS1280); SANY India's own numbers were not found online. Sparekart India quotes FF5052/LF3959/FS1275 for the same engine – LF3959 vs LF3345 (both B-series) should be checked against the SANY India parts book.
3. XCMG XE210i / XE215i / XE215i-KLC / XE245i LR (India, Cummins 6BT5.9): the XE215C OEM list is for the export Isuzu 6BG1T machine. Hydraulic filters, GET, track shoes and belts are probably shared; engine filters differ – rows are marked Low.
4. SANY "SY240C-9" Donaldson numbers were applied to SY240C-9HD GraMa / SPARC / LCHD (Medium) and to SY285C-9LR (Low).
5. SANY A222100000119 pilot-filter cartridge appears in Donaldson for nearly every SANY C-series model – plausible, but confirm per model.
6. LiuGong 856H MAX / 848H in India use Yuchai YCK09; Donaldson/sp-auto 856H entries are for the Cummins/Weichai export machine. Engine-side numbers (53C0053, 40C6996, 53C0576, 53C0841) need checking; the IndiaMART SP236190/SP217876 oil filter is the India-market number.
7. All "Kirloskar" rows come from the KOEL KFP 4R1040 fire-pump maintenance list – NOT a construction-engine list. Treat as placeholders until KOEL/LiuGong/SANY India confirm.
8. SEM 917F rows are from the SEM 919 guide (sibling). SEM 824F rows are from the 822D catalogue (sibling).
9. XCMG XE215C list quantities: bucket teeth 5, track shoes 94 (both sides) – from the list; confirm for Indian LC undercarriage.
10. Scania DC13/DC16 (LiuGong 965E HD, SANY SY980C-10HD) numbers are generic Scania engine numbers, not SANY/LiuGong numbers.
11. Marketplace rows (Alibaba/IndiaMART/EquipmentShare) are Low/Medium and should be cross-checked with a dealer before publishing.
