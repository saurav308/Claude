# parts_fitment CSV schema (one row per machine model x part)
Columns (exact header, in this order):
brand,model,category,engine_make_model,part_system,part_name,oem_part_number,part_number_owner,qty_per_machine,aftermarket_crossrefs,fitment_notes,source_url,source_type,confidence,checked_on

- brand / model / category: EXACTLY as given in the model list file (do not rename models).
- engine_make_model: e.g. "JCB ecoMAX 444 (TCAE-55)", "Cummins 6BT5.9", "Kubota V2403", "Kirloskar 4R1040" - as published; blank if unknown.
- part_system: one of Engine | Fuel | Air intake | Hydraulic | Transmission/Axle | Cooling | Electrical | Undercarriage/Tyres | Ground engaging | Drum/Mixer | Pumping | Other
- part_name: e.g. "Engine oil filter", "Fuel filter (primary/water separator)", "Fuel filter (secondary)", "Air filter (outer/primary)", "Air filter (inner/safety)", "Hydraulic return filter", "Hydraulic pilot filter", "Hydraulic suction strainer", "Transmission filter", "Hydraulic tank breather", "Fan belt", "Alternator belt", "Battery", "Tyre (front)", "Tyre (rear)", "Track shoe", "Bucket tooth", "Tooth adapter", "Cutting edge", "Pin & bush kit (bucket)", "Engine oil capacity", "Hydraulic oil capacity", "Coolant capacity", "Fuel tank capacity"
- oem_part_number: the exact number as the source prints it (keep slashes/dashes, e.g. 32/925915, 4448402, 1R-0750, 600-211-1340, 11110683). For capacities/specs put the value (e.g. "15 L", "12V 100Ah", "12.5-18 12PR").
- part_number_owner: whose numbering it is: machine OEM (JCB / Tata Hitachi / Komatsu / Cat ...), engine OEM (Cummins / Kubota / Perkins / Kirloskar / Deutz / Ashok Leyland ...), or "spec" for capacities and sizes.
- qty_per_machine: integer if known else blank.
- aftermarket_crossrefs: semicolon list "Fleetguard LF3345; Donaldson P550335; MANN W 940/25; Elofic ...; UFI ...; Baldwin ..." - only when a cross-reference source states it.
- fitment_notes: variants, serial/year breaks, engine variants, "fits 3DX/3DX Plus/3DX Super (ecoMAX 444)", "CEV Stage IV only", etc.
- source_url: the URL you actually read. One URL per row (the best one). Mandatory.
- source_type: OEM parts catalogue | OEM operator/service manual | OEM brochure/spec sheet | Aftermarket cross-reference catalogue | Dealer/parts-seller listing | Marketplace listing | Forum/other
- confidence: High (OEM manual/catalogue or 2+ agreeing reputable sources) | Medium (one reputable aftermarket/dealer listing) | Low (single marketplace/forum listing or inferred from a sibling model)
- checked_on: 2026-11-04
Rules: never invent a number. If no number is found for a part, do NOT write a row for it. Prefer India-market sources (jcb.com/in, tatahitachi.co.in, Fleetguard India, Elofic, UFI India, Donaldson, MANN+HUMMEL, Baldwin, Boodmo, IndiaMART listings that quote OEM numbers, Komatsu/Cat parts.cat.com, parts.komatsu). Engine-level parts shared across models should be written once per model (one row per model) so the table is complete per machine.
