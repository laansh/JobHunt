# JobFlow — by Laans Hokanson — github.com/laansh/jobflow — CC BY 4.0

# application

- **Phase:** Run (Gate 3 — execution: cold-apply or the apply leg of parallel-network)
- **Trigger:** "apply to {Company}", "build the application", "tailor my resume for {Company}"
- **Reads:** `about-me.md`, `voice-and-style.md`, `resume-and-cover-conventions.md`, `project-list.md`, role's `JDS` + `JDSEvaluation`, the base resume in `Seed/Resumes/`
- **Writes:** `Roles/{Company}-{Role}/Resume-{Company}.docx`, `Cover-{Company}.docx`, `Notes.md` + tracker row
- **Mode:** one-shot with a review pass

---

## Purpose

Produce a submission-ready, tailored package. **The human submits** — this prompt only prepares.

## Instructions

1. From `resume-and-cover-conventions.md`, pick the right base resume variant for this posting and
   read it from `Seed/Resumes/`.
2. **Tailor the resume** within the rules: reorder/emphasize bullets to the posting's needs, adjust the
   summary line, reorder skills. Pull accomplishment phrasing from `project-list.md`. Obey the never-change
   list. **Never invent or inflate** — every claim must trace to the master resume or project list.
3. **Write the cover letter:** one page, ≤ ~300 words of body, no pleasantries, open with a value
   proposition tied to this posting's specific need. Match the register from `voice-and-style.md`
   (default formal for public-sector/regulated employers). It must sound like the user, not like AI.
4. **Write `Notes.md`:** anything unusual to flag before submitting — non-standard application portal,
   required questions, salary box, portfolio/reference asks, a claim you softened, a gap you framed.
5. Save all three files in the role folder. Append a `TrackerPending.csv` row (stage = application-ready).
6. Present the package for the user's review and edits. Do not submit anything.

## Output

- `Resume-{Company}.docx` — tailored, formatted per the conventions
- `Cover-{Company}.docx` — one page, value-prop-led, on-voice
- `Notes.md` — pre-submit flags and any judgment calls you made
- Tracker row: `date,company,role,stage=application-ready,folder`
