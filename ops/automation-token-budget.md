# Automation Token Budget — DesiMachines Claude Workspace

How the scheduled daily / weekly / monthly automations consume the Claude plan, which
dials actually reduce that consumption, and how to keep headroom for interactive work.

**Status:** planning reference. Figures marked **[MEASURE]** must be filled in from your own
account — Anthropic does not publish subscription limits in tokens, so percentages can only
come from the usage bars on your account.

> **See also:** [`routine-optimisation-review.md`](routine-optimisation-review.md) — a review of
> the routines actually running (ORCH, S-EXEC, and the four uncharted external sessions), with
> the specific fixes ranked by size. The dominant finding is summarised in §3 below.

---

## 1. How the limits actually work

Three separate ceilings apply to a paid Claude plan, and automations draw on them exactly the
same way your own sessions do:

| Ceiling | Window | Shared across models? |
|---|---|---|
| Session limit | Rolling ~5 hours | Yes — switching models does not restore it |
| Weekly limit | Fixed weekly reset assigned to the account | Yes |
| Opus limit | Separate reset | **No — applies only to Opus requests** |

Plus a **daily cap on routine runs**, independent of tokens: 5/day on Pro, 15/day on Max,
25/day on Team and Enterprise. One-off `Run now` runs do **not** count against that cap, but
they do draw normal usage.

**There is no monthly usage window.** A "monthly" automation simply lands inside one week's
weekly budget — plan for that week to be the spike week.

### Where to read the numbers
| What | Where |
|---|---|
| Plan usage bars + next reset | `claude.ai/settings/usage` |
| Remaining daily routine runs | `claude.ai/code/routines` |
| Usage attribution (skills, subagents, MCP servers) + behaviour flags, 24h / 7d | `/usage` in the CLI |

---

## 2. Measuring each automation's share — [MEASURE]

Percentages cannot be derived from published figures. Measure them directly:

1. Open `claude.ai/settings/usage` and record the **weekly bar %**.
2. Trigger one automation with **Run now**. Wait for the run to finish.
3. Record the weekly bar % again. The delta is that automation's **cost per run**.
4. Repeat per automation, then annualise with the frequency multipliers below.

```
monthly runs = (daily count × 30) + (weekly count × 4.3) + (monthly count × 1)
monthly share of plan = Σ (cost per run × monthly runs)
```

| Automation | Cadence | Model | Effort | Cost/run (% weekly) | Runs/month | Monthly share |
|---|---|---|---|---|---|---|
| *(fill in)* | daily | | | **[MEASURE]** | ~30 | |
| *(fill in)* | weekly | | | **[MEASURE]** | ~4.3 | |
| *(fill in)* | monthly | | | **[MEASURE]** | 1 | |

A faster baseline: pause every routine for one week and read the weekly bar. That figure is
your own interactive consumption; everything above it in a normal week is automation.

---

## 3. What actually drives the cost

Every scheduled run is a **fresh session**. Nothing carries over from the previous run — the
repository is re-cloned and all context is re-read at cold-cache rates. So cost per run is
dominated by how much context the run pulls in before it does any work.

Measured context weight in this repository:

| Scope | Size | Approx. tokens |
|---|---|---|
| Whole `seo-blueprint/` markdown set | ~175 KB | ~48k |
| Whole repository | ~193 KB | ~54k |

An automation whose prompt causes it to read the full blueprint therefore starts each run
roughly **48k input tokens in the hole**, before a single Ahrefs, Semrush, or GSC call. Run
daily, that is ~1.4M tokens/month of pure re-reading.

The second driver is **connector payloads**. Ahrefs and Semrush endpoints return large result
sets; every row lands in context. Constrain with `display_limit`, date ranges, and specific
endpoints rather than exploratory sweeps.

**The largest driver in practice is neither of those.** The ORCH cycle log of 2026-08-07
records a full master-sheet pull at **625,850 chars (~174k tokens)**, growing ~29,400
chars/day — roughly **3.6× the entire blueprint, read once per day**, to produce a ~1k-token
digest. At the observed growth rate the daily pull alone runs ~5–7M tokens/month and rises
every month. Fix: have the sheet pipeline emit a compact delta digest that ORCH reads instead.
Full analysis and the ~97% reduction path are in
[`routine-optimisation-review.md`](routine-optimisation-review.md) §Finding 1.

---

## 4. The three dials

### Dial 1 — Model, per automation
Each routine's prompt input carries a **model selector**, and the selected model is used on
every run. This is set once per routine.

### Dial 2 — Effort level
Effort defaults to `high` on every model that supports it. Scheduled runs are autonomous and
have no interactive `/effort`, so set it through the **cloud environment**:

- Set `CLAUDE_CODE_EFFORT_LEVEL=medium` (or `low`) as an environment variable on the
  environment the routine uses. The environment variable takes precedence over every other
  effort setting.
- Cleanest split: keep the **Default** environment as-is for heavy work, and create a second
  environment — e.g. **"Routines — economy"** — carrying `CLAUDE_CODE_EFFORT_LEVEL=medium`.
  Point the light automations at it.

Effort levels, cheapest first: `low`, `medium`, `high` (default), `xhigh`, `max`.

> Environment variables are visible to anyone who uses that environment. An effort level is
> not a secret, so this is safe — do not put credentials there.

### Dial 3 — Scope
The biggest lever, and the only one that is free of any quality trade-off:

- Name the exact files each automation may read. Do not let a monitoring routine open the
  whole blueprint to answer a rank-delta question.
- Move standing context (what DesiMachines is, the KPI definitions, the North Star) into a
  **skill** committed to the repo, so it loads on demand instead of being re-read wholesale.
- Remove connectors a routine does not need. Every connector included is a connector Claude
  may call, and its results are billed as input tokens.
- Prefer narrow, parameterised connector calls over exploratory ones.

---

## 5. Recommended allocation

| Tier | Work | Model | Effort | Why |
|---|---|---|---|---|
| **Daily** | Rank/GSC pull, CTR monitoring, position-4–20 watch, alert on movement | Haiku or Sonnet | `low` – `medium` | Retrieval and tabulation. No architectural judgement involved; the expensive model adds nothing. |
| **Weekly** | Site-audit deltas, competitor movement, orphan/internal-link checks, content briefs | Sonnet | `medium` – `high` | Real analysis, but against a known framework that already exists in the blueprint. |
| **Monthly** | Strategy synthesis, roadmap re-prioritisation, revenue-model recalibration | Opus | `high` | Open-ended reasoning across the whole picture — this is where the Opus allowance earns its cost. |

Moving daily and weekly automations off Opus is the single highest-value change available,
for the reason in §6.

---

## 6. Reserving headroom for your own work

There is **no feature that carves out a slice of the plan limit** for automations versus
interactive use. Four mechanisms get most of the way there:

**a) Model separation is the only true reserve.** The Opus limit is separate and applies only
to Opus requests, while session and weekly limits are shared across all models. Run every
automation on Sonnet or Haiku and the Opus allowance stays entirely intact for your own work.
This is the strongest available lever and it costs nothing.

**b) Schedule into off-hours.** The session limit is a rolling ~5-hour window. An automation
firing at 03:00 burns a window you are not working in. It still counts toward the weekly
limit, but it stops automations from locking you out mid-afternoon. Note that runs are
staggered by a few minutes, consistently per routine.

**c) Budget the daily run cap deliberately.** Keep total *scheduled* runs below the plan's
daily cap (5 / 15 / 25) so headroom remains for your own `Run now` and one-off runs. One-offs
do not count against the cap.

**d) Decide the overage failure mode, then set the ceiling.** At
`claude.ai/settings/usage` you can turn on **usage credits** and set a **monthly spend cap**:

| Usage credits | What happens at the limit |
|---|---|
| Off | Runs are **rejected** until the window resets — automations silently stop |
| On, with a monthly spend cap | Automations keep running to a known dollar ceiling, then stop |

Pick per how much a missed daily run matters. If credits are on, note that the prompt-cache
lifetime drops from one hour to five minutes on credit usage, which raises cost —
`ENABLE_PROMPT_CACHING_1H=1` restores the one-hour lifetime.

---

## 7. Implementation order

1. Measure cost per run for every automation (§2) — nothing else can be prioritised without this.
2. Move every daily and weekly automation off Opus onto Sonnet or Haiku (§6a). Largest gain, no trade-off.
3. Create the **"Routines — economy"** environment with `CLAUDE_CODE_EFFORT_LEVEL=medium` and point the daily automations at it (§4, Dial 2).
4. Tighten each automation's prompt to name the files and connector calls it may use (§4, Dial 3).
5. Re-time schedules outside working hours (§6b).
6. Turn on usage credits with a conservative monthly spend cap, or accept hard stops (§6d).
7. Re-measure after two weeks and update the §2 table.
