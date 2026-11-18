# g1_jcb parts research notes (checked 2026-11-04)

Output: `parts/g1_jcb.csv` - 730 rows, all 40 JCB models in `groups/g1_jcb_models.csv` covered (engine + service capacities + tyres/track + battery for every model; OEM part numbers for every model, but depth and confidence vary - see gaps).

## How to read the CSV
- Capacity / tyre / track / battery rows have `part_number_owner = spec`; their source is the DesiMachines model page (which republishes the JCB brochure), confidence Medium. Telehandler tyre sizes and the 50Z/51R/55Z battery come straight from JCB India brochures (High).
- Filter rows carry the engine they belong to in `engine_make_model`. IMPORTANT: DesiMachines lists the current CEV Stage V machines (3DX family, 530-70/530-110/540-70, VM117 = JCB 430 3.0 L engine; 433-5/440-5 = ecoMAX 448 Stage V; 455-5N = Cummins QSB6.7). Almost all published JCB part numbers are for the previous JCB 444 ecoMAX/DieselMax (CEV III/IV) builds, which is still the bulk of the Indian fleet. Each such row says so in `fitment_notes`; the publisher should label these "444-engine machines" and ask dealers for the 430-engine numbers.
- Rows marked Low are either single marketplace/forum listings or numbers published for a sibling model (JS205 -> NXT 205 siblings, JS140 -> NXT 140, 531-70 -> 530-70, 35Z-1 -> 37C HD, VM116 -> VM117, 3DX Kirloskar -> JCB 81). The note says which.

## Sources used (best first)
1. JCB Parts India (official e-catalogue) - product pages: https://parts.jcb.com/in/product/320-04134 (shows supersession to 320/04133A), /581-18063 (-> 581/M7012), /40-300893, /32-915801, /320-A7250 (3DX Plus primary fuel/water separator), /400-N7762 (3DX 1000-hr kit), /333-Y7423 (3DX 500-hr kit), /400-01662 (JS205/200/210/220 1000-hr kit), /320-08547 (fan belt 8PK1835), /550-42746 (Kirloskar engine filter kit); category pages for filters, filter kits (335/C1280 air filter kit) and GET (40/303603 bucket tooth, 400/N7770 cutter kit JS81).
2. JCB documents: JCB RS-series common engine parts list (444/448 ecoMAX: 320/B4420, 320/A7123, 320/A7351, 320/07853) https://www.jcb.com/globalassets/digizuite/80176-te001_rs-series-common-engine-parts_v1.0 ; JCB North America filter-kit book (35Z-1, 55Z-1, 444 engine kits) https://lindstromequipment.com/content/JCB%20-%20Reference/JCB%20Filter%20Kits.pdf ; JCB India telehandler brochure (gem.gov.in copy) and 50Z/51R/55Z brochure (pascojcb.com).
3. Government procurement BoQ for tracked JCB JS-205 (filters, belt, GET, pins) https://mkp.gem.gov.in/uploaded_documents/51/16/877/OrderItem/BoqDocument/2021/11/29/procurement-of-stores-for-tracked-jcb-acw-and-bty-c_2021-11-29-14-07-55_8bcc50a99f601f87b2d30cd98c00af8c.pdf
4. Elofic Industrial Filters catalogue (JCB 3DX KOEL 4R1040, 3DX JCB engine, JS200 6BT, JS140 with Fleetguard/Donaldson cross-refs) https://cdn5.f-cdn.com/files/download/134514823/19uf_EloficIndustrialCatalogue-3-6.pdf
5. JCB India dealer filter list (3DX/4DX/JS120, JS205/JS140, VM116/VM115) https://www.scribd.com/document/394766526/filter-P-N
6. Indian dealers/sellers quoting genuine numbers: Samar Equip (kit contents of 400/N7762 and 333/Y7423), Pioneer Mitra (photographed kit box), Kumar N Kumar Faridabad (JS205, VMT330, JS220 Donaldson elements), Robot India, Aries India, UVS Parts, Assurer, Sidereal product list, IndiaMART/Aajjo listings.
7. Engine OEM/cross-reference: Perkins shop (140517050 oil filter, 130306380 fuel filter assembly - 403D-15/403J-17/404D-22), Perkins dealer kit lists (Allight, Symbiosistas with Fleetguard numbers), Cummins Filtration Tier-4-Final guide (QSB6.7: LF3970/LF16015, FS1098, FF63009, CV52001), Fleetguard FF5825NN (Cummins X12), Broken Tractor (Kohler KDI oil filter 333/H5477 = 334/V6243; Loadall hydraulic filter 333/C4690), Inline Filters (531-70 w/444 kit), Greenred Spares (51R-1 T3 kit).

## Gaps / no public data found
- JCB 430 (3.0 L CEV Stage V) engine, fitted to 2025 3DX/3DX Plus/3DX Super/3DX Xtra/4DX, 530-70/530-110/540-70 and VM117: no filter part numbers published anywhere public except the primary fuel element 320/A7250 (JCB Parts India, 3DX Plus) and the IndiaMART-grouped 320/A7188 / 320/A7373. JCB UK lists G60RSV "Stage V 430 engine" filter kits 400/29878 (1000 hr) and 400/29879 (2000 hr) but without contents. Publisher must get the 430-engine oil/fuel/air numbers from a JCB dealer.
- JCB 2DX (Kirloskar 4R810 NA): no filter numbers found; only capacities/tyres and a GET listing. Kirloskar 4R1040 numbers (3DX) are NOT assumed to fit.
- JCB VMT330 (Simpson SJ327): only air filters (335/D7242 outer, 335/D7243 inner) and a "VMT fuel filter" 32/925759; engine oil/fuel filter numbers not published.
- JCB VM117: only predecessor VM116 (444 engine) numbers; current 430 engine numbers unknown.
- JCB 433-5 / 440-5 / 455-5N / 225LC Eco Plus / 520X LC: only engine-level numbers (JCB 448 ecoMAX, Cummins QSB6.7, Cummins X12); machine-specific hydraulic, transmission and air filters not published. JCB Parts India lists a "432ZX 500 Hr. Filter Kit" but without a part number.
- JCB SSL 135/155 (Kohler KDI 1903 TCR): engine-level oil filter only (Medium); fuel/air numbers inferred from the Kohler-engined 55Z-1 kit (Low). Hydraulic filter unknown.
- JCB 130 (444 NA): engine numbers inferred from JS120 list; hydraulic return/pilot filters unknown.
- JCB 315LC HD / 345LC HD / 385LC / 385LC QM (JCB 672): oil filter 320/A4038 well supported (aspect-plus lists JS385LC HD), the rest Low.
- JCB NXT 140/145/150 and NXT 210LC/215LC/215 LC FM/225LC M/245HD LR: numbers inherited from JS140 / JS205 lists (Low) plus Cummins B-series engine-level filters (Medium). JS215 1000-hr kit 400/29647 is a single IndiaMART listing.
- No bucket-tooth/adapter numbers for the NXT 140 family, 315/345/385LC, 520X; no track-shoe part numbers for any excavator (only widths); no pin & bush kit numbers except 550/42700 (3DX, single aftermarket source).

## Things the publisher must verify before printing
- 320/04134 vs 320/04133A vs 320/B4420 are the same engine oil filter family (JCB Parts India marks 320/04134 "replaced"); 581/18063 -> 581/M7012 / 581/M8563; 320/07155 -> 320/A7170; 32/925950 -> 320/A7123; 320/07382 -> 320/A7351.
- Air-filter inner/outer assignment for the 32/915801 (inner) / 32/915802 (outer) pair follows JCB Parts India and Robot India; the Scribd dealer list has them the other way round.
- Elofic Donaldson numbers lost prefixes in the scanned catalogue; cross-refs are quoted as printed.
- Fitment of all 3DX-family numbers to the 2025 Stage V (JCB 430) machines is NOT confirmed; serial-number check required.
