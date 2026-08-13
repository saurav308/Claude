# Routine Activity Review & Optimisation — DesiMachines SEO Ops

Review of the automations actually running against DesiMachines.com, based on
`seo-ops/registry.md`, the ORCH cycle log of 2026-08-07, the S-EXEC charter, and the
PR history on `saurav308/Claude`.

**Method note:** token figures are derived from character counts recorded in your own logs
at ~3.6 chars/token for mixed text and tables. They are estimates of magnitude, not billing
figures — but the ratios between them are sound, and the ranking of findings does not change
under a ±30% error on the conversion factor.

---

## Inventory — what is actually running

| # | Routine | Cadence | Owner | Chartered? |
|---|---|---|---|---|
| 1 | **ORCH** — report diff + routing | Daily ~17:45 IST; weekly scorecard Mon | This repo, `claude/desimachines-seo-growth-baknjd` | Yes |
| 2 | **S-EXEC** — site execution engineer | Write batches; weekly crawl; Mon reporting | `claude/desimachines-site-executor` | Yes (GO 2026-08-02; not started as of 08-07) |
| 3 | **Sheet daily-pulse / dashboard pipeline** | Daily 17:00; weekly analyses; Mon competitor run | External | **No** |
| 4 | **Blog-refresh engine** | ~10 posts/day (Lane A/B) | External | **No** |
| 5 | **Authority Engine** — link prospecting | Continuous | External | **No** |
| 6 | **Action-Plan compiler** | Monthly | External | **No** |
| — | PromotEdge Routines A–E | Specced, not wired (`~T+30`) | Separate business | N/A |

Four of six live routines have no charter, so their model, effort, cadence and context
footprint are unmanaged. That is where the unaccounted consumption is.

---

## Finding 1 — The master-sheet full pull is the dominant cost, and it compounds

**Evidence, from the ORCH log of 2026-08-07:**

> "master sheet full pull (sheet state 2026-08-06, **625,850 chars** vs **478,985** on 08-01)"

| Metric | Value |
|---|---|
| Sheet size, 2026-08-06 | 625,850 chars ≈ **~174k tokens** |
| Growth, 08-01 → 08-06 | +146,865 chars over 5 days ≈ **+29,400 chars/day** (~+8k tokens/day) |
| Projected size, 2026-08-13 | ~831,000 chars ≈ **~231k tokens** |
| Output produced by that run | 3,798 chars |

Two things follow:

1. **The input-to-output ratio is ~165:1 by character count.** ~174k tokens are read to
   produce a ~1k-token digest. Run daily, that is **~5.2M tokens/month** at the 08-06 size —
   and roughly **~7M/month** at the 08-13 size.
2. **The growth is the bigger problem.** At the observed rate, the sheet's expansion alone
   adds on the order of **~3.8M tokens over a month of daily runs**, and that figure grows
   every month, because daily tabs accumulate and nothing prunes them.

The full workbook is being re-read to answer a question that is purely about **deltas**.

### Fix 1a — Have the producer emit the digest (biggest single win)
Routine 3 already refreshes the workbook daily and has the data in hand at that moment.
Have it write a compact `daily-digest` tab or JSON artifact containing only:

- click / impression / CTR / position deltas by page-type (29 rows)
- top 20 movers, up and down
- new rows in 🚨 Alerts since last run
- lead counts by type, 7d and 30d
- a `sheet_state_date` stamp

ORCH then reads the digest, not the workbook.

> **~174k → ~5k tokens per run. ~97% reduction on the single largest line item in the
> operation**, and it removes the compounding growth entirely. Computing the delta inside
> the producer is close to free — it already holds both states.

### Fix 1b — Cap the workbook
Archive daily tabs older than 90 days into a separate workbook. Without this, every
consumer of the sheet gets more expensive every day, forever.

---

## Finding 2 — The 4-agent fan-out multiplies the same context

The 08-07 run used a "4-agent digest+diff workflow (`wf_fea20050-453`)". Each teammate
carries its own context window, so a fan-out over one large document multiplies the
document, not the throughput. Agent teams run substantially more tokens than a single
session for exactly this reason.

Digest-and-diff over a single workbook is **IO-bound, not reasoning-bound** — it is the
wrong shape for fan-out.

**Fix:** with Fix 1a applied, the input is ~5k tokens and one session handles it. Drop the
fan-out here. Reserve multi-agent for genuinely independent tracks (e.g. the 33-domain
competitor sweep, where each domain is separable), and keep teammates on Sonnet.

---

## Finding 3 — Daily cadence on data that does not move daily

From the same log:

> "GSC daily through **07-29** on API, sheet's Daily Trend through **08-04**"

The run executed on 08-07 was diffing GSC data that was **5–9 days stale**. Meanwhile the
findings it reports are all multi-period trends: top-3 erosion "3rd straight period",
impressions "−10% since June", CTR "holding 0.94–0.95%".

A daily deep-diff over weekly-moving, week-lagged data re-derives the same conclusions most
days. That is the definition of a cadence mismatch.

**Fix — split ORCH into two routines:**

| | Daily tripwire | Weekly deep diff |
|---|---|---|
| Reads | 🚨 Alerts tab + last Daily Trend row + lead counts | Full digest (Fix 1a) + GSC 0-unit endpoints |
| Does | Threshold check; escalate only on a trip | Today's full diff, routing, scorecard |
| Output | Silent, or one alert | The 08-07-style report |
| Model / effort | **Haiku · low** | **Sonnet · medium** |
| Est. tokens/run | ~2–5k | ~15–25k |

This converts **30 heavy runs/month into ~4 heavy + ~26 trivial**, and it *improves*
signal — a silent day becomes meaningful instead of another full report nobody needed.
Fold the Monday scorecard into the weekly deep diff; they read the same inputs.

---

## Finding 4 — Third-party API quota is the binding constraint, and it is being rediscovered

Evidence across four separate work streams:

| Source | Finding |
|---|---|
| Registry | "quota exhausted until 2026-08-09; ≤5k units/week after" |
| ORCH log 08-07 | "Semrush top-up (still 0 units)" |
| PR #3 | "the Ahrefs plan has lapsed (`Insufficient plan`, verified), and Semrush API units are at zero (verified)" |
| PR #4 | "Ahrefs units reset 9 Aug; Semrush units exhausted; GSC not connected in Ahrefs" |

Three different sessions each spent a run **independently discovering and re-documenting the
same exhaustion**. That is pure waste — tokens spent to learn a fact the registry already knew.

**Fixes:**
1. **Quota state lives in the registry, and every routine reads it first.** Add a
   `## Quota state` block: Ahrefs units remaining, Semrush units, next reset date, weekly
   budget. One line each. Any routine that finds it stale updates it.
2. **Make the 0-unit rule explicit in every prompt.** The registry already establishes that
   `gsc-*` and `web-analytics-*` on Ahrefs project 9518353 cost 0 units. That should be the
   default path, with paid endpoints requiring the budgeted window.
3. **One weekly budgeted paid-sweep run.** The 08-07 log already plans this ad-hoc —
   "protect the Aug-9/10 Ahrefs reset run (25-domain sweep + AE-001 + orphan export + Brand
   Radar prompts, budgeted)". Make it a permanent weekly routine with a hard unit ceiling
   rather than a thing that gets protected by hand each cycle.

---

## Finding 5 — Six sessions, no shared context layer

Every session independently reads the registry, the blueprint, and the sheet. The
`seo-blueprint/` set alone is **~48k tokens**, re-read cold on every run that touches it,
because scheduled runs share no cache.

**Fix:** commit a **skill** at `.claude/skills/desimachines-context/SKILL.md` holding the
standing facts that never change run-to-run:

- North Star and KPI definitions
- the 29 page-types and what each is for
- session ownership boundaries (who may touch blog posts, products, templates)
- the guardrails: product-title veto, ask-first list, kill switch
- the quota rules from Finding 4

Skills load on demand rather than being re-read wholesale, and every routine gets the same
ground truth. Target ~2–3k tokens. Then instruct each routine to reference blueprint docs
**by path when needed** rather than reading the set.

---

## Finding 6 — Retired sessions still have live branches and open PRs

The registry retires two sessions:

> "PR#2 `claude/search-console-errors-9frpb9` (GSC triage) — one-shot runbook; merge into
> canonical branch, retire session."
> "PR#3 `claude/tech-stack-seo-viability-4qo1vc` (perf/security kit) — artifacts adopted as
> S-EXEC inputs; merge (renumber doc-20 collision), retire session."

Both branches still exist and both PRs are still open. **If either still has a schedule
attached, it is consuming runs against the daily cap and producing nothing.**

**Fix:** confirm at `claude.ai/code/routines` that no trigger points at a retired session,
then merge and delete the branches. Separately, PR #6 targets base
`claude/desimachines-seo-strategy-hdgg2p` rather than `main` — retarget it before merging or
it will drag the blueprint branch's history along.

---

## Finding 7 — The daily run cap may already be the binding limit

Counting scheduled runs per day: ORCH daily (1) + sheet pipeline (1) + blog-refresh engine
(~10, if each post refresh is its own run) = **~12/day before S-EXEC starts.**

The routine cap is 5/day on Pro, 15/day on Max, 25/day on Team and Enterprise. On Max that
leaves ~3 runs of headroom, and S-EXEC is chartered to add write batches, a weekly crawl and
Monday reporting on top.

**Fix:** batch the blog refreshes. Ten posts in one run costs far less than ten runs — a
single session amortises its context across all ten, where ten runs each pay the full cold
start. This also frees ~9 slots/day against the cap.

---

## Finding 8 — Blog-refresh engine is round-robin, not demand-driven

Register at 64/180 with a 10/day cadence: the engine is walking the full post list in order.
Meanwhile the ORCH log identifies exactly which pages are decaying (`jcb-nxt-215` −349 clicks
@999k impressions, the SLCM family, the crane cluster).

**Fix:** drive the refresh queue from the decay list rather than the register order. Same
token spend, aimed at pages that are actually losing clicks. Charter it, put it on Sonnet.

---

## Recommended model & effort assignment

| Routine | Cadence after change | Model | Effort | Rationale |
|---|---|---|---|---|
| ORCH tripwire *(new)* | Daily | **Haiku** | `low` | Threshold check on a handful of rows |
| ORCH deep diff + scorecard | **Weekly (Mon)** | **Sonnet** | `medium` | Analysis against a framework that already exists |
| Sheet pipeline + digest emit | Daily | **Sonnet** | `medium` | Mechanical transform; add the digest output |
| Blog refresh (batched, decay-driven) | Daily, 1 run | **Sonnet** | `medium` | Content generation to a house style |
| Authority Engine | Weekly | **Sonnet** | `medium` | Prospecting and drafting |
| Ahrefs paid sweep *(new, budgeted)* | Weekly | **Sonnet** | `low` | Pure retrieval against a fixed unit ceiling |
| S-EXEC write batches | Per batch | **Sonnet** | `high` | Live-site writes; correctness matters |
| S-EXEC Phase 1 deep dive | One-off | **Opus** | `high` | Genuinely open-ended; worth the Opus allowance |
| Action-Plan compiler | Monthly | **Opus** | `high` | Synthesis across the whole picture |
| Monthly red-team memo | Monthly | **Opus** | `high` | Adversarial reasoning, no fixed framework |

Keeping every daily and weekly routine off Opus leaves the **separate Opus limit** intact for
your own interactive work and for the two monthly strategy runs — see
`ops/automation-token-budget.md` §6a.

---

## Execution order

1. **Fix 1a — producer-side daily digest.** Largest win by a wide margin; nothing else
   comes close. Do this before touching anything else.
2. **Finding 3 — split ORCH into daily tripwire + weekly deep diff.** Cuts 30 heavy runs to ~4.
3. **Finding 6 — verify no triggers remain on retired sessions;** merge and delete those branches.
4. **Finding 7 — batch the blog refreshes into one run/day.** Frees ~9 daily-cap slots.
5. **Finding 4 — quota block in the registry + one weekly budgeted paid sweep.**
6. **Finding 5 — commit the shared context skill.**
7. **Finding 2 — drop the 4-agent fan-out** on the diff once the digest lands.
8. Charter routines 3–6 in the registry with model, effort, cadence and context budget recorded.
9. Re-measure per §2 of `ops/automation-token-budget.md` and fill in the `[MEASURE]` table.

Items 1–4 address the great majority of the consumption and none of them reduces coverage —
the daily loop still watches the same signals, it just stops re-reading a growing workbook to
learn what changed yesterday.
