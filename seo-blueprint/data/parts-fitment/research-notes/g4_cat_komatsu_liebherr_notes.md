# g4_cat_komatsu_liebherr - research notes (checked 2026-11-04)

CSV: parts/g4_cat_komatsu_liebherr.csv - 902 rows, 109 of 121 list entries covered (all 111 real models except the two Tata Hitachi EX 210 entries; the other 10 uncovered entries are not models, see "List anomalies").
Confidence split: High 115, Medium 634, Low 153. Capacities/tyres/batteries from desimachines.com model pages are Medium (OEM brochure/spec sheet); OEM Parts Reference Guides / cat.com maintenance pages / Komatsu QRGs are High; dealer and cross-reference catalogues Medium; marketplace, engine-level-only and sibling-model inferences Low (always stated in fitment_notes).

## List anomalies (publisher must fix the model list)
- These 10 "models" are page-section headings, not machines - no rows written: Caterpillar/Backhoe Loader "DIMENSIONS & WEIGHT", "ENGINE", "HYDRAULIC SYSTEM", "Wheel Dozer"; L&T Komatsu/Compactor "MACHINE WEIGHTS", "Mining Dozers", "PERFORMANCE", "Undercarriage and Component Life"; Caterpillar/Dozer "Medium (12-20 Ton)", "SPEED".
- 35 "Tata Hitachi ..." excavators are filed under brand "L&T Komatsu". Rows were written with brand "L&T Komatsu" verbatim (as instructed) but the machines are Tata Hitachi and are also covered by group g2 (parts/g2_tatahitachi.csv) - de-duplicate before publishing and re-brand to Tata Hitachi.
- "Komatsu D155A-6" is listed under brand "Komatsu" (not "L&T Komatsu"); rows use "Komatsu".
- "Hindustan 2021E" is listed under Caterpillar (Hindustan 2021 is the Caterpillar India / Hindustan Motors-era loader); capacities only.
- Komatsu WA470-6A / WA480-6A / WA500-6R / WA600-6R / WA900-8R are India/Asia regional builds; all part numbers were taken from -6 / -8 global documents and must be checked by serial number.

## Sources used per brand
### Caterpillar (best sources, all High)
- Cat 950 GC Parts Reference Guide: https://s7d2.scene7.com/is/content/Caterpillar/CM20220221-41c51-d0ee3 (serial prefix M5T; M5K alternates noted)
- Cat 966H/972H Parts Reference Guide: https://s7d2.scene7.com/is/content/Caterpillar/CM20230123-b9fd0-e5bfa
- Cat Motor Grader Rig Out Catalog (120, 120 GC, 140 GC, 14M3 planned-maintenance parts): https://s7d2.scene7.com/is/content/Caterpillar/CM20230125-95d7a-884e4
- cat.com Caterpillar Service Center maintenance page for 313D/313D2/315D (filters for 313D2 L)
- Cat 320D3 GC spec sheet CM20200814-0561a-3c47c and Gmmco 320D3 India brochure (capacities, ALUW06DTI engine)
- Cat 395 spec sheet CM20200730-7f2cb-bb1c4 (capacities)
- Cat parts.cat.com / industrialstop 1R-1808 application list (Medium) for C13/C15/C18/C27/C32 machines (14M3, 16M3, 24M, 972L, 980L, 988K-993K)
- cn-machinery.com cross-reference articles (Low) for 320D3 / 330 GC filter numbers
- desimachines.com model pages for all capacities/tyres/batteries
### Komatsu (L&T Komatsu)
- Komatsu Australia WA470-6 Quick Reference Guide ZESB051000 (via pdfcoffee) - full WA470-6 service list
- Komatsu D155A-6 parts book (manuals-free) - 600-211-1340 etc.
- Costex "Filters for Komatsu" catalogue F-720-353: https://www.costex.com/wp-content/uploads/2023/03/F-720-353-Rev.-A-Filters-for-Komatsu.pdf
- Komatsu South Africa Fuel Line Clogging Guide (600-319-3750 / 600-319-3841 main fuel filters): https://www.komatsu.co.za/sites/default/files/2023-02/error-manuals/Fuel_Line_Clogging_Guide.pdf
- komatsupartsonline.co.za dealer listings (600-211-1341, 600-319-3550), geniparts, 777parts (Low), ConstruMarket GD555-5 kit, partsell GD705 list, wixfilter.ru S6D140 table (Low), Komatsu NZ air-cleaner bulletin
### L&T (L&T 9020 / 9020 SX)
- L&T 9020 brochure (capacities, Ashok Leyland H6C413323 engine); two GeM tender specifications quoting L&T part numbers (F7A05000 oil filter, M0030010 etc. - source_type Forum/other, Medium/Low); Fleetguard engine-level numbers for the Ashok Leyland H-series engine (LF3970/FF63009/FS1098 - verify).
### Liebherr
- desimachines.com pages for every R-series / L-series capacity and engine (India R 920-925 use Cummins QSB6.7, not Liebherr D934 - confirmed on the DesiMachines/Liebherr India spec)
- ecefilter.com application page for R 926 Advanced (D934 S A6) - Liebherr numbers 10297295, 11065673, 10037617, 10802265, 10044302, 10044303, 12227636, 10342370, 10222393, 12582496 (Low: earlier-generation machine)
- diesel-czesci.pl Liebherr D934/D936/D944/D946 and D9508 engine pages (breathers 12886224, 10123751)
- fridayparts.com / x-filter.com listings (12820742 fuel, 11060250 hydraulic, 10289138 D9508 fuel, 10324849 / 11161894 L550-L580 hydraulic) - Low
- onodetruckparts / oneclickwarehouse (R9150 D9512 10149977 fuel, 11427521 oil) - Low
- Donaldson cross-reference (alexisfilters) Liebherr 10279775 = P951978 (D936/D946) - Low
- John Deere Replacement Part Guide 6068HB450 PowerTech PVS 6.8L "Liebherr OEM engine (TREM 4)": https://www.deere.ca/assets/pdfs/common/qrg/6068hb450-powertech-pvs-6.8l-liebherr-oem-engine-(trem-4).pdf (L550, High, JD numbering)
- John Deere Replacement Part Guide 6090HFL75 PowerTech 9.0L (6090 Tier 2) OEM engine: https://www.deere.com/assets/pdfs/common/qrg/6090hfl75-powertech-9.0l-(6090-tier-2)-oem-engine.pdf (L566/L580, High, JD numbering)
- Fleetguard "Genuine Filtration for Cummins Engines" guide (QSB6.7, QSK50, QSK60, QSK23 engine-level numbers): https://www.maxiparts.com.au/Documents/PartsGuides/Genuine%20Filtration%20for%20Cummins%20Engines.pdf
### Tata Hitachi entries (filed under L&T Komatsu)
- desimachines.com pages (engine, fuel tank, track shoe, battery)
- AG International Tata Hitachi filter page (Fleetguard LF3349 / FS1280 / FF5052 for Cummins 6BT5.9 EX200/EX210 family): https://aginternationalfilters.com/tata-hitachi-filters/
- www.tatahitachiparts.com could NOT be reached from this session (host blocked: ENOTFOUND) - it is the best OEM source for Tata Hitachi numbers; allow the host and re-run for g2/g4.

## Gaps - no public part numbers found (capacities only, or nothing)
- Caterpillar: CAT 316 GC, CAT 321, CAT 322, CAT 323D3, CAT 324, CAT 345 GC, CAT 350, CAT 374, CAT 395 - no Cat PRG or cat.com maintenance page found for the India next-gen builds; only capacities. Cat 950L, 986K, 994K - capacities/tyres/battery only. Cat 16M3, 24M, 972L, 980L, 988K-993K - only 1R-1808 engine oil filter (Medium) beyond capacities. Hindustan 2021E - capacities only (same Ashok Leyland engine as L&T 9020; L&T 9020 numbers may apply but not confirmed by any source).
- Komatsu: WA900-8R - capacities + a few dealer numbers only; GD755-5R, GD955-7 - engine-level Low numbers only; WA380Z-6 - several numbers inferred from WA380-6 (Low).
- Liebherr: R 9200 G7, R 9300 G8 (QSK38), R 9350 G6 (QSK45), R 9600 G8 (D9812) - capacities only; R 9250 G6, R 992 E, R 998 SME-E are electric-drive (no engine filters); R 9400 G6 / R 9800 G6 only Cummins QSK50/QSK60 engine-level Fleetguard numbers (Low). Liebherr publishes no public parts catalogue; all excavator numbers are from aftermarket sellers.
- Tata Hitachi entries: EX 210LC Prime and EX 210 Infra Super+ Series - desimachines pages not found (404), no rows. All ZAXIS / NX / mining EX models - capacities only (OEM numbers are in group g2 where available).
- Not found for any model: pin & bush kits, bucket teeth/adapters (except Cat 950 GC / 966H GET from the PRGs and WA470-6 cutting edges), belts (only Cat PRGs, WA470-6, JD engines).

## Things the publisher must verify before publishing
1. Serial-prefix dependence: Cat grader and loader numbers differ by prefix (e.g. Cat 120 fuel filters 439-5037 vs 525-6205; 140 GC air 346-6694 vs 245-6375) - India prefixes not confirmed; fitment_notes list the alternatives.
2. India-specific engines: Cat 320D3 / 320D3 GC India use Ashok Leyland ALUW06DTI (not C7.1) - US-market 320D3 numbers do not apply; Liebherr R 920-925 India use Cummins QSB6.7 - Liebherr D934 numbers do not apply to them.
3. Engine-level numbers (Fleetguard/Cummins, John Deere, Liebherr engine family) are only valid once the exact engine build/CPL on the machine is confirmed; rows say so in fitment_notes.
4. Komatsu -6A/-6R/-8R regional builds: numbers taken from -6/-8 global docs.
5. All Low rows (153) come from single marketplace listings or sibling models; treat as leads, not published fact.
6. The ecefilter R 926 Advanced list is for the previous generation (D934 S A6); current R 926/928/930 Litronic (D934 A7-23, Stage V) may use different hydraulic and fuel elements.
7. L&T 9020 numbers from GeM tender documents (F7A05000, M0030010 etc.) are L&T internal numbers transcribed by a government buyer - confirm with L&T CMB.
