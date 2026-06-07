_JobFlow — by Laans Hokanson — github.com/laansh/jobflow — CC BY 4.0_

# jds-eval-light

- **Phase:** Run (Gate 1 — Triage)
- **Trigger:** "light eval", "triage this", "run evals", "check the unevaluated folder"
- **Reads:** `Context/scoring-rubric.md` + a small inline facts block (NOT the full `about-me.md`)
- **Writes:** `Roles/{Company}-{Role}/{Company}-EvalLight.md` + one row to `TrackerPending.csv`
- **Mode:** one-shot, token-cheap

---

## Purpose

Fast triage. Decide whether a posting is worth the cost of a deep eval. This prompt runs constantly,
so it must stay cheap — it reads the rubric and a half-dozen inline facts, not the whole Context library.

## Inline facts (paste/maintain these here — do not read about-me.md)

```
Current title/level: <…>
Target comp floor: <…>
Must-haves: <…>
Dealbreakers: <…>
Location/remote: <…>
```

## Instructions

1. Take the JDS — pasted, or a file in `Unevaluated/` (a `.md`/`.txt` of copied text, or a `.pdf`,
   including PDFs the user printed from LinkedIn or other job boards). If batch-triaging, process every
   posting in the folder in turn.
2. Create the role folder `Roles/{Company}-{ShortRoleTitle}/` (PascalCase, no spaces) and save the
   original posting there as `JDS.md`/`JDS.pdf`.
3. Apply hard gates first: any dealbreaker present or must-have absent → tier **Pass**, stop scoring.
4. Otherwise score each rubric dimension 1–5, compute the weighted total, map to a tier.
5. Write a short `{Company}-EvalLight.md` (see format). Keep it to a screen.
6. Append one row to `TrackerPending.csv`.

Do not do company research, comp research, or pathway analysis here — that's `jds-eval-deep`. Stay light.

## Batch / scheduled use

This prompt is designed to run in bulk against everything in `Unevaluated/`, so the user can drop
postings throughout the day and triage them all at once. If the tool supports scheduled or automated
runs (e.g. Claude Code routines/cron, Tier A), point a **nightly** run at `Unevaluated/` — triage then
happens off-peak and doesn't burn prime-time/interactive tokens. After a scheduled run, move processed
postings out of `Unevaluated/` (into their new `Roles/` folder, or `Archive/` if passed) so the next
run only sees new ones.

## Output format

`{Company}-EvalLight.md`:
```markdown
# {Company} — {Role} — Light Eval

**Tier:** Pursue / Maybe / Pass   **Weighted score:** X.X / 5
**Date:** YYYY-MM-DD   **Source:** <url or where it came from>

## Hard gates
- Dealbreakers present: none / <…>   |   Must-haves met: yes / <missing>

## Scores
| Dimension | Score (1–5) | Note |
|---|---|---|
| ... | ... | one line |

## Verdict
<2–3 sentences: pursue and why, or pass and why. If Pursue, recommend running jds-eval-deep.>
```

`TrackerPending.csv` row (match the file's header; leave unused fields empty):
```
date,company,role,stage,tier,score,pathway,source,folder
YYYY-MM-DD,{Company},{Role},light-eval,{tier},{score},,{source},{folder}
```
