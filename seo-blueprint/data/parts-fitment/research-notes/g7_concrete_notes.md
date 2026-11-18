# g7_concrete – research notes (checked 2026-11-04)

Output: `parts/g7_concrete.csv` – 932 rows, 151 of 171 model entries covered. The 20 uncovered entries are not machines (see "Entries that are not models").

## How the data is structured
- Every machine gets engine / prime-mover identification plus the capacities and tyre/battery specs the OEM publishes (`part_number_owner = spec`).
- Real part numbers are attached through reusable **engine packs** (the number belongs to the engine OEM, stated in `part_number_owner` and `fitment_notes`) and **pump wear-part packs** (Putzmeister / Schwing numbers).
- Confidence: High = OEM manual/catalogue/data sheet or two agreeing sources; Medium = one reputable dealer/aftermarket source; Low = single marketplace/tender listing, or a number selected by nominal size/engine family rather than by machine model (always flagged in `fitment_notes`).

## Engine packs used (what the publisher must know)
| Pack | Applied to | Numbers | Caveat |
|---|---|---|---|
| Kirloskar HA494 (air-cooled 4-cyl, 49 kW) | Putzmeister BSA 1404 HD / 1405 D; Schwing SP 1015 HD (Low) / 1200 D / 1400 D / 1420 D; Venus VCP 1050/1450, Venus 6.0/7.0; Conmat MR 60C/70C/70XL; Macons M6TM | Fuel filter 06.474.50.0.00 (High, two dealers); oil capacity 12.5 L (High, KOEL HA manual); air inner 48.145.03.0.00 / outer 48.145.02.0.00 (Medium/Low); service kit 04.999.38.0.00 (Medium); lube spin-on 04.270.01.0.00 and Bosch fine filter F002H20364 (Low – from a BRO spares tender list, not an OEM catalogue) | HA engines exist in BS-III and CPCB-II builds; lube spin-on vs paper-element filter depends on build – verify with engine serial. |
| Kirloskar HA694 (6-cyl, 75–82 kW) | Putzmeister BSA 1407 D eSmart (High) / 1407 D Classic (Low); Schwing SP 1807; Venus VCP 1470 | same family numbers; air primary 6H.411.02.0.00 listed for HA694TC only | as above |
| Kirloskar HA394 | Schwing SP 1015 D | oil capacity 9 L; lube/fine filter Low | |
| Kirloskar 4R810 (water-cooled 49 HP, BS-IV/BS-V) | Apollo Carmix 23 FX, Conmat CSLM 2500, John SLCM 2.2, Macons MST 2, Schwing SLM 2100 / BEE 2.1, Tarle SLM 2200, Venus Ultra 2.0 / 2600 | Lube 06.436.01.0.00 (Medium – dealer lists "4R & 6R series"); fuel elements 3H.132.01.0.00 / 3H.132.02.0.00 (Low – published for 4R1040 KFP engines; same 3H.132 twin-bowl group shown on 4R810TA parts list) | CRDi BS-V 4R810 builds may use different fuel filters – verify. |
| Kirloskar 4R1190 NA / TA (74.5 / 110 HP BS-IV, BS-V) | AJAX ARGO 3000/4500/4800 (KOEL variant), Conmat CSLM 2800/4200L/4800, John SLCM 4.3, Macons MST 4/4.5, Schwing SLM 2600/4300/4600 (KOEL variant), Tarle SLM 4300, Venus Ultra 3.0/3200/3800/4.0/4500/4800 | Pre-filter cartridge 5H.019.001.0.00 and main cartridge 5H.019.002.0.00 (Medium – FPS Technologies list of KOEL 5H = 4R1190 BS-IV group); air cleaner assy 5H.050.10.0.PR, poly-V belt 5H.071.01.0.PR (Low); SCR supply-module filter set 5H.085.51.0.SP for TA/SCR engines (Medium); lube 06.436.01.0.00 (Low) | All are BS-IV (5H) group numbers; CEV Stage V machines sold since 2025 may differ. Mahindra/Tata/Escorts-Kubota engine options have no public filter data. |
| Deutz 912 (optional on Putzmeister BSA 1404 HD / 1407 D) | | oil 01174421, fuel 01174423 (Medium, aftermarket cross-ref) | Only if the optional Deutz engine was ordered. |
| Tata/Cummins ISBe 6.7 BS-VI | Tata Prima 2830.K (High), Signa 2830.K (Medium), LPK 2821.K (Low) | Fuel pre-filter element 278609119910 (= Fleetguard FS20117, Bosch F 002 H26 563, Cummins AX1015337); water separator 288047704904 (FS19732); main fuel filter 278609999828 (Low); air 570909130106 (Low) | Engine-oil filter for ISBe 6.7 BS-VI not found with a reliable model match (a Signa 2823K ISBe5.6 BS6 parts list shows lube cartridge 573718999807 but a dealer lists the same number as a diesel cartridge – left out). |
| Ashok Leyland H6 BS-VI (AVTR) | AVTR 2820/2825 (Medium), 3825 (Low) | Fleetguard kit P5105608 = LF16238 + FS20282 + FS20283 | Dealer kit listing for "AVTR 16T–49T H6 BSVI"; AL OE numbers not confirmed. |
| Eicher VEDX5/VEDX8 | Pro 6028TM, Pro 6035TM | Service kit oil filter & O-ring ID376839 (High – Eicher genuine parts portal lists both models) | Fuel/air numbers not found on the portal. |
| Mahindra mPower 7.2 | Blazo X 28 | Fuel filter 0305DAV03030N = Fleetguard FF5540 (Medium) | |

## Pump wear-part packs
- **Putzmeister BSA (India)** – all eSmart/Classic BSA 1404–1410 use hopper RS 905A + S 2018 PN + 200 mm cylinders (data sheets CT 4397-1/4399/4408-1/4911 IN). Putzmeister "Original parts" catalogue 2022 gives: wear plate 229488005 (carbide 571451), wear ring 251031006 (531240), thrust ring 284788009, set 264217008, piston 019004000 / long-life 086236005 (seal 080372004, guide ring 080794006), S2018 PN tube 406926, cylinder 200x1400 240112004, 200x2100 255591005. BSA 1404 HD (180 mm): 234559000 / 251231000 / 249304004 / 257836001 / piston 019033000 / cylinder 088358004. BSA 1408 HD and 2109 HD use S 2015 DP (513375) – wear parts given as Medium.
- **Schwing SP** – the only machine-specific listing found is an Indian wear-parts dealer (mrengineeringpro.com) giving RL-Rock numbers with fitment to SP1400 and SP1800: wearing insert 10308231, cutting ring DN190 10308236, clamp DN150 10043559, gland set 10003421; BP350: taper pipes 10004542/10007503, gland sets 10003413/10007414. The SCHWING GmbH genuine spare-parts list (truck pumps) numbers for M-ROCK DN200/210/180 (piston 10161754, insert 10074767, cutting ring 10063939, spring 10064472, kidney seal 10029138, kidney plate 10018046, base plate 10074769) and DN180 (piston 10161781) were added as **Low** by nominal cylinder size – India SP pumps use the RL Rock valve, so the publisher must verify valve type before publishing those rows.
- AJAX ASP (own S2018-type valve), Aquarius, Venus VCP and Conmat SCP do not publish wear-part numbers.

## Sources used per brand (best URLs)
- AJAX: ajax-engg.com product pages (ARGO 2000/2500/3000/4500/4800, AF 6XE/7XE/8XE, ASP 3009/4011/5009/7011/10012); AJAX ASP/AF brochures on centrocar.com (older engine data: ASP 3009 3-cyl 47 hp, ASP 40xx 4-cyl air-cooled 66 hp, ASP 7011 6-cyl air-cooled 100 hp).
- Schwing Stetter: schwingstetterindia.com SP/BP/AM/SLM pages and brochure PDFs (files 1548, 1858, 1870, 1871, 1873, 2086); SCHWING_SLM_CEV5_Nov_2025.pdf; Schwing RMC-series data sheet (info.hmd.group) which names Kirloskar HA394/HA494/HA694 on SP1015/1200/1400/1407/1420/1807; SCHWING GmbH spare-parts catalogue SWG-22-8387.
- Putzmeister: putzmeister.com India data sheets (BSA 1404 HD, 1405 D-RMC, 1407 D, 1407 HD, 1410 D, 2109 HD), eSmart/BSA brochures, Transit Mixer Brochure IN (CT 4855-4), Parts Catalog 2022 EN.
- Aquarius: aquariusengineers.biz product pages (703 D, 704 D, 1405 D PRIME/SUPER, 1407 D, 1407 D HR, 1400 HPD, 1410 D); engine make/model is never published – only kW.
- Venus: venusequipment.com (Ultra 2600/3200/3800/4500/4800, VCP series, 1450E, Venus 7.0); DesiMachines model pages for Ultra 2.0/3.0/4.0 and Venus 6.0.
- Conmat: conmatindia.com (CSLM 2500/4200L/4800, MR 80), hampiequipments.com dealer table (CSLM 2500/2800/4200L/4800 with KOEL model numbers), Conmat SCP brochure (imimg PDF), rcmme.com (MR 70C).
- Apollo Carmix: apolloinffratech.com BS-V catalogue (apollo-infra.pdf), apollocarmix.com product pages.
- Macons: macons.co.in (M6TM), DesiMachines MST pages, exportersindia (older MST sheet).
- Tarle/Universal/John/Fiori: tarleglobal.com, Tarle brochure (imimg), Universal brochure (imimg) + aajjo listing, DesiMachines compare pages.
- Truck chassis: trucks.tatamotors.com (Prima 2830.K REPTO), Bosch CV filters catalogue (boschaftermarket.com), vikingsauto.in, singlamotorparts.com, mymotoco.com; ashokleyland.com AVTR 2820/2825 RMC spec pages, trucksbuses.com; eichertrucksandbuses.com, myeicherpartsonline.vecv.net; mahindratruckandbus.com Blazo brochure; rightautospares.com Fleetguard application lists.
- Engine OEM: KOEL HA O&M manual (easymanua.ls), KOEL KFP maintenance parts list and 4R810TA parts list (scribd), FPS Technologies / FPS Group / GK Engine Spares Kirloskar listings, whiteint.com.au, Delcot, KOEL BS-IV engine brochure (application mapping 49/74.5/110 HP → 4R810/4R1190/4R1190TA), adrautoparts Deutz filter guide.

## Gaps / no public data
- **Engine make not published**: AJAX ASP series (only "4-cyl/6-cyl air-cooled, hp"), AJAX AF 6XE/7XE/8XE slave engine, Aquarius (all models – kW only), Schwing AM slave engines, Schwing SP 1000/1300/1600/1800 D/2000/2509 D/4507/4800/8800, Conmat SCP 5000/7500 and MR 80C (only "Kirloskar"/kW), Putzmeister BSA 1408 HD (160 kW), Putzmeister P7+ slave engine, Fiori DBS 4300 (Mahindra, model code not given), Universal SLM-2/4 (KOEL, no model).
- **No filter numbers found** for: Mahindra CEV engines (ARGO 3000/4500, Schwing SLM 2600/4300/4600 Mahindra option, Apollo Carmix 30 FX/46 FX, Fiori DBS 4300), Escorts Kubota (ARGO 2500), Tata engine option (ARGO 4500/4800), Ashok Leyland engines on Putzmeister BSA 1407 HD / 1410 D option, Volvo Penta D5 (BSA 1410 D), Deutz on BSA 2109 HD / SP 3000 / SP 3500 (exact Deutz model not stated – generic 01174421 oil filter given as Low), Cummins ISBe 6.7 engine-oil filter, Mahindra mPower 7.2 oil/air filters, Eicher VEDX fuel/air filters.
- **Gearbox/reducer**: no OEM publishes the drum gearbox model for India transit mixers (Stetter: "ZF/PMP"; Venus: "Rexroth reducer"; Macons: "imported planetary"; Putzmeister: 72/90 cc hydraulic motor). No ZF P-series part numbers could be tied to a model.
- **Fuel/hydraulic tank** not published by Schwing for SLM range; Putzmeister BSA India sheets give no tank sizes; Universal SLM gives no tank sizes.
- **Tyres** not published for Schwing SLM 2100/2600/4300/4600/BEE 2.1.
- Aquarius 1405 D SUPER OEM page shows a table headed "1004 D SHP" – data recorded as printed; verify.
- Venus VCP 1470 HR page prints "KOEL model HA494" against 132 kW – almost certainly a template error; flagged Low.
- Tarle SLM 3000 engine "KOEL 4R1040TC" comes only from DesiMachines (Tarle sheet just says 74.5 hp BS-IV).

## Entries that are not models (left out of the CSV – fix the model list)
- Apollo Carmix: "Apollo" and the long company-description string.
- BharatBenz: "Dimensions & Load Capacity" (the real product is the BharatBenz 2828C/2828CM RMC with OM926 engine – MANN cross-refs for OM900 series are HU 951 x oil, PU 999/1 x fuel, WK 1060 water separator per aginternationalfilters.com, but no model row could be written).
- Eicher: "High Payload & Fuel Efficiency", "Truck Mounted Transit Mixer".
- Tarle: "ENGINE", "MIXER", "Self Loading".
- Mahindra Truck: ACE AG 176, CASE 845B, Cat 120, Komatsu GD535-6, LiuGong 4180D, Mahindra Roadmaster G80/G90/G100, SEM 917F, Sany STG170C-10, Shantui SG15-G, XCMG GR1705 – these are motor graders mis-filed under the Mahindra Truck concrete-mixer page; they belong to the grader group.
- Duplicates kept as separate rows because the list has both names: "23 FX"/"Apollo Carmix 23 FX" (and 30/46 FX), "SLM 2200"/"Tarle SLM 2200" (and 3000/4300), "Pro 6028TM"/"Eicher Pro 6028TM", "AVTR 2825 6×4 RMC"/"Ashok Leyland AVTR 2825 6×4 RMC", and the seven Aquarius pumps that appear under both "AJAX Engg / Concrete Mixer" and "Aquarius / Concrete Pump" (the OEM is Aquarius Engineers, Pune – the AJAX attribution and the "Concrete Mixer" category are wrong).

## Things the publisher must verify before going live
1. All Low rows (251): Schwing Rock-valve numbers selected by DN size; KOEL HA lube/fine-filter numbers from a tender list; 4R810 fuel elements; 4R1190 BS-IV numbers on BS-V machines; Tata main fuel/air filters; AL 3825 kit; Deutz generic oil filter.
2. Engine variant on each machine (most Indian self-loaders are sold with 2–3 engine options; the KOEL packs apply only to the KOEL-engined unit).
3. Putzmeister BSA "Classic" variants are assumed to carry the same Kirloskar engines as the eSmart data sheets (1405 D = HA494 Medium, 1407 D = HA694 Low).
4. Hydraulic-tank figures on AJAX ARGO pages (DesiMachines shows water-tank values duplicated) – not recorded.
