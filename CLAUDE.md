# JobFlow — PromptlyDo Artifact Build

## What this repo is

This repo is the working home for turning **JobFlow** — a sanitized, portable job-hunt
workflow — into shippable artifacts. It is *not* an instance of the personal job hunt itself;
it is the place where the publishable version of the workflow is authored, refined, and packaged.

> Naming note: the GitHub repo is `laansh/JobFlow` (renamed from `JobHunt`; GitHub redirects the
> old URL) and the remote alias is `origin`. `JobFlow.md` also describes an end-user runtime folder
> layout called `JobFlow/` — that's the user's folders, not this repo. The only lingering `JobHunt`
> name is the local working-directory path `...\Repos\JobHunt`, left unrenamed to avoid breaking
> active sessions.

> Pattern note: this is expected to be the **first of several** sanitized workflows (other goals,
> other domains) that follow the same shape. So the structure of the artifacts here matters
> beyond this single deliverable — design for reuse.

## Delivery approach (current)

PromptlyDo.com is the eventual publishing target, but it is **pending a bug review**, so for now
the project proceeds as **plain markdown files in this repo**. Prompt bodies and guides are
authored as standalone `.md` files; once PromptlyDo is fully available we export/port them into
that environment. Keep each prompt self-contained so the later export is mechanical.

See [PromptlyJobFlow/deploydecision.md](PromptlyJobFlow/deploydecision.md) for how the primary
product reaches end users: a downloadable starter kit targeting Tiers A & B (filesystem / project
persistence). Tier C (stateless chat) is descoped from the primary product and deferred to PromptlyDo
post-launch. All prompts/artifacts carry a `JobFlow — CC BY 4.0` banner.

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

Working artifacts (authored as markdown now; portable to PromptlyDo later):
1. Prompt bodies for each of the ~11 named prompts (5 seeding + 5 per-role + 1 refresh),
   each self-contained and declaring which Context files it reads / which folder it writes.
2. A landing page / guide walking a new user through the three phases (esp. Phase 0 setup).
3. Optional starter Context templates (illustrative, not anyone's real files).
4. A consistent naming/packaging convention so each prompt is a discrete shareable unit.

`JobFlow.md` is the *brief*, not the deliverable.

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

1. PromptlyDo delivery shape (deferred): downloadable bundle, copy-paste prompt cards, or guided
   web flow? Resolve when PromptlyDo's bug review clears; markdown-first until then.
2. Seeding prompts one-shot or conversational? (Q&A / gap-filling are better multi-turn.)
3. Licensing posture between Laans and PromptlyDo (attribution, exclusivity, withdrawal rights).
4. Multi-tool portability — design works in ChatGPT/Cursor/etc., not just Claude; say so.
5. Companion sanitized prompt bodies are likely the core deliverable for the next round.

## Suggested first move

Confirm delivery format (open question #1), then draft the eleven prompt bodies. Start with the
five seeding prompts — most novel, most differentiating, and they unlock everything downstream.

## Source / privacy

- [PromptlyJobFlow/JobFlow.md](PromptlyJobFlow/JobFlow.md) — sanitized spec, safe to publish.
- The original `progress.md` context-transfer brief named live job targets and has been **removed
  from this repo** after its sanitized, generalizable content was folded into this CLAUDE.md. The
  private original remains only in Laans's `GETAJOBa/PromptlyJobHunt/` working directory.
- The original private source (`SkillSuite.md` and the real `.claude/skills/*` under `GETAJOBa/`)
  is **not** imported and must not be re-exposed.
