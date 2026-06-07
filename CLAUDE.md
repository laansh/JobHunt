# JobHunt — PromptlyDo "JobFlow" Artifact Build

## What this repo is

This repo is the working home for turning **JobFlow** — a sanitized, portable job-hunt
workflow — into shippable artifacts for **PromptlyDo.com**. It is *not* an instance of the
personal job hunt itself; it is the place where the publishable version of the workflow is
authored, refined, and packaged.

> Naming note: `JobFlow.md` describes a folder layout that is *also* called `JobHunt/`. That
> is the end-user's runtime folder structure, not this repo. Don't conflate the two.

## The workflow (one paragraph)

A job seeker uploads existing material (resumes, writing samples, project docs) into seeding
folders. Five **seeding prompts** analyze that material into a five-file **Context library**
(`about-me`, `scoring-rubric`, `voice-and-style`, `resume-and-cover-conventions`,
`project-list`). Then, per posting, five **core prompts** run a pipeline: triage
(`jds-eval-light`) → deep eval (`jds-eval-deep`) → pathway selection → execution
(`application` and/or `connect`) → `interview-prep` (re-run per round). Phase 1 prompts quietly
accumulate observed companies, network paths, and gap notes; a monthly `refresh-context`
prompt promotes those into the canonical Context files. Three phases: **Seed → Run → Refresh**.

See [PromptlyJobFlow/JobFlow.md](PromptlyJobFlow/JobFlow.md) for the full spec.

## The deliverable

Working artifacts for PromptlyDo.com — most likely:
1. Prompt bodies for each of the ~11 named prompts (5 seeding + 5 per-role + 1 refresh),
   each self-contained and declaring which Context files it reads / which folder it writes.
2. A landing page / guide walking a new user through the three phases (esp. Phase 0 setup).
3. Optional starter Context templates (illustrative, not anyone's real files).
4. A consistent naming/packaging convention if PromptlyDo treats each prompt as a unit.

The two source docs are the *brief*, not the deliverable.

## Locked design decisions (do not re-litigate)

- **Three explicit phases** (Seed / Run / Refresh). Seeding is mandatory — nobody hand-writes
  the Context library; it is built from uploaded artifacts + guided Q&A.
- **Seeding inputs:** `about-me` (free-text dump), `scoring-rubric` (~15-question Q&A),
  `voice-and-style` (analyze `Seed/VoiceSamples/`), `resume-and-cover-conventions`
  (analyze `Seed/Resumes/`), `project-list` (analyze `Seed/Projects/`).
- **No upfront `target-companies.md` / `network-map.md`** — Phase 1 accumulates these into
  `companies-observed.md` / `network-observed.md`; `refresh-context` promotes on confirmation.
- **Five per-role prompts, four gates, four pathways at Gate 3** (cold-apply / parallel-network
  / network-first / network-only). Battle-tested over months — keep it.
- **One folder per role; the folder name is the join key.** Prompts find each other's outputs
  by folder convention. No database / web app / alternative state model.
- **CSV append + manual reconciliation to XLSX.** Cloud-sync locks break automated spreadsheet
  writes; append-only CSV doesn't. The split is intentional.
- **LinkedIn / application submit / outreach send: all manual.** Prompts draft and track only.
  Hard constraint (LinkedIn automation is unreliable and risks account restriction).

## Constraints to avoid violating

- **Don't expose personal data.** Salary targets, certs, resume filenames, and real
  employer/target-company references stay private. The public artifacts carry patterns, not
  specifics.
- **Don't propose a database, web app, or backend** — the folder-as-database design is intentional.
- **Don't automate LinkedIn.** Hard no.
- **Don't pad prompts with safety-theater preambles.** Source prompts are terse and direct; match that.
- **Don't expand `jds-eval-light`.** It runs constantly and must stay token-cheap (inline-facts
  pattern, not full `about-me.md`).

## Open questions (confirm before finalizing artifact format)

1. PromptlyDo delivery shape: downloadable bundle, copy-paste prompt cards, or guided web flow?
2. Seeding prompts one-shot or conversational? (Q&A / gap-filling are better multi-turn.)
3. Licensing posture between Laans and PromptlyDo (attribution, exclusivity, withdrawal rights).
4. Multi-tool portability — design works in ChatGPT/Cursor/etc., not just Claude; say so.
5. Companion sanitized prompt bodies are likely the core deliverable for the next round.

## Suggested first move

Confirm delivery format (open question #1), then draft the eleven prompt bodies. Start with the
five seeding prompts — most novel, most differentiating, and they unlock everything downstream.

## Source / privacy

- [PromptlyJobFlow/JobFlow.md](PromptlyJobFlow/JobFlow.md) — sanitized spec, safe to publish.
- `PromptlyJobFlow/progress.md` — context-transfer brief; **git-ignored** because it names live
  job targets. Local reference only; do not commit to this public repo.
- The original private source (`SkillSuite.md` and the real `.claude/skills/*` under `GETAJOBa/`)
  is **not** imported and must not be re-exposed.
