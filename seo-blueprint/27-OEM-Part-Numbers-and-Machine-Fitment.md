# 27 — OEM Part Numbers & Machine Fitment Tables (all machines listed on DesiMachines.com)

**Prepared:** 4 Nov 2026 · **Scope:** every brand × category × model page on DesiMachines.com (inventory below) · **Purpose:** the data layer for a per-model "Parts & fitment" block (and the spare-parts RFQ funnel in `04`/`11`), publishable only after the dealer-verification step in §6.

> **How to read the tables.** Each row is a machine as DesiMachines names it. Part numbers are the OEM's own numbers as printed by the cited source (machine OEM, or the engine OEM where the number belongs to the engine). Marks: no mark = **High** confidence (OEM manual/catalogue, or two agreeing reputable sources) · **†** = Medium (one reputable aftermarket cross-reference or dealer listing) · **‡** = Low (single marketplace/forum listing, or inferred from a sibling model — treat as **[VERIFY]**). The full dataset with one source URL per number is `data/parts-fitment/oem_parts_fitment.csv`; the machine census is `data/parts-fitment/machine_inventory.csv`.

---

## 1. Coverage at a glance

| Metric | Value |
|---|---|
| Machines in the DesiMachines inventory (categorised) | 735 |
| Machines with at least one mapped row (part number, capacity or size) | 695 (94%) |
| Machines with at least one **OEM part number** | 479 (65%) |
| Part/fitment rows in the dataset | 7210 |
| Rows by confidence | High 670 · Medium 4649 · Low 1891 |


### 1.1 Coverage by category and brand

| Category | Brand | Models listed | With any row | With an OEM part number |
|---|---|---|---|---|
| Backhoe Loader | ACE | 6 | 6 | 5 |
| Backhoe Loader | BEML | 2 | 2 | 1 |
| Backhoe Loader | Bull Machines | 9 | 9 | 9 |
| Backhoe Loader | CASE | 6 | 6 | 3 |
| Backhoe Loader | Caterpillar | 1 | 1 | 1 |
| Backhoe Loader | Escorts Kubota | 5 | 5 | 3 |
| Backhoe Loader | JCB | 6 | 6 | 6 |
| Backhoe Loader | Mahindra CE | 6 | 6 | 6 |
| Backhoe Loader | Manitou | 5 | 5 | 2 |
| Backhoe Loader | Tata Hitachi | 4 | 4 | 3 |
| Excavator | BEML | 9 | 9 | 4 |
| Excavator | Bobcat | 6 | 6 | 5 |
| Excavator | CASE | 2 | 2 | 2 |
| Excavator | Caterpillar | 13 | 13 | 4 |
| Excavator | Fine Equipments | 2 | 2 | 2 |
| Excavator | Hyundai | 22 | 22 | 20 |
| Excavator | JCB | 24 | 24 | 24 |
| Excavator | Kobelco | 11 | 11 | 11 |
| Excavator | L&T Komatsu | 14 | 0 | 0 |
| Excavator | Leeboy | 3 | 3 | 3 |
| Excavator | Liebherr | 27 | 27 | 20 |
| Excavator | LiuGong | 24 | 24 | 17 |
| Excavator | SANY | 41 | 41 | 39 |
| Excavator | SDLG | 3 | 3 | 3 |
| Excavator | Tata Hitachi | 35 | 35 | 26 |
| Excavator | Volvo | 17 | 17 | 14 |
| Excavator | XCMG | 21 | 20 | 20 |
| Excavator | Yanmar | 5 | 5 | 5 |
| Wheel Loader | ACE | 3 | 3 | 2 |
| Wheel Loader | Caterpillar | 11 | 11 | 8 |
| Wheel Loader | Hindustan | 2 | 2 | 0 |
| Wheel Loader | Hyundai | 4 | 4 | 3 |
| Wheel Loader | JCB | 3 | 3 | 3 |
| Wheel Loader | L&T Komatsu | 8 | 8 | 8 |
| Wheel Loader | Liebherr | 3 | 3 | 3 |
| Wheel Loader | LiuGong | 6 | 6 | 6 |
| Wheel Loader | Tata Hitachi | 5 | 5 | 3 |
| Wheel Loader | Volvo | 7 | 7 | 7 |
| Wheel Loader | XCMG | 3 | 3 | 3 |
| Motor Grader | BEML | 4 | 4 | 1 |
| Motor Grader | CASE | 3 | 3 | 1 |
| Motor Grader | Caterpillar | 6 | 6 | 6 |
| Motor Grader | Fine Equipments | 4 | 4 | 4 |
| Motor Grader | L&T Komatsu | 6 | 6 | 6 |
| Motor Grader | LiuGong | 1 | 0 | 0 |
| Motor Grader | Mahindra CE | 6 | 3 | 0 |
| Motor Grader | SANY | 3 | 3 | 2 |
| Motor Grader | SDLG | 3 | 3 | 3 |
| Compactor | ACE | 2 | 2 | 0 |
| Compactor | Ammann | 3 | 3 | 2 |
| Compactor | CASE | 3 | 3 | 1 |
| Compactor | Dynapac | 11 | 11 | 8 |
| Compactor | Escorts Kubota | 4 | 4 | 2 |
| Compactor | HAMM | 5 | 5 | 2 |
| Compactor | JCB | 2 | 2 | 2 |
| Compactor | L&T Komatsu | 4 | 0 | 0 |
| Compactor | LiuGong | 2 | 2 | 2 |
| Compactor | SANY | 3 | 3 | 2 |
| Compactor | Volvo | 3 | 3 | 0 |
| Compactor | XCMG | 1 | 1 | 1 |
| Dozer | BEML | 7 | 7 | 7 |
| Dozer | CASE | 3 | 3 | 0 |
| Dozer | Caterpillar | 8 | 0 | 0 |
| Dozer | L&T Komatsu | 8 | 1 | 1 |
| Dozer | LiuGong | 2 | 2 | 2 |
| Dozer | SEM | 3 | 3 | 3 |
| Dozer | Shantui | 8 | 8 | 8 |
| Skid Steer Loader | ACE | 1 | 1 | 0 |
| Skid Steer Loader | Bobcat | 4 | 4 | 4 |
| Skid Steer Loader | Caterpillar | 1 | 0 | 0 |
| Skid Steer Loader | JCB | 2 | 2 | 2 |
| Skid Steer Loader | L&T Komatsu | 1 | 0 | 0 |
| Skid Steer Loader | Manitou | 1 | 1 | 1 |
| Telehandler | ACE | 1 | 1 | 0 |
| Telehandler | JCB | 3 | 3 | 3 |
| Telehandler | Manitou | 6 | 6 | 3 |
| Telehandler | SANY | 3 | 3 | 3 |
| Crane | ACE | 30 | 30 | 7 |
| Crane | Escorts Kubota | 18 | 18 | 2 |
| Crane | Indo Farm | 16 | 16 | 0 |
| Crane | TIL | 2 | 2 | 0 |
| Crane | Terex Franna | 2 | 2 | 1 |
| Concrete Mixer | ACE | 1 | 1 | 1 |
| Concrete Mixer | AJAX Engg | 9 | 9 | 3 |
| Concrete Mixer | Apollo Carmix | 3 | 3 | 1 |
| Concrete Mixer | Aquarius | 7 | 7 | 0 |
| Concrete Mixer | Ashok Leyland | 3 | 3 | 3 |
| Concrete Mixer | CASE | 1 | 1 | 1 |
| Concrete Mixer | Conmat | 9 | 9 | 7 |
| Concrete Mixer | Eicher | 2 | 2 | 2 |
| Concrete Mixer | FIORI | 1 | 1 | 0 |
| Concrete Mixer | John Infra | 2 | 2 | 2 |
| Concrete Mixer | Macons | 4 | 4 | 4 |
| Concrete Mixer | Mahindra Truck | 1 | 1 | 1 |
| Concrete Mixer | Putzmeister | 4 | 4 | 0 |
| Concrete Mixer | SANY | 1 | 1 | 1 |
| Concrete Mixer | SEM | 1 | 1 | 1 |
| Concrete Mixer | Schwing Stetter | 14 | 14 | 5 |
| Concrete Mixer | Shantui | 1 | 1 | 1 |
| Concrete Mixer | Tarle | 3 | 3 | 2 |
| Concrete Mixer | Tata Motors CV | 3 | 3 | 3 |
| Concrete Mixer | Universal | 2 | 2 | 0 |
| Concrete Mixer | Venus | 10 | 10 | 10 |
| Concrete Mixer | XCMG | 1 | 1 | 1 |
| Concrete Pump | AJAX Engg | 5 | 5 | 0 |
| Concrete Pump | Aquarius | 8 | 8 | 0 |
| Concrete Pump | Conmat | 2 | 2 | 0 |
| Concrete Pump | Putzmeister | 10 | 10 | 10 |
| Concrete Pump | Schwing Stetter | 26 | 26 | 21 |
| Concrete Pump | Venus | 8 | 8 | 3 |

### 1.2 Source mix

| Source type | Rows |
|---|---|
| OEM brochure/spec sheet | 3587 |
| Dealer/parts-seller listing | 1286 |
| OEM parts catalogue | 823 |
| Aftermarket cross-reference catalogue | 775 |
| Forum/other | 465 |
| OEM operator/service manual | 144 |
| Marketplace listing | 130 |

---

## 2. Fitment matrices by category and brand

One table per category, one line per machine: engine, then the service parts most owners ask for. The tables are large, so they live in their own files (same marks: no mark High · † Medium · ‡ Low). Where a cell holds several numbers they are different parts of the same kind (e.g. primary and secondary fuel filters) — the CSV names each one. Capacities are litres unless stated.

| Category | Machines | Mapped | Table |
|---|---|---|---|
| Backhoe Loader | 50 | 50 | [`data/parts-fitment/tables/backhoe-loader.md`](data/parts-fitment/tables/backhoe-loader.md) |
| Excavator | 279 | 264 | [`data/parts-fitment/tables/excavator.md`](data/parts-fitment/tables/excavator.md) |
| Wheel Loader | 55 | 55 | [`data/parts-fitment/tables/wheel-loader.md`](data/parts-fitment/tables/wheel-loader.md) |
| Motor Grader | 36 | 32 | [`data/parts-fitment/tables/motor-grader.md`](data/parts-fitment/tables/motor-grader.md) |
| Compactor | 43 | 39 | [`data/parts-fitment/tables/compactor.md`](data/parts-fitment/tables/compactor.md) |
| Dozer | 39 | 24 | [`data/parts-fitment/tables/dozer.md`](data/parts-fitment/tables/dozer.md) |
| Skid Steer Loader | 10 | 8 | [`data/parts-fitment/tables/skid-steer-loader.md`](data/parts-fitment/tables/skid-steer-loader.md) |
| Telehandler | 13 | 13 | [`data/parts-fitment/tables/telehandler.md`](data/parts-fitment/tables/telehandler.md) |
| Crane | 68 | 68 | [`data/parts-fitment/tables/crane.md`](data/parts-fitment/tables/crane.md) |
| Concrete Mixer | 83 | 83 | [`data/parts-fitment/tables/concrete-mixer.md`](data/parts-fitment/tables/concrete-mixer.md) |
| Concrete Pump | 59 | 59 | [`data/parts-fitment/tables/concrete-pump.md`](data/parts-fitment/tables/concrete-pump.md) |

---

## 3. Shared-part fitment lists (one part number → every listed machine it fits)

These are the "fitment tables" a parts page should carry: the number first, then the machines. Only numbers that appear on two or more listed machines are shown here; single-machine numbers are in the matrices above and the CSV.

| Part number | Numbering owner | Part | Fits (DesiMachines models) | Aftermarket cross-refs | Confidence |
|---|---|---|---|---|---|
| 06.436.01.0.00 | Kirloskar | Engine oil filter (spin-on) | ACE AX 130; ACE Phantom 2WD; ACE Phantom 4WD; ACE Phantom 4WD N; AJAX ARGO 3000; AJAX ARGO 4500; AJAX ARGO 4800; Apollo Carmix 23 FX; Bull HD76 2WD; Bull HD76 4WD; Bull HD96 4WD; CONMAT CSLM 2500; CONMAT CSLM 2800; CONMAT CSLM 4200L; CONMAT CSLM 4800; JOHN SLCM 2.2; JOHN SLCM 4.3; MACONS MST 2; MACONS MST 4; MACONS MST 4.5; Schwing Stetter SLM 2100; Schwing Stetter SLM 2600; Schwing Stetter SLM 4300; Schwing Stetter SLM 4600; Schwing Stetter SLM BEE 2.1; Tarle SLM 2200; Tarle SLM 4300; VENUS ULTRA 2.0; VENUS ULTRA 2600; VENUS ULTRA 3.0; VENUS ULTRA 3200; VENUS ULTRA 3800; VENUS ULTRA 4.0; VENUS ULTRA 4500; VENUS ULTRA 4800 | Bosch (OEM supplier) / Fleetguard LF16075; Donaldson P502908; Elofic EK-6259 / Fleetguard LF16075; Donaldson P502908; Elofic EK-6259 (Elofic lists these for JCB 3DX KOEL 4R1040, JCB no. 550/40575) | Medium |
| FF5052 | Cummins (Fleetguard) | Fuel filter (secondary) | Liugong 914E; Liugong 915E; Liugong 922E Amphibious; Liugong 922E XD; Liugong 922Ea (Alpha); Liugong 925E XLR; SANY SY120C-9; SANY SY140C-9/9S Quarry; SANY SY140C-9/9S Tunnel; SANY SY140C-9S SALT; SANY SY150C PRO; SANY SY210C-9; SANY SY215C-9LC SPARC; SANY SY220C-9XL Sparc+; SANY SY245C-9LR; Tata Hitachi EX 200 Infra; Tata Hitachi EX 200LC Prime; Tata Hitachi EX 215 LCQ Prime; Tata Hitachi EX 215LC Prime; Tata Hitachi EX 215LC-SLR; XCMG XE140i HD; XCMG XE140i K HD; XCMG XE210i; XCMG XE215i; XCMG XE215i-KLC; XCMG XE245i LR | Fleetguard FF5052 | Medium |
| FS1280 | Cummins (Fleetguard) | Fuel filter (primary/water separator) | Liugong 914E; Liugong 915E; Liugong 922E Amphibious; Liugong 922E XD; Liugong 922Ea (Alpha); Liugong 925E XLR; SANY SY120C-9; SANY SY140C-9/9S Quarry; SANY SY140C-9/9S Tunnel; SANY SY140C-9S SALT; SANY SY150C PRO; SANY SY210C-9; SANY SY215C-9LC SPARC; SANY SY220C-9XL Sparc+; SANY SY245C-9LR; Tata Hitachi EX 200 Infra; Tata Hitachi EX 200LC Prime; Tata Hitachi EX 215 LCQ Prime; Tata Hitachi EX 215LC Prime; Tata Hitachi EX 215LC-SLR; XCMG XE140i HD; XCMG XE140i K HD; XCMG XE210i; XCMG XE215i; XCMG XE215i-KLC; XCMG XE245i LR | Fleetguard FS1212 (alt) / Fleetguard FS1280 | Medium |
| 1-13240232-0 | Isuzu | Engine oil filter (element) | SANY SY140C-9/9S Quarry; SANY SY155W; SANY SY240C-9HD GraMa; SANY SY240C-9HD SPARC; SANY SY240C-9LCHD; SANY SY285C-9LR; SANY SY350C-9LCHD; SANY SY365C-9LA; SANY SY380C-10HD; SANY SY390C-10HD GraMa; SANY SY500C-10HD; SANY SY545C-10LR; SANY SY580C-10HD; SANY SY60C; SANY SY680C-10HD; SANY SY80C-9 SALT; SANY SY870C-10HD; XCMG XE140C; XCMG XE145GM; XCMG XE250C GM; XCMG XE250LC-K; XCMG XE380C GM |  | Medium |
| 8-98074288-2 | Isuzu | Fuel filter element kit | SANY SY140C-9/9S Quarry; SANY SY155W; SANY SY240C-9HD GraMa; SANY SY240C-9HD SPARC; SANY SY240C-9LCHD; SANY SY285C-9LR; SANY SY350C-9LCHD; SANY SY365C-9LA; SANY SY380C-10HD; SANY SY390C-10HD GraMa; SANY SY500C-10HD; SANY SY545C-10LR; SANY SY580C-10HD; SANY SY60C; SANY SY680C-10HD; SANY SY80C-9 SALT; SANY SY870C-10HD; XCMG XE140C; XCMG XE145GM; XCMG XE250C GM; XCMG XE250LC-K; XCMG XE380C GM |  | Medium |
| LF3345 | Cummins (Fleetguard) | Engine oil filter | Liugong 914E; Liugong 915E; Liugong 922E Amphibious; Liugong 922E XD; Liugong 922Ea (Alpha); Liugong 925E XLR; SANY SY120C-9; SANY SY140C-9/9S Quarry; SANY SY140C-9/9S Tunnel; SANY SY140C-9S SALT; SANY SY150C PRO; SANY SY210C-9; SANY SY215C-9LC SPARC; SANY SY220C-9XL Sparc+; SANY SY245C-9LR; XCMG XE140i HD; XCMG XE140i K HD; XCMG XE210i; XCMG XE215i; XCMG XE215i-KLC; XCMG XE245i LR | Fleetguard LF3349 (alt) | Medium |
| A222100000119 | SANY | Hydraulic pilot filter (cartridge) | SANY SY215C-9LCS; SANY SY220C-9HD; SANY SY225C-10HD GENe; SANY SY230C-10HD GENe; SANY SY240C-9HD GraMa; SANY SY240C-9HD SPARC; SANY SY240C-9LCHD; SANY SY260C-10HD GENe; SANY SY285C-9LR; SANY SY33C PRO; SANY SY350C-9LCHD; SANY SY35U; SANY SY35U Pro; SANY SY365C-9LA; SANY SY380C-10HD; SANY SY38U PRO; SANY SY390C-10HD GraMa; SANY SY500C-10HD; SANY SY545C-10LR; SANY SY580C-10HD | Donaldson R010051 | Medium |
| F002H20364 | Bosch/MICO | Fuel filter (fine/secondary element) | Conmat MR 60C; Conmat MR 70C; Conmat MR 70XL; Macons M6TM; Putzmeister BSA 1404 HD eSmart; Putzmeister BSA 1405 D Classic; Putzmeister BSA 1407 D Classic; Putzmeister BSA 1407 D eSmart; Schwing Stetter SP 1015 D; Schwing Stetter SP 1015 HD; Schwing Stetter SP 1200 D; Schwing Stetter SP 1400 D; Schwing Stetter SP 1420 D; Schwing Stetter SP 1807; Venus 6.0; Venus 7.0; Venus VCP 1050; Venus VCP 1450; Venus VCP 1470 |  | Low |
| 04.270.01.0.00 | Kirloskar | Engine oil filter (spin-on) | Conmat MR 60C; Conmat MR 70C; Conmat MR 70XL; Macons M6TM; Putzmeister BSA 1404 HD eSmart; Putzmeister BSA 1405 D Classic; Putzmeister BSA 1407 D Classic; Putzmeister BSA 1407 D eSmart; Schwing Stetter SP 1015 D; Schwing Stetter SP 1015 HD; Schwing Stetter SP 1200 D; Schwing Stetter SP 1400 D; Schwing Stetter SP 1420 D; Schwing Stetter SP 1807; Venus 6.0; Venus 7.0; Venus VCP 1050; Venus VCP 1450; Venus VCP 1470 |  | Low |
| 5H.019.001.0.00 | Kirloskar | Fuel filter (primary/pre-filter cartridge) | AJAX ARGO 3000; AJAX ARGO 4500; AJAX ARGO 4800; CONMAT CSLM 2800; CONMAT CSLM 4200L; CONMAT CSLM 4800; JOHN SLCM 4.3; MACONS MST 4; MACONS MST 4.5; Schwing Stetter SLM 2600; Schwing Stetter SLM 4300; Schwing Stetter SLM 4600; Tarle SLM 4300; VENUS ULTRA 3.0; VENUS ULTRA 3200; VENUS ULTRA 3800; VENUS ULTRA 4.0; VENUS ULTRA 4500; VENUS ULTRA 4800 |  | Medium |
| 5H.019.002.0.00 | Kirloskar | Fuel filter (main cartridge) | AJAX ARGO 3000; AJAX ARGO 4500; AJAX ARGO 4800; CONMAT CSLM 2800; CONMAT CSLM 4200L; CONMAT CSLM 4800; JOHN SLCM 4.3; MACONS MST 4; MACONS MST 4.5; Schwing Stetter SLM 2600; Schwing Stetter SLM 4300; Schwing Stetter SLM 4600; Tarle SLM 4300; VENUS ULTRA 3.0; VENUS ULTRA 3200; VENUS ULTRA 3800; VENUS ULTRA 4.0; VENUS ULTRA 4500; VENUS ULTRA 4800 |  | Medium |
| 5H.050.10.0.PR | Kirloskar | Air cleaner assembly | AJAX ARGO 3000; AJAX ARGO 4500; AJAX ARGO 4800; CONMAT CSLM 2800; CONMAT CSLM 4200L; CONMAT CSLM 4800; JOHN SLCM 4.3; MACONS MST 4; MACONS MST 4.5; Schwing Stetter SLM 2600; Schwing Stetter SLM 4300; Schwing Stetter SLM 4600; Tarle SLM 4300; VENUS ULTRA 3.0; VENUS ULTRA 3200; VENUS ULTRA 3800; VENUS ULTRA 4.0; VENUS ULTRA 4500; VENUS ULTRA 4800 |  | Low |
| 5H.071.01.0.PR | Kirloskar | Fan/alternator belt (poly-V) | AJAX ARGO 3000; AJAX ARGO 4500; AJAX ARGO 4800; CONMAT CSLM 2800; CONMAT CSLM 4200L; CONMAT CSLM 4800; JOHN SLCM 4.3; MACONS MST 4; MACONS MST 4.5; Schwing Stetter SLM 2600; Schwing Stetter SLM 4300; Schwing Stetter SLM 4600; Tarle SLM 4300; VENUS ULTRA 3.0; VENUS ULTRA 3200; VENUS ULTRA 3800; VENUS ULTRA 4.0; VENUS ULTRA 4500; VENUS ULTRA 4800 |  | Low |
| 10018046 | Schwing | Housing lining / kidney plate DN180 | Schwing Stetter SP 1000; Schwing Stetter SP 1015 D; Schwing Stetter SP 1015 HD; Schwing Stetter SP 1200 D; Schwing Stetter SP 1200 E; Schwing Stetter SP 1400 D; Schwing Stetter SP 1400 E; Schwing Stetter SP 1420 D; Schwing Stetter SP 1600; Schwing Stetter SP 1800 D; Schwing Stetter SP 1800 E; Schwing Stetter SP 1807; Schwing Stetter SP 2000; Schwing Stetter SP 2509 D; Schwing Stetter SP 3000; Schwing Stetter SP 3500; Schwing Stetter SP 4507; Schwing Stetter SP 4800 Electric; Schwing Stetter SP 8800 Electric | Carbide (HM) = 10129833 | Low |
| 10029138 | Schwing | Kidney seal DN180 | Schwing Stetter SP 1000; Schwing Stetter SP 1015 D; Schwing Stetter SP 1015 HD; Schwing Stetter SP 1200 D; Schwing Stetter SP 1200 E; Schwing Stetter SP 1400 D; Schwing Stetter SP 1400 E; Schwing Stetter SP 1420 D; Schwing Stetter SP 1600; Schwing Stetter SP 1800 D; Schwing Stetter SP 1800 E; Schwing Stetter SP 1807; Schwing Stetter SP 2000; Schwing Stetter SP 2509 D; Schwing Stetter SP 3000; Schwing Stetter SP 3500; Schwing Stetter SP 4507; Schwing Stetter SP 4800 Electric; Schwing Stetter SP 8800 Electric |  | Low |
| 06.474.50.0.00 | Kirloskar | Fuel filter (spin-on, main) | Conmat MR 60C; Conmat MR 70C; Conmat MR 70XL; Macons M6TM; Putzmeister BSA 1404 HD eSmart; Putzmeister BSA 1405 D Classic; Putzmeister BSA 1407 D Classic; Putzmeister BSA 1407 D eSmart; Schwing Stetter SP 1015 HD; Schwing Stetter SP 1200 D; Schwing Stetter SP 1400 D; Schwing Stetter SP 1420 D; Schwing Stetter SP 1807; Venus 6.0; Venus 7.0; Venus VCP 1050; Venus VCP 1450; Venus VCP 1470 | Stanadyne (OEM supplier) | High |
| 11110683 | Volvo | Fuel filter (primary/water separator) | Volvo EC120D; Volvo EC140D; Volvo EC200D; Volvo EC210D; Volvo EC220; Volvo EC220D; Volvo EC250D; Volvo EC300D; Volvo EC380D; Volvo EC480D; Volvo EC750D; Volvo EC950E; Volvo L120H; Volvo L150H; Volvo L180H; Volvo L220H; Volvo L90H | Fleetguard FS19914 / MANN WK 1080/7x; Donaldson P559118 / MANN WK 1080/7x; Donaldson P559118; Fleetguard FS19914 | High |
| B222100000494 | SANY | Engine oil filter | SANY SY225C-10HD GENe; SANY SY230C-10HD GENe; SANY SY240C-9HD GraMa; SANY SY240C-9HD SPARC; SANY SY240C-9LCHD; SANY SY285C-9LR; SANY SY350C-9LCHD; SANY SY365C-9LA; SANY SY380C-10HD; SANY SY390C-10HD GraMa; SANY SY500C-10HD; SANY SY545C-10LR; SANY SY580C-10HD; SANY SY680C-10HD; SANY SY870C-10HD | Donaldson P550596 | Medium |
| 04.999.38.0.00 | Kirloskar | Service kit (C-check, with air filter) | Conmat MR 60C; Conmat MR 70C; Conmat MR 70XL; Macons M6TM; Putzmeister BSA 1404 HD eSmart; Putzmeister BSA 1405 D Classic; Schwing Stetter SP 1015 HD; Schwing Stetter SP 1200 D; Schwing Stetter SP 1400 D; Schwing Stetter SP 1420 D; Venus 6.0; Venus 7.0; Venus VCP 1050; Venus VCP 1450 |  | Medium |
| 48.145.02.0.00 | Kirloskar | Air filter (outer/primary) | Conmat MR 60C; Conmat MR 70C; Conmat MR 70XL; Macons M6TM; Putzmeister BSA 1404 HD eSmart; Putzmeister BSA 1405 D Classic; Schwing Stetter SP 1015 HD; Schwing Stetter SP 1200 D; Schwing Stetter SP 1400 D; Schwing Stetter SP 1420 D; Venus 6.0; Venus 7.0; Venus VCP 1050; Venus VCP 1450 |  | Low |
| 48.145.03.0.00 | Kirloskar | Air filter (inner/safety) | Conmat MR 60C; Conmat MR 70C; Conmat MR 70XL; Macons M6TM; Putzmeister BSA 1404 HD eSmart; Putzmeister BSA 1405 D Classic; Schwing Stetter SP 1015 HD; Schwing Stetter SP 1200 D; Schwing Stetter SP 1400 D; Schwing Stetter SP 1420 D; Venus 6.0; Venus 7.0; Venus VCP 1050; Venus VCP 1450 |  | Medium |
| FF5052 | Fleetguard | Fuel filter (secondary) | Hyundai R210 SMART Plus; Hyundai R210 SMART X Plus; Hyundai R215 SMART Plus; Hyundai R215 SMART X Plus; Hyundai R215L SMART X Plus; Hyundai R220LS SMART Plus; Hyundai R220LS SMART X Plus; Hyundai R230LM SMART Plus; Hyundai R230LM SMART X Plus; Hyundai R245LR SMART X Plus; Hyundai R245LR Smart Plus; Leeboy 523; Leeboy 525M | Cummins 3931063; Fleetguard FF5052 | Medium |
| FS1280 | Fleetguard | Fuel filter (primary/water separator) | Hyundai R210 SMART Plus; Hyundai R210 SMART X Plus; Hyundai R215 SMART Plus; Hyundai R215 SMART X Plus; Hyundai R215L SMART X Plus; Hyundai R220LS SMART Plus; Hyundai R220LS SMART X Plus; Hyundai R230LM SMART Plus; Hyundai R230LM SMART X Plus; Hyundai R245LR SMART X Plus; Hyundai R245LR Smart Plus; Leeboy 523; Leeboy 525M | Cummins 3930942; Cummins 3903410; Fleetguard FS1280 | Medium |
| LF3349 | Fleetguard | Engine oil filter | Hyundai R210 SMART Plus; Hyundai R210 SMART X Plus; Hyundai R215 SMART Plus; Hyundai R215 SMART X Plus; Hyundai R215L SMART X Plus; Hyundai R220LS SMART Plus; Hyundai R220LS SMART X Plus; Hyundai R230LM SMART Plus; Hyundai R230LM SMART X Plus; Hyundai R245LR SMART X Plus; Hyundai R245LR Smart Plus; Leeboy 523; Leeboy 525M | Cummins 3932217; Fleetguard LF3349 | Medium |
| E131-0214 | Hyundai | Hydraulic suction strainer | Hyundai HX520L; Hyundai R210 SMART Plus; Hyundai R210 SMART X Plus; Hyundai R215 SMART Plus; Hyundai R215 SMART X Plus; Hyundai R215L SMART X Plus; Hyundai R220LS SMART Plus; Hyundai R220LS SMART X Plus; Hyundai R230LM SMART Plus; Hyundai R230LM SMART X Plus; Hyundai R245LR SMART X Plus; Hyundai R245LR Smart Plus | HIFI SH60515 | Low |
| 5H.085.51.0.SP | Kirloskar | DEF/AdBlue supply-module filter service set | AJAX ARGO 4500; AJAX ARGO 4800; CONMAT CSLM 4800; JOHN SLCM 4.3; MACONS MST 4; MACONS MST 4.5; Schwing Stetter SLM 4300; Schwing Stetter SLM 4600; Tarle SLM 4300; VENUS ULTRA 4.0; VENUS ULTRA 4500; VENUS ULTRA 4800 |  | Medium |
| 129150-35153 | Yanmar | Engine oil filter | Liugong 9035E; MANITOU 1340R; SANY SY33C PRO; SANY SY35U; SANY SY35U Pro; SANY SY38U PRO; XCMG XE38U; XCMG XE40U; XCMG XE40U PRO; Yanmar Vi035-6B; Yanmar Vi050-6B; Yanmar ViO30-6B | Fleetguard LF3657; Baldwin B7487; MANN W 811/80 | High |
| 11E1-70010 | Hyundai | Fuel filter (secondary) | Hyundai R210 SMART Plus; Hyundai R210 SMART X Plus; Hyundai R215 SMART Plus; Hyundai R215 SMART X Plus; Hyundai R215L SMART X Plus; Hyundai R220LS SMART Plus; Hyundai R220LS SMART X Plus; Hyundai R230LM SMART Plus; Hyundai R230LM SMART X Plus; Hyundai R245LR SMART X Plus; Hyundai R245LR Smart Plus | Cummins 3931063; Fleetguard FF5052; Donaldson P551329 | Medium |
| 11E1-70140 | Hyundai | Engine oil filter | Hyundai R210 SMART Plus; Hyundai R210 SMART X Plus; Hyundai R215 SMART Plus; Hyundai R215 SMART X Plus; Hyundai R215L SMART X Plus; Hyundai R220LS SMART Plus; Hyundai R220LS SMART X Plus; Hyundai R230LM SMART Plus; Hyundai R230LM SMART X Plus; Hyundai R245LR SMART X Plus; Hyundai R245LR Smart Plus | Cummins 3932217; Fleetguard LF3349 | Medium |
| 11E1-70210 | Hyundai | Fuel filter (primary/water separator) | Hyundai R210 SMART Plus; Hyundai R210 SMART X Plus; Hyundai R215 SMART Plus; Hyundai R215 SMART X Plus; Hyundai R215L SMART X Plus; Hyundai R220LS SMART Plus; Hyundai R220LS SMART X Plus; Hyundai R230LM SMART Plus; Hyundai R230LM SMART X Plus; Hyundai R245LR SMART X Plus; Hyundai R245LR Smart Plus | Cummins 3930942; Fleetguard FS1280 | Medium |
| 11LB-20310 | Hyundai | Fuel filter (primary/water separator, 2nd stage) | Hyundai R210 SMART Plus; Hyundai R210 SMART X Plus; Hyundai R215 SMART Plus; Hyundai R215 SMART X Plus; Hyundai R215L SMART X Plus; Hyundai R220LS SMART Plus; Hyundai R220LS SMART X Plus; Hyundai R230LM SMART Plus; Hyundai R230LM SMART X Plus; Hyundai R245LR SMART X Plus; Hyundai R245LR Smart Plus |  | Low |
| 11N6-24520 | Hyundai | Air filter (outer/primary) | Hyundai R210 SMART Plus; Hyundai R210 SMART X Plus; Hyundai R215 SMART Plus; Hyundai R215 SMART X Plus; Hyundai R215L SMART X Plus; Hyundai R220LS SMART Plus; Hyundai R220LS SMART X Plus; Hyundai R230LM SMART Plus; Hyundai R230LM SMART X Plus; Hyundai R245LR SMART X Plus; Hyundai R245LR Smart Plus | STAL ST40647AB; Fleetguard AF26285K; Sakura AS-2831 | Medium |
| 11N6-24530 | Hyundai | Air filter (inner/safety) | Hyundai R210 SMART Plus; Hyundai R210 SMART X Plus; Hyundai R215 SMART Plus; Hyundai R215 SMART X Plus; Hyundai R215L SMART X Plus; Hyundai R220LS SMART Plus; Hyundai R220LS SMART X Plus; Hyundai R230LM SMART Plus; Hyundai R230LM SMART X Plus; Hyundai R245LR SMART X Plus; Hyundai R245LR Smart Plus | Sakura A-2832 | Medium |
| 11N6-90340 | Hyundai | Cabin air filter (fresh air) | Hyundai R210 SMART Plus; Hyundai R210 SMART X Plus; Hyundai R215 SMART Plus; Hyundai R215 SMART X Plus; Hyundai R215L SMART X Plus; Hyundai R220LS SMART Plus; Hyundai R220LS SMART X Plus; Hyundai R230LM SMART Plus; Hyundai R230LM SMART X Plus; Hyundai R245LR SMART X Plus; Hyundai R245LR Smart Plus |  | Low |
| 31E1-10300 | Hyundai | Fuel tank strainer | Hyundai R210 SMART Plus; Hyundai R210 SMART X Plus; Hyundai R215 SMART Plus; Hyundai R215 SMART X Plus; Hyundai R215L SMART X Plus; Hyundai R220LS SMART Plus; Hyundai R220LS SMART X Plus; Hyundai R230LM SMART Plus; Hyundai R230LM SMART X Plus; Hyundai R245LR SMART X Plus; Hyundai R245LR Smart Plus |  | Low |
| 31E9-0126 | Hyundai | Hydraulic pilot filter | Hyundai R210 SMART Plus; Hyundai R210 SMART X Plus; Hyundai R215 SMART Plus; Hyundai R215 SMART X Plus; Hyundai R215L SMART X Plus; Hyundai R220LS SMART Plus; Hyundai R220LS SMART X Plus; Hyundai R230LM SMART Plus; Hyundai R230LM SMART X Plus; Hyundai R245LR SMART X Plus; Hyundai R245LR Smart Plus | STAL ST30628 | Low |
| E131-0212 | Hyundai | Hydraulic return filter | Hyundai R210 SMART Plus; Hyundai R210 SMART X Plus; Hyundai R215 SMART Plus; Hyundai R215 SMART X Plus; Hyundai R215L SMART X Plus; Hyundai R220LS SMART Plus; Hyundai R220LS SMART X Plus; Hyundai R230LM SMART Plus; Hyundai R230LM SMART X Plus; Hyundai R245LR SMART X Plus; Hyundai R245LR Smart Plus | Fleetguard HF35363; Donaldson P502446; Sakura H-2801; STAL ST30849 | Medium |
| 60201220 | SANY | Fuel filter (primary/water separator, cartridge) | SANY SY215C-9LCS; SANY SY220C-9HD; SANY SY240C-9HD GraMa; SANY SY240C-9HD SPARC; SANY SY240C-9LCHD; SANY SY260C-10HD GENe; SANY SY285C-9LR; SANY SY350C-9LCHD; SANY SY365C-9LA; SANY SY380C-10HD; SANY SY390C-10HD GraMa | Donaldson P502424 | Medium |
| 10161781 | Schwing | Pumping piston DN180 | Schwing Stetter SP 1000; Schwing Stetter SP 1200 D; Schwing Stetter SP 1200 E; Schwing Stetter SP 1400 D; Schwing Stetter SP 1400 E; Schwing Stetter SP 1600; Schwing Stetter SP 2509 D; Schwing Stetter SP 3000; Schwing Stetter SP 3500; Schwing Stetter SP 4800 Electric; Schwing Stetter SP 8800 Electric |  | Low |
| 1R-1808 | Cat | Engine oil filter | Caterpillar Cat 14M3; Caterpillar Cat 16M3; Caterpillar Cat 24M; Caterpillar Cat 966H; Caterpillar Cat 972L; Caterpillar Cat 980L; Caterpillar Cat 988K; Caterpillar Cat 990K; Caterpillar Cat 992K; Caterpillar Cat 993K | Baldwin B7299; Donaldson P551808; Fleetguard LF691A; MANN WD 13 145/18; Sakura C-5507 (SAPAC cross-ref) / Baldwin B7299; Donaldson P551808; Fleetguard LF691A; WIX 57792; Luber-finer LFP4005RN | High |
| FF5052 | Fleetguard (Cummins) | Fuel filter (secondary) | JCB NXT 140; JCB NXT 145 Quarry Master; JCB NXT 150; JCB NXT 205; JCB NXT 205LC; JCB NXT 210LC Fuel Master; JCB NXT 215 LC Fuel Master; JCB NXT 215LC; JCB NXT 225LC M; JCB NXT 245HD LR | Cummins 3931063 / 3903640; Donaldson P502905; Elofic EK-6360 / Donaldson P502905; Elofic EK-6360 | Medium |
| FS1275 | Fleetguard (Cummins) | Fuel filter (primary/water separator) | JCB NXT 140; JCB NXT 145 Quarry Master; JCB NXT 150; JCB NXT 205; JCB NXT 205LC; JCB NXT 210LC Fuel Master; JCB NXT 215 LC Fuel Master; JCB NXT 215LC; JCB NXT 225LC M; JCB NXT 245HD LR | Cummins 4093733; Donaldson P502913; Elofic EK-6363; FS1280 alternate (AG International) / Donaldson P502913; Elofic EK-6363 | Medium |
| LF3959 | Fleetguard (Cummins) | Engine oil filter | JCB NXT 140; JCB NXT 145 Quarry Master; JCB NXT 150; JCB NXT 205; JCB NXT 205LC; JCB NXT 210LC Fuel Master; JCB NXT 215 LC Fuel Master; JCB NXT 215LC; JCB NXT 225LC M; JCB NXT 245HD LR | Cummins 3937695 / 3937743; Donaldson P502907; Elofic EK-6377; Fleetguard LF3349 also listed for JS205/JS215 / Donaldson P502907; Elofic EK-6377 | Medium |
| 8-98375860-0 | Isuzu | Engine oil filter (spin-on) | SANY SY350C-9LCHD; SANY SY365C-9LA; SANY SY380C-10HD; SANY SY390C-10HD GraMa; SANY SY500C-10HD; SANY SY545C-10LR; SANY SY580C-10HD; SANY SY680C-10HD; SANY SY870C-10HD; XCMG XE380C GM |  | Low |
| 02/910140A | JCB | Engine oil filter | JCB NXT 140; JCB NXT 145 Quarry Master; JCB NXT 150; JCB NXT 205; JCB NXT 205LC; JCB NXT 210LC Fuel Master; JCB NXT 215 LC Fuel Master; JCB NXT 215LC; JCB NXT 225LC M; JCB NXT 245HD LR | Fleetguard LF3959 (Cummins 3937695/3937743); Donaldson P502907 - Elofic JS200 6BT listing / Fleetguard LF3959; Donaldson P502907 (Elofic JS140 listing) | Medium |
| 02/910155A | JCB | Fuel filter (secondary) | JCB NXT 140; JCB NXT 145 Quarry Master; JCB NXT 150; JCB NXT 205; JCB NXT 205LC; JCB NXT 210LC Fuel Master; JCB NXT 215 LC Fuel Master; JCB NXT 215LC; JCB NXT 225LC M; JCB NXT 245HD LR | Fleetguard FF5052 (Cummins 3931063/3903640); Donaldson P502905 - Elofic 6BT listing / Fleetguard FF5052; Donaldson P502905 (Elofic JS140 listing) | Medium |
| 332/Y3163 | JCB | Fuel filter (water separator) | JCB NXT 140; JCB NXT 145 Quarry Master; JCB NXT 150; JCB NXT 205; JCB NXT 205LC; JCB NXT 210LC Fuel Master; JCB NXT 215 LC Fuel Master; JCB NXT 215LC; JCB NXT 225LC M; JCB NXT 245HD LR | Fleetguard FS1275 (Cummins 4093733) per Elofic JS140 6BT listing / Fleetguard FS1275; Donaldson P502913 (Elofic JS140 listing) | Medium |
| 333/K8611 | JCB | Hydraulic return filter | JCB NXT 140; JCB NXT 145 Quarry Master; JCB NXT 150; JCB NXT 205; JCB NXT 205LC; JCB NXT 210LC Fuel Master; JCB NXT 215 LC Fuel Master; JCB NXT 215LC; JCB NXT 225LC M; JCB NXT 245HD LR | Fleetguard HF28978 / Donaldson P551210 listed by Elofic as JS140 hydraulic filter | Medium |
| 334/Y2810 | JCB | Air filter (outer/primary) | JCB NXT 140; JCB NXT 145 Quarry Master; JCB NXT 150; JCB NXT 205; JCB NXT 205LC; JCB NXT 210LC Fuel Master; JCB NXT 215 LC Fuel Master; JCB NXT 215LC; JCB NXT 225LC M; JCB NXT 245HD LR | Donaldson P613334; Baldwin RS30257 / Donaldson P613334; Baldwin RS30257; Hifi SA18160; Cummins 4315239/5025658 | Medium |
| KBJ1691A | JCB | Hydraulic pilot filter | JCB NXT 140; JCB NXT 145 Quarry Master; JCB NXT 150; JCB NXT 205; JCB NXT 205LC; JCB NXT 210LC Fuel Master; JCB NXT 215 LC Fuel Master; JCB NXT 215LC; JCB NXT 225LC M; JCB NXT 245HD LR | Donaldson P550576; Fleetguard HF28836 | Medium |
| KNJ0288A | JCB | Hydraulic drain (case drain) filter | JCB NXT 140; JCB NXT 145 Quarry Master; JCB NXT 150; JCB NXT 205; JCB NXT 205LC; JCB NXT 210LC Fuel Master; JCB NXT 215 LC Fuel Master; JCB NXT 215LC; JCB NXT 225LC M; JCB NXT 245HD LR | Donaldson P556005; Baldwin BT334; Fleetguard HF7551; Hifi SH60120 / Donaldson P556005; Fleetguard HF7551 | Medium |
| 5H.999.22.0.SP | Kirloskar | Engine service filter kit (KOEL consumables kit) | BEML BL9H 4×2; Bull HD76 BS4 Heavy Duty; Bull SD76 BS4 Champion; Escorts Digmax II; Escorts Digmax II XP; Escorts Jungli HT; MANITOU MXT 1740 K; MANITOU MXT 840 K; Manitou MBL 745 Ranger; Manitou MBL 745 S |  | Low |
| 53C0083 | LiuGong | Hydraulic pilot filter | Liugong 848H; Liugong 856H MAX; Liugong 922E Amphibious; Liugong 922E XD; Liugong 922Ea (Alpha); Liugong 924E XD; Liugong 925E XLR; Liugong 926E XD; Liugong 930E XLR; Liugong 935E HD |  | Medium |
| 53C0837 | LiuGong | Hydraulic tank breather | Liugong 914E; Liugong 915E; Liugong 922E Amphibious; Liugong 922E XD; Liugong 922Ea (Alpha); Liugong 924E XD; Liugong 925E XLR; Liugong 926E XD; Liugong 930E XLR; Liugong 935E HD |  | Medium |
| 21707132 | Volvo | Engine oil filter (by-pass) | Volvo EC380D; Volvo EC480D; Volvo EC550E; Volvo EC750D; Volvo EC950E; Volvo L150H; Volvo L180H; Volvo L220H; Volvo L260H; Volvo L350H | Fleetguard LF3654 / Fleetguard LF3654; Donaldson P550425 / Volvo 477556; Fleetguard LF3654 | Medium |
| 21707133 | Volvo | Engine oil filter (full-flow, long-life) | Volvo EC380D; Volvo EC480D; Volvo EC550E; Volvo EC750D; Volvo EC950E; Volvo L150H; Volvo L180H; Volvo L220H; Volvo L260H; Volvo L350H | MANN 478736; Donaldson P550425; Fleetguard LF667; Baldwin B76 / MANN 478736; Fleetguard LF667 / MANN 478736; Fleetguard LF667/LF3675; Donaldson P554004 | High |
| VOE14622355 | Volvo | Fuel pre-filter / water separator element | Volvo EC200D; Volvo EC210D; Volvo EC220D; Volvo EC250D; Volvo EC300D; Volvo EC350D; Volvo EC380D; Volvo EC480D; Volvo EC750D; Volvo EC950E |  | Medium |
| 40/303603 | JCB | Bucket tooth (twin-strap) | JCB 2DX; JCB 3DX; JCB 3DX Plus; JCB 3DX Super; JCB 3DX Xtra; JCB 4DX; JCB 530-110; JCB 530-70; JCB 540-70 | also JCB 332/34388 | Medium |
| 06.436.01.0.00 | Kirloskar | Engine oil filter | Hyundai R130 SMART; Hyundai R140L Smart Plus; Hyundai R150L SMART Plus; Hyundai R85A SMART Plus; LiuGong 611; LiuGong 6210E; Liugong 818N; SANY SSR110C-10 PRO; XCMG XE140i INFRA |  | Low |
| 3H.132.01.0.00 | Kirloskar | Fuel filter (primary element) | Apollo Carmix 23 FX; CONMAT CSLM 2500; JOHN SLCM 2.2; MACONS MST 2; Schwing Stetter SLM 2100; Schwing Stetter SLM BEE 2.1; Tarle SLM 2200; VENUS ULTRA 2.0; VENUS ULTRA 2600 |  | Low |
| 3H.132.02.0.00 | Kirloskar | Fuel filter (secondary element) | Apollo Carmix 23 FX; CONMAT CSLM 2500; JOHN SLCM 2.2; MACONS MST 2; Schwing Stetter SLM 2100; Schwing Stetter SLM BEE 2.1; Tarle SLM 2200; VENUS ULTRA 2.0; VENUS ULTRA 2600 |  | Low |
| 019004000 | Putzmeister | Delivery piston Ø200 (standard) | Putzmeister BSA 1405 D Classic; Putzmeister BSA 1406 E eSmart; Putzmeister BSA 1407 D Classic; Putzmeister BSA 1407 D eSmart; Putzmeister BSA 1407 HD eSmart; Putzmeister BSA 1408 HD; Putzmeister BSA 1410 D; Putzmeister BSA 2109 HD; Putzmeister Ultima BSA 1407 D | Long-life piston assembly 086236005 | High |
| 080372004 | Putzmeister | Delivery piston seal Ø200 (long-life piston) | Putzmeister BSA 1405 D Classic; Putzmeister BSA 1406 E eSmart; Putzmeister BSA 1407 D Classic; Putzmeister BSA 1407 D eSmart; Putzmeister BSA 1407 HD eSmart; Putzmeister BSA 1408 HD; Putzmeister BSA 1410 D; Putzmeister BSA 2109 HD; Putzmeister Ultima BSA 1407 D |  | High |
| 229488005 | Putzmeister | Spectacle wear plate (DURO 22) | Putzmeister BSA 1405 D Classic; Putzmeister BSA 1406 E eSmart; Putzmeister BSA 1407 D Classic; Putzmeister BSA 1407 D eSmart; Putzmeister BSA 1407 HD eSmart; Putzmeister BSA 1408 HD; Putzmeister BSA 1410 D; Putzmeister BSA 2109 HD; Putzmeister Ultima BSA 1407 D | Carbide version 571451; carbide with insert ring 275608004 + insert ring 485385 | High |
| 251031006 | Putzmeister | Wear ring / cutting ring (DURO 22) | Putzmeister BSA 1405 D Classic; Putzmeister BSA 1406 E eSmart; Putzmeister BSA 1407 D Classic; Putzmeister BSA 1407 D eSmart; Putzmeister BSA 1407 HD eSmart; Putzmeister BSA 1408 HD; Putzmeister BSA 1410 D; Putzmeister BSA 2109 HD; Putzmeister Ultima BSA 1407 D | Carbide version 531240 | High |
| 264217008 | Putzmeister | Wear part set Ø200/260 (plate+ring+thrust ring) | Putzmeister BSA 1405 D Classic; Putzmeister BSA 1406 E eSmart; Putzmeister BSA 1407 D Classic; Putzmeister BSA 1407 D eSmart; Putzmeister BSA 1407 HD eSmart; Putzmeister BSA 1408 HD; Putzmeister BSA 1410 D; Putzmeister BSA 2109 HD; Putzmeister Ultima BSA 1407 D | Carbide set 571452 | High |
| 284788009 | Putzmeister | Thrust ring Ø200 | Putzmeister BSA 1405 D Classic; Putzmeister BSA 1406 E eSmart; Putzmeister BSA 1407 D Classic; Putzmeister BSA 1407 D eSmart; Putzmeister BSA 1407 HD eSmart; Putzmeister BSA 1408 HD; Putzmeister BSA 1410 D; Putzmeister BSA 2109 HD; Putzmeister Ultima BSA 1407 D | Carbide set uses 252898002 | High |
| 60200365 | SANY | Hydraulic return filter | SANY SY210C-9; SANY SY215C-9LC SPARC; SANY SY215C-9LCS; SANY SY220C-9HD; SANY SY220C-9XL Sparc+; SANY SY245C-9LR; SANY SY260C-10HD GENe; SANY SY350C-9LCHD; SANY SY365C-9LA | SANY PO-CO-01-01430 | Medium |
| 14532687 | Volvo | Hydraulic filter (spin-on line filter) | Volvo EC120D; Volvo EC140D; Volvo EC200D; Volvo EC210D; Volvo EC220; Volvo EC220D; Volvo EC250D; Volvo EC300D; Volvo EC750D | CVA 14532687 | Medium |
| 30Z7181024 | BEML | Fuel water separator | BEML BD50; BEML BD65-1; BEML BD80; BEML BD85; BEML BE200; BEML BE220G; BEML BE300LC; BEML BG605A |  | Medium |
| 581/18063 | JCB | Transmission filter | JCB 3DX; JCB 3DX Plus; JCB 3DX Super; JCB 3DX Xtra; JCB 4DX; JCB 530-110; JCB 530-70; JCB 540-70 | Fleetguard HF35139; Donaldson P551204 | High |
| HH1C0-32430 | Kubota | Engine oil filter | SANY SY80C-9; SANY SY80C-9 PRO; SANY SY80C-9 SALT; Tata Hitachi Shinrai Power; Tata Hitachi Shinrai Power 4; Tata Hitachi Shinrai Prime; XCMG XE80C; XCMG XE80C Pro | Kubota HH164-32430 (alt) / replaces Kubota 1C020-32430 / 1C020-32434 | Medium |
| 12886224 | Liebherr | Engine crankcase breather filter | Liebherr R 926 Litronic; Liebherr R 928 Litronic; Liebherr R 930 Litronic; Liebherr R 934 Litronic; Liebherr R 938 Litronic; Liebherr R 945 Litronic; Liebherr R 956 Litronic; Liebherr R 960 SME Litronic |  | Low |
| 40C2707 | LiuGong | Air filter kit (outer+inner) | Liugong 922E Amphibious; Liugong 922E XD; Liugong 922Ea (Alpha); Liugong 924E XD; Liugong 925E XLR; Liugong 926E XD; Liugong 930E XLR; Liugong 935E HD | 40C1033 / 40C1032 / Donaldson X012252 kit; elements 40C1033 (outer) / 40C1032 (inner) | Medium |
| 406926 | Putzmeister | S transfer tube | Putzmeister BSA 1404 HD eSmart; Putzmeister BSA 1405 D Classic; Putzmeister BSA 1406 E eSmart; Putzmeister BSA 1407 D Classic; Putzmeister BSA 1407 D eSmart; Putzmeister BSA 1407 HD eSmart; Putzmeister BSA 1410 D; Putzmeister Ultima BSA 1407 D |  | Medium |
| 10063939 | Schwing | Cutting ring DN210 | Schwing Stetter SP 1015 D; Schwing Stetter SP 1015 HD; Schwing Stetter SP 1420 D; Schwing Stetter SP 1800 D; Schwing Stetter SP 1800 E; Schwing Stetter SP 1807; Schwing Stetter SP 2000; Schwing Stetter SP 4507 | Carbide (HM) = 10081098 | Low |
| 10064472 | Schwing | Pressure spring DN210 | Schwing Stetter SP 1015 D; Schwing Stetter SP 1015 HD; Schwing Stetter SP 1420 D; Schwing Stetter SP 1800 D; Schwing Stetter SP 1800 E; Schwing Stetter SP 1807; Schwing Stetter SP 2000; Schwing Stetter SP 4507 |  | Low |
| 10074767 | Schwing | Wearing insert / wear plate DN200 | Schwing Stetter SP 1015 D; Schwing Stetter SP 1015 HD; Schwing Stetter SP 1420 D; Schwing Stetter SP 1800 D; Schwing Stetter SP 1800 E; Schwing Stetter SP 1807; Schwing Stetter SP 2000; Schwing Stetter SP 4507 | Carbide (HM) DN200/210 = 10081096 | Low |
| 10074769 | Schwing | Base plate (Rock valve) DN180/200/230 | Schwing Stetter SP 1015 D; Schwing Stetter SP 1015 HD; Schwing Stetter SP 1420 D; Schwing Stetter SP 1800 D; Schwing Stetter SP 1800 E; Schwing Stetter SP 1807; Schwing Stetter SP 2000; Schwing Stetter SP 4507 |  | Low |
| 10161754 | Schwing | Pumping piston DN200 | Schwing Stetter SP 1015 D; Schwing Stetter SP 1015 HD; Schwing Stetter SP 1420 D; Schwing Stetter SP 1800 D; Schwing Stetter SP 1800 E; Schwing Stetter SP 1807; Schwing Stetter SP 2000; Schwing Stetter SP 4507 |  | Low |
| TE23320 | Tata Hitachi | Seal kit (bucket cylinder) | Tata Hitachi EX 200 Infra; Tata Hitachi EX 200LC Prime; Tata Hitachi EX 210 Infra Super+ Series; Tata Hitachi EX 210LC Prime; Tata Hitachi EX 215 LCQ Prime; Tata Hitachi EX 215LC Prime; Tata Hitachi EX 215LC-SLR; Tata Hitachi EX 70 Prime | alt TE22674 | Medium |
| 129242-55730 | Yanmar | Fuel filter (primary/water separator) | Liugong 9035E; SANY SY33C PRO; SANY SY35U; SANY SY35U Pro; SANY SY38U PRO; XCMG XE38U; XCMG XE40U; XCMG XE40U PRO | Water separator assembly 129242-55701 | Medium |
| 129907-55801 | Yanmar | Fuel filter (secondary) | Liugong 9035E; SANY SY33C PRO; SANY SY35U; SANY SY35U Pro; SANY SY38U PRO; XCMG XE38U; XCMG XE40U; XCMG XE40U PRO |  | Medium |
| 31Z5180443 | BEML | Engine oil filter cartridge | BEML BD155; BEML BD355; BEML BD65-1; BEML BD80; BEML BD85; BEML BE300LC; BEML BG605A |  | Medium |
| 3890206 | Cummins | Fuel filter (primary/water separator) | Tata Hitachi EX 200 Infra; Tata Hitachi EX 200LC Prime; Tata Hitachi EX 210 Infra Super+ Series; Tata Hitachi EX 210LC Prime; Tata Hitachi EX 215 LCQ Prime; Tata Hitachi EX 215LC Prime; Tata Hitachi EX 215LC-SLR | Fleetguard FS1280 (per AG International); alt. listed 3931866 / TE20760 / CSDEG002 / 278609119903 | High |
| 3903640 | Cummins | Fuel filter (secondary) | Tata Hitachi EX 200 Infra; Tata Hitachi EX 200LC Prime; Tata Hitachi EX 210 Infra Super+ Series; Tata Hitachi EX 210LC Prime; Tata Hitachi EX 215 LCQ Prime; Tata Hitachi EX 215LC Prime; Tata Hitachi EX 215LC-SLR | Fleetguard FF5052 (per AG International); alt. listed 4080713 / TE02806 / CSDEG001 / 278609119904 | High |
| 3908615 | Cummins | Engine oil filter | Tata Hitachi EX 200 Infra; Tata Hitachi EX 200LC Prime; Tata Hitachi EX 210 Infra Super+ Series; Tata Hitachi EX 210LC Prime; Tata Hitachi EX 215 LCQ Prime; Tata Hitachi EX 215LC Prime; Tata Hitachi EX 215LC-SLR | Fleetguard LF3349 (per AG International for EX200/EX210 6BT); alt. listed CSDEG006 / 278618139902 | High |
| 3922900 | Cummins | Belt tensioner | Tata Hitachi EX 200 Infra; Tata Hitachi EX 200LC Prime; Tata Hitachi EX 210 Infra Super+ Series; Tata Hitachi EX 210LC Prime; Tata Hitachi EX 215 LCQ Prime; Tata Hitachi EX 215LC Prime; Tata Hitachi EX 215LC-SLR |  | Medium |
| 3935335 | Cummins | Fan belt | Tata Hitachi EX 200 Infra; Tata Hitachi EX 200LC Prime; Tata Hitachi EX 210 Infra Super+ Series; Tata Hitachi EX 210LC Prime; Tata Hitachi EX 215 LCQ Prime; Tata Hitachi EX 215LC Prime; Tata Hitachi EX 215LC-SLR |  | Medium |
| FF256 | Cummins (Fleetguard) | Fuel filter (secondary) | Liebherr R 9400 G6; Liebherr R 9800 G6; Tata Hitachi EX 1200V; Tata Hitachi EX 2600-6; Tata Hitachi EX 3600-6; Tata Hitachi EX 5600-7; Tata Hitachi EX 8000-6 | Fleetguard FF256 | Low |
| FS53014 | Cummins (Fleetguard) | Fuel filter (primary/water separator) | Liebherr R 9400 G6; Liebherr R 9800 G6; Tata Hitachi EX 1200V; Tata Hitachi EX 2600-6; Tata Hitachi EX 3600-6; Tata Hitachi EX 5600-7; Tata Hitachi EX 8000-6 | Fleetguard FS53014 | Low |
| LF9540 | Cummins (Fleetguard) | Engine oil filter | Liebherr R 9400 G6; Liebherr R 9800 G6; Tata Hitachi EX 1200V; Tata Hitachi EX 2600-6; Tata Hitachi EX 3600-6; Tata Hitachi EX 5600-7; Tata Hitachi EX 8000-6 | Fleetguard LF9540 | Low |
| WF2075 | Cummins (Fleetguard) | Coolant filter (water filter) | Liebherr R 9400 G6; Liebherr R 9800 G6; Tata Hitachi EX 1200V; Tata Hitachi EX 2600-6; Tata Hitachi EX 3600-6; Tata Hitachi EX 5600-7; Tata Hitachi EX 8000-6 | Fleetguard WF2075; WF2077; WF2073 | Low |
| 2105/1605 | JCB | Bucket pin | JCB NXT 205; JCB NXT 205LC; JCB NXT 210LC Fuel Master; JCB NXT 215 LC Fuel Master; JCB NXT 215LC; JCB NXT 225LC M; JCB NXT 245HD LR |  | Low |
| 32/925968 | JCB | Fuel filter (additional) | JCB NXT 205; JCB NXT 205LC; JCB NXT 210LC Fuel Master; JCB NXT 215 LC Fuel Master; JCB NXT 215LC; JCB NXT 225LC M; JCB NXT 245HD LR |  | Low |
| 320/04134 | JCB | Engine oil filter | JCB 130; JCB 3DX; JCB 3DX Plus; JCB 3DX Super; JCB 3DX Xtra; JCB 4DX; JCB VM117 | Fleetguard LF17556; Donaldson P502465 / Fleetguard LF17556; Donaldson P502465; MANN W 950/38 | High |
| 320/A7170 | JCB | Fuel filter (secondary/main element) | JCB 130; JCB 3DX; JCB 3DX Plus; JCB 3DX Super; JCB 3DX Xtra; JCB 4DX; JCB VM117 | Fleetguard FF5794 (listed against earlier no. 320/07155) / also 320/07394 | High |
| 332/Y3296 | JCB | Fan belt | JCB NXT 205; JCB NXT 205LC; JCB NXT 210LC Fuel Master; JCB NXT 215 LC Fuel Master; JCB NXT 215LC; JCB NXT 225LC M; JCB NXT 245HD LR |  | Medium |
| 332/Y3299 | JCB | Fuel strainer | JCB NXT 205; JCB NXT 205LC; JCB NXT 210LC Fuel Master; JCB NXT 215 LC Fuel Master; JCB NXT 215LC; JCB NXT 225LC M; JCB NXT 245HD LR |  | Medium |
| 333/P1949 | JCB | Bucket bush | JCB NXT 205; JCB NXT 205LC; JCB NXT 210LC Fuel Master; JCB NXT 215 LC Fuel Master; JCB NXT 215LC; JCB NXT 225LC M; JCB NXT 245HD LR |  | Low |
| 334/Y2811 | JCB | Air filter (inner/safety) | JCB NXT 205; JCB NXT 205LC; JCB NXT 210LC Fuel Master; JCB NXT 215 LC Fuel Master; JCB NXT 215LC; JCB NXT 225LC M; JCB NXT 245HD LR |  | Medium |
| 335/18924 | JCB | Hydraulic filter | JCB NXT 205; JCB NXT 205LC; JCB NXT 210LC Fuel Master; JCB NXT 215 LC Fuel Master; JCB NXT 215LC; JCB NXT 225LC M; JCB NXT 245HD LR |  | Low |
| 40/303603 | JCB | Bucket tooth | JCB NXT 205; JCB NXT 205LC; JCB NXT 210LC Fuel Master; JCB NXT 215 LC Fuel Master; JCB NXT 215LC; JCB NXT 225LC M; JCB NXT 245HD LR |  | Low |
| KRJ3836 | JCB | Fuel filter (primary) | JCB NXT 205; JCB NXT 205LC; JCB NXT 210LC Fuel Master; JCB NXT 215 LC Fuel Master; JCB NXT 215LC; JCB NXT 225LC M; JCB NXT 245HD LR |  | Medium |
| 3H.132.01.0.00 | Kirloskar | Fuel filter element (primary) | ACE AX 130; ACE Phantom 2WD; ACE Phantom 4WD; ACE Phantom 4WD N; Bull HD76 2WD; Bull HD76 4WD; Bull HD96 4WD |  | Medium |
| 3H.132.02.0.00 | Kirloskar | Fuel filter element (secondary) | ACE AX 130; ACE Phantom 2WD; ACE Phantom 4WD; ACE Phantom 4WD N; Bull HD76 2WD; Bull HD76 4WD; Bull HD96 4WD |  | Medium |
| 3H.132.10.0.00 | Kirloskar | Fuel filter (spin-on twin bowl, primary+secondary) | ACE AX 130; ACE Phantom 2WD; ACE Phantom 4WD; ACE Phantom 4WD N; Bull HD76 2WD; Bull HD76 4WD; Bull HD96 4WD | Elofic EK-4293 (mesh/primary, Fleetguard FF5525) & EK-4294 (paper/secondary, Fleetguard FF5526) listed for KOEL 4R1040 on JCB 3DX / Elofic EK-4293 (primary, Fleetguard FF5525); EK-4294 (secondary, Fle | Medium |
| 4H.069.01.0.00 | Kirloskar | Fan/alternator V-belt | ACE AX 130; ACE Phantom 2WD; ACE Phantom 4WD; ACE Phantom 4WD N; Bull HD76 2WD; Bull HD76 4WD; Bull HD96 4WD |  | Low |
| 240112004 | Putzmeister | Delivery cylinder Ø200 x 1400 mm | Putzmeister BSA 1406 E eSmart; Putzmeister BSA 1407 D Classic; Putzmeister BSA 1407 D eSmart; Putzmeister BSA 1407 HD eSmart; Putzmeister BSA 1408 HD; Putzmeister BSA 1410 D; Putzmeister Ultima BSA 1407 D |  | Medium |
| 60207264 | SANY | Air filter (inner/safety) | SANY SY215C-9LCS; SANY SY220C-9HD; SANY SY240C-9HD GraMa; SANY SY240C-9HD SPARC; SANY SY240C-9LCHD; SANY SY260C-10HD GENe; SANY SY285C-9LR | Donaldson P537877 | Medium |
| 60207265 | SANY | Air filter (outer/primary) | SANY SY215C-9LCS; SANY SY220C-9HD; SANY SY240C-9HD GraMa; SANY SY240C-9HD SPARC; SANY SY240C-9LCHD; SANY SY260C-10HD GENe; SANY SY285C-9LR | Donaldson P537876 | Medium |
| B222100000640 | SANY | Air filter (inner/safety) | SANY SY350C-9LCHD; SANY SY365C-9LA; SANY SY380C-10HD; SANY SY390C-10HD GraMa; SANY SY500C-10HD; SANY SY545C-10LR; SANY SY580C-10HD | Donaldson P777869 | Medium |
| B222100000641 | SANY | Air filter (outer/primary) | SANY SY350C-9LCHD; SANY SY365C-9LA; SANY SY380C-10HD; SANY SY390C-10HD GraMa; SANY SY500C-10HD; SANY SY545C-10LR; SANY SY580C-10HD | Donaldson P777868 | Medium |
| 2014503 | Tata Hitachi | Side cutter | Tata Hitachi EX 200 Infra; Tata Hitachi EX 200LC Prime; Tata Hitachi EX 210 Infra Super+ Series; Tata Hitachi EX 210LC Prime; Tata Hitachi EX 215 LCQ Prime; Tata Hitachi EX 215LC Prime; Tata Hitachi EX 215LC-SLR |  | Medium |
| 3814312 | Tata Hitachi | Air filter (outer/primary) | Tata Hitachi EX 200 Infra; Tata Hitachi EX 200LC Prime; Tata Hitachi EX 210 Infra Super+ Series; Tata Hitachi EX 210LC Prime; Tata Hitachi EX 215 LCQ Prime; Tata Hitachi EX 215LC Prime; Tata Hitachi EX 215LC-SLR |  | Medium |
| 3814313 | Tata Hitachi | Air filter (inner/safety) | Tata Hitachi EX 200 Infra; Tata Hitachi EX 200LC Prime; Tata Hitachi EX 210 Infra Super+ Series; Tata Hitachi EX 210LC Prime; Tata Hitachi EX 215 LCQ Prime; Tata Hitachi EX 215LC Prime; Tata Hitachi EX 215LC-SLR |  | Medium |
| 4199012 | Tata Hitachi | Hydraulic suction strainer | Tata Hitachi EX 200 Infra; Tata Hitachi EX 200LC Prime; Tata Hitachi EX 210 Infra Super+ Series; Tata Hitachi EX 210LC Prime; Tata Hitachi EX 215 LCQ Prime; Tata Hitachi EX 215LC Prime; Tata Hitachi EX 215LC-SLR |  | Medium |
| 4325820 | Tata Hitachi | Hydraulic return filter | Tata Hitachi EX 200 Infra; Tata Hitachi EX 200LC Prime; Tata Hitachi EX 210 Infra Super+ Series; Tata Hitachi EX 210LC Prime; Tata Hitachi EX 215 LCQ Prime; Tata Hitachi EX 215LC Prime; Tata Hitachi EX 215LC-SLR |  | Medium |
| 4631976 | Tata Hitachi | Hydraulic pilot filter | Tata Hitachi EX 200 Infra; Tata Hitachi EX 200LC Prime; Tata Hitachi EX 210 Infra Super+ Series; Tata Hitachi EX 210LC Prime; Tata Hitachi EX 215 LCQ Prime; Tata Hitachi EX 215LC Prime; Tata Hitachi EX 215LC-SLR |  | Medium |
| TE03583 | Tata Hitachi | Tooth pin | Tata Hitachi EX 200 Infra; Tata Hitachi EX 200LC Prime; Tata Hitachi EX 210 Infra Super+ Series; Tata Hitachi EX 210LC Prime; Tata Hitachi EX 215 LCQ Prime; Tata Hitachi EX 215LC Prime; Tata Hitachi EX 215LC-SLR |  | Medium |
| TE06513 | Tata Hitachi | Bucket tooth | Tata Hitachi EX 200 Infra; Tata Hitachi EX 200LC Prime; Tata Hitachi EX 210 Infra Super+ Series; Tata Hitachi EX 210LC Prime; Tata Hitachi EX 215 LCQ Prime; Tata Hitachi EX 215LC Prime; Tata Hitachi EX 215LC-SLR |  | Medium |
| 1000424916 | Weichai | Fuel filter (primary/water separator) | Hyundai HL630I-V; Hyundai HL930I; SDLG G9150Hi; Shantui DH24C3; Shantui SG15-G; XCMG XS115H; XCMG ZL33FV |  | Low |
| 6667352 | Bobcat | Fuel filter (primary/water separator) | Bobcat E20z; Bobcat E27; Bobcat E37 Ultra HD; Bobcat E37 Xtra HD; Bobcat S450; Bobcat S70 |  | High |
| 7176099 | Bobcat | Cabin air filter | Bobcat E20z; Bobcat E27; Bobcat E50z; Bobcat S450; Bobcat S590; Bobcat S770 |  | High |
| FF5612 | Cummins (Fleetguard) | Fuel filter (secondary) | Liugong 924E XD; Liugong 926E XD; Liugong 930E XLR; Liugong 935E HD; Sany STG170C-10; Sany STG210C-10 |  | Medium |
| FS19732 | Cummins (Fleetguard) | Fuel filter (primary/water separator) | Liugong 924E XD; Liugong 926E XD; Liugong 930E XLR; Liugong 935E HD; Sany STG170C-10; Sany STG210C-10 | Fleetguard FS1098 (alt) | Medium |
| LF16015 | Cummins (Fleetguard) | Engine oil filter | Liugong 924E XD; Liugong 926E XD; Liugong 930E XLR; Liugong 935E HD; Sany STG170C-10; Sany STG210C-10 |  | Medium |
| 4326739 | Hitachi | Fuel filter (secondary) | Tata Hitachi ZAXIS 140H Ultra; Tata Hitachi ZAXIS 220LC; Tata Hitachi ZAXIS 220LC Ultra; Tata Hitachi ZAXIS 370LCH; Tata Hitachi ZAXIS 400MTH; Tata Hitachi ZAXIS 470H | Donaldson P550391; superseded by 4S00483 / Donaldson P550391; superseded by 4S00483; Fleetguard FF5367 / Donaldson P550391; superseded by 4S00483; Fleetguard FF5367 (eurofilter) | Medium |
| 4437838 | Hitachi | Hydraulic tank breather | Tata Hitachi ZAXIS 370LCH; Tata Hitachi ZAXIS 370LCH Ultra; Tata Hitachi ZAXIS 400MTH; Tata Hitachi ZAXIS 650H; Tata Hitachi ZAXIS 670H; Tata Hitachi ZW225 CEV 5 | Fleetguard AF26675 / Fleetguard AF26675; Sure SA12572 | Medium |
| 4484495 | Hitachi | Engine oil filter | Tata Hitachi ZAXIS 140H Ultra; Tata Hitachi ZAXIS 220LC; Tata Hitachi ZAXIS 220LC Ultra; Tata Hitachi ZAXIS 370LCH; Tata Hitachi ZAXIS 400MTH; Tata Hitachi ZAXIS 470H | Donaldson P550596; superseded by 4622562 / Donaldson P550596; superseded by 4622562 (also 4696643 per IKH) / Donaldson P550596; superseded by 4622562; Fleetguard LF16045 | Medium |
| 4630525 | Hitachi | Hydraulic pilot filter | Tata Hitachi ZAXIS 220LC; Tata Hitachi ZAXIS 220LC Ultra; Tata Hitachi ZAXIS 370LCH Ultra; Tata Hitachi ZAXIS 650H; Tata Hitachi ZAXIS 670H; Tata Hitachi Zaxis 870-5G | ECE FLP2606; Fleetguard HF35516/HF35519; Baldwin BT9440; Donaldson P573481 / Fleetguard HF35519 / Fleetguard HF35519; Baldwin BT9440 / Fleetguard HF35519; Baldwin BT9440; Donaldson P573481; Wix WL1000 | Medium |
| 32/915801 | JCB | Air filter (inner/safety) | JCB 130; JCB 3DX; JCB 3DX Plus; JCB 3DX Super; JCB 3DX Xtra; JCB 4DX | Donaldson P780030 (per Elofic listing) | Medium |
| 32/915802 | JCB | Air filter (outer/primary) | JCB 130; JCB 3DX; JCB 3DX Plus; JCB 3DX Super; JCB 3DX Xtra; JCB 4DX | Donaldson P778989 (per Elofic listing) | Medium |
| 320/07853 | JCB | Crankcase ventilation (CCV) filter | JCB 225LC Eco Plus; JCB 433-5; JCB 440-5; JCB 530-110; JCB 530-70; JCB 540-70 | also 320/07737 (CCV filter EcoMax JS) / also JCB 320/07737 | Medium |
| 320/A7123 | JCB | Fuel filter (primary/sediment) | JCB 225LC Eco Plus; JCB 433-5; JCB 440-5; JCB 530-110; JCB 530-70; JCB 540-70 | also 32/925950 / also JCB 32/925950 / also JCB 32/925950; Hifi SN70320 | Medium |
| 320/A7250 | JCB | Fuel filter (primary/water separator element) | JCB 130; JCB 3DX; JCB 3DX Plus; JCB 3DX Super; JCB 3DX Xtra; JCB 4DX | Fleetguard FS20076; Baldwin BF9828-D / Hifi SN 70575; Fleetguard FS20076; Baldwin BF9828-D; Donaldson P551424 | High |
| 320/A7351 | JCB | Fuel filter (secondary) | JCB 225LC Eco Plus; JCB 433-5; JCB 440-5; JCB 530-110; JCB 530-70; JCB 540-70 | also 320/07382 / also JCB 320/07382 | Medium |
| 320/B4420 | JCB | Engine oil filter | JCB 225LC Eco Plus; JCB 433-5; JCB 440-5; JCB 530-110; JCB 530-70; JCB 540-70 | MANN W 950/38; Fleetguard LF17556; Donaldson P502465 / MANN W 950/38; Fleetguard LF17556; Donaldson P502465 (crossrefs listed against 320/04133) / MANN W 950/38; Fleetguard LF17556; Donaldson P502465  | Medium |
| 53C0210 | LiuGong | Hydraulic return filter | Liugong 924E XD; Liugong 926E XD; Liugong 930E XLR; Liugong 935E HD; Liugong 939E; Liugong 939E HD | Donaldson P566999 | Medium |
| 53C0436 | LiuGong | Fuel filter (primary/water separator) | Liugong 914E; Liugong 915E; Liugong 924E XD; Liugong 926E XD; Liugong 930E XLR; Liugong 935E HD |  | Low |
| 53C0658 | LiuGong | Hydraulic suction filter | Liugong 924E XD; Liugong 926E XD; Liugong 930E XLR; Liugong 935E HD; Liugong 939E; Liugong 939E HD |  | Medium |
| 006022696H1 | Mahindra | Fuel filter (primary/water separator) | Mahindra Earthmaster SX; Mahindra Earthmaster SXE; Mahindra Earthmaster VX; Mahindra SX IV; Mahindra SX Smart 50; Mahindra VX IV | Elofic EK-6423 | Low |
| 0303BAC01031N | Mahindra | Engine oil filter (spin-on) | Mahindra Earthmaster SX; Mahindra Earthmaster SXE; Mahindra Earthmaster VX; Mahindra SX IV; Mahindra SX Smart 50; Mahindra VX IV | Elofic EK-6424 | Low |
| 0313AAA04072N | Mahindra | Air filter (inner/safety) | Mahindra Earthmaster SX; Mahindra Earthmaster SXE; Mahindra Earthmaster VX; Mahindra SX IV; Mahindra SX Smart 50; Mahindra VX IV | Elofic EK-4679 | Low |
| 0313AAC04712N | Mahindra | Air filter (outer/primary) | Mahindra Earthmaster SX; Mahindra Earthmaster SXE; Mahindra Earthmaster VX; Mahindra SX IV; Mahindra SX Smart 50; Mahindra VX IV | Elofic EK-4708 | Low |
| 0703BAN00041N | Mahindra | Transmission filter (spin-on, Carraro) | Mahindra Earthmaster SX; Mahindra Earthmaster SXE; Mahindra Earthmaster VX; Mahindra SX IV; Mahindra SX Smart 50; Mahindra VX IV | CASE BU4430033; Terex/L&T 6190810M1; Donaldson P554408 (per Elofic EK-6440) | Medium |
| 2106AAA00070N | Mahindra | Hydraulic suction strainer | Mahindra Earthmaster SX; Mahindra Earthmaster SXE; Mahindra Earthmaster VX; Mahindra SX IV; Mahindra SX Smart 50; Mahindra VX IV | Elofic EK-4388 (suction filter) | Low |
| 2106SAA00040N | Mahindra | Hydraulic return filter (main) | Mahindra Earthmaster SX; Mahindra Earthmaster SXE; Mahindra Earthmaster VX; Mahindra SX IV; Mahindra SX Smart 50; Mahindra VX IV | Donaldson P550251; alt. no. 0180MA010BN | Low |
| 130306380 | Perkins | Fuel filter assembly (with element) | JCB 30 PLUS; JCB 35Z HD; JCB 37C HD; JCB 50Z; JCB 51R; JCB 55Z |  | Medium |
| 140517050 | Perkins | Engine oil filter | JCB 30 PLUS; JCB 35Z HD; JCB 37C HD; JCB 50Z; JCB 51R; JCB 55Z | Fleetguard LF3874; JCB 02/630935A / Fleetguard LF3874; also JCB 02/630935A (replaces Perkins 403D/404 spin-on per L&S Engineers) | High |
| 60123505 | SANY | Air filter (inner/safety) | SANY SY20U; SANY SY27U; SANY SY33C PRO; SANY SY35U; SANY SY35U Pro; SANY SY38U PRO | Donaldson P822858 | Medium |
| 60123506 | SANY | Air filter (outer/primary) | SANY SY20U; SANY SY27U; SANY SY33C PRO; SANY SY35U; SANY SY35U Pro; SANY SY38U PRO | Donaldson P821575 | Medium |
| 60276913 | SANY | Fuel filter (primary/water separator) | SANY SY20U; SANY SY27U; SANY SY33C PRO; SANY SY35U; SANY SY35U Pro; SANY SY38U PRO | Yanmar 129242-55730 | Medium |
| 10043559 | Schwing | Delivery line clamp DN150 (cup type, wedge) | Schwing Stetter BP 350 D; Schwing Stetter BP 350 E; Schwing Stetter SP 1400 D; Schwing Stetter SP 1400 E; Schwing Stetter SP 1800 D; Schwing Stetter SP 1800 E |  | Medium |
| 1000491060 | Weichai | Engine oil filter | Hyundai HL630I-V; Hyundai HL930I; SDLG G9150Hi; Shantui SG15-G; XCMG XS115H; XCMG ZL33FV |  | Low |
| 1001120353 | Weichai | Fuel filter (secondary) | Hyundai HL630I-V; Hyundai HL930I; SDLG G9150Hi; Shantui SG15-G; XCMG XS115H; XCMG ZL33FV |  | Low |
| 800104344 | XCMG | Air filter (inner/safety, alt) | XCMG XE210i; XCMG XE215i; XCMG XE215i-KLC; XCMG XE245i LR; XCMG XE250C GM; XCMG XE250LC-K | Donaldson P537877 | Low |
| 800104345 | XCMG | Air filter (outer/primary, alt) | XCMG XE210i; XCMG XE215i; XCMG XE215i-KLC; XCMG XE245i LR; XCMG XE250C GM; XCMG XE250LC-K | Donaldson P537876 | Low |
| 800104393 | XCMG | Fuel filter (secondary, alt) | XCMG XE210i; XCMG XE215i; XCMG XE215i-KLC; XCMG XE245i LR; XCMG XE250C GM; XCMG XE250LC-K | Donaldson P552564 | Low |
| 800104394 | XCMG | Fan belt | XCMG XE210i; XCMG XE215i; XCMG XE215i-KLC; XCMG XE245i LR; XCMG XE250C GM; XCMG XE250LC-K |  | Low |
| 800105552 | XCMG | Fuel filter (primary/water separator) | XCMG XE210i; XCMG XE215i; XCMG XE215i-KLC; XCMG XE245i LR; XCMG XE250C GM; XCMG XE250LC-K | Donaldson P551026 | Low |
| 800107892 | XCMG | Engine oil filter (alt) | XCMG XE210i; XCMG XE215i; XCMG XE215i-KLC; XCMG XE245i LR; XCMG XE250C GM; XCMG XE250LC-K | Donaldson P550596 | Low |
| 800107893 | XCMG | Fuel filter (primary) | XCMG XE210i; XCMG XE215i; XCMG XE215i-KLC; XCMG XE245i LR; XCMG XE250C GM; XCMG XE250LC-K |  | Low |
| 800140917 | XCMG | V-belt | XCMG XE210i; XCMG XE215i; XCMG XE215i-KLC; XCMG XE245i LR; XCMG XE250C GM; XCMG XE250LC-K |  | Low |
| 800151027 | XCMG | Engine oil filter | XCMG XE210i; XCMG XE215i; XCMG XE215i-KLC; XCMG XE245i LR; XCMG XE250C GM; XCMG XE250LC-K |  | Low |
| 800151038 | XCMG | Air filter (inner/safety) | XCMG XE210i; XCMG XE215i; XCMG XE215i-KLC; XCMG XE245i LR; XCMG XE250C GM; XCMG XE250LC-K |  | Low |
| 800151039 | XCMG | Air filter (outer/primary) | XCMG XE210i; XCMG XE215i; XCMG XE215i-KLC; XCMG XE245i LR; XCMG XE250C GM; XCMG XE250LC-K |  | Low |
| 800151162 | XCMG | Fuel filter (secondary) | XCMG XE210i; XCMG XE215i; XCMG XE215i-KLC; XCMG XE245i LR; XCMG XE250C GM; XCMG XE250LC-K |  | Low |
| 803182167 | XCMG | Hydraulic filter (Donaldson listing) | XCMG XE210i; XCMG XE215i; XCMG XE215i-KLC; XCMG XE245i LR; XCMG XE250C GM; XCMG XE250LC-K |  | Low |
| 803306840 | XCMG | Hydraulic return filter | XCMG XE210i; XCMG XE215i; XCMG XE215i-KLC; XCMG XE245i LR; XCMG XE250C GM; XCMG XE250LC-K |  | Medium |
| 803306841 | XCMG | Hydraulic oil filter | XCMG XE210i; XCMG XE215i; XCMG XE215i-KLC; XCMG XE245i LR; XCMG XE250C GM; XCMG XE250LC-K |  | Medium |
| 819948380 | XCMG | Tooth pin | XCMG XE210i; XCMG XE215i; XCMG XE215i-KLC; XCMG XE245i LR; XCMG XE250C GM; XCMG XE250LC-K |  | Medium |
| 819950047 | XCMG | Bucket tooth | XCMG XE210i; XCMG XE215i; XCMG XE215i-KLC; XCMG XE245i LR; XCMG XE250C GM; XCMG XE250LC-K |  | Medium |
| 819951081 | XCMG | Side cutter (LH) | XCMG XE210i; XCMG XE215i; XCMG XE215i-KLC; XCMG XE245i LR; XCMG XE250C GM; XCMG XE250LC-K |  | Medium |
| 819951082 | XCMG | Side cutter (RH) | XCMG XE210i; XCMG XE215i; XCMG XE215i-KLC; XCMG XE245i LR; XCMG XE250C GM; XCMG XE250LC-K |  | Medium |
| 860151969 | XCMG | Hydraulic pilot filter | XCMG XE210i; XCMG XE215i; XCMG XE215i-KLC; XCMG XE245i LR; XCMG XE250C GM; XCMG XE250LC-K |  | Medium |
| FHJ01000 | Ashok Leyland (Leyparts) | Fuel filter (pre-filter, Ashok Leyland engine number) | BULL CH76 Challenger; Bull SD76 BS5 Super Smart; CASE 1107NX; CASE 770 EX; CASE 770 EX Plus | Fleetguard FF0555200 (FF5552) | Medium |
| FHN00400 | Ashok Leyland (Leyparts) | Fuel filter (main, Ashok Leyland engine number) | BULL CH76 Challenger; Bull SD76 BS5 Super Smart; CASE 1107NX; CASE 770 EX; CASE 770 EX Plus | Fleetguard FS1967100V (FS19671) | Low |
| FPA00300 | Ashok Leyland (Leyparts) | Engine oil filter (Ashok Leyland engine number) | BULL CH76 Challenger; Bull SD76 BS5 Super Smart; CASE 1107NX; CASE 770 EX; CASE 770 EX Plus | Fleetguard LF16309 / LF1630900; Bosch F 002 H26 313; Millard ML-12036; HIFI SO 11170 | Medium |
| 0412122261 | BEML | Drive belt C/58 | BEML BD65-1; BEML BD80; BEML BD85; BEML BE300LC; BEML BG605A |  | Medium |
| 0412122273 | BEML | V-belt | BEML BD65-1; BEML BD80; BEML BD85; BEML BE300LC; BEML BG605A |  | Medium |
| 11Z7180235 | BEML | Fuel pre-filter cartridge (mud filter) | BEML BD65-1; BEML BD80; BEML BD85; BEML BE300LC; BEML BG605A |  | Medium |
| 30Z6280101 | BEML | Corrosion resistor (coolant filter) element | BEML BD65-1; BEML BD80; BEML BD85; BEML BE300LC; BEML BG605A | Komatsu 6150619320 (as printed; = 6150-61-9320) | Medium |
| 30Z9900495 | BEML | 250-hr engine service kit | BEML BD65-1; BEML BD80; BEML BD85; BEML BE300LC; BEML BG605A |  | Medium |
| 31Z1200272 | BEML | Air cleaner element assembly | BEML BD65-1; BEML BD80; BEML BD85; BEML BE300LC; BEML BG605A | Komatsu 6125817032 (as printed) | Medium |
| 31Z1280139 | BEML | Air filter (inner/safety) | BEML BD65-1; BEML BD80; BEML BD85; BEML BE300LC; BEML BG605A |  | Medium |
| 31Z1280155 | BEML | Air filter (outer/primary) | BEML BD65-1; BEML BD80; BEML BD85; BEML BE300LC; BEML BG605A |  | Medium |
| 31Z5180743 | BEML | Engine oil filter cartridge (alternate) | BEML BD65-1; BEML BD80; BEML BD85; BEML BE300LC; BEML BG605A |  | Medium |
| 41Z5181022 | BEML | Centrifugal (bypass) oil filter | BEML BD65-1; BEML BD80; BEML BD85; BEML BE300LC; BEML BG605A |  | Medium |
| 41Z7181537 | BEML | Fuel filter cartridge | BEML BD65-1; BEML BD80; BEML BD85; BEML BE300LC; BEML BG605A |  | Medium |
| 9441037202 | BEML | Hand primer pump (fuel) | BEML BD65-1; BEML BD80; BEML BD85; BEML BE300LC; BEML BG605A |  | Medium |
| 6683101 | Bobcat | Fuel pre-filter (in-line) | Bobcat E20z; Bobcat E27; Bobcat E37 Ultra HD; Bobcat E37 Xtra HD; Bobcat S450 |  | High |
| 360-8960 | Cat | Fuel filter (secondary) | Caterpillar CAT 320D3 GC; Caterpillar CAT 950GC; Caterpillar Cat 120; Caterpillar Cat 120 GC; Caterpillar Cat 140 GC |  | High |
| FF63009 | Cummins (Fleetguard) | Fuel filter (secondary) | L&T 9020 SX; Liebherr R 920 Litronic; Liebherr R 922 Litronic; Liebherr R 924 Litronic; Liebherr R 925 Litronic | Fleetguard FF63009 / Fleetguard FF63009 (Cummins 5303743) | Low |
| FS1098 | Cummins (Fleetguard) | Fuel filter (primary/water separator) | L&T 9020 SX; Liebherr R 920 Litronic; Liebherr R 922 Litronic; Liebherr R 924 Litronic; Liebherr R 925 Litronic | Fleetguard FS1098 / Fleetguard FS1098 (Cummins 5319680) | Low |
| LF3349 | Cummins (Fleetguard) | Engine oil filter | Tata Hitachi EX 200 Infra; Tata Hitachi EX 200LC Prime; Tata Hitachi EX 215 LCQ Prime; Tata Hitachi EX 215LC Prime; Tata Hitachi EX 215LC-SLR | Fleetguard LF3349 | Medium |
| LF3970 | Cummins (Fleetguard) | Engine oil filter | L&T 9020 SX; Liebherr R 920 Litronic; Liebherr R 922 Litronic; Liebherr R 924 Litronic; Liebherr R 925 Litronic | Fleetguard LF3970 (Cummins 3937736) / Fleetguard LF3970; Fleetguard LF16015 | Medium |
| FS1242 | Fleetguard (aftermarket) | Fuel filter (primary/water separator) | XCMG XE140C; XCMG XE140i HD; XCMG XE140i INFRA; XCMG XE140i K HD; XCMG XE145GM |  | Low |
| 4331920 | Hitachi | Air filter (inner/safety) | Tata Hitachi EX 1900-6; Tata Hitachi EX 2600-6; Tata Hitachi EX 3600-6; Tata Hitachi EX 5600-7; Tata Hitachi EX 8000-6 | Donaldson P115070 (per Donaldson EH700-3 entry E4031215 => L4331920) | Low |
| 4331923 | Hitachi | Air filter (outer/primary) | Tata Hitachi EX 1900-6; Tata Hitachi EX 2600-6; Tata Hitachi EX 3600-6; Tata Hitachi EX 5600-7; Tata Hitachi EX 8000-6 | Donaldson P182038 (per Donaldson EH700-3 entry E4082222 => L4331923) | Medium |
| 4370435 | Hitachi | Hydraulic pilot filter | Tata Hitachi ZAXIS 140H Ultra; Tata Hitachi ZAXIS 220LC; Tata Hitachi ZAXIS 220LC Ultra; Tata Hitachi ZAXIS 370LCH; Tata Hitachi ZAXIS 400MTH | Donaldson P173238 / Donaldson P173238; Fleetguard HF7954 | Medium |
| 4669642 | Hitachi | Fuel filter (primary/water separator) | Tata Hitachi EX 1900-6; Tata Hitachi EX 2600-6; Tata Hitachi EX 3600-6; Tata Hitachi EX 5600-7; Tata Hitachi EX 8000-6 |  | Medium |
| 02/630935A | JCB | Engine oil filter | JCB 35Z HD; JCB 37C HD; JCB 50Z; JCB 51R; JCB 55Z | Perkins 140517050 | Medium |
| 32/902200 | JCB | Transmission suction strainer | JCB 3DX; JCB 3DX Plus; JCB 3DX Super; JCB 3DX Xtra; JCB 4DX |  | Medium |
| 32/920300 | JCB | Hydraulic suction strainer | JCB 3DX; JCB 3DX Plus; JCB 3DX Super; JCB 3DX Xtra; JCB 4DX |  | Medium |
| 32/925694 | JCB | Fuel filter (primary/water separator element) | JCB 3DX; JCB 3DX Plus; JCB 3DX Super; JCB 3DX Xtra; JCB 4DX | Baldwin BF7956-D; also JCB 320/A7128, 32/921001 | Low |
| 320/08547 | JCB | Fan belt | JCB 3DX; JCB 3DX Plus; JCB 3DX Super; JCB 3DX Xtra; JCB 4DX |  | High |
| 320/A7088 | JCB | Fuel filter (primary/water separator, 30 micron sedimenter element) | JCB 3DX; JCB 3DX Plus; JCB 3DX Super; JCB 3DX Xtra; JCB 4DX |  | High |
| 333/G6057 | JCB | Fuel filter (secondary) | JCB 50Z; JCB 51R; JCB 55Z; JCB SSL 135; JCB SSL 155 |  | Low |
| 333/W5100 | JCB | Fuel filter (primary/water separator element) | JCB 50Z; JCB 51R; JCB 55Z; JCB SSL 135; JCB SSL 155 | Stanadyne 36995 / Stanadyne 36995 (Filong listing) | Low |
| 333/Y7423 | JCB | Service filter kit (500 hr) | JCB 3DX; JCB 3DX Plus; JCB 3DX Super; JCB 3DX Xtra; JCB 4DX |  | High |
| 335/C1280 | JCB | Air filter set (primary + secondary) | JCB 3DX; JCB 3DX Plus; JCB 3DX Super; JCB 3DX Xtra; JCB 4DX |  | High |
| 335/Y1459A | JCB | Loader bucket tooth kit (forged) | JCB 3DX; JCB 3DX Plus; JCB 3DX Super; JCB 3DX Xtra; JCB 4DX |  | Low |
| 40/300893 | JCB | Hydraulic return filter | JCB 3DX; JCB 3DX Plus; JCB 3DX Super; JCB 3DX Xtra; JCB 4DX | Fleetguard HF7992; Donaldson P502910 | High |
| 40/303376 | JCB | Side cutter (LH, single flange) | JCB 3DX; JCB 3DX Plus; JCB 3DX Super; JCB 3DX Xtra; JCB 4DX |  | Low |
| 40/303377 | JCB | Side cutter (RH, single flange) | JCB 3DX; JCB 3DX Plus; JCB 3DX Super; JCB 3DX Xtra; JCB 4DX |  | Low |
| 400/N7762 | JCB | Service filter kit (1000 hr) | JCB 3DX; JCB 3DX Plus; JCB 3DX Super; JCB 3DX Xtra; JCB 4DX |  | High |
| 531/03205 | JCB | Bucket tooth | JCB 3DX; JCB 3DX Plus; JCB 3DX Super; JCB 3DX Xtra; JCB 4DX |  | Medium |
| 531/03208 | JCB | Side cutter (RH, double flange) | JCB 3DX; JCB 3DX Plus; JCB 3DX Super; JCB 3DX Xtra; JCB 4DX |  | Medium |
| 531/03209 | JCB | Side cutter (LH, double flange) | JCB 3DX; JCB 3DX Plus; JCB 3DX Super; JCB 3DX Xtra; JCB 4DX |  | Medium |
| 550/42700 | JCB | Pin & bush kit (bucket) | JCB 3DX; JCB 3DX Plus; JCB 3DX Super; JCB 3DX Xtra; JCB 4DX |  | Low |
| 550/43485 | JCB | Hydraulic tank breather | JCB 3DX; JCB 3DX Plus; JCB 3DX Super; JCB 3DX Xtra; JCB 4DX |  | Medium |
| 3H.132.01.0.00 | Kirloskar | Fuel filter (primary) | LiuGong 611; LiuGong 6210E; Liugong 818N; SANY SSR110C-10 PRO; XCMG XE140i INFRA |  | Low |
| 3H.132.02.0.00 | Kirloskar | Fuel filter (secondary) | LiuGong 611; LiuGong 6210E; Liugong 818N; SANY SSR110C-10 PRO; XCMG XE140i INFRA |  | Low |
| 5H.999.23.0.SP | Kirloskar | Engine service filter kit (KOEL consumables kit) | Bull HD76 BS4 Heavy Duty; Bull SD76 BS4 Champion; Escorts Digmax II; Manitou MBL 745 Ranger; Manitou MBL 745 S |  | Low |
| 600-211-1340 | Komatsu | Engine oil filter | Kobelco SK850LC; L&T Komatsu D155A-6; L&T Komatsu Komatsu GD755-5R; L&T Komatsu Komatsu GD955-7; L&T Komatsu Komatsu WA470-6A | Fleetguard LF9070 / LF9018; Baldwin BD7154 | High |
| 600-319-3550 | Komatsu | Fuel filter (main) | L&T Komatsu D155A-6; L&T Komatsu Komatsu WA470-6A; L&T Komatsu Komatsu WA480-6A; L&T Komatsu Komatsu WA500-6R; L&T Komatsu Komatsu WA600-6R |  | Medium |
| 1J770-05810 | Kubota | Fuel filter (primary/water separator) | SANY SY80C-9; SANY SY80C-9 PRO; SANY SY80C-9 SALT; XCMG XE80C; XCMG XE80C Pro |  | Low |
| HH166-43560 | Kubota | Fuel filter (secondary) | SANY SY80C-9; SANY SY80C-9 PRO; SANY SY80C-9 SALT; XCMG XE80C; XCMG XE80C Pro |  | Medium |
| 60249072 | SANY | Fuel filter (water separator cartridge) | SANY SY500C-10HD; SANY SY545C-10LR; SANY SY580C-10HD; SANY SY680C-10HD; SANY SY870C-10HD | Donaldson P502593 | Low |
| VOE11037868 | Volvo | Hydraulic filter (spin-on) | Volvo L120H; Volvo L150H; Volvo L180H; Volvo L220H; Volvo L260H |  | Medium |
| 803198487 | XCMG | Hydraulic filter element | XCMG XE140C; XCMG XE140i HD; XCMG XE140i INFRA; XCMG XE140i K HD; XCMG XE145GM |  | Low |
| 6672467 | Bobcat | Air filter (outer/primary) | Bobcat E27; Bobcat E37 Ultra HD; Bobcat E37 Xtra HD; Bobcat S70 |  | High |
| 6672468 | Bobcat | Air filter (inner/safety) | Bobcat E27; Bobcat E37 Ultra HD; Bobcat E37 Xtra HD; Bobcat S70 |  | High |
| 7222791 | Bobcat | Cabin air filter (recirculation) | Bobcat E27; Bobcat E37 Ultra HD; Bobcat E37 Xtra HD; Bobcat E50z |  | High |
| 462-1171 | Cat | Engine oil filter | Caterpillar CAT 950GC; Caterpillar Cat 120; Caterpillar Cat 120 GC; Caterpillar Cat 140 GC | MANN W 9071; WIX 57791 (per filterverified.com) | High |
| AF55005 | Cummins (Fleetguard) | Air filter (outer/primary) | Liebherr R 920 Litronic; Liebherr R 922 Litronic; Liebherr R 924 Litronic; Liebherr R 925 Litronic | Fleetguard AF55005; AF55014; AF55015 | Low |
| CV52001 | Cummins (Fleetguard) | Engine crankcase ventilation filter | Liebherr R 920 Litronic; Liebherr R 922 Litronic; Liebherr R 924 Litronic; Liebherr R 925 Litronic | Fleetguard CV52001 | Low |
| P550185 | Donaldson | Engine oil filter (insert, Donaldson cross) | ACE 14XW; ACE 15XW; ACE 15XWE; ACE HXP 150 | Donaldson P550185 (alt 146790) | Low |
| P551167 | Donaldson | Fuel filter (insert, Donaldson cross) | ACE 14XW; ACE 15XW; ACE 15XWE; ACE HXP 150 |  | Low |
| 4812103576 | Dynapac | Engine oil filter | Dynapac CA305 CEV-V; Dynapac CA305D CEV-V; Dynapac CC425 CEV-V; Dynapac CC425 T3 ROPS |  | Medium |
| AF25929 | Fleetguard (aftermarket) | Air filter (outer/primary) | XCMG XE210i; XCMG XE215i; XCMG XE215i-KLC; XCMG XE245i LR | Fleetguard AF26076 (inner) | Low |
| AF26076 | Fleetguard (aftermarket) | Air filter (inner/safety) | XCMG XE210i; XCMG XE215i; XCMG XE215i-KLC; XCMG XE245i LR |  | Low |
| 4363399 | Hitachi | Hydraulic drain/spin-on filter | Tata Hitachi ZAXIS 470H; Tata Hitachi ZAXIS 650H; Tata Hitachi ZAXIS 670H; Tata Hitachi Zaxis 870-5G | Donaldson P556005 / Donaldson P556005; HiFi SH60134 | Low |
| 4448402 | Hitachi | Hydraulic return filter | Tata Hitachi ZAXIS 220LC; Tata Hitachi ZAXIS 220LC Ultra; Tata Hitachi ZAXIS 370LCH; Tata Hitachi ZAXIS 400MTH | Fleetguard HF7691; Baldwin BT9557; Donaldson P502270; Hitachi 4443773 | Medium |
| 4459548 | Hitachi | Air filter (inner/safety) | Tata Hitachi ZAXIS 370LCH; Tata Hitachi ZAXIS 370LCH Ultra; Tata Hitachi ZAXIS 400MTH; Tata Hitachi Zaxis 870-5G | Donaldson P777414 / Donaldson P777414; Fleetguard AF25523 | Medium |
| 4459549 | Hitachi | Air filter (outer/primary) | Tata Hitachi ZAXIS 370LCH; Tata Hitachi ZAXIS 370LCH Ultra; Tata Hitachi ZAXIS 400MTH; Tata Hitachi Zaxis 870-5G | Donaldson P777409 / Donaldson P777409; Fleetguard AF25756 / Donaldson P777409; Fleetguard AF25756; Sure SA16125 | High |
| 4642641 | Hitachi | Fuel filter (primary/water separator) | Tata Hitachi ZAXIS 370LCH Ultra; Tata Hitachi ZAXIS 650H; Tata Hitachi ZAXIS 670H; Tata Hitachi Zaxis 870-5G | Isuzu 8980088400 / Isuzu 8980088400; Sure SN25045 | Low |
| 4649267 | Hitachi | Fuel filter (secondary) | Tata Hitachi ZAXIS 370LCH Ultra; Tata Hitachi ZAXIS 650H; Tata Hitachi ZAXIS 670H; Tata Hitachi Zaxis 870-5G | Sure SN25044 / MFE1497 | Low |
| 4658521 | Hitachi | Engine oil filter | Tata Hitachi ZAXIS 370LCH Ultra; Tata Hitachi ZAXIS 650H; Tata Hitachi ZAXIS 670H; Tata Hitachi Zaxis 870-5G | Donaldson P550596; superseded by 4661256 / Donaldson P550596; superseded by 4661256; alt 4696643 | Low |
| 32/917804 | JCB | Air filter (outer/primary) | JCB 530-110; JCB 530-70; JCB 540-70; JCB VM117 |  | Low |
| 32/917805 | JCB | Air filter (inner/safety) | JCB 530-110; JCB 530-70; JCB 540-70; JCB VM117 |  | Low |
| 32/925284 | JCB | Air filter (outer/primary) | JCB 315LC HD; JCB 345LC HD; JCB 385LC; JCB 385LC Quarry Master |  | Low |
| 32/925285 | JCB | Air filter (inner/safety) | JCB 315LC HD; JCB 345LC HD; JCB 385LC; JCB 385LC Quarry Master |  | Low |
| 320/A4038 | JCB | Engine oil filter | JCB 315LC HD; JCB 345LC HD; JCB 385LC; JCB 385LC Quarry Master | JCB 02/910970, 02/910140 (earlier nos.); Hifi SO11151; Sakura SP96083 | Medium |
| 333/K7702 | JCB | Fuel filter (water separator) | JCB 315LC HD; JCB 345LC HD; JCB 385LC; JCB 385LC Quarry Master | John Deere RE536192 / RE524723 (cross-reference) | Low |
| 3H.132.10.0.00 | Kirloskar | Fuel filter (spin-on, twin bowl) | Hyundai R130 SMART; Hyundai R140L Smart Plus; Hyundai R150L SMART Plus; Hyundai R85A SMART Plus |  | Low |
| 6H.411.02.0.00 | Kirloskar | Air filter (outer/primary) | Putzmeister BSA 1407 D Classic; Putzmeister BSA 1407 D eSmart; Schwing Stetter SP 1807; Venus VCP 1470 |  | Low |
| XPA 1250 (KOEL 4H.069.01.0.00) | Kirloskar | Fan belt | Hyundai R130 SMART; Hyundai R140L Smart Plus; Hyundai R150L SMART Plus; Hyundai R85A SMART Plus |  | Low |
| YN21P01157R100 | Kobelco | Fuel filter (primary/water separator) | Kobelco SK220; Kobelco SK220XD; Kobelco SK220XDLC; Kobelco SK380XDLC |  | Medium |
| 285-62-17320 | Komatsu | Hydraulic tank breather | L&T Komatsu Komatsu WA380Z-6; L&T Komatsu Komatsu WA500-6R; L&T Komatsu Komatsu WA600-6R; L&T Komatsu Komatsu WA900-8R |  | Medium |
| 600-319-3750 | Komatsu | Fuel filter (main) | L&T Komatsu Komatsu GD535-6; L&T Komatsu Komatsu GD555; L&T Komatsu Komatsu GD705-5; L&T Komatsu Komatsu WA380Z-6 |  | Medium |
| 714-07-28713 | Komatsu | Transmission filter | L&T Komatsu Komatsu GD555; L&T Komatsu Komatsu GD705-5; L&T Komatsu Komatsu WA380Z-6; L&T Komatsu Komatsu WA470-6A |  | Medium |
| 10123751 | Liebherr | Engine crankcase breather filter | Liebherr R 972 Litronic; Liebherr R 978 SME Litronic; Liebherr R 992 Litronic; Liebherr R 998 SME Litronic |  | Low |
| 10289138 | Liebherr | Fuel filter | Liebherr R 972 Litronic; Liebherr R 978 SME Litronic; Liebherr R 992 Litronic; Liebherr R 998 SME Litronic |  | Low |
| 34C2211 | LiuGong | Tooth pin | Liugong 922E Amphibious; Liugong 922E XD; Liugong 922Ea (Alpha); Liugong 925E XLR |  | Medium |
| 35C1745 | LiuGong | Cabin air filter | Liugong 922E Amphibious; Liugong 922E XD; Liugong 922Ea (Alpha); Liugong 925E XLR |  | Low |
| 40C1032 | LiuGong | Air filter (inner/safety) | Liugong 922E Amphibious; Liugong 922E XD; Liugong 922Ea (Alpha); Liugong 925E XLR |  | Medium |
| 40C1033 | LiuGong | Air filter (outer/primary) | Liugong 922E Amphibious; Liugong 922E XD; Liugong 922Ea (Alpha); Liugong 925E XLR |  | Medium |
| 40C2182 | LiuGong | Engine oil filter | Liugong 924E XD; Liugong 926E XD; Liugong 930E XLR; Liugong 935E HD | Donaldson P550428 | Low |
| 40C2953 | LiuGong | Air filter (933E listing) | Liugong 924E XD; Liugong 926E XD; Liugong 930E XLR; Liugong 935E HD | LiuGong 60C2472 kit | Low |
| 40C3253 | LiuGong | Fuel/water separator assembly | Liugong 922E Amphibious; Liugong 922E XD; Liugong 922Ea (Alpha); Liugong 925E XLR |  | Medium |
| 40C4077 | LiuGong | Air filter kit (alt) | Liugong 922E Amphibious; Liugong 922E XD; Liugong 922Ea (Alpha); Liugong 925E XLR | LiuGong 60C2472 | Medium |
| 40C7018 | LiuGong | Fuel filter (QSB7/6BT5.9) | Liugong 922E Amphibious; Liugong 922E XD; Liugong 922Ea (Alpha); Liugong 925E XLR | Fleetguard FS1098 | Medium |
| 40C7018 | LiuGong | Fuel filter (QSB7) | Liugong 924E XD; Liugong 926E XD; Liugong 930E XLR; Liugong 935E HD | Fleetguard FS1098 | Medium |
| 53C0045 | LiuGong | Fuel filter (primary) | Liugong 922E Amphibious; Liugong 922E XD; Liugong 922Ea (Alpha); Liugong 925E XLR | Donaldson P553004 | Medium |
| 53C0051 | LiuGong | Fuel filter (primary/water separator) | Liugong 922E Amphibious; Liugong 922E XD; Liugong 922Ea (Alpha); Liugong 925E XLR | Donaldson P551329; alt LiuGong 53C0436 | Medium |
| 53C0052 | LiuGong | Fuel filter (secondary) | Liugong 922E Amphibious; Liugong 922E XD; Liugong 922Ea (Alpha); Liugong 925E XLR | Donaldson P550440 | Medium |
| 53C0053 | LiuGong | Engine oil filter | Liugong 848H; Liugong 856H MAX; Liugong 939E; Liugong 939E HD | Donaldson P553000 / Donaldson P553000; LiuGong 40C2182 (alt) | Medium |
| 53C0054 | LiuGong | Engine oil filter | Liugong 922E Amphibious; Liugong 922E XD; Liugong 922Ea (Alpha); Liugong 925E XLR | Donaldson P558615 | Medium |
| 53C0214 | LiuGong | Engine oil filter (alt) | Liugong 922E Amphibious; Liugong 922E XD; Liugong 922Ea (Alpha); Liugong 925E XLR | LiuGong 53C0226 (alt) | Medium |
| 53C0250 | LiuGong | Hydraulic filter | Liugong 922E Amphibious; Liugong 922E XD; Liugong 922Ea (Alpha); Liugong 925E XLR |  | Medium |
| 53C0497 | LiuGong | Fuel filter | Liugong 924E XD; Liugong 926E XD; Liugong 930E XLR; Liugong 935E HD | Donaldson P550880 | Low |
| 53C1485 | LiuGong | Hydraulic suction filter | Liugong 922E Amphibious; Liugong 922E XD; Liugong 922Ea (Alpha); Liugong 925E XLR | LiuGong 53C0500 (alt); sp-auto lists 53C0616 suction for 920E/922E/926E | Medium |
| 53C1486 | LiuGong | Hydraulic return filter | Liugong 922E Amphibious; Liugong 922E XD; Liugong 922Ea (Alpha); Liugong 925E XLR | LiuGong 53C0515 (alt) | Medium |
| 72A1695 | LiuGong | Bucket tooth | Liugong 922E Amphibious; Liugong 922E XD; Liugong 922Ea (Alpha); Liugong 925E XLR |  | Medium |
| 72A1862 / 72A1863 | LiuGong | Side cutter (LH/RH) | Liugong 922E Amphibious; Liugong 922E XD; Liugong 922Ea (Alpha); Liugong 925E XLR |  | Medium |
| 72A3788 | LiuGong | Tooth adapter | Liugong 922E Amphibious; Liugong 922E XD; Liugong 922Ea (Alpha); Liugong 925E XLR |  | Medium |
| C 1196/2 | MANN+HUMMEL | Air filter (outer/primary) | Kobelco SK30SR; Kobelco SK35SR; Yanmar Vi020-6; Yanmar Vi025-6 | MANN C 1196/2 | Medium |
| 26561117 | Perkins | Fuel filter (secondary, spin-on) | JCB 30 PLUS; JCB 50Z; JCB 51R; JCB 55Z | Fleetguard FF167 | Medium |
| 139257 (Rico kit for SY210C-9) | Rico Europe (aftermarket kit) | Engine filter service kit | SANY SY210C-9; SANY SY215C-9LC SPARC; SANY SY220C-9XL Sparc+; SANY SY245C-9LR |  | Low |
| 160602020056A | SANY | Air filter (main element, alt) | SANY SY33C PRO; SANY SY35U; SANY SY35U Pro; SANY SY38U PRO |  | Low |
| 160602030042A | SANY | Air filter (inner/safety, alt) | SANY SY33C PRO; SANY SY35U; SANY SY35U Pro; SANY SY38U PRO |  | Low |
| 60033346 | SANY | Fuel filter (primary/water separator) | SANY SY210C-9; SANY SY215C-9LC SPARC; SANY SY220C-9XL Sparc+; SANY SY245C-9LR | MANN PL 420 | Low |
| 60058453 | SANY | Fuel filter (primary/water separator, spin-on) | SANY SY33C PRO; SANY SY35U; SANY SY35U Pro; SANY SY38U PRO | Donaldson P505951 | Medium |
| 60101256 | SANY | Hydraulic return filter (alt) | SANY SY210C-9; SANY SY215C-9LC SPARC; SANY SY220C-9XL Sparc+; SANY SY245C-9LR |  | Low |
| 60101257 | SANY | Hydraulic suction filter (alt) | SANY SY210C-9; SANY SY215C-9LC SPARC; SANY SY220C-9XL Sparc+; SANY SY245C-9LR |  | Low |
| 60186788 | SANY | Hydraulic tank breather / filter core | SANY SY33C PRO; SANY SY35U; SANY SY35U Pro; SANY SY38U PRO |  | Low |
| 60200363 | SANY | Hydraulic suction filter | SANY SY210C-9; SANY SY215C-9LC SPARC; SANY SY220C-9XL Sparc+; SANY SY245C-9LR |  | Low |
| 60200364 | SANY | Hydraulic suction strainer | SANY SY210C-9; SANY SY215C-9LC SPARC; SANY SY220C-9XL Sparc+; SANY SY245C-9LR |  | Low |
| 60273112 | SANY | Engine oil filter | SANY SY33C PRO; SANY SY35U; SANY SY35U Pro; SANY SY38U PRO | Donaldson R010001 | Medium |
| 60292521 | SANY | Fuel filter (secondary) | SANY SY33C PRO; SANY SY35U; SANY SY35U Pro; SANY SY38U PRO | SANY PF-CO-01-01170; Yanmar 3TNV88 | Medium |
| 60336531 | SANY | Fuel filter | SANY SY33C PRO; SANY SY35U; SANY SY35U Pro; SANY SY38U PRO | Yanmar 129A00-55800 | Low |
| B222100000520 | SANY | Fuel filter (secondary) | SANY SY240C-9HD GraMa; SANY SY240C-9HD SPARC; SANY SY240C-9LCHD; SANY SY285C-9LR | Donaldson P552564 | Medium |
| B222100000660K | SANY | Cabin air filter | SANY SY240C-9HD GraMa; SANY SY240C-9HD SPARC; SANY SY240C-9LCHD; SANY SY285C-9LR | Donaldson P500138 | Medium |
| B222100000685 | SANY | Fuel filter (secondary, spin-on) | SANY SY33C PRO; SANY SY35U; SANY SY35U Pro; SANY SY38U PRO | Donaldson R010002 | Medium |
| GLQ009244827 | SANY | Hydraulic pilot filter | SANY SY33C PRO; SANY SY35U; SANY SY35U Pro; SANY SY38U PRO |  | Medium |
| GLQ009253930 | SANY | Hydraulic return filter | SANY SY33C PRO; SANY SY35U; SANY SY35U Pro; SANY SY38U PRO |  | Medium |
| 4110000509164 | SDLG | Engine oil filter | SDLG E6135Fi; SDLG E6150F; SDLG G9150Hi; SDLG G9190Hi | Deutz 01174421 (BF4M2012) / Weichai 1012010A52D | Medium |
| 4110000509232 | SDLG | Fuel filter (secondary) | SDLG E6135Fi; SDLG E6150F; SDLG G9150Hi; SDLG G9190Hi | Weichai 1117050A52D | Medium |
| 4110001593002 | SDLG | Fuel filter (primary/water separator) | SDLG E6135Fi; SDLG E6150F; SDLG G9150Hi; SDLG G9190Hi |  | Medium |
| 10308231 | Schwing | Wearing insert RL (Rock valve) | Schwing Stetter SP 1400 D; Schwing Stetter SP 1400 E; Schwing Stetter SP 1800 D; Schwing Stetter SP 1800 E |  | Medium |
| 10308236 | Schwing | Cutting ring DN190 (RL Rock valve) | Schwing Stetter SP 1400 D; Schwing Stetter SP 1400 E; Schwing Stetter SP 1800 D; Schwing Stetter SP 1800 E |  | Medium |
| 16Y-60-13000 | Shantui | Hydraulic filter | Shantui DH16B3; Shantui DH17B3; Shantui SD13; Shantui SD16E |  | Medium |
| 11703979 | Volvo | Cabin air filter (primary) | Volvo EC200D; Volvo EC210D; Volvo EC380D; Volvo EC480D |  | Medium |
| 14500233 | Volvo | Hydraulic tank breather | Volvo EC200D; Volvo EC210D; Volvo EC220D; Volvo EC300D |  | Medium |
| 15126069 | Volvo | Fuel filter (secondary) | Volvo EC380D; Volvo EC480D; Volvo EC750D; Volvo EC950E |  | High |
| 3831236 | Volvo | Engine oil filter | Volvo EC200D; Volvo EC210D; Volvo EC220; Volvo L90H | Donaldson P553771 / Volvo 17457469; Donaldson P553771 | Medium |
| VOE15035179 | Volvo | Hydraulic pilot (servo) filter element | Volvo EC120D; Volvo EC140D; Volvo EC200D; Volvo EC210D |  | Medium |
| 61000070005 | Weichai | Engine oil filter | LiuGong B160C; Shantui DH16B3; Shantui DH17B3; Shantui SD16E | Weichai 1000424655 (alt) | Medium |
| 612600081334 | Weichai | Fuel filter (secondary) | LiuGong B160C; Shantui DH16B3; Shantui DH17B3; Shantui SD16E | Shantui 6I0273T (air) listed alongside | Medium |
| 612600081335 | Weichai | Fuel filter (primary/water separator) | LiuGong B160C; Shantui DH16B3; Shantui DH17B3; Shantui SD16E |  | Medium |
| 612600110540 | Weichai | Air filter (outer/primary) | LiuGong B160C; Shantui DH16B3; Shantui DH17B3; Shantui SD16E |  | Medium |
| 129242-55701 | Yanmar | Fuel filter (primary/water separator) | Liugong 9027F; Liugong 908E; SANY SY20U; SANY SY27U |  | Medium |
| 200593400300 | ACE | Transmission filter | ACE AX 124; ACE AX 130; ACE Phantom 4WD |  | Medium |
| 200593424100 | ACE | Air filter (inner/safety) | ACE AX 124; ACE AX 130; ACE Phantom 4WD |  | Medium |
| 200593424200 | ACE | Air filter (outer/primary) | ACE AX 124; ACE AX 130; ACE Phantom 4WD |  | Medium |
| FHJ00700 | Ashok Leyland (Leyparts) | Fuel filter (primary/water separator) | Fine FMG 130; Fine FMG 180; Fine FMG 585HD |  | Low |
| PHJ00004 | Ashok Leyland (Leyparts) | Fuel filter (secondary/main) | Fine FMG 130; Fine FMG 180; Fine FMG 585HD | Fleetguard FS19671V00; Bosch F002H26310; Leyparts FHN00400 | Low |
| 11Z5180094 | BEML | Engine oil filter cartridge (early build) | BEML BD50; BEML BE200; BEML BE220G |  | Medium |
| 11Z5190495 | BEML | Centrifugal (bypass) oil filter paper insert | BEML BD50; BEML BE200; BEML BE220G |  | Medium |
| 11Z7180235 | BEML | Fuel pre-filter cartridge | BEML BD50; BEML BE200; BEML BE220G |  | High |
| 30Z1280158 | BEML | Air filter (inner/safety, later build) | BEML BD50; BEML BE200; BEML BE220G |  | Medium |
| 30Z5180495 | BEML | Engine oil filter cartridge | BEML BD50; BEML BE200; BEML BE220G |  | High |
| 30Z7180369 | BEML | Fuel filter cartridge | BEML BD50; BEML BE200; BEML BE220G |  | High |
| 6668819 | Bobcat | Hydraulic/hydrostatic filter | Bobcat E37 Ultra HD; Bobcat E37 Xtra HD; Bobcat E50z |  | High |
| 6675517 | Bobcat | Engine oil filter | Bobcat E37 Ultra HD; Bobcat E37 Xtra HD; Bobcat S450 |  | High |
| 6727475 | Bobcat | Hydraulic tank breather cap | Bobcat S450; Bobcat S590; Bobcat S770 |  | High |
| 7009365 | Bobcat | Hydraulic case drain filter | Bobcat E27; Bobcat E37 Ultra HD; Bobcat E37 Xtra HD |  | High |
| F002H22025 | Bosch (via ACE catalogue) | Fuel filter (main cartridge, Bosch number) | ACE AX 124; ACE AX 130; ACE Phantom 4WD |  | Low |
| 47484442 | CASE | Transmission filter | CASE 770 EX; CASE 770 EX Plus; CASE 770 NXe Series |  | High |
| 183-3873 | Cat | Transmission filler tube breather | Caterpillar Cat 120; Caterpillar Cat 140 GC; Caterpillar Cat 14M3 |  | High |
| 1R-0774 | Cat | Hydraulic oil filter | Caterpillar Cat 120; Caterpillar Cat 120 GC; Caterpillar Cat 140 GC |  | High |
| 4H-6112 | Cat | Tandem breather | Caterpillar Cat 120; Caterpillar Cat 120 GC; Caterpillar Cat 14M3 |  | High |
| 3930942 | Cummins | Fuel filter (primary/water separator) | ACE ALN 300; ACE ALN 500; Dynapac CP275 | Fleetguard FS1280 / Fleetguard FS1280; Donaldson P551329; Baldwin BF1280 / Fleetguard FS1280; MANN WK 9165 x; Donaldson P550899 (per cross-ref sites) | Medium |
| 3931063 | Cummins | Fuel filter (secondary) | ACE ALN 300; ACE ALN 500; Dynapac CP275 | Fleetguard FF5052 / Fleetguard FF5052; Donaldson P550440; Baldwin BF788 | Medium |
| FF5488 | Cummins (Fleetguard) | Fuel filter (secondary) | Liugong 939E; Liugong 939E HD; Sany SMG200C-8 |  | Medium |
| FF5552 | Cummins (Fleetguard) | Fuel filter (secondary) | Liugong 836N; Liugong 838H MAX; SANY STR90C-10 PRO | Ashok Leyland FHJ01000 | Low |
| FS1003 | Cummins (Fleetguard) | Fuel filter (primary/water separator) | Liugong 939E; Liugong 939E HD; Sany SMG200C-8 |  | Medium |
| FS19669 | Cummins (Fleetguard) | Fuel filter (primary/water separator) | Liugong 836N; Liugong 838H MAX; SANY STR90C-10 PRO | Fleetguard FS1003 (CRS variant) | Low |
| LF16238 | Cummins (Fleetguard) | Engine oil filter | Liugong 836N; Liugong 838H MAX; SANY STR90C-10 PRO | Ashok Leyland F7A01500 | Low |
| LF9009 | Cummins (Fleetguard) | Engine oil filter | Liugong 939E; Liugong 939E HD; Sany SMG200C-8 |  | Medium |
| 9183-462 | Delphi-TVS | Fuel filter (pre-filter/water separator) | ACE FX 230; ACE NX 360 20T; Terex Franna FR20 |  | Medium |
| 9188-545 | Delphi-TVS | Fuel filter (main) | ACE FX 230; ACE NX 360 20T; Terex Franna FR20 |  | Medium |
| 01174416 | Deutz | Engine oil filter | SANY STH1056A; SANY STH634A; SANY STH844A |  | Low |
| 01180597 | Deutz | Fuel filter (Deutz) | SDLG E6135Fi; SDLG E6150F; SDLG G9240F | Deutz 01174423 | Medium |
| 01180597 | Deutz | Fuel filter | SANY STH1056A; SANY STH634A; SANY STH844A | Deutz 01174423 (alt) | Medium |
| 4812332520 | Dynapac | Fuel filter (primary/water separator) | Dynapac CA305 CEV-V; Dynapac CA305D CEV-V; Dynapac CC425 CEV-V |  | Medium |
| 4812332521 | Dynapac | Fuel filter (secondary) | Dynapac CA305 CEV-V; Dynapac CA305D CEV-V; Dynapac CC425 CEV-V |  | Medium |
| FS20282 | Fleetguard | Fuel filter (secondary) | Ashok Leyland AVTR 2820 6×4 RMC; Ashok Leyland AVTR 2825 6×4 RMC; Ashok Leyland AVTR 3825 8×4 RMC |  | Medium |
| FS20283 | Fleetguard | Fuel filter (primary/water separator) | Ashok Leyland AVTR 2820 6×4 RMC; Ashok Leyland AVTR 2825 6×4 RMC; Ashok Leyland AVTR 3825 8×4 RMC |  | Medium |
| LF16238 | Fleetguard | Engine oil filter | Ashok Leyland AVTR 2820 6×4 RMC; Ashok Leyland AVTR 2825 6×4 RMC; Ashok Leyland AVTR 3825 8×4 RMC | Ashok Leyland F7A01500 (listed for U-Truck H-series) | Medium |
| VH15607-2190 | Hino | Engine oil filter | Kobelco SK220; Kobelco SK220XD; Kobelco SK220XDLC | STAL ST10768 | Medium |
| VH23390E0020 | Hino | Fuel filter (secondary/main element) | Kobelco SK220; Kobelco SK220XD; Kobelco SK220XDLC | STAL ST20737 | Low |
| 4192631 | Hitachi | Fuel filter (primary/water separator) | Tata Hitachi ZAXIS 370LCH; Tata Hitachi ZAXIS 400MTH; Tata Hitachi ZAXIS 470H | Donaldson P557440; Fleetguard FF232 / Donaldson P557440; Fleetguard FF232; Baldwin BF7546 | Medium |
| 4648651 | Hitachi | Hydraulic suction strainer | Tata Hitachi ZAXIS 220LC; Tata Hitachi ZAXIS 220LC Ultra; Tata Hitachi ZAXIS 370LCH Ultra | Donaldson R010052 / Donaldson R010052; ECE FLP5047 | Medium |
| 4654745 | Hitachi | Hydraulic return filter | Tata Hitachi ZAXIS 650H; Tata Hitachi ZAXIS 670H; Tata Hitachi Zaxis 870-5G | HiFi SH60199 | Low |
| 333/C4690 | JCB | Hydraulic return filter | JCB 530-110; JCB 530-70; JCB 540-70 | MANN W 941 (Filong listing) | Low |
| 333/C6860 | JCB | Hydraulic suction strainer | JCB 530-110; JCB 530-70; JCB 540-70 |  | Low |
| 335/D8226 | JCB | Hydraulic return filter | JCB 50Z; JCB 51R; JCB 55Z |  | Medium |
| 550/43799 | JCB | Service filter kit | JCB NXT 140; JCB NXT 145 Quarry Master; JCB NXT 150 |  | Low |
| YN11P00029S002 | Kobelco | Air filter (inner/safety) | Kobelco SK220; Kobelco SK220XD; Kobelco SK220XDLC |  | Low |
| YN11P00029S003 | Kobelco | Air filter (outer/primary) | Kobelco SK220; Kobelco SK220XD; Kobelco SK220XDLC |  | Low |
| YN21P01068R100 | Kobelco | Fuel filter (pre-filter/water separator element) | Kobelco SK220; Kobelco SK220XD; Kobelco SK220XDLC | STAL ST20385 | Low |
| YN52V01008R100 | Kobelco | Hydraulic return filter | Kobelco SK220; Kobelco SK220XD; Kobelco SK220XDLC | STAL ST30255 | Low |
| YN57V00004S002 | Kobelco | Hydraulic tank breather | Kobelco SK220; Kobelco SK220XD; Kobelco SK220XDLC |  | Low |
| YR52V01004R300 | Kobelco | Hydraulic return filter | Kobelco SK30SR; Kobelco SK35SR; Kobelco SK80 | Fleetguard HF6686; HIFI SH60161 / Fleetguard HF6686; HIFI SH60161; CNH 72150036 | Medium |
| 600-211-1341 | Komatsu | Engine oil filter | L&T Komatsu Komatsu WA480-6A; L&T Komatsu Komatsu WA500-6R; L&T Komatsu Komatsu WA600-6R |  | Medium |
| 600-311-4510 | Komatsu | Fuel filter (cartridge, 1-1/4 in) | L&T Komatsu Komatsu GD755-5R; L&T Komatsu Komatsu GD825A-2; L&T Komatsu Komatsu WA500-6R |  | Medium |
| 600-319-3580 | Komatsu | Fuel filter (pre-filter/water separator) | L&T Komatsu Komatsu WA480-6A; L&T Komatsu Komatsu WA500-6R; L&T Komatsu Komatsu WA600-6R |  | Low |
| 600-319-3610 | Komatsu | Fuel filter (pre-filter/water separator) | L&T Komatsu Komatsu GD535-6; L&T Komatsu Komatsu GD555; L&T Komatsu Komatsu WA380Z-6 |  | Medium |
| 6736-51-5142 | Komatsu | Engine oil filter | L&T Komatsu Komatsu GD535-6; L&T Komatsu Komatsu GD555; L&T Komatsu Komatsu WA380Z-6 | Fleetguard LF16006; Baldwin B7181; Donaldson P550909 (per cn-machinery cross-ref) | Medium |
| 15221-43170 | Kubota | Fuel filter (secondary) | Fine FM20; Hyundai HX30AZ; Hyundai R30Z-9AK |  | Low |
| HH150-32094 | Kubota | Engine oil filter | Fine FM20; Hyundai HX30AZ; Hyundai R30Z-9AK | Kubota 15241-32094 | Medium |
| 10037617 | Liebherr | Hydraulic filter (secondary circuit) | Liebherr R 926 Litronic; Liebherr R 928 Litronic; Liebherr R 930 Litronic |  | Low |
| 10044302 | Liebherr | Fuel filter (primary/water separator) | Liebherr R 926 Litronic; Liebherr R 928 Litronic; Liebherr R 930 Litronic |  | Low |
| 10044303 | Liebherr | Fuel filter (fine) | Liebherr R 926 Litronic; Liebherr R 928 Litronic; Liebherr R 930 Litronic |  | Low |
| 10222393 | Liebherr | Hydraulic tank breather | Liebherr R 926 Litronic; Liebherr R 928 Litronic; Liebherr R 930 Litronic |  | Low |
| 10297295 | Liebherr | Engine oil filter | Liebherr R 926 Litronic; Liebherr R 928 Litronic; Liebherr R 930 Litronic | Donaldson P502596 | Low |
| 10324849 | Liebherr | Hydraulic return filter | Liebherr L550; Liebherr L566; Liebherr L580 | Baldwin PT23591-MPG; Fleetguard HF29132; MANN HD1520; HIFI SH68238; Filtrec WG1021 | Low |
| 10342370 | Liebherr | Air filter (inner/safety) | Liebherr R 926 Litronic; Liebherr R 928 Litronic; Liebherr R 930 Litronic |  | Low |
| 10802265 | Liebherr | Fuel filter (secondary) | Liebherr R 926 Litronic; Liebherr R 928 Litronic; Liebherr R 930 Litronic |  | Low |
| 11065673 | Liebherr | Hydraulic return filter | Liebherr R 926 Litronic; Liebherr R 928 Litronic; Liebherr R 930 Litronic |  | Low |
| 11161894 | Liebherr | Hydraulic filter (second element) | Liebherr L550; Liebherr L566; Liebherr L580 | HIFI SH68367; Parker 936979Q; SF HY90992 | Low |
| 12227636 | Liebherr | Air filter (outer/primary) | Liebherr R 926 Litronic; Liebherr R 928 Litronic; Liebherr R 930 Litronic |  | Low |
| 12582496 | Liebherr | Engine crankcase breather | Liebherr R 926 Litronic; Liebherr R 928 Litronic; Liebherr R 930 Litronic |  | Low |
| 12820742 | Liebherr | Fuel filter | Liebherr R 934 Litronic; Liebherr R 938 Litronic; Liebherr R 956 Litronic |  | Low |
| 135326206 | Perkins | Air filter (outer/primary) | JCB 50Z; JCB 51R; JCB 55Z | Fleetguard AF27867 | Low |
| 60017773 | SANY | Fuel filter (primary/water separator, cartridge) | SANY SY500C-10HD; SANY SY545C-10LR; SANY SY580C-10HD | Donaldson P502424 | Low |
| 60151839 | SANY | Fuel filter (secondary, cartridge) | SANY SY60C; SANY SY680C-10HD; SANY SY870C-10HD | Donaldson P502424 | Low |
| 60206017 | SANY | Fuel filter (secondary, spin-on) | SANY SY500C-10HD; SANY SY545C-10LR; SANY SY580C-10HD | Donaldson P552216 | Low |
| A222100000119 | SANY | Hydraulic pilot filter | SANY SY20U; SANY SY27U; SANY SY60C | Donaldson R010051 | Low |
| 4110000076368 | SDLG | Transmission filter | SDLG G9150Hi; SDLG G9190Hi; SDLG G9240F | ZF 0750 131 053 | Medium |
| 4110003496001 | SDLG | Air filter (outer/primary, alt) | SDLG G9150Hi; SDLG G9190Hi; SDLG G9240F |  | Medium |
| 4110003496002 | SDLG | Air filter (inner/safety, alt) | SDLG G9150Hi; SDLG G9190Hi; SDLG G9240F |  | Medium |
| 4120004037001 | SDLG | Hydraulic filter insert | SDLG G9150Hi; SDLG G9190Hi; SDLG G9240F | SDLG 4120004036003 | Medium |
| 16Y-15-07000 | Shantui | Magnet filter | Shantui DH16B3; Shantui DH17B3; Shantui SD16E |  | Medium |
| 16Y-75-13100 | Shantui | Transmission/torque converter filter | Shantui DH16B3; Shantui DH17B3; Shantui SD16E | Komatsu-pattern 195-13-13420 | Medium |
| 16Y-75-23200 | Shantui | Transmission filter | Shantui DH16B3; Shantui DH17B3; Shantui SD16E |  | Medium |
| 16Y-76-09200 | Shantui | Steering clutch filter | Shantui DH16B3; Shantui DH17B3; Shantui SD16E |  | Medium |
| 6I0273T | Shantui | Air filter (outer/primary, Shantui no.) | Shantui DH16B3; Shantui DH17B3; Shantui SD16E |  | Medium |
| D24A-005-03 | Shantui | Water filter | Shantui DH16B3; Shantui DH17B3; Shantui SD16E |  | Medium |
| 278609119910 | Tata Motors | Fuel filter (pre-filter element) | Tata LPK 2821.K FE+ RMC; Tata Prima 2830.K REPTO RMC; Tata Signa 2830.K 8 Cum REPTO RMC | Fleetguard FS20117; Bosch F 002 H26 563; Cummins AX1015337; Tata Autocomp TFFCV1078K; Luman FF146 | High |
| 278609999828 | Tata Motors | Fuel filter (main) | Tata LPK 2821.K FE+ RMC; Tata Prima 2830.K REPTO RMC; Tata Signa 2830.K 8 Cum REPTO RMC | Bosch F 002 H26 562 | Low |
| 288047704904 | Tata Motors | Fuel filter (water separator) | Tata LPK 2821.K FE+ RMC; Tata Prima 2830.K REPTO RMC; Tata Signa 2830.K 8 Cum REPTO RMC | Fleetguard FS19732; Cummins 3973233 | Medium |
| 570909130106 | Tata Motors | Air filter (outer/primary) | Tata LPK 2821.K FE+ RMC; Tata Prima 2830.K REPTO RMC; Tata Signa 2830.K 8 Cum REPTO RMC | Bosch F 002 H26 641 (outer) / F 002 H26 640 (outer+inner set with 570909130107) | Low |
| 5009275 | VECV (Eicher) | Engine oil filter | ACE FX 230; ACE NX 360 20T; Terex Franna FR20 | Fleetguard LF0905300; Bosch F002H27505; Eicher ID337989 | Medium |
| IB999850 | VECV (Eicher) | Engine filter set (E483) | ACE FX 230; ACE NX 360 20T; Terex Franna FR20 |  | Low |
| 11110175 | Volvo | Air filter (outer/primary) | Volvo EC200D; Volvo EC210D; Volvo L90H |  | Medium |
| 17500251 | Volvo | Air filter (outer/primary) | Volvo EC200D; Volvo EC210D; Volvo EC220D | SA160132; SA160133 | Medium |
| 1000442627 | Weichai | Engine oil filter (element) | XCMG GR1705; XCMG ZL48GV; XCMG ZL55GV |  | Low |
| 1000447499 | Weichai | Fuel filter (secondary/fine) | XCMG GR1705; XCMG ZL48GV; XCMG ZL55GV |  | Low |
| 1000955413 | Weichai | Fuel filter (primary/coarse) | XCMG GR1705; XCMG ZL48GV; XCMG ZL55GV |  | Low |
| 1002166151 | Weichai | Fuel filter element (WP7G) | XCMG GR1705; XCMG ZL48GV; XCMG ZL55GV |  | Low |
| 803164216 | XCMG | Hydraulic return filter | XCMG XS115H; XCMG ZL48GV; XCMG ZL55GV |  | Low |
| 803199320 | XCMG | Hydraulic pilot filter | XCMG XE38U; XCMG XE40U; XCMG XE40U PRO |  | Low |
| 860104429 | XCMG | Hydraulic suction filter | XCMG XE38U; XCMG XE40U; XCMG XE40U PRO |  | Low |
| 860104431 | XCMG | Fuel filter | XCMG XE38U; XCMG XE40U; XCMG XE40U PRO |  | Low |
| 119305-35151 | Yanmar | Engine oil filter | Liugong 9027F; SANY SY20U; SANY SY27U |  | Medium |
| 119802-55801 | Yanmar | Fuel filter (secondary) | Liugong 9027F; SANY SY20U; SANY SY27U |  | Medium |
| 129150-35170 | Yanmar | Engine oil filter | Yanmar Vi035-6B; Yanmar Vi050-6B; Yanmar ViO30-6B |  | Medium |
| 1A8240-05110 | Yanmar | Air filter (outer/primary) | Yanmar Vi035-6B; Yanmar Vi050-6B; Yanmar ViO30-6B |  | High |
| 1A8240-05120 | Yanmar | Air filter (inner/safety) | Yanmar Vi035-6B; Yanmar Vi050-6B; Yanmar ViO30-6B |  | High |
| Dual PU scrapers per drum (no P/N published) | Ammann | Drum scraper | Ammann ARX 32.2; Ammann ARX 90.2 |  | Low |
| 10Z7180132 | BEML | Fuel filter cartridge (alternate) | BEML BE200; BEML BE220G |  | Medium |
| 11Z1280049 | BEML | Air filter (inner/safety) | BEML BE200; BEML BE220G |  | Medium |
| 11Z1280065 | BEML | Air filter outer element assembly (early build) | BEML BE200; BEML BE220G |  | Medium |
| 11Z1280098 | BEML | Air filter (outer/primary) | BEML BE200; BEML BE220G |  | Medium |
| 125FL92676 | BEML | Fuel filter element (spin-on) | BEML BD155; BEML BD355 |  | Medium |
| 155HS02074 | BEML | Hydraulic return filter element | BEML BE200; BEML BE220G |  | Medium |
| 171HS91209 | BEML | Hydraulic suction strainer | BEML BE200; BEML BE220G |  | Medium |
| 30Z2180392 | BEML | Crankcase breather assembly | BEML BE200; BEML BE220G |  | Medium |
| 51Z5181498 | BEML | Centrifugal oil filter paper insert | BEML BD155; BEML BD355 |  | Medium |
| 51Z7185884 | BEML | Fuel pre-filter cartridge with water separator | BEML BD155; BEML BD355 |  | Medium |
| 51Z7185908 | BEML | Fuel filter cartridge | BEML BD155; BEML BD355 |  | Medium |
| 51Z9900906 | BEML | Engine maintenance kit E-51 | BEML BD155; BEML BD355 |  | Medium |
| 6657635 | Bobcat | Engine oil filter | Bobcat E27; Bobcat S70 |  | High |
| 6661248 | Bobcat | Hydraulic/hydrostatic filter | Bobcat E20z; Bobcat E27 |  | High |
| 6666375 | Bobcat | Air filter (outer/primary) | Bobcat E50z; Bobcat S450 |  | High |
| 6666376 | Bobcat | Air filter (inner/safety) | Bobcat E50z; Bobcat S450 |  | High |
| 6692836 | Bobcat | Hydraulic tank breather | Bobcat E20z; Bobcat E50z |  | High |
| 6692836 | Bobcat | Hydraulic tank breather cap | Bobcat E37 Ultra HD; Bobcat E37 Xtra HD |  | Low |
| 7012303 | Bobcat | Engine oil filter | Bobcat S590; Bobcat S770 |  | High |
| 7023589 | Bobcat | Fuel filter (primary/water separator) | Bobcat S590; Bobcat S770 |  | High |
| 7024037 | Bobcat | Hydraulic filter (main) | Bobcat S450; Bobcat S590 |  | High |
| 7176099 | Bobcat | Cabin air filter (fresh air) | Bobcat E37 Ultra HD; Bobcat E37 Xtra HD |  | Low |
| 7319444 | Bobcat | Hydraulic charge filter (spin-on) | Bobcat S450; Bobcat S770 |  | High |
| 47362223 | CASE | Air filter (outer/primary) | CASE 770 EX; CASE 770 NXe Series |  | Medium |
| 47362227 | CASE | Air filter (inner/safety) | CASE 770 EX; CASE 770 NXe Series |  | Medium |
| 47587350 | CASE | Hydraulic tank breather | Case CX220C; Case CX220C LC |  | High |
| 47635916 | CASE | Hydraulic pilot filter | Case CX220C; Case CX220C LC |  | High |
| 47710533 | CASE | Hydraulic return filter | CASE 845B; CASE 865B |  | Medium |
| 47757762 | CASE | Hydraulic return filter | Case CX220C; Case CX220C LC |  | High |
| 47801835 | CASE | Fuel filter (primary/water separator) | CASE 770 EX; CASE 770 NXe Series |  | Medium |
| 47833564 | CASE | Hydraulic return filter | CASE 770 EX; CASE 770 EX Plus |  | High |
| 47947003 | CASE | Fuel filter (pre-filter) | Case CX220C; Case CX220C LC |  | High |
| 47986270 | CASE | Cab air filter | Case CX220C; Case CX220C LC |  | High |
| 48138563 | CASE | Engine oil filter | CASE 845B; CASE 865B |  | Medium |
| 84217229 | CASE | Air filter (outer/primary) | CASE 845B; CASE 865B |  | Medium |
| 84565926 | CASE | Fuel filter (inline/pre-filter) | CASE 845B; CASE 865B |  | Medium |
| 87327673L | CASE | Engine oil filter | Case CX220C; Case CX220C LC |  | High |
| 87682999 | CASE | Air filter (inner/safety) | CASE 845B; CASE 865B |  | Medium |
| 87683001 | CASE | Air filter (inner/safety) | Case CX220C; Case CX220C LC |  | High |
| 90373728 | CASE | Fuel strainer | CASE 770 EX; CASE 770 EX Plus |  | Medium |
| 90462638 | CASE | Engine oil filter | CASE 770 EX; CASE 770 EX Plus |  | High |
| 90495241 | CASE | Air filter (outer/primary) | CASE 770 EX; CASE 770 EX Plus |  | High |
| 90495242 | CASE | Air filter (inner/safety) | CASE 770 EX; CASE 770 EX Plus |  | High |
| 91756080 | CASE | Fuel filter (primary/water separator, spin-on) | CASE 770 EX; CASE 770 EX Plus | Donaldson P551000 | High |
| 91756083 | CASE | Fuel filter (secondary) | CASE 770 EX; CASE 770 EX Plus |  | High |
| 92129321 | CASE | Fuel filter (secondary) | CASE 845B; CASE 865B |  | Medium |
| BU4430027 | CASE | Hydraulic tank breather | CASE 770 EX; CASE 770 EX Plus |  | Medium |
| KBH0921 | CASE | Air filter (outer/primary) | Case CX220C; Case CX220C LC |  | High |
| KHH12030L | CASE | Fuel filter (spin-on main) | Case CX220C; Case CX220C LC |  | High |
| KHJ17730 | CASE | Hydraulic pilot filter (alternate number) | Case CX220C; Case CX220C LC |  | Low |
| KRJ10590 | CASE | Hydraulic suction strainer | Case CX220C; Case CX220C LC |  | Medium |
| KRJ15830 | CASE | Hydraulic return filter (alternate number) | Case CX220C; Case CX220C LC |  | Low |
| 128-2686 | Cat | Air filter (outer/primary) | Caterpillar CAT 320D3; Caterpillar CAT 320D3 GC |  | Low |
| 231-4487 | Cat | Cab recirculation filter | Caterpillar Cat 120 GC; Caterpillar Cat 140 GC |  | High |
| 258-2829 | Cat | Hydraulic tank breather | Caterpillar CAT 950GC; Caterpillar Cat 966H |  | High |
| 328-3655 | Cat | Transmission filter | Caterpillar Cat 14M3; Caterpillar Cat 966H | Baldwin PT9429-MPG; Donaldson P573354; Fleetguard HF35515 (SAPAC cross-ref) | High |
| 378-3187 | Cat | DEF filter element | Caterpillar Cat 120 GC; Caterpillar Cat 140 GC |  | High |
| 389-1085 | Cat | Transmission filter | Caterpillar Cat 120 GC; Caterpillar Cat 140 GC |  | High |
| 7T-7358 | Cat | Cab fresh air filter | Caterpillar Cat 120 GC; Caterpillar Cat 140 GC |  | High |
| FS1212 | Cummins (Fleetguard) | Fuel filter (primary/water separator) | LiuGong B230; Shantui SD32W | Cummins 3315843 | Medium |
| LF670 | Cummins (Fleetguard) | Engine oil filter | LiuGong B230; Shantui SD32W | Fleetguard LF777 (bypass); Cummins 3313279 / 3313283 / 3401544 / Fleetguard LF777; LF9009; Cummins 3313279 / 3313283 / 3401544 | Medium |
| FS53014 | Cummins Filtration (Fleetguard) | Fuel filter (primary/water separator) | BEML BD475-2; BEML BE1000-1 |  | Medium |
| 01174421 | Deutz | Engine oil filter (spin-on) - Deutz option | Putzmeister BSA 1404 HD eSmart; Putzmeister BSA 1407 D eSmart | Deutz 01183574; 01181749 | Medium |
| 01174421 | Deutz | Engine oil filter (spin-on) | Putzmeister BSA 2109 HD; Schwing Stetter SP 3500 | Deutz 01183574 | Low |
| 01174421 | Deutz | Engine oil filter (Deutz) | SDLG E6135Fi; SDLG E6150F |  | Medium |
| 01174423 | Deutz | Fuel filter (spin-on) - Deutz option | Putzmeister BSA 1404 HD eSmart; Putzmeister BSA 1407 D eSmart | Deutz 01181917; 01160243 | Medium |
| 4812161866 | Dynapac | Engine oil (Dynapac Engine Oil 50, 5 L can) | Dynapac CA305 CEV-V; Dynapac CA305D CEV-V |  | Medium |
| ID376839 | Eicher (VECV) | Engine oil filter (service kit with O-ring) | Eicher Pro 6028TM; Eicher Pro 6035TM |  | High |
| FS19732 | Fleetguard | Fuel filter (primary/water separator) | Fine FMG 985 HD; Leeboy 525E | Cummins 3973233 / Cummins 3973233; Cummins 3991498 | Medium |
| LF16015 | Fleetguard | Engine oil filter | Fine FMG 985 HD; Leeboy 525E | Cummins 4989314 / Cummins 4989314; Cummins 4897898; Donaldson P551100 | Medium |
| 4210224 | Hitachi | Hydraulic suction strainer | Tata Hitachi ZAXIS 370LCH; Tata Hitachi ZAXIS 400MTH | Donaldson P764679 | Medium |
| 4240294 | Hitachi | Air filter (outer/primary) | Tata Hitachi ZAXIS 650H; Tata Hitachi ZAXIS 670H | Donaldson P127308; Sure SA11871 | Low |
| 4240295 | Hitachi | Air filter (inner/safety) | Tata Hitachi ZAXIS 650H; Tata Hitachi ZAXIS 670H | Donaldson P127309; Sure SA11872 | Low |
| 4286128 | Hitachi | Air filter (outer/primary) | Tata Hitachi ZAXIS 220LC; Tata Hitachi ZAXIS 220LC Ultra | Donaldson P821938; Fleetguard AF25414 | Low |
| 4286130 | Hitachi | Air filter (inner/safety) | Tata Hitachi ZAXIS 220LC; Tata Hitachi ZAXIS 220LC Ultra | Donaldson P821963; Fleetguard AF25412 | Low |
| 4350249 | Hitachi | Cabin air filter | Tata Hitachi ZAXIS 370LCH; Tata Hitachi ZAXIS 400MTH | superseded by 4S00640 | Low |
| 4448336 | Hitachi | Engine oil filter | Tata Hitachi ZAXIS 370LCH; Tata Hitachi ZAXIS 400MTH | Fleetguard LF9008; Baldwin B7217; Donaldson P550596 | Low |
| 4616545 | Hitachi | Fuel filter (primary/water separator) | Tata Hitachi ZAXIS 220LC; Tata Hitachi ZAXIS 220LC Ultra | Donaldson P552564; earlier L4206080 (Fleetguard FF5108) | Medium |
| 4658521RCP | Hitachi | Engine oil filter | Tata Hitachi ZAXIS 220LC; Tata Hitachi ZAXIS 220LC Ultra | ECE FLP3130 | Medium |
| 4S00686 | Hitachi | Cabin air filter | Tata Hitachi ZAXIS 220LC; Tata Hitachi ZAXIS 220LC Ultra | Donaldson P500248; ECE FLP2583 (fresh air FYA00001490) | Medium |
| KC3098117099 | Hitachi | Hydraulic tank breather | Tata Hitachi ZAXIS 220LC; Tata Hitachi ZAXIS 220LC Ultra | Donaldson P502563; ECE FLP2908 | Medium |
| YA00007394 | Hitachi | Air filter (outer/primary) | Tata Hitachi ZAXIS 220LC; Tata Hitachi ZAXIS 220LC Ultra | Donaldson P532503; ECE FLP2818 | Medium |
| YA00007606 | Hitachi | Air filter (inner/safety) | Tata Hitachi ZAXIS 220LC; Tata Hitachi ZAXIS 220LC Ultra | Donaldson P532504; ECE FLP2819 | Medium |
| YA00026486 | Hitachi | Hydraulic return filter | Tata Hitachi ZW 370-5A; Tata Hitachi ZW550 |  | Low |
| YA00033064 | Hitachi | Hydraulic return filter | Tata Hitachi ZAXIS 220LC; Tata Hitachi ZAXIS 220LC Ultra | Donaldson P502660 | Medium |
| 8-98018858-0 | Isuzu | Engine oil filter (element) | Kobelco SK140; Kobelco SK145XDLC |  | Low |
| 8-98143041-1 | Isuzu | Fuel filter (secondary) | Kobelco SK140; Kobelco SK145XDLC |  | Low |
| VI8983758600 | Isuzu | Engine oil filter (element) | Kobelco SK140; Kobelco SK145XDLC |  | Low |
| 32/917301 | JCB | Air filter (outer/primary) | JCB SSL 135; JCB SSL 155 |  | Low |
| 32/917302 | JCB | Air filter (inner/safety) | JCB SSL 135; JCB SSL 155 |  | Low |
| 32/922300 | JCB | Fuel filter (pre-filter/inline strainer) | JCB 35Z HD; JCB 37C HD |  | Medium |
| 32/925348 | JCB | Air filter (outer/primary) | JCB 35Z HD; JCB 37C HD |  | Medium |
| 32/925349 | JCB | Air filter (inner/safety) | JCB 35Z HD; JCB 37C HD |  | Medium |
| 32/925666 | JCB | Fuel filter (primary/water separator element) | JCB 35Z HD; JCB 37C HD | Stanadyne 37290 | Medium |
| 320/A7088 | JCB | Fuel filter (primary/water separator, 30 micron) | JCB 130; JCB VM117 |  | Low |
| 333/H5477 | JCB | Engine oil filter (cartridge) | JCB SSL 135; JCB SSL 155 | JCB 334/V6243 (interchange); Hifi SO 11159; Kohler ED0021750010-S / ED0021753090-S | Medium |
| 334/L6678 | JCB | Hydraulic return filter | JCB 35Z HD; JCB 37C HD |  | Medium |
| 400/01662 | JCB | Service filter kit (1000 hr) | JCB NXT 205; JCB NXT 205LC |  | High |
| 400/29647 | JCB | Service filter kit (1000 hr) | JCB NXT 215 LC Fuel Master; JCB NXT 215LC |  | Low |
| 500/00151 | JCB | Fuel filter (secondary) | JCB 3DX; JCB 81 | Fleetguard FF5526 / Fleetguard FF5526 (1.1 L STF element, Elofic EK-4294) | Low |
| 500/00214 | JCB | Fuel filter (cloth element, 1.1 L) | JCB 3DX; JCB 81 | Donaldson P759007 / Elofic EK-4406; Donaldson P759007 | Medium |
| 550/40575 | JCB | Engine oil filter | JCB 3DX; JCB 81 | Fleetguard LF16075; Donaldson P502908 / Fleetguard LF16075; Donaldson P502908; Elofic EK-6259 | Medium |
| 550/41639 | JCB | Air filter (inner/safety) | JCB 3DX; JCB 81 | Fleetguard AF26392; Donaldson P500807 | Medium |
| 550/41640 | JCB | Air filter (outer/primary) | JCB 3DX; JCB 81 | Fleetguard AF26391; Donaldson P500806 / Fleetguard AF26391; Donaldson P500806; Elofic EK-1547 (set) | Medium |
| 550/42746 | JCB | Service filter kit (Kirloskar engine) | JCB 3DX; JCB 81 |  | Medium |
| R519476 | John Deere | Fan belt | Liebherr L566; Liebherr L580 |  | High |
| RE506103 | John Deere | Starter motor (24V) | Liebherr L566; Liebherr L580 |  | High |
| RE509672 | John Deere | Engine oil filter | Liebherr L566; Liebherr L580 |  | High |
| RE519626 | John Deere | Engine oil filter | HAMM HD 109i VV; HAMM HD 99i VV |  | Medium |
| RE520906 | John Deere | Fuel filter (primary) | Liebherr L566; Liebherr L580 |  | High |
| RE525523 | John Deere | Fuel filter (secondary/final) | Liebherr L566; Liebherr L580 |  | High |
| RE554345 | John Deere | Fuel filter (secondary) | HAMM HD 109i VV; HAMM HD 99i VV |  | Medium |
| RE558676 | John Deere | Alternator (24V 100A) | Liebherr L566; Liebherr L580 |  | High |
| 5H.999.24.0.SP | Kirloskar | Engine service filter kit (KOEL consumables kit) | Escorts Digmax II XP; Escorts Jungli HT |  | Low |
| 5H.999.25.0.SP | Kirloskar | Engine service filter kit (KOEL consumables kit) | Escorts EC 5250; Escorts EC 5250 Plus |  | Low |
| LV57V00002S003 | Kobelco | Hydraulic tank breather | Kobelco SK520XDLC; Kobelco SK850LC |  | Low |
| 22B-60-11160 | Komatsu | Hydraulic suction strainer | L&T Komatsu Komatsu GD555; L&T Komatsu Komatsu WA470-6A |  | Medium |
| 426-07-32441 | Komatsu | Cab air filter | L&T Komatsu Komatsu WA380Z-6; L&T Komatsu Komatsu WA470-6A |  | Medium |
| 600-185-6120 | Komatsu | Air filter (inner/safety) | L&T Komatsu D155A-6; L&T Komatsu Komatsu WA500-6R |  | Medium |
| 600-311-3841 | Komatsu | Fuel filter (cartridge, 1-5/8 in) | L&T Komatsu Komatsu GD955-7; L&T Komatsu Komatsu WA500-6R |  | Medium |
| 600-411-1151 | Komatsu | Corrosion resistor (coolant filter) | L&T Komatsu Komatsu GD825A-2; L&T Komatsu Komatsu WA470-6A |  | Medium |
| 6002-11-1230 | Komatsu/BEML | Oil filter cartridge (Komatsu-numbered alternate) | BEML BD155; BEML BD355 | Komatsu 600-211-1230 | Medium |
| 6003-11-8291 | Komatsu/BEML | Fuel filter cartridge (Komatsu-numbered alternate) | BEML BD155; BEML BD355 | Komatsu 600-311-8291 | Medium |
| HH150-32430 | Kubota | Engine oil filter | XCMG XE20U; XCMG XE28U | Donaldson P502067; Kubota HH1J0-32430; 15853-99170 | Low |
| HH164-32430 | Kubota | Engine oil filter | Fine FM38; Hyundai HX35AZ |  | Medium |
| 10149977 | Liebherr | Fuel filter | Liebherr R 9100 G6; Liebherr R 9150 G7 | HIFI SN70406; SF SK48590; Sakura EF-49030 | Low |
| 10279775 | Liebherr | Air filter (outer/primary) | Liebherr R 956 Litronic; Liebherr R 960 SME Litronic | Donaldson P951978; SF SL81446; HIFI SA 17521 | Low |
| 16C0143 | LiuGong | Hydraulic tank breather | Liugong 848H; Liugong 856H MAX |  | Medium |
| 40C2178 | LiuGong | Air filter (outer/primary) | Liugong 848H; Liugong 856H MAX |  | Medium |
| 40C2179 | LiuGong | Air filter (inner/safety) | Liugong 848H; Liugong 856H MAX |  | Medium |
| 40C5856 | LiuGong | Air filter kit (alt) | Liugong 848H; Liugong 856H MAX |  | Low |
| 40C6996 | LiuGong | Fuel filter (fine) | Liugong 848H; Liugong 856H MAX |  | Medium |
| 40C7018 | LiuGong | Fuel filter (QSB7/6BT listing) | Liugong 939E; Liugong 939E HD | Fleetguard FS1098 | Low |
| 46C6247 | LiuGong | Cabin air filter | Liugong 848H; Liugong 856H MAX | LiuGong 46C5715 | Low |
| 53C0066 | LiuGong | Hydraulic filter (alt) | Liugong 848H; Liugong 856H MAX | LiuGong 53C0574 | Low |
| 53C0253 | LiuGong | Air filter (outer/primary) | Liugong 939E; Liugong 939E HD |  | Low |
| 53C0254 | LiuGong | Air filter (inner/safety) | Liugong 939E; Liugong 939E HD |  | Low |
| 53C0265 | LiuGong | Hydraulic filter | Liugong 939E; Liugong 939E HD |  | Low |
| 53C0494 | LiuGong | Fuel filter | Liugong 939E; Liugong 939E HD |  | Low |
| 53C0563 | LiuGong | Torque converter filter | Liugong 848H; Liugong 856H MAX |  | Medium |
| 53C0576 | LiuGong | Fuel filter (primary/water separator) | Liugong 848H; Liugong 856H MAX |  | Medium |
| 53C0720 | LiuGong | Hydraulic return filter | Liugong 848H; Liugong 856H MAX |  | Medium |
| 53C0841 | LiuGong | Fuel filter (secondary) | Liugong 848H; Liugong 856H MAX |  | Medium |
| 53C1530 | LiuGong | Transmission filter | Liugong 848H; Liugong 856H MAX |  | Medium |
| 60C2472 | LiuGong | Air filter kit (outer+inner) | Liugong 848H; Liugong 856H MAX | Donaldson X012252; elements 40C2178 (outer) / 40C2179 (inner) | Medium |
| SP202380 | LiuGong | Transmission filter (external, alt) | Liugong 848H; Liugong 856H MAX |  | Low |
| SP236190 | LiuGong | Engine oil filter (Yuchai, India) | Liugong 848H; Liugong 856H MAX | LiuGong SP217876 | Medium |
| P 4001 | MANN+HUMMEL | Fuel filter (secondary) | Yanmar Vi020-6; Yanmar Vi025-6 | MANN P 4001; MANN P 45 | Medium |
| W 67/1 | MANN+HUMMEL | Engine oil filter | Yanmar Vi020-6; Yanmar Vi025-6 | MANN W 67/1 | Medium |
| W 811/80 | MANN+HUMMEL | Engine oil filter | Kobelco SK30SR; Kobelco SK35SR | MANN W 811/80; Yanmar 129150-35153 | Low |
| WK 818/80 | MANN+HUMMEL | Fuel filter (secondary) | Kobelco SK30SR; Kobelco SK35SR | MANN WK 818/80 | Low |
| 26510342 | Perkins | Air filter (outer/primary) | Bull Grandia; Bull HD100 4WD | Fleetguard AF25557 | Low |
| 26510343 | Perkins | Air filter (inner/safety) | Bull Grandia; Bull HD100 4WD | Fleetguard AF25558 | Low |
| 2654407 | Perkins | Engine oil filter | Bull Grandia; Bull HD100 4WD | Fleetguard LF699 | High |
| 26560201 | Perkins | Fuel filter (secondary) | Bull Grandia; Bull HD100 4WD | Fleetguard FS20009 | Low |
| 513375 | Putzmeister | S transfer tube | Putzmeister BSA 1408 HD; Putzmeister BSA 2109 HD |  | Medium |
| 60114999 | SANY | Hydraulic return filter | SANY SY20U; SANY SY27U |  | Low |
| 60167908 | SANY | Hydraulic filter | SANY SY20U; SANY SY27U |  | Low |
| 60170568 | SANY | Air filter (inner/safety) | SANY SY680C-10HD; SANY SY870C-10HD | Donaldson P114931 | Low |
| 60170569 | SANY | Air filter (outer/primary) | SANY SY680C-10HD; SANY SY870C-10HD | Donaldson P181039 | Low |
| 60186788 | SANY | Hydraulic tank breather | SANY SY20U; SANY SY27U |  | Low |
| 60201219 | SANY | Fuel filter (secondary) | SANY SY350C-9LCHD; SANY SY365C-9LA | Donaldson P557440 | Medium |
| 60249072 | SANY | Fuel filter (water separator cartridge, alt) | SANY SY350C-9LCHD; SANY SY365C-9LA | Donaldson P502593 | Medium |
| 60250800 | SANY | Fuel filter (water separator, alt) | SANY SY680C-10HD; SANY SY870C-10HD |  | Low |
| 60260271 | SANY | Hydraulic high-pressure filter | Sany STG170C-10; Sany STG210C-10 |  | Medium |
| 60273108 | SANY | Fuel filter (secondary) | SANY SY20U; SANY SY27U | Donaldson P550127 | Low |
| 60273111 | SANY | Engine oil filter | SANY SY20U; SANY SY27U | Donaldson P502067; alt SANY 60058455 (P502051) | Low |
| 60282117 | SANY | Fuel filter (secondary, alt) | SANY SY350C-9LCHD; SANY SY365C-9LA | Donaldson R011739 | Medium |
| 60282117 | SANY | Fuel filter (secondary) | SANY SY680C-10HD; SANY SY870C-10HD | Donaldson R011739 | Low |
| 60310823 | SANY | Fuel filter (secondary, alt) | SANY SY215C-9LCS; SANY SY220C-9HD | Donaldson P502466 | Low |
| 60310823 | SANY | Fuel filter (secondary) | SANY SY225C-10HD GENe; SANY SY230C-10HD GENe | Donaldson P502466 | Low |
| 60328868 | SANY | Fuel filter (primary/water separator, element) | Sany STG170C-10; Sany STG210C-10 |  | Medium |
| B222100000151 | SANY | Engine oil filter | Sany STG170C-10; Sany STG210C-10 |  | Low |
| B222100000492 | SANY | Fuel filter (secondary) | SANY SY380C-10HD; SANY SY390C-10HD GraMa | Donaldson P557440 | Low |
| B222100000521 | SANY | Fuel filter (secondary) | SANY SY215C-9LCS; SANY SY220C-9HD | Donaldson P552561 | Low |
| B222100000532 | SANY | Air filter (inner/safety) | SANY SY225C-10HD GENe; SANY SY230C-10HD GENe | Donaldson P536492 | Low |
| B222100000535 | SANY | Air filter (outer/primary) | SANY SY225C-10HD GENe; SANY SY230C-10HD GENe | Donaldson P536457 | Low |
| B222100000551 | SANY | Engine oil filter | SANY SY215C-9LCS; SANY SY220C-9HD | Donaldson P552562 | Low |
| B222100000729 | SANY | Fuel filter (primary/water separator, cartridge) | SANY SY225C-10HD GENe; SANY SY230C-10HD GENe | Donaldson P502652 | Low |
| 11211150 | SDLG | Air filter (inner/safety, Donaldson LG6210 listing) | SDLG E6135Fi; SDLG E6150F |  | Low |
| 14403813 | SDLG | Fuel filter (Donaldson LG6210 listing) | SDLG E6135Fi; SDLG E6150F | water separator 11214252 | Low |
| 28110002321 | SDLG | Hydraulic filter | SDLG E6135Fi; SDLG E6150F |  | Medium |
| 29100000061 | SDLG | Hydraulic return filter | SDLG E6135Fi; SDLG E6150F | SDLG 4120003296 | Medium |
| 4110000763001 | SDLG | Air filter (outer/primary) | SDLG E6135Fi; SDLG E6150F |  | Medium |
| 4110000763002 | SDLG | Air filter (inner/safety) | SDLG E6135Fi; SDLG E6150F |  | Medium |
| 4110001169001 | SDLG | Air filter | SDLG G9150Hi; SDLG G9190Hi |  | Medium |
| 4120001088 | SDLG | Hydraulic tank breather | SDLG E6135Fi; SDLG E6150F |  | Medium |
| 249-1750 | SEM | Transmission filter | SEM 822D; SEM 824F | SEM 2491750 | High |
| 517-6649 | SEM | Hydraulic tank strainer | SEM 822D; SEM 824F |  | High |
| 5178619 | SEM | Cabin air filter | SEM 822D; SEM 824F |  | Low |
| 518-8099 | SEM | Engine oil filter (element) | SEM 822D; SEM 824F | SEM 5188099 | High |
| 5185260 | SEM | Hydraulic pilot filter | SEM 822D; SEM 824F |  | Low |
| 520-3012 | SEM | Fuel filter (primary/water separator) | SEM 822D; SEM 824F | SEM 5203012 | High |
| 5228468 | SEM | Hydraulic filter | SEM 822D; SEM 824F |  | Low |
| 5232588 | SEM | Hydraulic lower-tank filter | SEM 822D; SEM 824F |  | Low |
| 565-1153 | SEM | Fuel filter (secondary) | SEM 822D; SEM 824F | SEM 5651153 | High |
| 5651159 | SEM | Air filter | SEM 822D; SEM 824F |  | Low |
| 5878467 | SEM | Hydraulic return filter | SEM 822D; SEM 824F |  | Low |
| 1873018 | Scania | Fuel filter | Liugong 965E HD; SANY SY980C-10HD | Fleetguard FF5683 | Medium |
| KF200250C | Tata Hitachi | Service filter kit (250 h) | Tata Hitachi EX 200 Infra; Tata Hitachi EX 200LC Prime |  | Medium |
| KF200500C-N | Tata Hitachi | Service filter kit (500 h) | Tata Hitachi EX 200 Infra; Tata Hitachi EX 200LC Prime |  | Medium |
| KF201000C-N | Tata Hitachi | Service filter kit (1000 h) | Tata Hitachi EX 200 Infra; Tata Hitachi EX 200LC Prime |  | Medium |
| TE-21349 | Tata Hitachi | Air filter (outer/primary) | Tata Hitachi EX 200 Infra; Tata Hitachi EX 200LC Prime |  | Low |
| TE01870 | Tata Hitachi | Air filter kit | Tata Hitachi EX 200 Infra; Tata Hitachi EX 200LC Prime |  | Low |
| 14530989 | Volvo | Hydraulic filter | Volvo EC380D; Volvo EC480D |  | Low |
| 17500253 | Volvo | Air filter (inner/safety) | Volvo EC200D; Volvo EC210D |  | Medium |
| 17500260 | Volvo | Air filter (outer/primary) | Volvo EC380D; Volvo EC480D |  | Medium |
| 17500263 | Volvo | Air filter (inner/safety) | Volvo EC380D; Volvo EC480D |  | Medium |
| 20424148 | Volvo | Air dryer cartridge | Volvo EC380D; Volvo EC480D |  | Low |
| 20805349 | Volvo | Fuel filter (secondary) | Volvo EC200D; Volvo EC210D |  | Low |
| 20976003 | Volvo | Fuel filter (secondary) | Volvo EC380D; Volvo EC480D | Fleetguard FF5507; Volvo 20430751 | Medium |
| VOE11110004 | Volvo | Air filter (inner/safety) | Volvo EC250D; Volvo EC300D |  | Medium |
| VOE11110022 | Volvo | Air filter (outer/primary) | Volvo EC250D; Volvo EC300D |  | Medium |
| VOE11110283 | Volvo | Air filter (outer/primary) | Volvo EC120D; Volvo EC140D |  | Medium |
| VOE11110284 | Volvo | Air filter (inner/safety) | Volvo EC120D; Volvo EC140D |  | Medium |
| VOE14509379 | Volvo | Hydraulic return filter element | Volvo EC200D; Volvo EC210D | Fleetguard HF6319; Donaldson P551210 / Fleetguard HF6319; Donaldson P551210; Baldwin PT483; Sakura H-7911 | Medium |
| 250200144 | XCMG | Transmission filter | XCMG ZL48GV; XCMG ZL55GV | XCMG 860116239 (alt) | Low |
| 800171742 | XCMG | Fuel filter (primary/water separator) | XCMG XE80C; XCMG XE80C Pro |  | Low |
| 800173432 | XCMG | Engine oil filter | XCMG XE80C; XCMG XE80C Pro | Kubota 1C020-32434; HH1C0-32430 | Low |
| 800173433 | XCMG | Fuel filter (secondary, cartridge) | XCMG XE80C; XCMG XE80C Pro |  | Low |
| 803086817 | XCMG | Hydraulic tank breather | XCMG ZL48GV; XCMG ZL55GV |  | Low |
| 803164217 | XCMG | Hydraulic fill filter | XCMG ZL48GV; XCMG ZL55GV |  | Low |
| 803164228 | XCMG | Hydraulic suction strainer | XCMG ZL48GV; XCMG ZL55GV |  | Low |
| 803164329 | XCMG | Hydraulic suction filter | XCMG ZL48GV; XCMG ZL55GV |  | Low |
| 860119766 | XCMG | Fuel filter (primary/water separator, ZL50GV listing) | XCMG ZL48GV; XCMG ZL55GV |  | Low |
| 860131616 | XCMG | Air filter (ZL50GV listing) | XCMG ZL48GV; XCMG ZL55GV |  | Low |
| 860133763 | XCMG | Engine oil filter (ZL50GV listing) | XCMG ZL48GV; XCMG ZL55GV | Shangchai 2D17-002-02 | Low |
| 860134745 | XCMG | Fuel filter (secondary, ZL50GV listing) | XCMG ZL48GV; XCMG ZL55GV | Shangchai D638-002-02 | Low |
| 860203871 | XCMG | Hydraulic suction filter | XCMG XE80C; XCMG XE80C Pro |  | Low |
| 119802-55710 | Yanmar | Fuel filter (primary/water separator) screen | Yanmar Vi035-6B; Yanmar ViO30-6B |  | Medium |
| 119802-55810 | Yanmar | Fuel filter (secondary) | Yanmar Vi035-6B; Yanmar ViO30-6B |  | Medium |
| 119808-12520 | Yanmar | Air filter (outer/primary) | Yanmar Vi020-6; Yanmar Vi025-6 | Sakura A-8568 | High |
| 172175-73710 | Yanmar | Hydraulic return filter | Yanmar Vi035-6B; Yanmar ViO30-6B |  | Medium |
| 961000-1105100B | Yuchai | Fuel filter (Yuchai YCK09) | Liugong 848H; Liugong 856H MAX |  | Low |

---

## 4. Aftermarket cross-reference index

OEM number → equivalents stated by a cross-reference source (Fleetguard, Donaldson, MANN+HUMMEL, Baldwin, UFI, Elofic, WIX, Sakura…). Use these for the "parts makers" blocks on the spare-parts hub; always keep the OEM number as the primary key.

| OEM number | Owner | Part | Cross-references | Example machine |
|---|---|---|---|---|
| 006022696H1 | Mahindra | Fuel filter (primary/water separator) | Elofic EK-6423 | Mahindra CE Mahindra Earthmaster SX |
| 01174421 | Deutz | Engine oil filter (spin-on) | Deutz 01183574 | Putzmeister Putzmeister BSA 2109 HD |
| 01174421 | Deutz | Engine oil filter (spin-on) - Deutz option | Deutz 01183574; 01181749 | Putzmeister Putzmeister BSA 1404 HD eSmart |
| 01174423 | Deutz | Fuel filter (spin-on) - Deutz option | Deutz 01181917; 01160243 | Putzmeister Putzmeister BSA 1404 HD eSmart |
| 01180597 | Deutz | Fuel filter | Deutz 01174423 (alt) | SANY SANY STH1056A |
| 01180597 | Deutz | Fuel filter (Deutz) | Deutz 01174423 | SDLG SDLG E6135Fi |
| 019004000 | Putzmeister | Delivery piston Ø200 (standard) | Long-life piston assembly 086236005 | Putzmeister Putzmeister BSA 1405 D Classic |
| 019033000 | Putzmeister | Delivery piston Ø180 (standard) | Long-life assembly 234735002; seal 056720004; guide ring 056123009 | Putzmeister Putzmeister BSA 1404 HD eSmart |
| 02/630935A | JCB | Engine oil filter | Perkins 140517050 | JCB JCB 35Z HD |
| 02/910140A | JCB | Engine oil filter | Fleetguard LF3959 (Cummins 3937695/3937743); Donaldson P502907 - Elofic JS200 6BT listing | JCB JCB NXT 205 |
| 02/910140A | JCB | Engine oil filter | Fleetguard LF3959; Donaldson P502907 (Elofic JS140 listing) | JCB JCB NXT 140 |
| 02/910155A | JCB | Fuel filter (secondary) | Fleetguard FF5052 (Cummins 3931063/3903640); Donaldson P502905 - Elofic 6BT listing | JCB JCB NXT 205 |
| 02/910155A | JCB | Fuel filter (secondary) | Fleetguard FF5052; Donaldson P502905 (Elofic JS140 listing) | JCB JCB NXT 140 |
| 0303BAC01031N | Mahindra | Engine oil filter (spin-on) | Elofic EK-6424 | Mahindra CE Mahindra Earthmaster SX |
| 0305DAV03030N | Mahindra | Fuel filter | Fleetguard FF5540 | Mahindra Truck Mahindra Blazo X 28 |
| 0313AAA04072N | Mahindra | Air filter (inner/safety) | Elofic EK-4679 | Mahindra CE Mahindra Earthmaster SX |
| 0313AAC04712N | Mahindra | Air filter (outer/primary) | Elofic EK-4708 | Mahindra CE Mahindra Earthmaster SX |
| 04504440 | Deutz | Fuel water separator (Deutz engine number) | Liebherr 11492364; Perkins 4522178; Racor R60THB1 | Manitou MANITOU MRT-X 1645 |
| 06.436.01.0.00 | Kirloskar | Engine oil filter (spin-on) | Bosch (OEM supplier) | AJAX Engg AJAX ARGO 3000 |
| 06.436.01.0.00 | Kirloskar | Engine oil filter (spin-on) | Fleetguard LF16075; Donaldson P502908; Elofic EK-6259 | Bull Machines Bull HD76 2WD |
| 06.436.01.0.00 | Kirloskar | Engine oil filter (spin-on) | Fleetguard LF16075; Donaldson P502908; Elofic EK-6259 (Elofic lists these for JCB 3DX KOEL 4R1040, JCB no. 550/40575) | ACE ACE AX 130 |
| 06.474.50.0.00 | Kirloskar | Fuel filter (spin-on, main) | Stanadyne (OEM supplier) | Conmat Conmat MR 60C |
| 0703BAN00041N | Mahindra | Transmission filter (spin-on, Carraro) | CASE BU4430033; Terex/L&T 6190810M1; Donaldson P554408 (per Elofic EK-6440) | Mahindra CE Mahindra Earthmaster SX |
| 10003413 | Schwing | Sealing gland set 45/65 x 27.5 (grooved ring) | Alt. 10007414 sealing gland set 45/65 x 27.5 | Schwing Stetter Schwing Stetter BP 350 D |
| 1000428205 | Weichai | Engine oil filter | Weichai 1000424655 (alt) | Shantui Shantui DH24C3 |
| 1000495963 | Weichai | Fuel filter (primary) | Donaldson P582086; Fleetguard FS20071 | Shantui Shantui DH13B3 |
| 10018046 | Schwing | Housing lining / kidney plate DN180 | Carbide (HM) = 10129833 | Schwing Stetter Schwing Stetter SP 1015 D |
| 10063939 | Schwing | Cutting ring DN210 | Carbide (HM) = 10081098 | Schwing Stetter Schwing Stetter SP 1015 D |
| 10074767 | Schwing | Wearing insert / wear plate DN200 | Carbide (HM) DN200/210 = 10081096 | Schwing Stetter Schwing Stetter SP 1015 D |
| 10149977 | Liebherr | Fuel filter | HIFI SN70406; SF SK48590; Sakura EF-49030 | Liebherr Liebherr R 9150 G7 |
| 10279775 | Liebherr | Air filter (outer/primary) | Donaldson P951978; SF SL81446; HIFI SA 17521 | Liebherr Liebherr R 956 Litronic |
| 10297295 | Liebherr | Engine oil filter | Donaldson P502596 | Liebherr Liebherr R 926 Litronic |
| 10324849 | Liebherr | Hydraulic return filter | Baldwin PT23591-MPG; Fleetguard HF29132; MANN HD1520; HIFI SH68238; Filtrec WG1021 | Liebherr Liebherr L550 |
| 10Y-76-03000 | Shantui | Transmission filter | Shantui 10Y-76-03030 | Shantui Shantui SD13 |
| 11036607 | Volvo | Hydraulic/transmission oil filter (spin-on) | MANN W 980.1; Volvo 11448509 | Volvo Volvo L90H |
| 11110683 | Volvo | Fuel filter (primary/water separator) | Fleetguard FS19914 | Volvo Volvo EC220D |
| 11110683 | Volvo | Fuel filter (primary/water separator) | MANN WK 1080/7x; Donaldson P559118 | Volvo Volvo L90H |
| 11110683 | Volvo | Fuel filter (primary/water separator) | MANN WK 1080/7x; Donaldson P559118; Fleetguard FS19914 | Volvo Volvo EC200D |
| 11161894 | Liebherr | Hydraulic filter (second element) | HIFI SH68367; Parker 936979Q; SF HY90992 | Liebherr Liebherr L550 |
| 11427521 | Liebherr | Engine oil filter cartridge | MANN H15178x; Hengst E1049HD603; HIFI SO7291 | Liebherr Liebherr R 9150 G7 |
| 119802-55801 | Yanmar | Fuel filter (secondary, spin-on) | Donaldson P550048; MANN WK 818/80; Baldwin BF7552 | Manitou MANITOU 1340R |
| 119808-12520 | Yanmar | Air filter (outer/primary) | Sakura A-8568 | Yanmar Yanmar Vi020-6 |
| 11E1-70010 | Hyundai | Fuel filter (secondary) | Cummins 3931063; Fleetguard FF5052; Donaldson P551329 | Hyundai Hyundai R210 SMART Plus |
| 11E1-70140 | Hyundai | Engine oil filter | Cummins 3932217; Fleetguard LF3349 | Hyundai Hyundai R210 SMART Plus |
| 11E1-70210 | Hyundai | Fuel filter (primary/water separator) | Cummins 3930942; Fleetguard FS1280 | Hyundai Hyundai R210 SMART Plus |
| 11N6-24520 | Hyundai | Air filter (outer/primary) | STAL ST40647AB; Fleetguard AF26285K; Sakura AS-2831 | Hyundai Hyundai R210 SMART Plus |
| 11N6-24530 | Hyundai | Air filter (inner/safety) | Sakura A-2832 | Hyundai Hyundai R210 SMART Plus |
| 129150-35153 | Yanmar | Engine oil filter | Fleetguard LF3657; Baldwin B7487; MANN W 811/80 | Manitou MANITOU 1340R |
| 129242-55730 | Yanmar | Fuel filter (primary/water separator) | Water separator assembly 129242-55701 | LiuGong Liugong 9035E |
| 135326205 | Perkins | Air filter (outer/primary) | Fleetguard AF26659 | JCB JCB 30 PLUS |
| 135326206 | Perkins | Air filter (outer/primary) | Fleetguard AF27867 | JCB JCB 50Z |
| 140517050 | Perkins | Engine oil filter | Fleetguard LF3874; JCB 02/630935A | JCB JCB 35Z HD |
| 140517050 | Perkins | Engine oil filter | Fleetguard LF3874; also JCB 02/630935A (replaces Perkins 403D/404 spin-on per L&S Engineers) | JCB JCB 30 PLUS |
| 144-0832 | Cat | Hydraulic filter (steering/implement) | Baldwin BT9371-MPG; Fleetguard HF35523; Donaldson P167162; MANN WD 13 003 X | Caterpillar Cat 966H |
| 14403813 | SDLG | Fuel filter (Donaldson LG6210 listing) | water separator 11214252 | SDLG SDLG E6135Fi |
| 14532687 | Volvo | Hydraulic filter (spin-on line filter) | CVA 14532687 | Volvo Volvo EC200D |
| 16Y-75-13100 | Shantui | Transmission/torque converter filter | Komatsu-pattern 195-13-13420 | Shantui Shantui DH16B3 |
| 171081-55910 | Yanmar | Fuel pre-filter | Sakura FC-1022 | Yanmar Yanmar Vi025-6 |
| 175-49-11580 | Shantui | Transmission filter | Shantui 175-49-11231 | Shantui Shantui SD32W |
| 17500251 | Volvo | Air filter (outer/primary) | SA160132; SA160133 | Volvo Volvo EC220D |
| 1873014 | Scania | Engine oil filter | Fleetguard LF17487 | SANY SANY SY980C-10HD |
| 1873018 | Scania | Fuel filter | Fleetguard FF5683 | LiuGong Liugong 965E HD |
| 1R-0762 | Cat | Fuel filter (secondary) | Fleetguard FF5624; Donaldson P550625; Baldwin BF7753; Sakura FC-5517 (SAPAC cross-ref) | Caterpillar Cat 966H |
| 1R-1808 | Cat | Engine oil filter | Baldwin B7299; Donaldson P551808; Fleetguard LF691A; MANN WD 13 145/18; Sakura C-5507 (SAPAC cross-ref) | Caterpillar Cat 966H |
| 1R-1808 | Cat | Engine oil filter | Baldwin B7299; Donaldson P551808; Fleetguard LF691A; WIX 57792; Luber-finer LFP4005RN | Caterpillar Cat 14M3 |
| 2022275 | Scania | Engine oil filter (insert) | Scania 2037556 (alt) | LiuGong Liugong 965E HD |
| 207-60-71182 | Komatsu | Hydraulic return filter | Fleetguard HF35360; Donaldson P550787; Baldwin PT9351-MPG (SAPAC cross-ref) | L&T Komatsu Komatsu WA470-6A |
| 20976003 | Volvo | Fuel filter (secondary) | Fleetguard FF5507; Volvo 20430751 | Volvo Volvo EC380D |
| 2106AAA00070N | Mahindra | Hydraulic suction strainer | Elofic EK-4388 (suction filter) | Mahindra CE Mahindra Earthmaster SX |
| 2106SAA00040N | Mahindra | Hydraulic return filter (main) | Donaldson P550251; alt. no. 0180MA010BN | Mahindra CE Mahindra Earthmaster SX |
| 21707132 | Volvo | Engine oil filter (by-pass) | Fleetguard LF3654 | Volvo Volvo EC550E |
| 21707132 | Volvo | Engine oil filter (by-pass) | Fleetguard LF3654; Donaldson P550425 | Volvo Volvo EC750D |
| 21707132 | Volvo | Engine oil filter (by-pass) | Volvo 477556; Fleetguard LF3654 | Volvo Volvo EC380D |
| 21707133 | Volvo | Engine oil filter (full-flow, long-life) | MANN 478736; Donaldson P550425; Fleetguard LF667; Baldwin B76 | Volvo Volvo EC380D |
| 21707133 | Volvo | Engine oil filter (full-flow, long-life) | MANN 478736; Fleetguard LF667 | Volvo Volvo EC550E |
| 21707133 | Volvo | Engine oil filter (full-flow, long-life) | MANN 478736; Fleetguard LF667/LF3675; Donaldson P554004 | Volvo Volvo EC750D |
| 220747709902 | Tata Motors | Fuel filter | Bosch F 002 H26 567; Fleetguard FS1003 (Cummins 220747700109) | Tata Motors CV Tata LPK 2821.K FE+ RMC |
| 225-4118 | Cat | Hydraulic filter (hydraulic system) | Baldwin BT9353-MPG; Fleetguard HF6588; Donaldson P165675; MANN WH 1257/3 (SAPAC cross-ref) | Caterpillar Cat 966H |
| 229488005 | Putzmeister | Spectacle wear plate (DURO 22) | Carbide version 571451; carbide with insert ring 275608004 + insert ring 485385 | Putzmeister Putzmeister BSA 1405 D Classic |
| 234559000 | Putzmeister | Spectacle wear plate (DURO 22) | Carbide 533286; carbide w/ insert ring 275604008 + 269759008 | Putzmeister Putzmeister BSA 1404 HD eSmart |
| 245-3818 | Cat | Air filter (outer/primary) | Fleetguard AF26401; Donaldson P782106; Baldwin RS3998 (SAPAC cross-ref) | Caterpillar Cat 966H |
| 245-3819 | Cat | Air filter (inner/safety) | Fleetguard AF26402; Donaldson P782109; Baldwin RS3999 (SAPAC cross-ref) | Caterpillar Cat 966H |
| 249-1750 | SEM | Transmission filter | SEM 2491750 | SEM SEM 822D |
| 250200144 | XCMG | Transmission filter | XCMG 860116239 (alt) | XCMG XCMG ZL48GV |
| 251031006 | Putzmeister | Wear ring / cutting ring (DURO 22) | Carbide version 531240 | Putzmeister Putzmeister BSA 1405 D Classic |
| 251231000 | Putzmeister | Wear ring / cutting ring (DURO 22) | Carbide 509425 | Putzmeister Putzmeister BSA 1404 HD eSmart |
| 257836001 | Putzmeister | Wear part set Ø180/260 | Carbide set 519870 | Putzmeister Putzmeister BSA 1404 HD eSmart |
| 264217008 | Putzmeister | Wear part set Ø200/260 (plate+ring+thrust ring) | Carbide set 571452 | Putzmeister Putzmeister BSA 1405 D Classic |
| 26510342 | Perkins | Air filter (outer/primary) | Fleetguard AF25557 | Bull Machines Bull Grandia |
| 26510343 | Perkins | Air filter (inner/safety) | Fleetguard AF25558 | Bull Machines Bull Grandia |
| 2654407 | Perkins | Engine oil filter | Fleetguard LF699 | Bull Machines Bull Grandia |
| 26560201 | Perkins | Fuel filter (secondary) | Fleetguard FS20009 | Bull Machines Bull Grandia |
| 26561117 | Perkins | Fuel filter (secondary, spin-on) | Fleetguard FF167 | JCB JCB 30 PLUS |
| 278609119910 | Tata Motors | Fuel filter (pre-filter element) | Fleetguard FS20117; Bosch F 002 H26 563; Cummins AX1015337; Tata Autocomp TFFCV1078K; Luman FF146 | Tata Motors CV Tata LPK 2821.K FE+ RMC |
| 278609999828 | Tata Motors | Fuel filter (main) | Bosch F 002 H26 562 | Tata Motors CV Tata LPK 2821.K FE+ RMC |
| 284788009 | Putzmeister | Thrust ring Ø200 | Carbide set uses 252898002 | Putzmeister Putzmeister BSA 1405 D Classic |
| 288047704904 | Tata Motors | Fuel filter (water separator) | Fleetguard FS19732; Cummins 3973233 | Tata Motors CV Tata LPK 2821.K FE+ RMC |
| 29100000061 | SDLG | Hydraulic return filter | SDLG 4120003296 | SDLG SDLG E6135Fi |
| 299937 | Manitou | Air filter (inner/safety) | Donaldson P606121 | Manitou MANITOU MRT-X 1645 |
| 30Z6280101 | BEML | Corrosion resistor (coolant filter) element | Komatsu 6150619320 (as printed; = 6150-61-9320) | BEML BEML BD65-1 |
| 31945-72001 | Hyundai | Fuel filter (secondary) | Donaldson P550391; Baldwin BF798 | Hyundai Hyundai R340L SMART |
| 31E9-0126 | Hyundai | Hydraulic pilot filter | STAL ST30628 | Hyundai Hyundai R210 SMART Plus |
| 31K6-01320 | Hyundai | Hydraulic line filter (spin-on) | HIFI SH60204; Fleetguard HF35556 | Hyundai Hyundai HX520L |
| 31N4-01460 | Hyundai | Hydraulic return filter | HIFI SH60769; Fleetguard HF35520 | Hyundai Hyundai HX520L |
| 31Q6-20340 | Hyundai | Hydraulic pilot filter | HIFI SH75160; Fleetguard HF35555 | Hyundai Hyundai HX520L |
| 31Z1200272 | BEML | Air cleaner element assembly | Komatsu 6125817032 (as printed) | BEML BEML BD65-1 |
| 32/915801 | JCB | Air filter (inner/safety) | Donaldson P780030 (per Elofic listing) | JCB JCB 3DX |
| 32/915802 | JCB | Air filter (outer/primary) | Donaldson P778989 (per Elofic listing) | JCB JCB 3DX |
| 32/925666 | JCB | Fuel filter (primary/water separator element) | Stanadyne 37290 | JCB JCB 35Z HD |
| 32/925694 | JCB | Fuel filter (primary/water separator element) | Baldwin BF7956-D; also JCB 320/A7128, 32/921001 | JCB JCB 3DX |
| 320/04134 | JCB | Engine oil filter | Fleetguard LF17556; Donaldson P502465 | JCB JCB VM117 |
| 320/04134 | JCB | Engine oil filter | Fleetguard LF17556; Donaldson P502465; MANN W 950/38 | JCB JCB 130 |
| 320/07382 | JCB | Fuel filter (secondary) | superseded by JCB 320/A7351 | JCB JCB VM117 |
| 320/07853 | JCB | Crankcase ventilation (CCV) filter | also 320/07737 (CCV filter EcoMax JS) | JCB JCB 225LC Eco Plus |
| 320/07853 | JCB | Crankcase ventilation (CCV) filter | also JCB 320/07737 | JCB JCB 530-110 |
| 320/A4038 | JCB | Engine oil filter | JCB 02/910970, 02/910140 (earlier nos.); Hifi SO11151; Sakura SP96083 | JCB JCB 315LC HD |
| 320/A7123 | JCB | Fuel filter (primary/sediment) | also 32/925950 | JCB JCB 225LC Eco Plus |
| 320/A7123 | JCB | Fuel filter (primary/sediment) | also JCB 32/925950 | JCB JCB 433-5 |
| 320/A7123 | JCB | Fuel filter (primary/sediment) | also JCB 32/925950; Hifi SN70320 | JCB JCB 530-110 |
| 320/A7170 | JCB | Fuel filter (secondary/main element) | Fleetguard FF5794 (listed against earlier no. 320/07155) | JCB JCB 3DX |
| 320/A7170 | JCB | Fuel filter (secondary/main element) | also 320/07394 | JCB JCB 130 |
| 320/A7188 | JCB | Fuel filter (secondary element) | Hifi SN 70575 (same cartridge family as 320/A7250) | JCB JCB 3DX Plus |
| 320/A7250 | JCB | Fuel filter (primary/water separator element) | Fleetguard FS20076; Baldwin BF9828-D | JCB JCB 130 |
| 320/A7250 | JCB | Fuel filter (primary/water separator element) | Hifi SN 70575; Fleetguard FS20076; Baldwin BF9828-D; Donaldson P551424 | JCB JCB 3DX |
| 320/A7351 | JCB | Fuel filter (secondary) | also 320/07382 | JCB JCB 225LC Eco Plus |
| 320/A7351 | JCB | Fuel filter (secondary) | also JCB 320/07382 | JCB JCB 433-5 |
| 320/B4420 | JCB | Engine oil filter | MANN W 950/38; Fleetguard LF17556; Donaldson P502465 | JCB JCB 225LC Eco Plus |
| 320/B4420 | JCB | Engine oil filter | MANN W 950/38; Fleetguard LF17556; Donaldson P502465 (crossrefs listed against 320/04133) | JCB JCB 530-110 |
| 320/B4420 | JCB | Engine oil filter | MANN W 950/38; Fleetguard LF17556; Donaldson P502465 (listed against 320/04133) | JCB JCB 433-5 |
| 326-1644 | Cat | Fuel filter (primary/water separator) | Baldwin BF1811-SP; Fleetguard FS20007; Donaldson P550900 (SAPAC cross-ref) | Caterpillar Cat 966H |
| 328-3655 | Cat | Transmission filter | Baldwin PT9429-MPG; Donaldson P573354; Fleetguard HF35515 (SAPAC cross-ref) | Caterpillar Cat 966H |
| 3318853 | Cummins | Engine oil filter | Fleetguard LF3000; alt. 3401544 / LF9009 (DCEC 6CTA) | ACE ACE ALN 500 |
| 332/Y3163 | JCB | Fuel filter (water separator) | Fleetguard FS1275 (Cummins 4093733) per Elofic JS140 6BT listing | JCB JCB NXT 205 |
| 332/Y3163 | JCB | Fuel filter (water separator) | Fleetguard FS1275; Donaldson P502913 (Elofic JS140 listing) | JCB JCB NXT 140 |
| 333/C4690 | JCB | Hydraulic return filter | MANN W 941 (Filong listing) | JCB JCB 530-110 |
| 333/H5477 | JCB | Engine oil filter (cartridge) | JCB 334/V6243 (interchange); Hifi SO 11159; Kohler ED0021750010-S / ED0021753090-S | JCB JCB SSL 135 |
| 333/K7702 | JCB | Fuel filter (water separator) | John Deere RE536192 / RE524723 (cross-reference) | JCB JCB 315LC HD |
| 333/K8611 | JCB | Hydraulic return filter | Fleetguard HF28978 / Donaldson P551210 listed by Elofic as JS140 hydraulic filter | JCB JCB NXT 140 |
| 333/W5100 | JCB | Fuel filter (primary/water separator element) | Stanadyne 36995 | JCB JCB 50Z |
| 333/W5100 | JCB | Fuel filter (primary/water separator element) | Stanadyne 36995 (Filong listing) | JCB JCB SSL 135 |
| 334/Y2810 | JCB | Air filter (outer/primary) | Donaldson P613334; Baldwin RS30257 | JCB JCB NXT 140 |
| 334/Y2810 | JCB | Air filter (outer/primary) | Donaldson P613334; Baldwin RS30257; Hifi SA18160; Cummins 4315239/5025658 | JCB JCB NXT 205 |
| 335/D7242 | JCB | Air filter (outer/primary) | Donaldson-brand element sold by Indian dealer | JCB JCB VMT330 |
| 335/D7243 | JCB | Air filter (inner/safety) | Donaldson-brand element sold by Indian dealer | JCB JCB VMT330 |
| 3831236 | Volvo | Engine oil filter | Donaldson P553771 | Volvo Volvo EC200D |
| 3831236 | Volvo | Engine oil filter | Volvo 17457469; Donaldson P553771 | Volvo Volvo L90H |
| 3890206 | Cummins | Fuel filter (primary/water separator) | Fleetguard FS1280 (per AG International); alt. listed 3931866 / TE20760 / CSDEG002 / 278609119903 | Tata Hitachi Tata Hitachi EX 200 Infra |
| 3903640 | Cummins | Fuel filter (secondary) | Fleetguard FF5052 (per AG International); alt. listed 4080713 / TE02806 / CSDEG001 / 278609119904 | Tata Hitachi Tata Hitachi EX 200 Infra |
| 3908615 | Cummins | Engine oil filter | Fleetguard LF3349 (per AG International for EX200/EX210 6BT); alt. listed CSDEG006 / 278618139902 | Tata Hitachi Tata Hitachi EX 200 Infra |
| 3930942 | Cummins | Fuel filter (primary/water separator) | Fleetguard FS1280 | ACE ACE ALN 500 |
| 3930942 | Cummins | Fuel filter (primary/water separator) | Fleetguard FS1280; Donaldson P551329; Baldwin BF1280 | ACE ACE ALN 300 |
| 3930942 | Cummins | Fuel filter (primary/water separator) | Fleetguard FS1280; MANN WK 9165 x; Donaldson P550899 (per cross-ref sites) | Dynapac Dynapac CP275 |
| 3931063 | Cummins | Fuel filter (secondary) | Fleetguard FF5052 | ACE ACE ALN 500 |
| 3931063 | Cummins | Fuel filter (secondary) | Fleetguard FF5052; Donaldson P550440; Baldwin BF788 | ACE ACE ALN 300 |
| 3937743 | Cummins | Engine oil filter | Fleetguard LF3552 (6B5.9 automotive) / LF3349 (3937145, 6BT5.9 generator) / LF3345 (3908616, 4BT) | ACE ACE ALN 300 |
| 3H.132.10.0.00 | Kirloskar | Fuel filter (spin-on twin bowl, primary+secondary) | Elofic EK-4293 (mesh/primary, Fleetguard FF5525) & EK-4294 (paper/secondary, Fleetguard FF5526) listed for KOEL 4R1040 on JCB 3DX | ACE ACE AX 130 |
| 3H.132.10.0.00 | Kirloskar | Fuel filter (spin-on twin bowl, primary+secondary) | Elofic EK-4293 (primary, Fleetguard FF5525); EK-4294 (secondary, Fleetguard FF5526) | Bull Machines Bull HD76 2WD |
| 40/300893 | JCB | Hydraulic return filter | Fleetguard HF7992; Donaldson P502910 | JCB JCB 3DX |
| 40/303603 | JCB | Bucket tooth (twin-strap) | also JCB 332/34388 | JCB JCB 2DX |
| 40C2182 | LiuGong | Engine oil filter | Donaldson P550428 | LiuGong Liugong 924E XD |
| 40C2707 | LiuGong | Air filter kit (outer+inner) | 40C1033 / 40C1032 | LiuGong Liugong 924E XD |
| 40C2707 | LiuGong | Air filter kit (outer+inner) | Donaldson X012252 kit; elements 40C1033 (outer) / 40C1032 (inner) | LiuGong Liugong 922E Amphibious |
| 40C2953 | LiuGong | Air filter (933E listing) | LiuGong 60C2472 kit | LiuGong Liugong 924E XD |
| 40C4077 | LiuGong | Air filter kit (alt) | LiuGong 60C2472 | LiuGong Liugong 922E Amphibious |
| 40C7018 | LiuGong | Fuel filter (QSB7) | Fleetguard FS1098 | LiuGong Liugong 924E XD |
| 4110000076368 | SDLG | Transmission filter | ZF 0750 131 053 | SDLG SDLG G9150Hi |
| 4110000509164 | SDLG | Engine oil filter | Deutz 01174421 (BF4M2012) | SDLG SDLG E6135Fi |
| 4110000509164 | SDLG | Engine oil filter | Weichai 1012010A52D | SDLG SDLG G9150Hi |
| 4110000509232 | SDLG | Fuel filter (secondary) | Weichai 1117050A52D | SDLG SDLG G9150Hi |
| 4120004037001 | SDLG | Hydraulic filter insert | SDLG 4120004036003 | SDLG SDLG G9150Hi |
| 4190000173001 | SDLG | Hydraulic filter | SDLG 4120002103001 | SDLG SDLG E680Hi |
| 4192631 | Hitachi | Fuel filter (primary/water separator) | Donaldson P557440; Fleetguard FF232 | Tata Hitachi Tata Hitachi ZAXIS 470H |
| 4192631 | Hitachi | Fuel filter (primary/water separator) | Donaldson P557440; Fleetguard FF232; Baldwin BF7546 | Tata Hitachi Tata Hitachi ZAXIS 370LCH |
| 4207841 | Hitachi | Hydraulic pilot filter | Donaldson P173238 | Tata Hitachi Tata Hitachi ZAXIS 470H |
| 4207841 | Tata Hitachi | Hydraulic pilot filter | Donaldson P173238; alt 4191301 | Tata Hitachi Tata Hitachi EX 70 Prime |
| 4210224 | Hitachi | Hydraulic suction strainer | Donaldson P764679 | Tata Hitachi Tata Hitachi ZAXIS 370LCH |
| 4240294 | Hitachi | Air filter (outer/primary) | Donaldson P127308; Sure SA11871 | Tata Hitachi Tata Hitachi ZAXIS 650H |
| 4240295 | Hitachi | Air filter (inner/safety) | Donaldson P127309; Sure SA11872 | Tata Hitachi Tata Hitachi ZAXIS 650H |
| 4285577 | Hitachi | Hydraulic drain/spin-on filter | Donaldson P550445 | Tata Hitachi Tata Hitachi ZAXIS 140H Ultra |
| 4286128 | Hitachi | Air filter (outer/primary) | Donaldson P821938; Fleetguard AF25414 | Tata Hitachi Tata Hitachi ZAXIS 220LC |
| 4286130 | Hitachi | Air filter (inner/safety) | Donaldson P821963; Fleetguard AF25412 | Tata Hitachi Tata Hitachi ZAXIS 220LC |
| 4326739 | Hitachi | Fuel filter (secondary) | Donaldson P550391; superseded by 4S00483 | Tata Hitachi Tata Hitachi ZAXIS 140H Ultra |
| 4326739 | Hitachi | Fuel filter (secondary) | Donaldson P550391; superseded by 4S00483; Fleetguard FF5367 | Tata Hitachi Tata Hitachi ZAXIS 370LCH |
| 4326739 | Hitachi | Fuel filter (secondary) | Donaldson P550391; superseded by 4S00483; Fleetguard FF5367 (eurofilter) | Tata Hitachi Tata Hitachi ZAXIS 220LC |
| 4331920 | Hitachi | Air filter (inner/safety) | Donaldson P115070 (per Donaldson EH700-3 entry E4031215 => L4331920) | Tata Hitachi Tata Hitachi EX 1900-6 |
| 4331923 | Hitachi | Air filter (outer/primary) | Donaldson P182038 (per Donaldson EH700-3 entry E4082222 => L4331923) | Tata Hitachi Tata Hitachi EX 1900-6 |
| 4333469 | Hitachi | Hydraulic return filter | Donaldson P762921; HiFi SH60101 | Tata Hitachi Tata Hitachi ZAXIS 470H |
| 4350249 | Hitachi | Cabin air filter | superseded by 4S00640 | Tata Hitachi Tata Hitachi ZAXIS 370LCH |
| 4363399 | Hitachi | Hydraulic drain/spin-on filter | Donaldson P556005 | Tata Hitachi Tata Hitachi Zaxis 870-5G |
| 4363399 | Hitachi | Hydraulic drain/spin-on filter | Donaldson P556005; HiFi SH60134 | Tata Hitachi Tata Hitachi ZAXIS 470H |
| 4370435 | Hitachi | Hydraulic pilot filter | Donaldson P173238 | Tata Hitachi Tata Hitachi ZAXIS 140H Ultra |
| 4370435 | Hitachi | Hydraulic pilot filter | Donaldson P173238; Fleetguard HF7954 | Tata Hitachi Tata Hitachi ZAXIS 220LC |
| 4437838 | Hitachi | Hydraulic tank breather | Fleetguard AF26675 | Tata Hitachi Tata Hitachi ZAXIS 370LCH Ultra |
| 4437838 | Hitachi | Hydraulic tank breather | Fleetguard AF26675; Sure SA12572 | Tata Hitachi Tata Hitachi ZAXIS 370LCH |
| 4448336 | Hitachi | Engine oil filter | Fleetguard LF9008; Baldwin B7217; Donaldson P550596 | Tata Hitachi Tata Hitachi ZAXIS 370LCH |
| 4448371 | Hitachi | Fuel filter (primary/water separator) | Donaldson P550057; superseded by 4S00246 | Tata Hitachi Tata Hitachi ZAXIS 140H Ultra |
| 4448402 | Hitachi | Hydraulic return filter | Fleetguard HF7691; Baldwin BT9557; Donaldson P502270; Hitachi 4443773 | Tata Hitachi Tata Hitachi ZAXIS 220LC |
| 4448602 | Hitachi | Hydraulic return filter | superseded by 4454002 | Tata Hitachi Tata Hitachi ZAXIS 140H Ultra |
| 4459548 | Hitachi | Air filter (inner/safety) | Donaldson P777414 | Tata Hitachi Tata Hitachi Zaxis 870-5G |
| 4459548 | Hitachi | Air filter (inner/safety) | Donaldson P777414; Fleetguard AF25523 | Tata Hitachi Tata Hitachi ZAXIS 370LCH |
| 4459549 | Hitachi | Air filter (outer/primary) | Donaldson P777409 | Tata Hitachi Tata Hitachi Zaxis 870-5G |
| 4459549 | Hitachi | Air filter (outer/primary) | Donaldson P777409; Fleetguard AF25756 | Tata Hitachi Tata Hitachi ZAXIS 370LCH Ultra |
| 4459549 | Hitachi | Air filter (outer/primary) | Donaldson P777409; Fleetguard AF25756; Sure SA16125 | Tata Hitachi Tata Hitachi ZAXIS 370LCH |
| 4466268 | Hitachi | Air filter (inner/safety) | Donaldson P777869; Fleetguard AF25454; Sure SA16121 | Tata Hitachi Tata Hitachi ZAXIS 470H |
| 4466269 | Hitachi | Air filter (outer/primary) | Donaldson P777868; Fleetguard AF25468; Sure SA16120 | Tata Hitachi Tata Hitachi ZAXIS 470H |
| 4484495 | Hitachi | Engine oil filter | Donaldson P550596; superseded by 4622562 | Tata Hitachi Tata Hitachi ZAXIS 140H Ultra |
| 4484495 | Hitachi | Engine oil filter | Donaldson P550596; superseded by 4622562 (also 4696643 per IKH) | Tata Hitachi Tata Hitachi ZAXIS 220LC |
| 4484495 | Hitachi | Engine oil filter | Donaldson P550596; superseded by 4622562; Fleetguard LF16045 | Tata Hitachi Tata Hitachi ZAXIS 370LCH |
| 4486002 | Hitachi | Air filter (outer/primary) | Donaldson P828889 | Tata Hitachi Tata Hitachi ZAXIS 140H Ultra |
| 4486014 | Hitachi | Air filter (inner/safety) | Donaldson P829333 | Tata Hitachi Tata Hitachi ZAXIS 140H Ultra |
| 4616545 | Hitachi | Fuel filter (primary/water separator) | Donaldson P552564; earlier L4206080 (Fleetguard FF5108) | Tata Hitachi Tata Hitachi ZAXIS 220LC |
| 462-1171 | Cat | Engine oil filter | MANN W 9071; WIX 57791 (per filterverified.com) | Caterpillar CAT 950GC |
| 4630525 | Hitachi | Hydraulic pilot filter | ECE FLP2606; Fleetguard HF35516/HF35519; Baldwin BT9440; Donaldson P573481 | Tata Hitachi Tata Hitachi ZAXIS 220LC |
| 4630525 | Hitachi | Hydraulic pilot filter | Fleetguard HF35519 | Tata Hitachi Tata Hitachi Zaxis 870-5G |
| 4630525 | Hitachi | Hydraulic pilot filter | Fleetguard HF35519; Baldwin BT9440 | Tata Hitachi Tata Hitachi ZAXIS 650H |
| 4630525 | Hitachi | Hydraulic pilot filter | Fleetguard HF35519; Baldwin BT9440; Donaldson P573481; Wix WL10006 | Tata Hitachi Tata Hitachi ZAXIS 370LCH Ultra |
| 4639464 | Hitachi | Engine oil filter | Fleetguard LF9325 | Tata Hitachi Tata Hitachi EX 1200V |
| 4642641 | Hitachi | Fuel filter (primary/water separator) | Isuzu 8980088400 | Tata Hitachi Tata Hitachi Zaxis 870-5G |
| 4642641 | Hitachi | Fuel filter (primary/water separator) | Isuzu 8980088400; Sure SN25045 | Tata Hitachi Tata Hitachi ZAXIS 370LCH Ultra |
| 4648651 | Hitachi | Hydraulic suction strainer | Donaldson R010052 | Tata Hitachi Tata Hitachi ZAXIS 370LCH Ultra |
| 4648651 | Hitachi | Hydraulic suction strainer | Donaldson R010052; ECE FLP5047 | Tata Hitachi Tata Hitachi ZAXIS 220LC |
| 4649267 | Hitachi | Fuel filter (secondary) | Sure SN25044 / MFE1497 | Tata Hitachi Tata Hitachi ZAXIS 370LCH Ultra |
| 4654745 | Hitachi | Hydraulic return filter | HiFi SH60199 | Tata Hitachi Tata Hitachi ZAXIS 650H |
| 4656608 | Hitachi | Hydraulic return filter | Fleetguard HF7679; HiFi SH60328 | Tata Hitachi Tata Hitachi ZAXIS 370LCH Ultra |
| 4658521 | Hitachi | Engine oil filter | Donaldson P550596; superseded by 4661256 | Tata Hitachi Tata Hitachi ZAXIS 650H |
| 4658521 | Hitachi | Engine oil filter | Donaldson P550596; superseded by 4661256; alt 4696643 | Tata Hitachi Tata Hitachi ZAXIS 370LCH Ultra |
| 4658521RCP | Hitachi | Engine oil filter | ECE FLP3130 | Tata Hitachi Tata Hitachi ZAXIS 220LC |
| 46C6247 | LiuGong | Cabin air filter | LiuGong 46C5715 | LiuGong Liugong 848H |
| 4812106128 | Dynapac | Engine oil filter | MANN W 913/1 | Dynapac Dynapac CC1250 CEV-V |
| 4812156263 | Dynapac | Fuel filter (secondary) | HiFi SN25027; MANN WK 8500; Fleetguard FF253 | Dynapac Dynapac CC800 |
| 4812160094 | Dynapac | Engine oil filter | Donaldson P502438; HiFi SO6117; SF-Filter SP4603 | Dynapac Dynapac CC800 |
| 4S00686 | Hitachi | Cabin air filter | Donaldson P500248; ECE FLP2583 (fresh air FYA00001490) | Tata Hitachi Tata Hitachi ZAXIS 220LC |
| 500/00151 | JCB | Fuel filter (secondary) | Fleetguard FF5526 | JCB JCB 81 |
| 500/00151 | JCB | Fuel filter (secondary) | Fleetguard FF5526 (1.1 L STF element, Elofic EK-4294) | JCB JCB 3DX |
| 500/00214 | JCB | Fuel filter (cloth element, 1.1 L) | Donaldson P759007 | JCB JCB 81 |
| 500/00214 | JCB | Fuel filter (cloth element, 1.1 L) | Elofic EK-4406; Donaldson P759007 | JCB JCB 3DX |
| 5009275 | VECV (Eicher) | Engine oil filter | Fleetguard LF0905300; Bosch F002H27505; Eicher ID337989 | ACE ACE FX 230 |
| 518-8099 | SEM | Engine oil filter (element) | SEM 5188099 | SEM SEM 822D |
| 5184406 | SEM | Air filter (outer/primary) | SEM Select 6084776 | SEM SEM 818F |
| 520-3012 | SEM | Fuel filter (primary/water separator) | SEM 5203012 | SEM SEM 822D |
| 5271995 | SEM | Fuel filter | SEM 5558940 | SEM SEM 917F |
| 53C0045 | LiuGong | Fuel filter (primary) | Donaldson P553004 | LiuGong Liugong 922E Amphibious |
| 53C0051 | LiuGong | Fuel filter (primary/water separator) | Donaldson P551329; alt LiuGong 53C0436 | LiuGong Liugong 922E Amphibious |
| 53C0052 | LiuGong | Fuel filter (secondary) | Donaldson P550440 | LiuGong Liugong 922E Amphibious |
| 53C0053 | LiuGong | Engine oil filter | Donaldson P553000 | LiuGong Liugong 939E |
| 53C0053 | LiuGong | Engine oil filter | Donaldson P553000; LiuGong 40C2182 (alt) | LiuGong Liugong 848H |
| 53C0054 | LiuGong | Engine oil filter | Donaldson P558615 | LiuGong Liugong 922E Amphibious |
| 53C0066 | LiuGong | Hydraulic filter (alt) | LiuGong 53C0574 | LiuGong Liugong 848H |
| 53C0210 | LiuGong | Hydraulic return filter | Donaldson P566999 | LiuGong Liugong 924E XD |
| 53C0214 | LiuGong | Engine oil filter (alt) | LiuGong 53C0226 (alt) | LiuGong Liugong 922E Amphibious |
| 53C0497 | LiuGong | Fuel filter | Donaldson P550880 | LiuGong Liugong 924E XD |
| 53C1485 | LiuGong | Hydraulic suction filter | LiuGong 53C0500 (alt); sp-auto lists 53C0616 suction for 920E/922E/926E | LiuGong Liugong 922E Amphibious |
| 53C1486 | LiuGong | Hydraulic return filter | LiuGong 53C0515 (alt) | LiuGong Liugong 922E Amphibious |
| 5402611 | SEM | Engine oil filter | SEM Select 6086004 | SEM SEM 818F |
| 550/40575 | JCB | Engine oil filter | Fleetguard LF16075; Donaldson P502908 | JCB JCB 81 |
| 550/40575 | JCB | Engine oil filter | Fleetguard LF16075; Donaldson P502908; Elofic EK-6259 | JCB JCB 3DX |
| 550/41639 | JCB | Air filter (inner/safety) | Fleetguard AF26392; Donaldson P500807 | JCB JCB 3DX |
| 550/41640 | JCB | Air filter (outer/primary) | Fleetguard AF26391; Donaldson P500806 | JCB JCB 81 |
| 550/41640 | JCB | Air filter (outer/primary) | Fleetguard AF26391; Donaldson P500806; Elofic EK-1547 (set) | JCB JCB 3DX |
| 565-1153 | SEM | Fuel filter (secondary) | SEM 5651153 | SEM SEM 822D |
| 5651155 | SEM | Fuel filter (primary/water separator) | SEM Select 5203012 | SEM SEM 818F |
| 570909130106 | Tata Motors | Air filter (outer/primary) | Bosch F 002 H26 641 (outer) / F 002 H26 640 (outer+inner set with 570909130107) | Tata Motors CV Tata LPK 2821.K FE+ RMC |
| 5712316 | SEM | Fuel filter (secondary) | SEM Select 5984189 | SEM SEM 818F |
| 581/18063 | JCB | Transmission filter | Fleetguard HF35139; Donaldson P551204 | JCB JCB 3DX |
| 5878467 | SEM | Transmission filter | SEM 6039195 (second transmission filter) | SEM SEM 818F |
| 600-211-1340 | Komatsu | Engine oil filter | Fleetguard LF9070 / LF9018; Baldwin BD7154 | Kobelco Kobelco SK850LC |
| 60017773 | SANY | Fuel filter (primary/water separator, cartridge) | Donaldson P502424 | SANY SANY SY500C-10HD |
| 6002-11-1230 | Komatsu/BEML | Oil filter cartridge (Komatsu-numbered alternate) | Komatsu 600-211-1230 | BEML BEML BD155 |
| 6003-11-8291 | Komatsu/BEML | Fuel filter cartridge (Komatsu-numbered alternate) | Komatsu 600-311-8291 | BEML BEML BD155 |
| 60033346 | SANY | Fuel filter (primary/water separator) | MANN PL 420 | SANY SANY SY210C-9 |
| 60058453 | SANY | Fuel filter (primary/water separator, spin-on) | Donaldson P505951 | SANY SANY SY33C PRO |
| 60123505 | SANY | Air filter (inner/safety) | Donaldson P822858 | SANY SANY SY33C PRO |
| 60123506 | SANY | Air filter (outer/primary) | Donaldson P821575 | SANY SANY SY33C PRO |
| 60151839 | SANY | Fuel filter (secondary, cartridge) | Donaldson P502424 | SANY SANY SY60C |
| 60170568 | SANY | Air filter (inner/safety) | Donaldson P114931 | SANY SANY SY680C-10HD |
| 60170569 | SANY | Air filter (outer/primary) | Donaldson P181039 | SANY SANY SY680C-10HD |
| 60176475 | SANY | Fuel filter (secondary) | Donaldson P557440 | SANY SANY SY260C-10HD GENe |
| 60176476 | SANY | Engine oil filter | Donaldson P550086 | SANY SANY SY260C-10HD GENe |
| 60200365 | SANY | Hydraulic return filter | SANY PO-CO-01-01430 | SANY SANY SY210C-9 |
| 60201219 | SANY | Fuel filter (secondary) | Donaldson P557440 | SANY SANY SY350C-9LCHD |
| 60201220 | SANY | Fuel filter (primary/water separator, cartridge) | Donaldson P502424 | SANY SANY SY215C-9LCS |
| 60206017 | SANY | Fuel filter (secondary, spin-on) | Donaldson P552216 | SANY SANY SY500C-10HD |
| 60207264 | SANY | Air filter (inner/safety) | Donaldson P537877 | SANY SANY SY215C-9LCS |
| 60207265 | SANY | Air filter (outer/primary) | Donaldson P537876 | SANY SANY SY215C-9LCS |
| 60220063 | SANY | Fuel filter (primary/water separator) | Donaldson P505951 | SANY SANY SY60C |
| 60249072 | SANY | Fuel filter (water separator cartridge) | Donaldson P502593 | SANY SANY SY500C-10HD |
| 60273108 | SANY | Fuel filter (secondary) | Donaldson P550127 | SANY SANY SY20U |
| 60273111 | SANY | Engine oil filter | Donaldson P502067; alt SANY 60058455 (P502051) | SANY SANY SY20U |
| 60273112 | SANY | Engine oil filter | Donaldson R010001 | SANY SANY SY33C PRO |
| 60276913 | SANY | Fuel filter (primary/water separator) | Yanmar 129242-55730 | SANY SANY SY20U |
| 60282117 | SANY | Fuel filter (secondary) | Donaldson R011739 | SANY SANY SY680C-10HD |
| 60292521 | SANY | Fuel filter (secondary) | SANY PF-CO-01-01170; Yanmar 3TNV88 | SANY SANY SY33C PRO |
| 60310823 | SANY | Fuel filter (secondary) | Donaldson P502466 | SANY SANY SY225C-10HD GENe |
| 60336531 | SANY | Fuel filter | Yanmar 129A00-55800 | SANY SANY SY33C PRO |
| 60C2472 | LiuGong | Air filter kit (outer+inner) | Donaldson X012252; elements 40C2178 (outer) / 40C2179 (inner) | LiuGong Liugong 848H |
| 61000070005 | Weichai | Engine oil filter | Weichai 1000424655 (alt) | LiuGong LiuGong B160C |
| 612600081334 | Weichai | Fuel filter (secondary) | Shantui 6I0273T (air) listed alongside | LiuGong LiuGong B160C |
| 614080740 | Shantui | Fuel filter | Shantui 614080739 | Shantui Shantui SD32W |
| 6736-51-5142 | Komatsu | Engine oil filter | Fleetguard LF16006; Baldwin B7181; Donaldson P550909 (per cn-machinery cross-ref) | L&T Komatsu Komatsu WA380Z-6 |
| 6742-01-4540 | Komatsu | Engine oil filter | Sakura C-5707 (per Sakura GD675-3/SAA6D114E listing) | L&T Komatsu Komatsu GD705-5 |
| 799966 | Manitou | Engine oil filter | ECE FLP3208 | Manitou MANITOU MRT-X 1645 |
| 799967 | Manitou | Fuel filter (secondary) | Donaldson P959195; ECE FLP3145 | Manitou MANITOU MRT-X 1645 |
| 799968 | Manitou | Fuel filter (primary/water separator) | Donaldson P959143; ECE FLP2999 | Manitou MANITOU MRT-X 1645 |
| 800104344 | XCMG | Air filter (inner/safety) | Donaldson P537877 | XCMG XCMG XE380C GM |
| 800104345 | XCMG | Air filter (outer/primary) | Donaldson P537876 | XCMG XCMG XE380C GM |
| 800104393 | XCMG | Fuel filter (secondary, alt) | Donaldson P552564 | XCMG XCMG XE210i |
| 800105027 | XCMG | Fuel filter (primary/water separator) | Donaldson P551000; Fleetguard FS1000 | XCMG XCMG XE520C |
| 800105552 | XCMG | Fuel filter (primary/water separator) | Donaldson P551026 | XCMG XCMG XE210i |
| 800107892 | XCMG | Engine oil filter (alt) | Donaldson P550596 | XCMG XCMG XE210i |
| 800155884 | XCMG | Fuel filter (primary/water separator) | Donaldson R011619 | XCMG XCMG XE380C GM |
| 800155885 | XCMG | Fuel filter (water separator cartridge) | Donaldson P502424 | XCMG XCMG XE380C GM |
| 800173432 | XCMG | Engine oil filter | Kubota 1C020-32434; HH1C0-32430 | XCMG XCMG XE80C |
| 803169358 | XCMG | Engine oil filter (alt) | XCMG 803374058; 800156859 | XCMG XCMG XE520C |
| 803302602 | XCMG | Engine oil filter | Donaldson P559000; Fleetguard LF9009 | XCMG XCMG XE520C |
| 819909162 | XCMG | Engine oil filter | Donaldson P550596 | XCMG XCMG XE380C GM |
| 860133763 | XCMG | Engine oil filter (ZL50GV listing) | Shangchai 2D17-002-02 | XCMG XCMG ZL48GV |
| 860134745 | XCMG | Fuel filter (secondary, ZL50GV listing) | Shangchai D638-002-02 | XCMG XCMG ZL48GV |
| 91756080 | CASE | Fuel filter (primary/water separator, spin-on) | Donaldson P551000 | CASE CASE 770 EX |
| 923593 | Manitou | Air filter (outer/primary) | Donaldson P608665 (PowerCore); ECE FLP2806 | Manitou MANITOU MRT-X 1645 |
| 9451037407 | Bosch (Tata) | Fuel filter (secondary) | Tata 252709110105 | Tata Hitachi Tata Hitachi EX 70 Prime |
| A222100000119 | SANY | Hydraulic pilot filter | Donaldson R010051 | SANY SANY SY60C |
| A222100000569 | SANY | Engine oil filter | Donaldson P502039 | SANY SANY SY60C |
| AF25929 | Fleetguard (aftermarket) | Air filter (outer/primary) | Fleetguard AF26076 (inner) | XCMG XCMG XE210i |
| AF55005 | Cummins (Fleetguard) | Air filter (outer/primary) | Fleetguard AF55005; AF55014; AF55015 | Liebherr Liebherr R 920 Litronic |
| AF55005 | Fleetguard (Cummins) | Air filter (outer/primary) | alternates AF55014 / AF55015 (Direct Flow elements) | JCB JCB 455-5N |
| B222100000492 | SANY | Fuel filter (secondary) | Donaldson P557440 | SANY SANY SY380C-10HD |
| B222100000494 | SANY | Engine oil filter | Donaldson P550596 | SANY SANY SY225C-10HD GENe |
| B222100000520 | SANY | Fuel filter (secondary) | Donaldson P552564 | SANY SANY SY240C-9HD GraMa |
| B222100000521 | SANY | Fuel filter (secondary) | Donaldson P552561 | SANY SANY SY215C-9LCS |
| B222100000532 | SANY | Air filter (inner/safety) | Donaldson P536492 | SANY SANY SY225C-10HD GENe |
| B222100000535 | SANY | Air filter (outer/primary) | Donaldson P536457 | SANY SANY SY225C-10HD GENe |
| B222100000551 | SANY | Engine oil filter | Donaldson P552562 | SANY SANY SY215C-9LCS |
| B222100000591 | SANY | Air filter (inner/safety) | Donaldson P829332 | SANY SANY SY60C |
| B222100000593 | SANY | Air filter (outer/primary) | Donaldson P827653 | SANY SANY SY60C |
| B222100000640 | SANY | Air filter (inner/safety) | Donaldson P777869 | SANY SANY SY350C-9LCHD |
| B222100000641 | SANY | Air filter (outer/primary) | Donaldson P777868 | SANY SANY SY350C-9LCHD |
| B222100000660K | SANY | Cabin air filter | Donaldson P500138 | SANY SANY SY240C-9HD GraMa |
| B222100000685 | SANY | Fuel filter (secondary, spin-on) | Donaldson R010002 | SANY SANY SY33C PRO |
| B222100000729 | SANY | Fuel filter (primary/water separator, cartridge) | Donaldson P502652 | SANY SANY SY225C-10HD GENe |
| C 1196/2 | MANN+HUMMEL | Air filter (outer/primary) | MANN C 1196/2 | Kobelco Kobelco SK30SR |
| CV52001 | Cummins (Fleetguard) | Engine crankcase ventilation filter | Fleetguard CV52001 | Liebherr Liebherr R 920 Litronic |
| D638-002-02 | Shangchai (SDEC) | Fuel filter | SDEC D638-002-02B | Shantui Shantui SD13 |
| E131-0212 | Hyundai | Hydraulic return filter | Fleetguard HF35363; Donaldson P502446; Sakura H-2801; STAL ST30849 | Hyundai Hyundai R210 SMART Plus |
| E131-0214 | Hyundai | Hydraulic suction strainer | HIFI SH60515 | Hyundai Hyundai HX520L |
| FF256 | Cummins (Fleetguard) | Fuel filter (secondary) | Fleetguard FF256 | Liebherr Liebherr R 9400 G6 |
| FF5052 | Cummins (Fleetguard) | Fuel filter (secondary) | Fleetguard FF5052 | Tata Hitachi Tata Hitachi EX 200 Infra |
| FF5052 | Fleetguard | Fuel filter (secondary) | Cummins 3931063; Fleetguard FF5052 | Hyundai Hyundai R210 SMART Plus |
| FF5052 | Fleetguard (Cummins) | Fuel filter (secondary) | Cummins 3931063 / 3903640; Donaldson P502905; Elofic EK-6360 | JCB JCB NXT 205 |
| FF5052 | Fleetguard (Cummins) | Fuel filter (secondary) | Donaldson P502905; Elofic EK-6360 | JCB JCB NXT 140 |
| FF5552 | Cummins (Fleetguard) | Fuel filter (secondary) | Ashok Leyland FHJ01000 | LiuGong Liugong 836N |
| FF5612 | Fleetguard | Fuel filter (secondary) | Fleetguard FF5612; MANN WK 929 | Leeboy Leeboy 525E |
| FF5825NN | Fleetguard (Cummins) | Fuel filter (secondary) | Cummins 5365988 / 5599456 / 2864993 / 2893612 / 4331007 / 3685306; Donaldson DBF6776; Baldwin BF46129 | JCB JCB 520X LC |
| FF63009 | Cummins (Fleetguard) | Fuel filter (secondary) | Fleetguard FF63009 | Liebherr Liebherr R 920 Litronic |
| FF63009 | Cummins (Fleetguard) | Fuel filter (secondary) | Fleetguard FF63009 (Cummins 5303743) | L&T Komatsu L&T 9020 SX |
| FHJ01000 | Ashok Leyland (Leyparts) | Fuel filter (pre-filter, Ashok Leyland engine number) | Fleetguard FF0555200 (FF5552) | Bull Machines BULL CH76 Challenger |
| FHN00400 | Ashok Leyland (Leyparts) | Fuel filter (main, Ashok Leyland engine number) | Fleetguard FS1967100V (FS19671) | Bull Machines BULL CH76 Challenger |
| FPA00300 | Ashok Leyland (Leyparts) | Engine oil filter (Ashok Leyland engine number) | Fleetguard LF16309 / LF1630900; Bosch F 002 H26 313; Millard ML-12036; HIFI SO 11170 | Bull Machines BULL CH76 Challenger |
| FS1098 | Cummins (Fleetguard) | Fuel filter (primary/water separator) | Fleetguard FS1098 | Liebherr Liebherr R 920 Litronic |
| FS1098 | Cummins (Fleetguard) | Fuel filter (primary/water separator) | Fleetguard FS1098 (Cummins 5319680) | L&T Komatsu L&T 9020 SX |
| FS1212 | Cummins (Fleetguard) | Fuel filter (primary/water separator) | Cummins 3315843 | LiuGong LiuGong B230 |
| FS1275 | Fleetguard (Cummins) | Fuel filter (primary/water separator) | Cummins 4093733; Donaldson P502913; Elofic EK-6363; FS1280 alternate (AG International) | JCB JCB NXT 205 |
| FS1275 | Fleetguard (Cummins) | Fuel filter (primary/water separator) | Donaldson P502913; Elofic EK-6363 | JCB JCB NXT 140 |
| FS1280 | Cummins (Fleetguard) | Fuel filter (primary/water separator) | Fleetguard FS1212 (alt) | LiuGong Liugong 914E |
| FS1280 | Cummins (Fleetguard) | Fuel filter (primary/water separator) | Fleetguard FS1280 | Tata Hitachi Tata Hitachi EX 200 Infra |
| FS1280 | Fleetguard | Fuel filter (primary/water separator) | Cummins 3930942; Cummins 3903410; Fleetguard FS1280 | Hyundai Hyundai R210 SMART Plus |
| FS19669 | Cummins (Fleetguard) | Fuel filter (primary/water separator) | Fleetguard FS1003 (CRS variant) | LiuGong Liugong 836N |
| FS19732 | Cummins (Fleetguard) | Fuel filter (primary/water separator) | Fleetguard FS1098 (alt) | LiuGong Liugong 924E XD |
| FS19732 | Fleetguard | Fuel filter (primary/water separator) | Cummins 3973233 | Fine Equipments Fine FMG 985 HD |
| FS19732 | Fleetguard | Fuel filter (primary/water separator) | Cummins 3973233; Cummins 3991498 | Leeboy Leeboy 525E |
| FS53014 | Cummins (Fleetguard) | Fuel filter (primary/water separator) | Fleetguard FS53014 | Liebherr Liebherr R 9400 G6 |
| HH150-32094 | Kubota | Engine oil filter | Kubota 15241-32094 | Fine Equipments Fine FM20 |
| HH150-32430 | Kubota | Engine oil filter | Donaldson P502067; Kubota HH1J0-32430; 15853-99170 | XCMG XCMG XE20U |
| HH1C0-32430 | Kubota | Engine oil filter | Kubota HH164-32430 (alt) | SANY SANY SY80C-9 |
| HH1C0-32430 | Kubota | Engine oil filter | replaces Kubota 1C020-32430 / 1C020-32434 | Tata Hitachi Tata Hitachi Shinrai Power |
| KBJ1691A | JCB | Hydraulic pilot filter | Donaldson P550576; Fleetguard HF28836 | JCB JCB NXT 140 |
| KC3098117099 | Hitachi | Hydraulic tank breather | Donaldson P502563; ECE FLP2908 | Tata Hitachi Tata Hitachi ZAXIS 220LC |
| KNJ0288A | JCB | Hydraulic drain (case drain) filter | Donaldson P556005; Baldwin BT334; Fleetguard HF7551; Hifi SH60120 | JCB JCB NXT 205 |
| KNJ0288A | JCB | Hydraulic drain (case drain) filter | Donaldson P556005; Fleetguard HF7551 | JCB JCB NXT 140 |
| LF14000NN | Fleetguard (Cummins) | Engine oil filter | LF9009 / LF14001NN also listed for X12 by application guides | JCB JCB 520X LC |
| LF16015 | Fleetguard | Engine oil filter | Cummins 4989314 | Fine Equipments Fine FMG 985 HD |
| LF16015 | Fleetguard | Engine oil filter | Cummins 4989314; Cummins 4897898; Donaldson P551100 | Leeboy Leeboy 525E |
| LF16238 | Cummins (Fleetguard) | Engine oil filter | Ashok Leyland F7A01500 | LiuGong Liugong 836N |
| LF16238 | Fleetguard | Engine oil filter | Ashok Leyland F7A01500 (listed for U-Truck H-series) | Ashok Leyland Ashok Leyland AVTR 2820 6×4 RMC |
| LF3345 | Cummins (Fleetguard) | Engine oil filter | Fleetguard LF3349 (alt) | LiuGong Liugong 914E |
| LF3349 | Cummins (Fleetguard) | Engine oil filter | Fleetguard LF3349 | Tata Hitachi Tata Hitachi EX 200 Infra |
| LF3349 | Fleetguard | Engine oil filter | Cummins 3932217; Fleetguard LF3349 | Hyundai Hyundai R210 SMART Plus |
| LF3959 | Fleetguard (Cummins) | Engine oil filter | Cummins 3937695 / 3937743; Donaldson P502907; Elofic EK-6377; Fleetguard LF3349 also listed for JS205/JS215 | JCB JCB NXT 205 |
| LF3959 | Fleetguard (Cummins) | Engine oil filter | Donaldson P502907; Elofic EK-6377 | JCB JCB NXT 140 |
| LF3970 | Cummins (Fleetguard) | Engine oil filter | Fleetguard LF3970 (Cummins 3937736) | L&T Komatsu L&T 9020 SX |
| LF3970 | Cummins (Fleetguard) | Engine oil filter | Fleetguard LF3970; Fleetguard LF16015 | Liebherr Liebherr R 920 Litronic |
| LF3970 | Fleetguard (Cummins) | Engine oil filter | Fleetguard LF16015 (alternate per Cummins T4F guide) | JCB JCB 455-5N |
| LF516 | Fleetguard | Engine oil filter (Fleetguard cross quoted by buyer) | Fleetguard LF516 (lube), FF5511 (fuel), bypass filter also listed | BEML BEML BD155 |
| LF670 | Cummins (Fleetguard) | Engine oil filter | Fleetguard LF777 (bypass); Cummins 3313279 / 3313283 / 3401544 | LiuGong LiuGong B230 |
| LF670 | Cummins (Fleetguard) | Engine oil filter | Fleetguard LF777; LF9009; Cummins 3313279 / 3313283 / 3401544 | Shantui Shantui SD32W |
| LF9540 | Cummins (Fleetguard) | Engine oil filter | Fleetguard LF9540 | Liebherr Liebherr R 9400 G6 |
| P 4001 | MANN+HUMMEL | Fuel filter (secondary) | MANN P 4001; MANN P 45 | Yanmar Yanmar Vi020-6 |
| P550185 | Donaldson | Engine oil filter (insert, Donaldson cross) | Donaldson P550185 (alt 146790) | ACE ACE 14XW |
| PHJ00004 | Ashok Leyland (Leyparts) | Fuel filter (secondary/main) | Fleetguard FS19671V00; Bosch F002H26310; Leyparts FHN00400 | Fine Equipments Fine FMG 130 |
| SP236190 | LiuGong | Engine oil filter (Yuchai, India) | LiuGong SP217876 | LiuGong Liugong 848H |
| SP4520 | SF-Filter (aftermarket) | Engine oil filter | SF SK3570; SK3600 (fuel); SL81658 (air); HY9524; HY80061; HY80038 (hydraulic) | SANY SANY SY210C-9 |
| TE23320 | Tata Hitachi | Seal kit (bucket cylinder) | alt TE22674 | Tata Hitachi Tata Hitachi EX 70 Prime |
| VH15607-2190 | Hino | Engine oil filter | STAL ST10768 | Kobelco Kobelco SK220 |
| VH23390E0020 | Hino | Fuel filter (secondary/main element) | STAL ST20737 | Kobelco Kobelco SK220 |
| VOE14509379 | Volvo | Hydraulic return filter element | Fleetguard HF6319; Donaldson P551210 | Volvo Volvo EC210D |
| VOE14509379 | Volvo | Hydraulic return filter element | Fleetguard HF6319; Donaldson P551210; Baldwin PT483; Sakura H-7911 | Volvo Volvo EC200D |
| W 67/1 | MANN+HUMMEL | Engine oil filter | MANN W 67/1 | Yanmar Yanmar Vi020-6 |
| W 811/80 | MANN+HUMMEL | Engine oil filter | MANN W 811/80; Yanmar 129150-35153 | Kobelco Kobelco SK30SR |
| WF2074 | Cummins (Fleetguard) | Coolant filter | Fleetguard WF2076; Cummins 4058965 | LiuGong LiuGong B230 |
| WF2075 | Cummins (Fleetguard) | Coolant filter (water filter) | Fleetguard WF2075; WF2077; WF2073 | Liebherr Liebherr R 9400 G6 |
| WF2076 | Cummins (Fleetguard) | Coolant filter | Cummins 4058965 | Shantui Shantui SD32W |
| WK 818/80 | MANN+HUMMEL | Fuel filter (secondary) | MANN WK 818/80 | Kobelco Kobelco SK30SR |
| YA00007394 | Hitachi | Air filter (outer/primary) | Donaldson P532503; ECE FLP2818 | Tata Hitachi Tata Hitachi ZAXIS 220LC |
| YA00007606 | Hitachi | Air filter (inner/safety) | Donaldson P532504; ECE FLP2819 | Tata Hitachi Tata Hitachi ZAXIS 220LC |
| YA00033064 | Hitachi | Hydraulic return filter | Donaldson P502660 | Tata Hitachi Tata Hitachi ZAXIS 220LC |
| YN21P01068R100 | Kobelco | Fuel filter (pre-filter/water separator element) | STAL ST20385 | Kobelco Kobelco SK220 |
| YN52V01008R100 | Kobelco | Hydraulic return filter | STAL ST30255 | Kobelco Kobelco SK220 |
| YR52V01004R300 | Kobelco | Hydraulic return filter | Fleetguard HF6686; HIFI SH60161 | Kobelco Kobelco SK80 |
| YR52V01004R300 | Kobelco | Hydraulic return filter | Fleetguard HF6686; HIFI SH60161; CNH 72150036 | Kobelco Kobelco SK30SR |

---

## 5. Gaps and what to collect from dealers

For every machine marked _no data_ above, the dealer can fill the row from the serial number in minutes. Ask for exactly these fields (they map 1:1 to the CSV): engine make/model; engine oil filter; fuel filter primary + secondary (and water separator); air filter outer + inner; hydraulic return, pilot and suction filters; transmission/axle filters; breather; belts; battery (V/Ah, terminal, dimensions); tyre size + ply (wheeled) or track shoe width (crawler); bucket tooth/adapter family; engine-oil, hydraulic-oil, coolant and fuel-tank capacities. Record the serial/production range the dealer quotes for, because filter numbers change at serial breaks (see the fitment_notes column).


## 6. Publishing rules (from the SEO playbook)

1. **Nothing marked ‡ goes live** until a dealer or the OEM catalogue confirms it; keep the `[VERIFY]` flag in the CMS field until then.
2. Every published number carries its source type and `checked_on` date; refresh annually or when the OEM announces a serial break.
3. Brand names are used only to identify the machines and parts they fit (nominative use); say "genuine parts through the authorised dealer" and keep the RFQ as the CTA — DesiMachines does not sell parts.
4. Template: a "Parts & fitment" block on each model page (engine, 6–8 service parts, capacities, tyre/track) + a "Fits these machines" list on each shared-part page (§3), both generated from the CSV, with `Product`/`isAccessoryOrSparePartFor` schema at template level (see `desimachines-aeo-geo`).
5. Metric to move: spare-parts RFQs per month from model and parts pages (Leads Sheet, landing-page column); re-check 30 days after the first 50 model blocks ship.


## 7. Method and provenance

- **Inventory:** parsed from every DesiMachines brand page and brand×category page (4 Nov 2026). The site reports ~732 models in its brand headers; the inventory holds 735 categorised rows because some models appear under more than one name (e.g. "SY210C-9" and "SY210C-9 Sparc"); aliases are kept so that either name matches.
- **Part numbers:** collected by eight parallel research passes (one per brand group) from OEM parts catalogues, operator/maintenance manuals, OEM brochures, aftermarket cross-reference catalogues and Indian parts-seller listings; each row keeps the single URL it was read from. Nothing was taken from memory; where no public source existed the machine is marked _no data_.
- **Known limits:** OEM parts catalogues for most brands are dealer-only, so coverage is deepest for JCB, Cat, Komatsu, Volvo, Hitachi/Tata Hitachi and engine-OEM numbers (Cummins, Kubota, Kirloskar, Perkins, Deutz, Isuzu, Yanmar), and thinnest for cranes, self-loading mixers and Chinese brands. Ahrefs and Semrush were unavailable during this run (plan/units), so no search-demand figures are attached here; see `04` for parts-intent demand.
