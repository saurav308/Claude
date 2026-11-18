# g8_compaction – research notes (HAMM / Dynapac / Ammann rollers, India)

Checked 2026-11-04. CSV: parts/g8_compaction.csv (148 rows, 25/25 model names covered, incl. the duplicate spellings in the model list).

## Engines fitted (India CEV Stage V builds) – confirmed from OEM pages/datasheets
| Model | Engine |
|---|---|
| HAMM HC 119i / HC 119iD (H305) | Ashok Leyland H4C510122, 74 kW; CEV IV series H279 (2021-23) had Cummins QSB4.5 CIVD1 90 kW |
| HAMM HC 139iD | Ashok Leyland H4C513022, 95.6 kW |
| HAMM HD 99i VV / HD 109i VV (H306) | John Deere EWX 2.9 (3029 family), 55 kW; CEV IV units John Deere 3029 |
| Ammann ARS 110.2 | Ashok Leyland H4C510122 (CEV IV: H4C410122) |
| Ammann ARX 90.2 | Ashok Leyland H4C47422 (data sheet prints H4C5E7422 for CEV V) |
| Ammann ARX 32.2 | Mahindra MCDHC29NA047CE5, 36.2 kW |
| Dynapac CA245 / CA305 / CC425 CEV-V | KOEL (Kirloskar) – model not printed for CEV-V; CEV IV: 4R1190TA (CA305), 4R1190NA1 (CC425) |
| Dynapac CA405D / CA405PS CEV-V | Cummins 121 hp @ 2200 (model not printed; matches Cummins India B4.5 121 rating – unverified) |
| Dynapac CC125 CEV-V | Mahindra 18.5 kW (older CC125: Mahindra MDI 1895) |
| Dynapac CC1250 CEV-V | Kubota D1703-M |
| Dynapac CC800 | Kubota D1105-E4B |
| Dynapac CP275 | Cummins 4BTAA3.9 (T2) 125 hp per DesiMachines; dynapac.com lists QSB4.5 T3 / QSF4.5 BS IV alternatives |

## Sources used per brand
**HAMM / Wirtgen Group**
- HC 119i H305 datasheet: https://www.wirtgen-group.com/binary/full/o305594v83_HC_119i_H305_Datasheet_enGB.pdf
- HD 99i VV / HD 109i VV H306 datasheets: https://www.wirtgen-group.com/binary/full/o308091v83_HD_99i_VV_H306_Datasheet_enGB.pdf , https://www.wirtgen-group.com/binary/full/o308014v83_HD_109i_VV_H306_Datasheet_enGB.pdf
- John Deere 3029HI530 (PowerTech EWX 2.9L Stage V) replacement part guide: https://www.deere.ca/assets/pdfs/common/qrg/3029hi530.pdf (oil filter RE519626, fuel filter RE554345, option-coded belts/starters/alternators)
- DesiMachines pages for HC 119iD / HC 139iD (engine, fuel, DEF, tyre).
- HAMM "Parts and More" portal is login-only; no HAMM part numbers for the India HC/HD-i machines are public. Cross-reference catalogues (ecefilter, partflux, Rico) only list European Deutz/Kubota-engined HAMM models.

**Dynapac**
- Dynadocweb (public OEM manuals): CA305/D/PD CEV IV O&M 4812332492 (capacities, battery, tyre, lubricant P/Ns); CC425 CEV IV O&M 4812332527 (capacities, battery, lubricant P/Ns); CC125 O&M 4812106760 (capacities); CC800 spare parts list 4812159862 (full service-kit and wear-part numbers). Other India catalogues exist but timed out: CC125 SPC 4812106759, CC1250 SPC 4812106596 / 4812108515_A, CA245 CEV IV O&M 4812333981, CP275 O&M 4812273203 and SPC 4812273202/4812269123, CC800 SPC 4812162261 (newer).
- Dynapac India filter-decal drawing 4812331873 (Scribd copy): https://www.scribd.com/document/904322340/4812331873-drw-1 – lists India filter P/Ns for CA305/CA385/CC425, CA305 CEV IV/CC425 CEV IV, CC125, CC1250.
- dynapac.com India product pages (CA305/CA405D/CC425/CC125 CEV-V) and Rhino-range brochure (IndiaMART-hosted PDF).
- Dynapac kit selector (CP275 kits): https://dynapac.com/en/products/service/more/kitselector
- Cummins 4BTAA3.9-C125 parts list (gensetengine.com) + Fleetguard cross-reference (fonho.com) for CP275 fuel filters.
- MANN W 913/1 application page (lists CC 1250 Kubota D1703-M); efiltry.pl / agro-filtry.pl CC 800 listings for aftermarket crossrefs.

**Ammann**
- Ammann India data sheets: ARS 110.2 CEV St V (MSS-3382-00-EN, frontify CDN), ARX 90.2 CEV St V (MSS-2878-00-EN, IndiaMART-hosted copy), ARX 32.2 CEV St V (MSS-3354-00-EN, frontify CDN); ammann.com/en-IN product pages.
- Ashok Leyland H4C47422 engine spec page (sump 10 L max).
- Ammann "Heavy equipment service – parts and service kits" catalogue (frontify) covers only Deutz/Kubota/Yanmar European models (ARX 90 Deutz kits 4-760169 etc.) – NOT the India Ashok Leyland/Mahindra machines.

## Gaps (no public part numbers found)
- HAMM HC 119i / 119iD / 139iD and HD 99i / 109i VV: no HAMM or Ashok Leyland filter numbers, battery, hydraulic/engine oil capacities published. Only JD engine-level filter numbers for the HD-i (Medium). Publisher should obtain the HAMM India maintenance-parts sheet from Wirtgen India (Pune) dealer.
- Ashok Leyland H4C510122 / H4C513022 / H4C47422 industrial engines: Leyparts/Fleetguard/Elofic numbers not traceable to these CEV engines (truck H-series numbers such as LF16238/F7A01500, FHJ00700 exist but are for 6-cyl truck engines – do not publish for rollers without dealer confirmation).
- Ammann ARS 110.2 / ARX 90.2 / ARX 32.2: Ammann India sells "service kits" but numbers are not public; no filter numbers.
- Dynapac CA245 CEV-V, CA405D/CA405PS CEV-V: engine model and filter numbers not published; only fuel tank and tyre.
- KOEL 4R1190/4R1040 and Cummins B4.5 CEV-V filter numbers: not found in public catalogues.
- Mahindra engines (CC125 CEV-V, ARX 32.2): no filter numbers.
- CP275 lube/air filter numbers for the Cummins 4BTAA3.9 installation not confirmed (Fleetguard LF3345 is the usual 4BT3.9 lube filter, but no source tied it to the C125 build – left out of CSV).

## Things the publisher must verify
1. Dynapac filter numbers from decal drawing 4812331873 are for CEV IV builds (CA305/CC425) and 2021-era CC125/CC1250; CEV-V (2024-) machines may carry new numbers – confirm with Dynapac India (customercare@dynapac.com, Pune).
2. Capacities for CA305/CC425/CC125 CEV-V are taken from the CEV IV manuals of the same platforms (marked Medium).
3. CC425 T3 ROPS engine: DesiMachines says Cummins QSB3.3 99 HP, but Indian dealer sheets for the BS III CC425 show Kirloskar 4R1040TC 76 hp; fuel tank 180 vs 250 L conflict.
4. Ammann battery ratings: data sheets say 2x65 Ah (ARS 110.2) and 2x72 Ah (ARX 90.2); DesiMachines pages show 150 Ah / 130 Ah.
5. CP275 India engine: DesiMachines lists Cummins 4BTAA3.9 T2; Dynapac global page lists QSB4.5/QSF4.5 – the fuel-filter rows apply only to the 4BTAA3.9.
6. HD 99i/109i JD filter numbers are engine-OEM numbers for the 3029HI530 (EWX 2.9) family; HAMM may use its own numbers and the primary (water-separator) filter was not found.
