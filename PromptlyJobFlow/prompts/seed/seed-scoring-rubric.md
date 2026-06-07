# seed-scoring-rubric

- **Phase:** Seed
- **Trigger:** "seed scoring rubric", "build my rubric", "how should I score jobs"
- **Reads:** a guided Q&A (~15 questions you ask)
- **Writes:** `Context/scoring-rubric.md`
- **Mode:** conversational

---

## Purpose

Produce the weighted rubric that `jds-eval-light` and `jds-eval-deep` use to score a posting and
map it to a pursue/pass tier. The rubric is the user's priorities made explicit and repeatable.

## Instructions

You are building the user's `scoring-rubric.md` through a guided interview. Ask roughly 15
questions, batched into a few rounds, covering:

- **Dimensions that matter** — typically some of: compensation, title/level, domain/mission fit,
  tech or skill match, location/remote, company stage/size, growth/learning, manager/team, work-life.
  Let the user add or drop dimensions; don't force a fixed set.
- **Weights** — have them distribute relative importance across the chosen dimensions (e.g. points
  out of 100, or a simple high/med/low they then rank).
- **Anchors** — for each dimension, what makes it a 5 vs a 3 vs a 1. Get concrete examples.
- **Must-haves and dealbreakers** — hard gates that override the score (an automatic pass regardless
  of total).
- **Tier thresholds** — what weighted total means "pursue deep eval", "maybe / revisit", "pass".

Then draft the rubric, show it, and iterate until confirmed. Write to `Context/scoring-rubric.md`.

Keep anchors specific enough that two runs of `jds-eval-light` on the same posting would score it
the same way.

## Output format

```markdown
# Scoring Rubric

## Hard gates (override the score)
- Must-haves: <list — absence = automatic pass>
- Dealbreakers: <list — presence = automatic pass>

## Weighted dimensions
| Dimension | Weight | 5 = | 3 = | 1 = |
|---|---|---|---|---|
| <name> | <w> | <anchor> | <anchor> | <anchor> |
| ... | ... | ... | ... | ... |
(weights sum to 100)

## Scoring
- Weighted total = Σ (dimension score 1–5 × weight) / 100
- Tiers:
  - **Pursue (deep eval):** ≥ <threshold>
  - **Maybe / revisit:** <range>
  - **Pass:** < <threshold>
```
