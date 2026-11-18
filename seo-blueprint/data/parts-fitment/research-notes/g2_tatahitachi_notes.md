# g2_tatahitachi — research notes (checked 2026-11-04)

CSV: parts/g2_tatahitachi.csv — 615 rows, 51/51 model names covered (278 part-number rows, 337 capacity/size rows).
Confidence mix: High 49 · Medium 378 · Low 188. Duplicate DesiMachines names (e.g. "Shinrai Prime" and "Tata Hitachi Shinrai Prime", "TL340H Prime" / "Tata Hitachi TL340H Prime") carry identical rows so every name in the model file resolves.

## 1. Sources used (by brand / model family)

### Tata Hitachi — official / OEM
- DesiMachines model pages (engine model, service capacities, track shoe width, battery, tyres). Source type "OEM brochure/spec sheet", confidence Medium. Slugs that differ from the model name: EX 210LC Prime = /excavator/tata-hitachi-ex-210-lc-prime/, EX 210 Infra Super+ Series = /excavator/tata-hitachi-ex-210-infra/, TL340H Prime = /wheel-loader/tata-hitachi-tl-340h-prime/, ZW225 CEV 5 = /wheel-loader/tata-hitachi-zw-225/, ZW550 = /wheel-loader/tata-hitachi-zw-550/, Hindustan 2021E = /wheel-loader/hindustan/.
- tatahitachi.co.in brochures: EX 210LC Prime (ex-210-lc-prime-brochure.pdf), EX 215LCQ Prime, Shinrai Prime (shinrai-prime-brochure.pdf: refill capacities and tyre sizes), ZW225 CEV5 (ZW225-CEV5-Brochure.pdf: full refill capacities, 23.5-25-20PR tyres), TL340H (2020 brochure – older Cummins B3.9 model, not used).
- Hitachi ZX220LC-GI brochure (info.hmd-africa.com) — confirms ZAXIS 220LC = ZX220LC-GI, Isuzu CC-6BG1T, capacities and service intervals.
- tatahitachiparts.com (Tata Hitachi genuine parts portal "e-DOST"): has FILTERS / TOOTH POINTS / PINS AND BUSHES categories per model (EX 200LC Prime, ZAXIS 220LC Ultra, 370LCH Ultra, 490H Ultra, NX30/50/80, TMX 20 Neo, ZAXIS 23U/33U/38U, Shinrai, 870-5G, EX1200-7 …) but part numbers are behind a dealer/customer login. **Best next step for the publisher: ask a Tata Hitachi dealer for an e-DOST export of the FILTERS category per model.**
- Hitachi operator's manuals on easymanua.ls ("List of Consumable Parts"): ZW370-6, ZW550-6, ZW180-6, ZX120-6 class. Used only as inferred (Low) data for the Indian ZW models.
- Kubota industrial engine oil-filter selection guide (kubotaengine.com) — V3800 → HH1C0-32430 (Shinrai Prime/Power/Power 4).
- Caterpillar India Hindustan 2021E brochure (catmachine.co.in) — capacities, tyres.

### Indian government tenders / GeM BOQs quoting Tata Hitachi part numbers (source type "Forum/other")
These are the only public documents that print Tata-Hitachi-native (TE/TB/TC/TD) numbers against a model:
- tenderdetail 31903540 (Srinagar 2022, "Cat A spares Tata Hitachi EX 200 LC") — Cummins 6BT filters 3908615 / 3903640 (4080713) / 3890206 (3931866), air 3814312/3814313, pilot 4631976, hyd element 4325820, suction 4199012, tooth TE06513/TB00218, pin TE03583, side cutters 2014503/2014504, track master pin/bush TD20278/7, /8, lower roller TD20275, sprocket 1010204, seal kits TE23320/TE23318/TE23317, belt tensioner 3922900.
- tenderdetail 1987451 (EX 200LC + EX 70) and 1489926 (EX 200) — corroborate the Cummins numbers and add belt 3935335; EX 70 items TE23840 oil filter, 9451037407 fuel element, TE20879/TE20880 air elements, TE20210 hyd element, 4191301/4207841 pilot, TB00395 tooth, TE00594/TC00594 adapter.
- tenderdetail 1971608 (GREF Leh 2021, EX 70) — hydraulic filter 4225846, track shoe TB00440/03, bush TB00440/6, master pin TB00440/08, roller TC00620, seal kits.
- tenderdetail 6310807 (2023, "filters for Tata Hitachi hydraulic excavator") — lube 4658521RCP, pilot 4630525, breather 4437838, "Air filter outer Ex 370 4459549", "Strainer Hyd Ex 470 4333464", "Hyd pilot filter Ex 350 3015259", "Hydraulic filter Ex 350 4325820", primary fuel 4078360, fuel element 4616864, cabin YA00001490 / YA00032683.
- GeM BOQ 2024 (EX200 Super+ filter kits KF200250C / KF200500C-N / KF201000C-N / KF201500C-N) and GeM BOQ 2025 (EX 200 tooth pin TE-03583, air filter TE-21349; EX-70 hyd filter TE-20210; TMX 20 oil L002654408, fuel L002654, hyd SC-00202, air SD-00356).

### Aftermarket cross-reference catalogues
- Donaldson "Catalog filters for HITACHI" (webcatalogs.info/donaldson-hitachi pages 19–31) — model-by-model OEM numbers with serial breaks and engine codes for ZX70–ZX870 and ZW220/250/310. Primary source for Isuzu-engined ZAXIS models.
- ecefilter.com HITACHI ZX 200-5G ZAXIS (Isuzu CC-6BG1T, 2017-) — current GI/5G-generation numbers (4658521RCP, YA00033064, YA00007394/YA00007606, 4648651, 4630525, 4326739, 4616545, KC3098117099, 4S00686).
- eurofilter.net, otr-tyres.kz, teh-treid.ru (Fleetguard/Sure cross-refs for ZX200LC, ZX350H, ZX330/350-3, ZX450H, ZX470H-3, ZX650LC-3).
- Dealer/marketplace: AG International (Kolkata; Fleetguard LF3349/LF3959, FS1280, FF5052 tied to Cummins-6BT EX200/EX210), IndiaMART (TE01870 air kit for EX200), ruiqianfilter (4448402 applications), Amazon/Galloparts (4630525 applications incl. ZX350H-5G/ZX210LCH-5G/ZX470H-5G), parts-machining (LF9325 → 4639464 for EX1200-5/-6), avspare/equipment-parts (mining 4669642, 4331923/4331920; 6UZ1 oil element 1132402322).

## 2. How fitment was mapped (publisher must read)
Tata Hitachi does not publish filter numbers; every Hitachi/Isuzu number was mapped by (a) confirming the engine on the DesiMachines page / brochure and (b) finding the Hitachi global model with the same engine and platform:
- ZAXIS 220LC / 220LC Ultra (CC-6BG1T) ← Hitachi ZX200-5G / ZX220LC-GI (ECE list; Hitachi engine catalogue 6BG1-TRA12 explicitly covers ZX200-5G series + ZX220LC-GI). Medium for 220LC, Low for Ultra. Older ZX200(LC) Donaldson numbers (4484495, 4286128/4286130, 4370435, 4210224) given as Low alternatives — serial-dependent.
- ZAXIS 370LCH / 400MTH (AA-6HK1X) ← Donaldson ZX350(LC)H / ZX370(MTH) (AA-6HK1 XQA). Medium; air element 4459549 corroborated by the 2023 tender ("Ex 370") → High.
- ZAXIS 370LCH Ultra (GH-6HK1X, common rail) ← Hitachi ZX350H-3/-5G filter set. Low (inferred).
- ZAXIS 140H Ultra (C-4BG1T) ← Donaldson ZX130H (4BG1 T). Low.
- ZAXIS 470H (AA-6WG1TQA) ← Donaldson ZX450(LC)H (6WG1 TQA). Low; strainer 4333464 corroborated by tender ("Ex 470") → Medium.
- ZAXIS 490H Ultra (6UZ1) — only the Isuzu oil-filter element from the ZX470LCH-5B 6UZ1 engine catalogue (Low). Hitachi Australia sells a "ZX490LCH-5A 2000 hour filter kit" (HCA-ZX490LCH-5A2000F) but does not list contents.
- ZAXIS 650H / 670H (BB-6WG1X) ← Donaldson ZX650LC-3 / ZX670LCH-3. Low.
- Zaxis 870-5G (BB-6WG1XQA-04) ← Donaldson ZX870(LC)H-3. Low.
- EX 200/210/215 family (Cummins 6BT5.9C) ← Indian tenders for "EX 200 LC" (Super+ series). Engine-level Cummins numbers: High for EX 200 Infra / EX 210 Infra Super+, Medium for Prime variants; machine-side items (air elements, pilot, hydraulic, GET, track) Medium for Infra/Super+, Low for Prime series (Prime has a different HP return-line filter and cyclonic pre-cleaner per brochure).
- EX 70 Prime (Tata 497) ← tenders for "EX 70" (Super+). Low.
- Shinrai Prime/Power/Power 4 (Kubota V3800) ← Kubota V3800 oil filter HH1C0-32430 (engine-level, Medium). No Shinrai-specific fuel/air/hydraulic/transmission numbers found publicly (Tata Hitachi Shinrai Prime parts manual 910100220418 exists but is paywalled).
- ZW 370-5A ← ZW370-6 manual list (Low); ZW550 ← ZW550-6 machine-side only (Low; Tata's ZW550 is Cummins QSK19, so engine filters omitted); ZW225 CEV 5 ← ZW180-6 engine filters (Low).
- Mining EX 1900-6 / 2600-6 / 3600-6 (Cummins QSK) ← Hitachi catalogue aggregators naming those models (Medium); EX 5600-7 / EX 8000-6 Low (sources name -6 variants). EX 1200V ← EX1200-5/-6 oil filter 4639464 (Low).
- Hindustan "PERFORMANCE" and "Small (8-15 Ton)" are DesiMachines placeholder names; both mapped to the Hindustan 2021E page/brochure (capacities, tyres, battery only).

## 3. Gaps — no public part numbers found (specs only in CSV)
- Tata Hitachi EX 130 Prime (Tata 697A) and Shinrai Pro (Tata 497D139 CEV-5): no filter numbers tied to the model. (Bosch/Tata truck-engine filters exist but engine variant for the machine is not confirmed.)
- EX 350LC Prime (Cummins QSB6.7), TL340H Prime (Cummins B4.5 BSIV), ZW 310-5A (Cummins QSM11): no model-tied numbers.
- NX30, NX 50, NX 80, ZAXIS 23U, 33U, 38U (Yanmar 3TNV76 / 3TNV88 / 4TNV88 / 4TN98S): aftermarket kits exist (unearthedparts.com.au ZX33U-5A/ZX38U-5A, ricoeurope ZX38U-5) but none print OEM numbers; Hitachi/Yanmar engine catalogues (3TNV88-ZPHB/-BPHBB for ZX33U-5A/38U-5A) are paywalled. Donaldson ZX30U-2/35U-2 numbers were NOT used (older generation).
- ZAXIS 890LCH (-7G class): engine + capacities only.
- EX 215 LCQ Prime capacities: DesiMachines page truncated; brochure values used.
- No OEM bucket-tooth/adapter numbers for ZAXIS models (only EX 200 LC and EX 70 from tenders).
- Tata Hitachi tyre sizes for Shinrai Pro/Power not individually confirmed (Shinrai Prime brochure sizes applied to the family via the 4WD page; Power 4 page lists 9x16 / 16.9x28).

## 4. Items the publisher must verify before publishing
1. Everything marked Low (188 rows) — mostly Hitachi global-model numbers inferred by engine match; check against machine serial in e-DOST.
2. Oil filter duality for 6BG1/6HK1 machines: 4448336 vs 4484495/4622562 vs 4658521RCP vs 4696643 — Hitachi has superseded these several times; the CSV keeps each with its source.
3. Mining air elements 4331923 / 4331920: sources disagree on which is outer vs inner.
4. ZAXIS 23U capacities on DesiMachines (hydraulic system 19 L vs tank 30 L) look inverted.
5. "Cummins GSM1 1" on the ZW 310-5A page is a typo for QSM11 (Hitachi ZW310-5A engine catalogue PNFC90-EG1 confirms QSM11).
6. ZW225 tyre size printed "235-25-20PR" on DesiMachines; brochure says 23.5-25-20PR.
7. Tender-derived numbers (source type Forum/other) are buyer BOQs, not Tata Hitachi price lists; part descriptions were copied as written.

## 5. Best five source URLs
1. https://webcatalogs.info/donaldson-hitachi/files/basic-html/page22.html (and pages 19–31) — Donaldson Hitachi application catalogue with OEM numbers per model/engine/serial.
2. https://www.ecefilter.com/DetayliArama/ModelDetay/ceeff25ac/HITACHI/ZX-200-5G-ZAXIS — current ZX200-5G (CC-6BG1T) filter set = ZAXIS 220LC GI.
3. https://www.tenderdetail.com/Indian-Tenders/TenderNotice/31903540/4bc8911c26608c6a6f5de68b3abd17c3 — Tata Hitachi EX 200 LC spares list with TE/TD/TB and Cummins numbers.
4. https://www.tatahitachi.co.in/pdf/shinrai-prime-brochure.pdf — Shinrai refill capacities and tyre sizes (plus ZW225-CEV5-Brochure.pdf and ex-210-lc-prime-brochure.pdf on the same site).
5. https://www.tenderdetail.com/Bid-Results/TenderNotice/6310807/63e0ef87-c5cf-4601-9a55-0b0f3ec67ea0 — 2023 tender tying Hitachi numbers (4459549, 4333464, 4630525, 4658521RCP, 4437838) to Tata Hitachi "Ex 370 / Ex 350 / Ex 470".
