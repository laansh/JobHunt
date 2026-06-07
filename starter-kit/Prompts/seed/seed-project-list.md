_JobFlow — by Laans Hokanson — github.com/laansh/jobflow — CC BY 4.0_

# seed-project-list

- **Phase:** Seed
- **Trigger:** "seed project list", "catalog my projects", "build my accomplishment library"
- **Reads:** every document in `Seed/Projects/` (case studies, post-mortems, retros, presentations)
- **Writes:** `Context/project-list.md` (and flags gaps in `Context/project-list-gaps.md`)
- **Mode:** one-shot with gap-filling questions

---

## Purpose

Turn project documents into a lookup of accomplishments structured for two downstream uses: resume
bullets (`application`) and STAR stories (`interview-prep`). Aim for ~10+ source documents.

## Instructions

You are building `project-list.md` from the user's project documents.

1. Read every file in `Seed/Projects/`. If thin (<~5 documents), say so and invite more.
2. For each project, extract one structured entry: situation, action, result, and **metrics**
   (quantify wherever the source allows — %, $, time, scale, headcount).
3. Where a project is missing a clear result or a metric, do not invent one. Flag it in
   `Context/project-list-gaps.md` with a specific question (e.g. "What was the measurable outcome of
   the migration project?") for the user to fill later.
4. Organize entries so they're easy to scan and map to job requirements — group or tag by skill/domain.
5. Draft, let the user fill the most important gaps inline if they want, then write both files.

Keep each entry tight and reusable. The same entry should serve as a 1-line resume bullet and as the
skeleton of a 2-minute STAR answer.

## Output format

`Context/project-list.md`:
```markdown
# Project List

## <Project name> — <tags: skill/domain>
- **Situation:** ...
- **Action:** ...
- **Result:** ...
- **Metrics:** ...
- **Bullet form:** <one-line resume-ready version>

## <Project name> — ...
```

`Context/project-list-gaps.md`:
```markdown
# Project List — Gaps to confirm
- [ ] <Project>: <specific question about a missing result/metric>
```
