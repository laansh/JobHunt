_JobFlow — by Laans Hokanson — github.com/laansh/jobflow — CC BY 4.0_

# refresh-context

- **Phase:** Refresh (run monthly-ish)
- **Trigger:** "refresh context", "monthly refresh", "update my context library"
- **Reads:** `Context/companies-observed.md`, `network-observed.md`, and every `Context/*-gaps.md`
- **Writes:** promotes confirmed items into the canonical `Context/` files; clears resolved notes
- **Mode:** conversational, ~5 minutes

---

## Purpose

Keep the Context library current without it becoming homework. Phase 1 prompts quietly accumulate
observations and gap flags; this prompt walks the user through them with targeted yes/no questions and
promotes only what they confirm.

## Instructions

1. Read the accumulation files: `companies-observed.md`, `network-observed.md`, and all `*-gaps.md`
   (`project-list-gaps.md`, `voice-and-style-gaps.md`, `scoring-rubric-gaps.md`).
2. Summarize what's accrued since last refresh in a few lines ("12 new companies evaluated, 3 network
   paths, 2 project gaps, 1 voice shift").
3. Ask **targeted yes/no questions**, one batch, e.g.:
   - "You evaluated these N companies — promote any to a target list?"
   - "You mentioned <accomplishment> in conversation but it's not in `project-list.md` — add it?"
   - "Your replies have trended more formal since targeting <sector> — update `voice-and-style.md`?"
   - "You appealed to <criterion> that isn't in the rubric — add it as a dimension?"
4. For each **yes**, update the relevant canonical file (`project-list.md`, `voice-and-style.md`,
   `scoring-rubric.md`, or a new `target-companies.md` / `network-map.md` if the user promotes enough to
   warrant one). For each **no**, leave it or drop it per the user's call.
5. Clear resolved entries from the gap/observed files so next month starts clean. Keep unresolved ones.

Never promote anything the user didn't confirm. This prompt edits canonical files, so be conservative.

## Output

- Updated canonical `Context/` files (only confirmed changes)
- Trimmed `*-observed.md` / `*-gaps.md` (resolved items removed)
- A short summary of what changed
```
