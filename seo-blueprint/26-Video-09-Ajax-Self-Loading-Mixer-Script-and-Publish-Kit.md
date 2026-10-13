# 26 — Video #9 · "Ajax Machine Kab Le aur Kaunsi Capacity: Poora Process" · Script + Publish Kit (v2, process-first)

**Channel:** @desimachinesofficial · **Series:** Machine Ka Hisaab · **Playlist:** Concrete 101 (new) · **Target length:** 6:45
**Status:** SCRIPT v2 from the strategy desk, for the audit desk's read and Saurav's go. Nothing generated yet.
**Topic source:** doc `20`, runner-up §4.1, promoted to make the batch six videos. Batch position: video #9. Drop it if the batch must stay at five.
**What changed from v1 (Saurav, 13 Oct 2026):** no price list by capacity, no EMI, no hire rates, no diesel price, no crew cost, no per-cubic-metre rupee figure and no hire ledger in the video. The video teaches the five-step *process* of deciding whether a self-loading mixer belongs on your site and which capacity: the RMC-distance test, counting the work, sizing by your own batch cycle, buying a wheeled machine properly, and the method for working out your own cost per cubic metre. Current price bands, EMI and hire rates stay on `/concrete-mixer/self-loading/` and the model pages, linked from the description. v1 remains in git history (commit `ae25a60`).

> ⚠️ **Shorts-overlap gate (unchanged):** no Short covers concrete equipment; confirm against `shorts-apply-plan.json`. The "diesel kiska" line is a one-sentence callback to video #6, not a repeat.

---

## 0. The video in one breath

In most of India the self-loading concrete mixer is simply "Ajax machine", the way an excavator is a Poclain. It scoops its own sand and aggregate, weighs the cement, mixes on the move and pours where the slab is: a loader, a weigh batcher, a mixer and a transit mixer in one 4WD machine. The YouTube answer to it is a price list. The video gives the buyer the process instead: three questions that decide whether RMC or this machine serves the site (minutes to the pour at pour hour, transit-mixer access, one big pour versus many small ones); counting the day's concrete and the honest pour days; timing your own batch cycle and dividing the day's concrete by it to get the drum size; buying a wheeled machine with its RTO, insurance, GST input credit, a written landed quote and a demo on your own sand; and the top-up diesel, batch log and per-cubic-metre formula that tell you, two months in, whether the machine earns or eats. The rule: *RMC ki doori pehle; din ka concrete ÷ apne batch = capacity; bees pour-din se kam to kiraye par.*

---

## 1. Numbers policy for this video

- **Off-screen:** rupee amounts of any kind, ex-factory or on-road bands, EMI, hire rates per hour or day, diesel price, crew wages, insurance and maintenance figures, the per-cubic-metre rupee result, the hire ledger, RMC per-cubic-metre rates, model counts that change with the catalogue.
- **On-screen, allowed:** drum classes in cubic metres (2.0 · 2.5 · 3.0 · 4.3 · 4.5), the day's concrete in cubic metres, minutes to the pour, the one-hour line, pour days per month and the twenty-day line, batches per shift as *your own count*, the division, the landed-quote line headings, the per-cubic-metre *formula*, litres from the top-up method, a crew of three.
- **Flagged planning lines for the audit desk:** "within an hour, get the RMC rate first" as the RMC threshold; twenty pour days a month as the own/hire line; "ten to twelve batches a shift on most sites" as the spoken example (the chip says `YOUR COUNT*`). None is a specification; all three are decision rules the viewer re-checks on their own site.
- Source basis (site guides and model pages): the machine is all-wheel-drive and road-registered; on-road adds transport, RTO registration, TCS, warranty and insurance; GST input credit applies to a registered buyer; a wet-sand batch changes the water-cement balance unless the batcher corrects for moisture; utilisation decides the own-vs-hire outcome, not the rate.

## 2. Standards notes

As v1 minus the money: word ⟺ image (#23) on *sand heap, aggregate, cement bags, the loading-bucket swing, weigh display, drum turning on the move, slab pour, narrow village road, culvert, PMGSY road, canal lining, hill road, an RMC plant gate, a transit mixer in traffic, a stopwatch, a tally sheet, a water tanker*; cutaway (#24) of the four-in-one decomposition; named machine on screen (#25) with Ajax and peers in positive, working contexts only (#31) and the idle machine in the case de-badged; host action (#39): Ustaad ji reads the weigh display, paces the distance to the pour, points down the road, starts a stopwatch, fills the blank card; composite case (F1); method-on-screen (F2); AAJ KA RULE (F3); screenshot card (F4); 3-second vignette (a mason tapping the fresh slab with a trowel); sound logo. **No currency symbol on any chip.**

---

## 3. The script

### S01 · 0:00–0:14 · Opening lock
**Shot:** Frame 1 locked: the loading bucket biting a sand heap, swinging up and tipping into the turning drum; the weigh display ticks. Site ambience. VO ≤0.3 s in.
**VO:** ये machine अपनी reti ख़ुद उठाती है, cement ख़ुद तोलती है, चलते-चलते मिलाती है, और जहाँ slab है वहाँ जाकर डाल देती है। एक machine — चार काम। हिंदुस्तान इसे "Ajax machine" कहता है। और इसका सबसे बड़ा सवाल दाम नहीं है — ये है कि ये machine आपकी site पर चाहिए ही या नहीं। और चाहिए, तो कितनी बड़ी। आज दोनों का process।
**EN sub:** This machine scoops its own sand, weighs its own cement, mixes on the move, and pours where the slab is. One machine, four jobs. India calls it the "Ajax machine". And its biggest question isn't the price. It's whether your site needs this machine at all. And if it does, how big. Today, the process for both.

### S02 · 0:14–0:20 · Sting
**VO:** देसी मशीन्स — सुनो सबकी, चुनो अपनी! · **EN:** Desi Machines — hear everyone out, choose your own!

### S03 · 0:20–0:42 · The five steps
**Shot:** Ustaad ji beside the drum, weigh display behind. Cut-ins: a road milestone, a pour register, a stopwatch over a batch, an RTO form, a batch-log sheet.
**VO:** पाँच step। एक — RMC की दूरी का test — plant कितनी दूर, और transit mixer site तक पहुँचता है या नहीं। दो — काम गिनो — दिन का concrete, महीने के pour-din। तीन — capacity — दिन का concrete, भाग अपने batch। चार — ख़रीदने का process — पहियों वाली machine, RTO से demo तक। पाँच — चलाने का हिसाब — cubic metre का ख़र्च, और किराया — लेना या देना।
**EN sub:** Five steps. One: the RMC-distance test: how far the plant is, and whether a transit mixer reaches the site. Two: count the work: the day's concrete, the pour days a month. Three: capacity: the day's concrete divided by your own batches. Four: the buying process: a wheeled machine, from the RTO to the demo. Five: the running math: the cost per cubic metre, and hire, in or out.
**Chips:** `1 RMC TEST` · `2 COUNT THE WORK` · `3 CAPACITY = DAY'S M³ ÷ BATCHES` · `4 BUYING PROCESS` · `5 RUNNING MATH`

### S04 · 0:42–1:06 · Four machines in one (decomposition)
**Shot (#24):** loader bucket isolated → weigh-cell display → drum → 4WD chassis driving to the pour → composed machine. Then a quick brand roll of name chips (Ajax, Schwing Stetter, Venus, Conmat, Apollo Carmix, Fiori, Tarle, Macons and others).
**VO:** self-loading concrete mixer चार machine की जगह लेती है: loader — reti-gitti उठाने के लिए; weigh batcher — हर batch तोलने के लिए; mixer — drum; और transit mixer — क्योंकि ये चलते हुए मिलाती है और site के अंदर पहुँच जाती है। four-wheel drive, कच्चे रास्ते पर चढ़ाई। दस से ज़्यादा brand बनाते हैं — Ajax सबसे आगे, इसीलिए हर machine "Ajax" कहलाती है। drum का size दो cubic metre से साढ़े चार तक।
**EN sub:** A self-loading concrete mixer replaces four machines: a loader to pick up sand and aggregate; a weigh batcher to weigh every batch; a mixer, the drum; and a transit mixer, because it mixes on the move and reaches inside the site. Four-wheel drive, climbs rough tracks. More than ten brands make it; Ajax leads, which is why every machine gets called an "Ajax". Drum sizes from two cubic metres to four and a half.
**Chips:** `LOADER + WEIGH BATCHER + MIXER + TRANSIT` · `4WD` · `2.0 → 4.5 M³ PER BATCH`

### S05 · 1:06–1:46 · Step 1: the RMC test, three questions (word ⟺ image)
**Shot:** an RMC plant gate → a transit mixer in city traffic → a narrow village road with a culvert → a PMGSY road in open country → canal lining → a hill road; the host paces, points down the road (#39), checks a phone timer.
**VO:** step एक — RMC का test। तीन सवाल। पहला — plant से आपके pour तक कितने मिनट — और उसी वक़्त, जब आप डालते हो। concrete की घड़ी plant पर शुरू हो जाती है। एक घंटे के अंदर पहुँचे — तो RMC का rate पहले लो। दूसरा — transit mixer आपकी site तक आता है या नहीं? संकरा रास्ता, पहाड़ी मोड़, कच्चा approach — plant पास भी हो, mixer नहीं पहुँचता। तीसरा — pour कैसा है? एक बड़ा slab — RMC का खेल। बीस जगह छोटे pour — culvert, सड़क के टुकड़े, नहर की lining — वहाँ transit mixer आना नहीं चाहता। और यही machine आपका plant बन जाती है।
**EN sub:** Step one: the RMC test. Three questions. First: how many minutes from the plant to your pour, at the hour you actually pour. The concrete's clock starts at the plant. Within an hour, get the RMC rate first. Second: can a transit mixer reach your site? A narrow road, hill bends, a soft approach: even a nearby plant can't deliver. Third: what does the pour look like? One big slab is RMC's game. Twenty small pours in twenty places, culverts, road stretches, canal lining: the transit mixer doesn't want to come. And this machine becomes your plant.
**Chips:** `1 MINUTES TO THE POUR, AT POUR HOUR` · `WITHIN 1 HOUR → GET THE RMC RATE FIRST` · `2 CAN A TRANSIT MIXER REACH?` · `3 ONE BIG POUR → RMC · MANY SMALL POURS → SLCM`

### S06 · 1:46–2:14 · Step 2: count the work
**Shot:** a BOQ page with the concrete total highlighted; a calendar with pour days ticked and shuttering days crossed; a twenty-day line.
**VO:** step दो — काम गिनो। drawing या BOQ से कुल concrete निकालो — cubic metre में। उसे काम के दिनों से बाँटो — दिन का concrete मिला। अब calendar लो — हर दिन pour नहीं होता। shuttering के दिन, steel के दिन, curing — उनमें machine खड़ी। जिन दिनों सच में concrete डलता है — वो pour-din। महीने में बीस से कम pour-din — ख़रीदने का हिसाब मत शुरू करो, किराये का करो। बीस से ज़्यादा, और काम एक package से आगे का दिखता है — आगे बढ़ो।
**EN sub:** Step two: count the work. From the drawing or the BOQ, take the total concrete in cubic metres. Divide by the working days: that's the day's concrete. Now take the calendar: not every day pours. Shuttering days, steel days, curing: the machine stands. The days concrete actually goes in are the pour days. Fewer than twenty pour days a month: don't start the buying math, start the hire math. More than twenty, and work visible beyond one package: carry on.
**Chips:** `TOTAL M³ ÷ WORKING DAYS = DAY'S M³` · `POUR DAYS ≠ CALENDAR DAYS` · `<20 POUR DAYS / MONTH → HIRE`

### S07 · 2:14–2:24 · Subscribe beat (icons)
**VO:** एक second — subscribe। concrete से crane तक, हर process यहीं। · **EN:** One second: subscribe. From concrete to cranes, every process is here.

### S08 · 2:24–3:02 · Step 3: capacity, by your own cycle
**Shot:** a stopwatch over one full cycle: load → water → mix → drive → pour → return; a tally sheet ticking batches through a shift; the ladder of drum classes lights up the matching one; a half-full drum.
**VO:** step तीन — capacity। brochure "घंटे का output" बताता है — आपकी site को नहीं जानता। एक cycle घड़ी से नापो: load, cement, पानी, mixing, pour तक चलना, डालना, वापस। आठ घंटे में कितने batch — वो आपका number; ज़्यादा sites पर दस-बारह। अब division: दिन का concrete, भाग अपने batch — यही drum का size; सबसे पास की class लो। एक class ऊपर जाने से पहले दो बातें। बड़ी machine पर छोटा काम — हर batch आधा drum, पूरा diesel। और एक machine दो shift में — output दुगना, बिना बड़ी machine के। बड़ी machine तब, जब काम बड़ा हो — पहले नहीं।
**EN sub:** Step three: capacity. The brochure gives output per hour; it doesn't know your site. Time one cycle with a watch: loading, cement, water, mixing, the drive to the pour, discharge, return. How many batches in eight hours: that's your number; on most sites ten to twelve. Now the division: the day's concrete divided by your batches is the drum size; take the nearest class. Before you go a class up, two things. Small work on a big machine: half a drum every batch, full diesel. And one machine in two shifts doubles the output without a bigger machine. The bigger machine when the work is bigger. Not before.
**Chips:** `TIME ONE CYCLE: LOAD → WATER → MIX → DRIVE → POUR → RETURN` · `BATCHES PER SHIFT = YOUR COUNT*` · `DRUM SIZE = DAY'S M³ ÷ BATCHES` · `CLASSES: 2.0 · 2.5 · 3.0 · 4.3 · 4.5 M³` · `HALF DRUM = FULL DIESEL · 2 SHIFTS BEFORE 1 CLASS UP`

### S09 · 3:02–3:30 · Step 4a: buying a wheeled machine
**Shot:** the machine driving on a public road; an RTO form; an insurance cover note; a low-bed trailer; a written quote whose lines build one by one.
**VO:** step चार — ख़रीदने का process। ये machine पहियों पर है और सड़क पर चलती है — मतलब RTO registration और road tax; insurance; site तक transport; ऊपर TCS। GST — आपका registration है, तो input credit बनता है; पहले registration, फिर machine। dealer से एक काग़ज़ पर पूरी landed quote लो — ex-factory, GST, transport, RTO, insurance, TCS, और जो extra आप माँग रहे हो — printer, weigh calibration, training — हर line अलग।
**EN sub:** Step four: the buying process. This machine is on wheels and uses the road, so RTO registration and road tax; insurance; transport to site; plus TCS. GST: if you are registered, input credit builds; registration first, then the machine. Get the full landed quote from the dealer on one sheet: ex-factory, GST, transport, RTO, insurance, TCS, and whatever extras you're asking for, printer, weigh calibration, training, every line separate.
**Chips:** `WHEELED → RTO + ROAD TAX + INSURANCE` · `GST INPUT CREDIT: REGISTER FIRST` · `LANDED QUOTE, LINE BY LINE, IN WRITING`

### S10 · 3:30–3:58 · Step 4b: the demo and the first-month proof
**Shot:** a demo on the buyer's own sand heap; a fist of damp sand; the weigh display with a calibration sticker; cube moulds being filled; a crew of three; a dealer's service van; a water tanker parked beside the stockyard.
**VO:** demo अपनी site, अपनी reti पर — showroom की सूखी reti पर नहीं। reti में नमी है, तो cement-पानी का हिसाब बदलता है — पूछो, machine moisture correction कैसे लेती है। weigh cell का calibration certificate माँगो। पहले pours के cube test कराओ — grade आपकी lab में साबित हो। crew — operator और दो helper — OEM की training के साथ। service कितनी दूर; drum के blade, bucket के pin, weigh cell — stock में? और layout — पानी, reti-gitti का ढेर, cement का godown — सब machine के पास। पानी दो km दूर, तो batch आधे।
**EN sub:** The demo on your site, on your sand, not the showroom's dry sand. Damp sand changes the cement-water balance: ask how the machine takes moisture correction. Ask for the weigh-cell calibration certificate. Get cube tests on the first pours, so the grade is proven in your lab. The crew, an operator and two helpers, with the OEM's training. How far is service; drum blades, bucket pins, weigh cells, in stock? And the layout: water, the sand and aggregate heaps, the cement store, all next to the machine. Water two kilometres away, and the batches halve.
**Chips:** `DEMO ON YOUR SAND · MOISTURE CORRECTION?` · `WEIGH CALIBRATION CERTIFICATE · CUBE TESTS` · `CREW OF 3 + OEM TRAINING · SERVICE + PARTS` · `WATER + STOCKYARD NEXT TO THE MACHINE`

### S11 · 3:58–4:44 · The dramatised case (F1)
**Shot:** "Gopal ji" (composite) on an 18 km PMGSY package in Jhansi: his badged Argo pouring a CC stretch; a milestone "RMC plant 60 km"; culverts dotted along the road; a tally sheet; a water tanker moved next to the stockyard; the 3-second vignette, a mason tapping the fresh slab with a trowel; then the neighbour's identical machine under a tarp (de-badged) at a city project with a transit mixer rolling in behind.
**VO:** गोपाल जी, झाँसी। PMGSY की अट्ठारह km सड़क — बीच में culvert, टुकड़ों में CC। नज़दीकी RMC plant साठ km — दो घंटे; छोटे pours के लिए transit mixer आता ही नहीं। दिन का concrete गिना, अपने batch गिने — division ने mid-size machine दी, सबसे बड़ी नहीं। पहले हफ़्ते batch कम — पानी दो km दूर था। tanker ढेर के बग़ल में — batch वापस ऊपर। पड़ोसी ने वही machine ली — शहर का project, plant आठ km पर, एक बड़ा slab। transit mixer सस्ता और आसान निकला। machine साल भर tarpaulin के नीचे — EMI हर महीने। एक ही machine। फ़र्क — plant की दूरी, और pour का size।
**EN sub:** Gopal ji, Jhansi. An eighteen-kilometre PMGSY road: culverts along the way, CC in stretches. The nearest RMC plant sixty kilometres, two hours; for pours that small the transit mixer doesn't come at all. He counted the day's concrete and his own batches; the division gave him a mid-size machine, not the biggest. The first week the batches fell short: the water was two kilometres away. Tanker beside the heap, and the batches came back up. His neighbour bought the same machine: a city project, plant eight kilometres away, one big slab. The transit mixer turned out cheaper and easier. The machine spent a year under a tarpaulin, EMI every month. Same machine. The difference: distance to the plant, and the size of the pour.
**Chips:** `RMC 60 KM · SMALL POURS → THE MACHINE IS THE PLANT` · `WATER 2 KM → BATCHES DOWN · TANKER MOVED → BATCHES UP` · `RMC 8 KM · ONE BIG SLAB → TARP`

### S12 · 4:44–5:16 · Step 5: the running math, by method
**Shot:** refuelling to the seated nozzle (#18, #26); the batch log; the per-cubic-metre formula building; two hire quotes side by side with their basis lines.
**VO:** step पाँच — चलाने का हिसाब, तरीक़े से। diesel brochure से नहीं — tank से: सुबह full, दिन भर काम, शाम को फिर full — जो litre गए, वो दिन का diesel। batch का log रखो — batch गुना drum size — दिन का concrete; pour register से मिलाओ। महीने के अंत में diesel, crew, maintenance, insurance, interest जोड़ो — महीने के cubic metre से बाँटो — ये आपका per-cubic-metre, material के ऊपर। अब किराया। quote का basis पूछो: घंटे का, दिन का, या cubic metre का। diesel किसका — Poclain video का सवाल। पानी, waiting — लिखो। अपना per-cubic-metre किराये के सामने रखो — फ़र्क छोटा है, तो ख़रीदना दाम के लिए नहीं, availability के लिए है।
**EN sub:** Step five: the running math, by method. Diesel from the tank, not the brochure: full in the morning, work all day, full again in the evening; the litres that went in are the day's diesel. Keep a batch log: batches times drum size is the day's concrete; match it to the pour register. At month end add diesel, crew, maintenance, insurance, interest; divide by the month's cubic metres: that's your per cubic metre, on top of materials. Now hire. Ask the quote's basis: per hour, per day or per cubic metre. Whose diesel, the question from the Poclain video. Water, waiting: in writing. Put your own per cubic metre against the hire quote: if the gap is small, buying is for availability, not for price.
**Chips:** `DIESEL: FULL → WORK → TOP-UP = DAY'S LITRES` · `BATCH LOG × DRUM SIZE = DAY'S M³` · `PER M³ = (DIESEL + CREW + MAINTENANCE + INSURANCE + INTEREST) ÷ M³ POURED` · `HIRE QUOTE: BASIS? DIESEL KISKA? WATER? WAITING?`

### S13 · 5:16–5:34 · The owner's card, performed on screen (headings only)
**Shot:** the host fills a blank card with a pen: headings and blanks, nothing numeric.
**VO:** ये card आपका है — महीने के आख़िर में भरो। ऊपर: pour-din, batch, cubic metre। बीच में: diesel litre, crew, maintenance, insurance, interest। नीचे: कुल, भाग cubic metre। और एक line — किराये का quote। दो महीने भर लो — आपको पता होगा कि machine कमा रही है या खा रही है — किसी video के number से नहीं, अपने से।
**EN sub:** This card is yours; fill it at month end. Top: pour days, batches, cubic metres. Middle: diesel litres, crew, maintenance, insurance, interest. Bottom: the total divided by cubic metres. And one more line: the hire quote. Fill it for two months and you'll know whether the machine earns or eats, from your own numbers, not a video's.
**Chips (card):** `POUR DAYS __ · BATCHES __ · M³ __` · `DIESEL L __ · CREW __ · MAINTENANCE __ · INSURANCE __ · INTEREST __` · `TOTAL ÷ M³ = YOUR PER-M³` · `HIRE QUOTE PER M³ __`

### S14 · 5:34–5:50 · AAJ KA RULE
**Shot:** host at the drum; rule card lower-third; sound logo.
**VO:** आज का rule। पहले RMC की दूरी — एक घंटे के अंदर है, तो RMC का rate लो। फिर दिन का concrete, भाग अपने batch — वो आपकी capacity। और महीने के बीस pour-din नहीं हैं — तो SLCM ख़रीदो मत, किराये पर लो।
**EN sub:** Today's rule. First the distance to RMC: within an hour, get the RMC rate. Then the day's concrete divided by your batches: that's your capacity. And without twenty pour days a month, don't buy an SLCM. Hire one.
**Chip:** `TODAY'S RULE · RMC WITHIN 1 HOUR → RMC RATE FIRST · DAY'S M³ ÷ YOUR BATCHES = CAPACITY · <20 POUR DAYS: HIRE`

### S15 · 5:50–6:08 · The screenshot card (7-point checklist)
**VO:** ये card screenshot ले लो — सात बातें, machine देखने से पहले। आज के दाम, सब models और brands की guide — link नीचे।
**EN sub:** Screenshot this card: seven things before you look at a machine. Today's prices, every model and the brands guide: link below.
**Card:** `1 RMC: MINUTES AT POUR HOUR · TRANSIT-MIXER ACCESS · POUR PATTERN` · `2 TOTAL M³ ÷ WORKING DAYS = DAY'S M³` · `3 POUR DAYS / MONTH (THE 20 LINE)` · `4 TIME YOUR CYCLE → BATCHES / SHIFT` · `5 DAY'S M³ ÷ BATCHES = DRUM SIZE · 2 SHIFTS BEFORE 1 CLASS UP` · `6 LANDED QUOTE: EX-FACTORY · GST · TRANSPORT · RTO · INSURANCE · TCS · EXTRAS` · `7 DEMO ON YOUR SAND · CALIBRATION · CUBE TESTS · TOP-UP DIESEL · BATCH LOG` · footer `desimachines.com/concrete-mixer/self-loading`

### S16 · 6:08–6:32 · Brand-principle close
**Shot:** most energetic shot: the Argo discharging a full drum into a CC-road form at speed, the crew spreading; the host.
**VO:** देसी मशीन्स — India's largest platform to discover, compare, enquire about machines & equipment। सुनो सबकी, चुनो अपनी! और याद रखो — हम बेचते नहीं, आपको ख़रीदने में help करते हैं। इसीलिए आज हमने वो site भी बताई, जहाँ ये machine लेनी ही नहीं चाहिए — और वो तरीक़ा, जिससे आप छोटी machine चुनो, जब छोटी ही काफ़ी है।
**EN sub:** Desi Machines: India's largest platform to discover, compare and enquire about machines and equipment. Hear everyone out, choose your own! And remember: we don't sell, we help you buy. That's why today we also named the site where you shouldn't buy this machine at all, and the method that lets you pick the smaller machine when the smaller one is enough.

### S17 · 6:32–6:40 · End card

**Running time ≈ 6:45–6:50 at series VO pace; re-time chapters at render. VO ≈ 1,150 words (Hindi with English technical terms), the longest of the batch by a few lines.**

**Completeness check (F2):** what the machine replaces · who makes it · the three-question RMC test · total concrete ÷ working days · pour days and the twenty-day line · timing the cycle, batches per shift · the division and the class ladder · the half-drum trap and two shifts · RTO, road tax, insurance, transport, TCS · GST input credit · the landed quote line by line · demo on your sand, moisture correction, calibration certificate, cube tests · crew and training · service and parts · site layout · top-up diesel · batch log · the per-cubic-metre formula · hire basis and clauses · availability vs price. Left to description and paired pages: current price bands and EMI, hire-rate bands, used SLCM, water-tank sizing by class, attachments.

**Lexicon (#21):** `self-loading concrete mixer` · `SLCM` एस-एल-सी-एम · `RMC` आर-एम-सी · `Argo` आर्गो · `Schwing Stetter` श्विंग स्टेटर · `Conmat` · `Carmix` · `PMGSY` पी-एम-जी-एस-वाई · `BOQ` बी-ओ-क्यू · `cubic metre` · `weigh batcher` · `moisture correction` · `cube test` · `calibration` · numbers: अट्ठारह, साठ, आठ, बीस, दस-बारह.

---

## 4. Shot plan notes
≈27 unique clips. New generations: bucket-to-drum scoop (S01 hero), four-in-one decomposition (S04), RMC montage (S05, 6 clips incl. narrow village road and culvert), BOQ page and pour calendar (S06), stopwatch cycle, tally sheet and half drum (S08), RTO form and quote lines (S09), demo on sand, damp-sand fist, calibration sticker, cube moulds, tanker beside the heap (S10), Gopal sequence (S11, 7 clips; de-badge the tarp machine), top-up, batch log and formula (S12), blank card (S13), discharge at speed (S16). Host lip-sync: S03, S05 (paces, points, timer), S07, S08 (stopwatch), S13 (fills the card), S14, S16. Logos only on working machines. Tier B.

---

## 5. Publish kit

### Title (≤60)
1. **Recommended:** `Ajax Machine Kab Le aur Kaunsi Capacity: Poora Process` (54)
2. `Self Loading Mixer ya RMC? Sahi Faisla Step by Step` (51)
3. `Ajax 2.5 ya 4.5 Cubic Metre? Capacity Chunne ka Tareeka` (55)

### Description
```
Ajax machine (self-loading concrete mixer) kab leni chahiye aur kaunsi capacity — daam nahi, process. 5 step: (1) RMC test — plant se pour tak minute (pour ke waqt), transit mixer site tak aata hai ya nahi, ek bada pour (RMC) ya bees chhote pour (SLCM); 1 ghante ke andar plant → RMC ka rate pehle; (2) kaam gino — total concrete ÷ kaam ke din = din ka cubic metre; mahine ke pour-din (20 din ki line); (3) capacity — apna cycle ghadi se naapo, shift ke batch gino, din ka concrete ÷ batch = drum size; aadha drum = poora diesel; 2 shift pehle, badi machine baad mein; (4) kharidne ka process — pahiyon wali machine: RTO + road tax, insurance, transport, TCS, GST input credit (registration pehle), likhit landed quote line-by-line, demo apni reti par, moisture correction, weigh calibration, cube test, crew + training, service aur parts, paani-stockyard layout; (5) chalane ka hisaab — top-up diesel, batch log, per-cubic-metre formula, hire quote ka basis, diesel kiska, waiting. Aaj ke price bands, EMI aur kiraya niche ke pages par.

⏱ Chapters
0:00 Ek machine, chaar kaam
0:14 Suno Sabki, Chuno Apni
0:20 Aaj ke 5 step
0:42 Self-loading mixer kya hai
1:06 Step 1: RMC test — 3 sawaal
1:46 Step 2: Din ka concrete aur pour-din
2:24 Step 3: Capacity — apna cycle, apna batch
3:02 Step 4: Kharidna — RTO, GST, landed quote
3:30 Demo apni reti par, calibration, cube test
3:58 Gopal ji ki kahani
4:44 Step 5: Diesel, batch log, per cubic metre, kiraya
5:16 Aapka card — mahine ke end ka
5:34 Aaj ka Rule
5:50 7-point checklist + Desi Machines ka vaada

🔗 Links
Self-loading mixers — aaj ke price bands, sab models: https://desimachines.com/concrete-mixer/self-loading/?utm_source=youtube&utm_medium=description&utm_campaign=yt-ajax-slcm
Best SLCM brands guide: https://desimachines.com/blog/best-self-loading-concrete-mixers-brands-in-india/?utm_source=youtube&utm_medium=description&utm_campaign=yt-ajax-slcm
Ajax Argo 4500: https://desimachines.com/self-loading-concrete-mixer/ajax-argo-4500/?utm_source=youtube&utm_medium=description&utm_campaign=yt-ajax-slcm
Ajax Argo 2500: https://desimachines.com/self-loading-concrete-mixer/ajax-argo-2500/?utm_source=youtube&utm_medium=description&utm_campaign=yt-ajax-slcm
Ajax Argo 3000: https://desimachines.com/self-loading-concrete-mixer/ajax-argo-3000/?utm_source=youtube&utm_medium=description&utm_campaign=yt-ajax-slcm
Tarle SLM 3000: https://desimachines.com/self-loading-concrete-mixer/tarle-slm-3000/?utm_source=youtube&utm_medium=description&utm_campaign=yt-ajax-slcm
Concrete mixers hub: https://desimachines.com/concrete-mixer/?utm_source=youtube&utm_medium=description&utm_campaign=yt-ajax-slcm
Kiraya rate card: https://desimachines.com/blog/equipment-rental-rate-card/?utm_source=youtube&utm_medium=description&utm_campaign=yt-ajax-slcm
GST on construction equipment (input credit): https://desimachines.com/heavy-equipment-guide/gst-on-construction-equipment/?utm_source=youtube&utm_medium=description&utm_campaign=yt-ajax-slcm
Finance desk: https://desimachines.com/finance/?utm_source=youtube&utm_medium=description&utm_campaign=yt-ajax-slcm
WhatsApp channel: <channel link> · Instagram: https://www.instagram.com/desimachinesofficial

ℹ️ Is video mein koi price, EMI ya kiraye ka number nahi — wo saal aur zile se badalte hain; process nahi. Aaj ke price bands aur EMI upar ke pages par. "1 ghante" ki RMC line, "20 pour-din" ki line aur "shift mein 10–12 batch" planning ke rules hain, specification nahi — apni site par gino. Gopal ji ek dramatised composite hain. Visuals aur voice AI-produced hain.

AJAX, Schwing Stetter, Venus, Conmat, Apollo Carmix, Fiori aur Tarle apne maalikon ke trademark hain. DesiMachines ek independent platform hai.

#AjaxMachine #SelfLoadingMixer #DesiMachines
```

### Tags (15)
`ajax machine` · `ajax machine price` · `self loading concrete mixer` · `self loading concrete mixer price` · `ajax machine kaise chune` · `ajax fiori` · `ajax argo 4500` · `ajax argo 2500` · `concrete mixer machine` · `slcm machine` · `ready mix concrete vs site mix` · `rmc vs self loading mixer` · `concrete 101` · `desi machines` · `machine ka hisaab`

### Pinned comment
```
Aapki site se RMC plant kitne minute door hai — aur din ka kitna concrete? 👇 Comment karo, capacity ka division hum saath karenge.
Sab self-loading mixers, aaj ke price aur specs: https://desimachines.com/concrete-mixer/self-loading/?utm_source=youtube&utm_medium=pinned&utm_campaign=yt-ajax-slcm
```

### Thumbnails (A/B/C), no currency
- **A · machine hero:** the scoop into the drum, `RMC ya AJAX?` and `1 GHANTE ka TEST`.
- **B · host + Devanagari:** Ustaad ji at the weigh display, `अजैक्स मशीन` large, `कब लें, कौन-सी capacity?` smaller.
- **C · split:** RMC transit mixer in city traffic | Argo on an open PMGSY road, strap `DOORI DECIDE KARTI HAI`.
Real badges on working machines; none on the tarp machine.

### Studio settings
Playlists: *Machine Ka Hisaab*, new *Concrete 101* · End screen: subscribe + Concrete 101 · Cards: 1:06 → SLCM hub, 2:24 → brands guide, 4:44 → rate card · HI + EN `.srt` · disclosure · watermark · ledger row.

---

## 6. Site embed plan
Unchanged pages: `/concrete-mixer/self-loading/` hub (top; the page keeps the current price bands the video points to) and `/blog/best-self-loading-concrete-mixers-brands-in-india/`. VideoObject per doc `21` v1 template; clips: `S05 RMC test (66–106 s)` · `S06 Count the work (106–134 s)` · `S08 Capacity (144–182 s)` · `S09–S10 Buying (182–238 s)` · `S12 Running math (284–316 s)`.
**Secondary:** `/self-loading-concrete-mixer/ajax-argo-4500/` (the site's strongest converting SLCM page), `ajax-argo-2500/`, `ajax-argo-3000/`, `/concrete-mixer/` hub (the 32k-impression page with 0.46% CTR). Admin-user embed; verify stored content.

## 7. SEO targets and day-30 scorecard
Unchanged from v1: the hub, brands guide and model pages carry the embed, so the price queries are served by the page while the video serves the decision.

| Query | Impressions (90 d) | Position now | CTR now | Day-30 target |
|---|---|---|---|---|
| concrete mixer machine | 32,232 | 3.2 | 0.5% | video thumbnail live on `/concrete-mixer/`; CTR ≥1% |
| ajax machine | 17,327 | 2.0 | 0.5% | thumbnail live; CTR ≥1.5% |
| mixer machine price | 13,785 | 2.7 | 0.4% | CTR ≥1% |
| concrete mixer machine price | 12,645 | 3.0 | 1.7% | position ≤2 |
| ajax machine price | 5,445 | 2.4 | 2.2% | position ≤2; thumbnail live (SERP already `video_th`) |
| self loading concrete mixer | 4,503 | 5.4 | 1.2% | position ≤3 |
| ajax machine on road price | 2,783 | 1.6 | 5.0% | hold |
| ajax fiori price | 2,003 | 3.5 | 2.7% | position ≤2 |

Add for the video itself: `ajax machine kaise chune`, `self loading mixer vs rmc`, `slcm capacity`. Rest per doc `21` §7.

## 8. Needs Saurav
1. Keep or drop this sixth video (the batch was five; this is the runner-up promoted).
2. Confirm the numbers policy as applied: capacities in cubic metres, minutes, days and formulas only; price bands, EMI and hire rates stay on the pages.
3. Confirm the three planning lines with the concrete team: one hour to the pour as the RMC threshold; twenty pour days a month as the own/hire line; "ten to twelve batches a shift on most sites" as the spoken example (or drop the figure and keep only "count your own").
4. Confirm with the OEM or audit desk that moisture correction and a weigh-cell calibration certificate are things dealers can actually show on these machines.
5. Go / no-go on Gopal ji (composite), the water-tanker beat and the neighbour's tarp machine.
6. Title choice (A recommended) and creation of the *Concrete 101* playlist.
7. Real-viewer gate: two SLCM owners, one on rural roads or canal work, one running the machine on hire.
