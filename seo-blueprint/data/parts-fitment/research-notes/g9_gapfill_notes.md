# g9_gapfill — research notes

Group: `g9_gapfill` (43 machines missed by earlier passes). Output: `parts/g9_gapfill.csv`, 627 rows, all 43 models covered (header identical to `parts_schema.md`). Confidence: High 79 / Medium 424 / Low 124. Rows checked 2026-11-07 (`checked_on` records the real date; schema example says 2026-11-04).

Rows of type "OEM brochure/spec sheet" with a desimachines.com URL are the engine, capacity, track/tyre and battery rows captured from each model's desimachines page (Medium). All other rows carry the URL actually read.

## Sources by brand

### Komatsu (L&T Komatsu) — excavators
- PC210-10M0 / PC210LC-10M0: Komatsu PC210-10 operation & maintenance manual, "Wear parts / consumable parts list" (easymanua.ls p.447) — oil filter 6736-51-5142, fuel pre-filter 600-319-3610, main fuel filter 600-319-3550, air cleaner 600-185-5100 (double element) and the hydraulic return/pilot/breather items. Komatsu South Africa parts store (komatsupartsonline.co.za) confirms 6736-51-5142 and 600-319-3550 for the -10M0 variant; mymromarts lists 600-319-3610 for PC210-10M0. Costex F-720-353 "Filters for Komatsu" gives aftermarket crosses.
- PC205-10M0: only engine-level rows (SAA4D107E-1), Low — no PC205-specific list found.
- PC300LC-8M0 / PC350LC-8M0: Komatsu PC300-8 OMM wear-parts list (easymanua.ls p.271) — 6742-01-4540 oil filter, 600-319-3610/600-311-3750 fuel, 600-185-5100 air, 207-60-71182 hydraulic. LoaderPartsSource and cn-machinery name the -8M0 variant for the oil filter and filter set; the rest are Medium (PC300-8 base model).
- PC450LC-7 / PC600-8R1: Komatsu PC800-8 OMM list and fridayparts/equipment-parts listings naming PC450/PC600 (600-211-1340 oil filter, 600-319-3550, 600-185-6100 air). PC600-8R1 regional variant: Medium.
- PC800-8R: Komatsu PC800-8 OMM wear-parts list (easymanua.ls p.231), full list.
- PC2000-8: zapkomat.su parts book (consumable section).
- PC3000-6 / PC4000-6: Komatsu Mining Germany maintenance-parts lists reproduced in the Örnek İş Makinaları catalogue (ornekismakinalari.com.tr) — 16 rows each.
- PC35MR-3: Komatsu Australia Quick Reference Guide ZESB035000 (resize.shop033.com PDF) — filters, undercarriage (rubber/steel track, sprocket, idler, rollers), bucket teeth/pins, cutting edges, bulbs, wiper, seat belt. Best single-machine source in the group.
- PC71 / PC81: Kirloskar 4R1040 engine-level numbers from the KOEL illustrated spare-parts list and KFP "Recommended maintenance parts" list, Low (engine family, not machine-specific).

### Komatsu — dozers / wheel dozer
- D39EX-22 / D39PX-22: Grupo ConstruMarket dealer kit for D39EX-22, Costex F-720-353, Komatsu NZ air-cleaner-elements bulletin.
- D85ESS-2A: Fleetguard application catalogue (webcatalogs.info page 899, "D85E-SS-2A"), Cotrac filter pack naming D85ESS-2A, Costex.
- D155A-6: Komatsu distributor preventive-maintenance parts sheet for D155A-6R S/N 85077-up (scribd), manuals-free D155A-6 parts book pages, MaintainX asset page.
- D275A-5R: manuals-free D275A-5 parts book pages, Costex, equipment-parts.com (-5R named only by desimachines; Komatsu numbers are for D275A-5).
- D375A-6: geniparts D375A-5/-6 maintenance list (8 rows), Costex. Confirm -6 vs -5 numbers.
- D475A-5E0: Costex and tdgrupp parts book extracts; thin (7 rows).
- WD600-6R: buymachineryparts listing naming WD600-6 (600-211-1340) plus Costex; thin.

### Caterpillar
- D6R2: D6R2 parts manual (SSS1/TTT1/PPP1-up) "Maintenance parts index" (pdfcoffee) — 19 rows.
- D10: D10T2 parts manual maintenance index (pdfcoffee) — 22 rows. desimachines "Cat D10" page specs match the D10T2.
- D8: desimachines page describes the next-generation D8 (C15, 4-speed automatic). No PRG found for that machine; rows use the D8T Parts Reference Guide (Peterson Cat PDF) cross-checked with the D8R C15 PRG — all Low, confirm by serial prefix.
- D5R2 / 814K: parts.cat.com product page for 439-5037 (compatible-model list names 814K and D5R2 — High), machinery-parts.com 462-1171, filterverified 814, spareindex D5R2 air-cleaner group, Cat PRG index.
- D11, 824K, 834K: engine-level only (C32 / C15 / C18 generic filters via boarparts D11T list, componentsonly 824K page, Cat filter cross chart) — Low, 1-3 rows each.
- 216B Series 3: tractorgearbox maintenance page and filterverified (reproduces parts.cat.com data), 10 rows; also Cat PRG CM20230906.

### Volvo (SD110, DD90, PT220)
- Capacities/tyre/drum data from desimachines. Part numbers only at engine level (VE Commercial Vehicles E483 / E494 engines fitted to Indian-built Volvo compactors): VECV parts portal filter set IB999850 (E483), Fleetguard listings on mymotoco, Bosch and Delphi-TVS cross catalogues — all Low. Volvo CE service-kit lists for Indian compactors were not found publicly.

### L&T (1190, 2490 HD, 491, 990HFi compactors; S315R skid steer)
- Only desimachines capacity/engine/tyre/battery rows. lntcel.com publishes brochures but no part numbers; no dealer listings quoting OEM numbers for the Mahindra MTorque 41025/4745/4485 engines or the S315R (Mahindra NE 460 3A) were found. No part-number rows written.

### Mahindra CE (Roadmaster G80 / G90 / G100)
- desimachines plus mahindraconstructionequipment.com model pages for capacities. Part numbers (0303BAC01031N oil filter, 006022696H1, 0313AAC04712N, 0313AAA04072N, 0703BAN00041N transmission filter) come from the Elofic industrial catalogue and mechanicbazaar listing for the Mahindra DITEC engine family as fitted to EarthMaster backhoes — Low, engine-family inference, not grader-specific.

### XCMG XE230C LC
- XCMG XE230C parts manual (pdfcoffee) and XE215C consumable list (machineryline-tm PDF), forexcavator and Amazon pilot-filter listings; 21 rows. Note: 800104594 is the air pre-cleaner assembly (预滤器总成 in the air-cleaner group), not a fuel pre-filter.

## Gaps
- L&T 1190, 2490 HD, 491, 990HFi, S315R: capacities only, zero part numbers.
- Mahindra Roadmaster G80/G90/G100: engine-family inference only (Low).
- Volvo SD110/DD90/PT220: VECV engine-level numbers only (Low); no Volvo CE kit numbers.
- Cat D11, 824K, 834K: 1-3 engine-level rows each; Cat D8 all Low (D8T numbers).
- Komatsu PC205-10M0, PC71, PC81: engine-level only; WD600-6R and D475A-5E0 thin.

## Items for the publisher to verify
1. desimachines PC210-10M0 page prints engine "SAA4D107E-1" but gives 6 cylinders / 6.69 L; recorded as SAA6D107E-1 (Komatsu India brochure). PC205-10M0 is the 4-cyl SAA4D107E-1.
2. Komatsu SA "PC210-10M0 3000 hour kit" lists PC300-class filter numbers (6742-01-4540, 600-311-3620, 600-185-5100/5110); only the breather 421-60-35170 was taken from it (Low).
3. Air-cleaner element numbers differ by case diameter (600-185-3100 / -5100 / -6100); confirm against the machine's air-cleaner assembly before publishing.
4. D155A-6 power-train filter: 07063-51100 (parts book) vs 154-15-65561 (Costex list) — both recorded; confirm by serial.
5. Cat D8 rows are D8T/D8R C15 numbers (Low) — the India page is the next-gen D8.
6. Cat D10 rows are from the D10T2 parts manual; confirm the India machine is D10T2.
7. L&T S315R desimachines page appears to swap battery and alternator values.
8. D275A-5R / PC600-8R1 / PC800-8R / PC300LC-8M0 / PC350LC-8M0 are regional variants; numbers are for the base model unless the fitment_notes name the variant.
9. Mahindra grader and Volvo compactor numbers are engine-family inferences (Low) and need dealer confirmation.
10. Brand for D155A-6 in the model list is "L&T Komatsu" with model written without the Komatsu prefix; desimachines lists it under brand Komatsu.
11. checked_on is 2026-11-07, not the schema's example 2026-11-04.
