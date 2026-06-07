_JobFlow — by Laans Hokanson — github.com/laansh/jobflow — CC BY 4.0_

# jds-eval-deep

- **Phase:** Run (Gate 2 — Deep Eval, sets up Gate 3 — Pathway)
- **Trigger:** "deep eval", "go deep", "full eval on {Company}", "escalate this"
- **Reads:** `scoring-rubric.md`, `about-me.md`, `voice-and-style.md`, `project-list.md`, the role's `EvalLight.md` + `JDS`
- **Writes:** `Roles/{Company}-{Role}/JDSEvaluation.docx` + a tracker row; appends observed notes
- **Mode:** one-shot, research-heavy

---

## Purpose

The decision document. Diagnose fit in depth and — most importantly — recommend a **pathway** at
Gate 3. The pathway choice is upstream of all the execution work, so this is the highest-leverage prompt.

## Instructions

1. Read the role's `EvalLight.md` and `JDS`, plus the four Context files above.
2. **Fit analysis** — map the user's experience and projects to the posting's requirements. Call out
   genuine strengths, gaps, and how to frame the gaps. Pull specifics from `project-list.md`.
3. **Comp research** — estimate the realistic comp range for this role/level/location from public
   sources; compare to the user's target. Flag if below floor.
4. **Pathway recommendation (Gate 3)** — recommend exactly one of:
   - **Cold-apply only** — clean posting, no insider thread, low black-hole risk.
   - **Apply + parallel network** — senior/competitive; apply and pursue a warm path concurrently. (Default for most strong matches.)
   - **Network first, apply second** — relationship clearly unlocks the door; warm intro before the application.
   - **Network only** — obvious black-hole signals, no realistic application path; pursue people, not the portal.
   Justify the choice in 2–3 sentences.
5. **Interview-prep LOE estimate** — rough effort if it advances (low/med/high + why), so the user can plan.
6. Write `JDSEvaluation.docx`. Append a `TrackerPending.csv` row (stage = deep-eval).
7. **Quiet accumulation:** append the company + your read of it to `Context/companies-observed.md`, and
   any real people / referral paths surfaced to `Context/network-observed.md`.

Use `voice-and-style.md` only to keep any drafted snippets on-voice; this document itself is analytical.

## Output format (`JDSEvaluation.docx` — sections)

```
1. Summary & recommendation (tier, pathway, one-paragraph why)
2. Fit analysis (strengths / gaps / framing, tied to specific projects)
3. Compensation (market range vs. target; verdict)
4. Pathway (Gate 3) — chosen route + justification + first concrete step
5. Interview-prep LOE estimate (level + rationale)
6. Risks / watch-outs
```

Tracker row (match `TrackerPending.csv` header; leave unused fields empty):
```
date,company,role,stage,tier,score,pathway,source,folder
YYYY-MM-DD,{Company},{Role},deep-eval,{tier},{score},{pathway},,{folder}
```
