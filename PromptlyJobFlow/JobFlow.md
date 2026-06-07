# JobFlow — A Prompt-Driven Job Hunt Workflow

A connected pipeline that moves a job posting from inbox to offer using a small set of reusable prompts (skills), four decision gates, and one folder per role. The workflow runs in three phases: **Seed** the context library once, **Run** the per-role pipeline as postings arrive, **Refresh** the library periodically so it stays current.

---

## The Premise

Most job-hunt advice is fragmented: a resume tip here, a networking script there, an interview prep checklist somewhere else. JobFlow stitches the entire pipeline together so that every prompt in the sequence can read what the prior prompt produced, and every output lands in a predictable place.

The leverage is in the **context library** — a set of reference documents that describe who you are, how you write, what jobs you want, what you've done, and what you have to offer. Once that library exists, the per-role prompts get sharper and cheaper every time you use them.

The library is not something you sit down and write from scratch. You build it by uploading material you already have (resumes, cover letters, project write-ups, performance reviews, LinkedIn posts, anything that sounds like you) and letting seeding prompts assemble it for you. You refine it over time as you use it.

---

## The Three Phases

```
   PHASE 0: SEED            PHASE 1: RUN             PHASE 2: REFRESH
   ─────────────────        ─────────────────        ─────────────────
   Run once, up front.      Run per posting.         Run periodically
   Builds the Context       Five prompts move a      (monthly, or when
   library by analyzing     posting from triage to   something changes).
   documents you upload.    interview prep.          Library stays current.
```

You'll do Phase 0 once. Phase 1 runs on every interesting posting. Phase 2 keeps the context library from going stale as your story evolves.

---

# PHASE 0 — Seed the Context Library

Five seeding prompts build the context library from material you upload into dedicated folders. None of them ask you to handwrite a structured document; they read what you already have and produce the structured output.

## Seeding Prompts

| Prompt | What it reads | What it produces | Effort from you |
|---|---|---|---|
| `seed-about-me` | A free-text dump you paste in: career story, identity facts, what you're looking for, anything you'd say in a conversation. No format required. | `Context/about-me.md` — structured profile (identity, credentials, career arc, differentiators, target role/comp/location) | 30–60 min talking into a chat |
| `seed-scoring-rubric` | A guided Q&A — the prompt asks you ~15 questions (must-haves, dealbreakers, weight on title vs. comp vs. location vs. domain, what makes a 5 vs. a 3 in each dimension) | `Context/scoring-rubric.md` — weighted dimensions, 1–5 definitions per dimension, decision matrix that maps weighted total to tier | 20–30 min answering questions |
| `seed-voice-and-style` | Everything in `VoiceSamples/` — emails, blog posts, cover letters, LinkedIn comments, anything you wrote in your own voice | `Context/voice-and-style.md` — tone descriptors, sentence-structure patterns, signature word choices, dos and don'ts, calibration notes (when you write more formally vs. casually) | Upload files, confirm the prompt's draft |
| `seed-resume-library` | Every resume in `Resumes/` (master, variants, prior versions you've used) | `Context/resume-and-cover-conventions.md` — catalog of variants with "use this one when…" rules, tailoring conventions, what to reorder/swap/never-change. Cover-letter structural rules. | Upload files, answer clarifying questions |
| `seed-project-list` | Every project document in `Projects/` — case studies, post-mortems, retro notes, presentations, anything that documents what you actually did | `Context/project-list.md` — one entry per project (situation, action, result, metrics), organized for easy lookup as resume bullets and STAR stories | Upload files, fill any gaps the prompt flags |

## Seeding Folders You Set Up

```
JobHunt/
├── Seed/
│   ├── VoiceSamples/    ← drop emails, blog posts, LinkedIn writing, cover letters here
│   ├── Resumes/         ← every resume version you want considered, plus a cover template
│   └── Projects/        ← project documents, case studies, post-mortems, retro notes
```

Quality of seeding matters. The prompts can only produce a voice guide as good as the writing samples you give them; the project list can only be as deep as the source documents. Aim for ~20+ writing samples and ~10+ project documents if you can.

## What Comes Out of Phase 0

```
JobHunt/Context/
├── about-me.md
├── scoring-rubric.md
├── voice-and-style.md
├── resume-and-cover-conventions.md
└── project-list.md
```

These five files are read by every per-role prompt downstream. You can edit them by hand any time — they're just markdown. The seeding prompts get you to a strong starting point fast; your hands-on refinements make them yours.

## What Is Deliberately NOT Seeded

Two things you might expect — a `target-companies.md` and a `network-map.md` — are not seeded up front. Most people can't enumerate either of those cold, and a stale list is worse than no list. Instead, the per-role prompts in Phase 1 quietly accumulate this context as you use the system (see Phase 2).

---

# PHASE 1 — Run the Per-Role Pipeline

Five prompts move a single posting from inbox to interview prep. Each prompt reads the Context library, writes its output into the role's folder, and (where useful) appends to the trackers.

## The Five Core Prompts

| Prompt | When you run it | What it produces |
|---|---|---|
| `jds-eval-light` | A job description arrives — quick triage | A short markdown evaluation with a weighted score and a "pursue / pass" tier |
| `jds-eval-deep` | The light eval scored high enough to justify the time | A formatted document covering fit analysis, comp research, recommended pathway, and an interview-prep level-of-effort estimate |
| `application` | You've decided to apply | A tailored resume, a tailored cover letter, and a notes file flagging anything unusual about the submission |
| `connect` | The deep eval recommends networking instead of (or alongside) applying | Copy-paste-ready outreach messages and a list of warm-intro paths from public sources |
| `interview-prep` | An interview is scheduled | A one-page briefing, targeted STAR stories, questions to ask, a glossary of company/industry terms, and a positioning script |

## The Decision Tree

```
JDS arrives
   │
   ▼
Gate 1: TRIAGE  ───── jds-eval-light ──── score below threshold ──► archive
   │
   │ score meets threshold
   ▼
Gate 2: DEEP EVAL  ── jds-eval-deep
   │
   │ read the pathway recommendation
   ▼
Gate 3: PATHWAY  ─── one of four routes:
   │
   ├── cold-apply only ────────── application
   ├── apply + parallel network ─ application AND connect (concurrent)
   ├── network first, apply 2nd ─ connect → wait for response → application
   └── network only ───────────── connect (no application)
   │
   ▼
Gate 4: INTERVIEW  ── interview-prep — re-run for each round
   │
   ▼
outcome
```

The four pathways at Gate 3 are the heart of the system. Most senior or competitive postings benefit from the "apply + parallel network" pattern; postings with no insider thread and obvious black-hole signals benefit from networking only. The deep eval is what diagnoses which.

## Per-Role Folder Convention

One folder per role. The folder name is how the prompts find each other's outputs — don't rename folders manually mid-pipeline.

```
JobHunt/Roles/{CompanyName}-{ShortRoleTitle}/    (PascalCase, no spaces)
├── JDS.md or JDS.pdf                            (original posting)
├── {Company}-EvalLight.md                       (jds-eval-light output)
├── JDSEvaluation.docx                           (jds-eval-deep output)
├── Resume-{Company}.docx                        (application output)
├── Cover-{Company}.docx                         (application output)
├── Notes.md                                     (anything to flag pre-submit)
├── Outreach.md                                  (connect output)
└── InterviewPrep/
    ├── PhoneScreen-YYYY-MM-DD/
    │   ├── Briefing.md
    │   ├── Stories.md
    │   └── Questions-to-ask.md
    └── Panel-YYYY-MM-DD/
        └── ...
```

## What Each Per-Role Prompt Reads

| Context file | jds-eval-light | jds-eval-deep | application | connect | interview-prep |
|---|---|---|---|---|---|
| `scoring-rubric.md` | yes | yes | — | — | — |
| `about-me.md` | inline summary | yes | yes | yes | yes |
| `voice-and-style.md` | — | yes | yes | yes | yes |
| `resume-and-cover-conventions.md` | — | — | yes | — | — |
| `project-list.md` | — | yes | yes | — | yes |

`jds-eval-light` runs often and should stay token-light. Inline the half-dozen facts it actually needs (current title, target salary, must-haves, dealbreakers) directly into the prompt rather than reading the full `about-me.md`. The other four prompts can afford the full library.

## Tracker Mechanics

Each per-role prompt appends a status row to a CSV. The CSV is the prompts' write target; your spreadsheet is the human-facing roll-up. Why split them: spreadsheets in cloud-sync folders get locked while a prompt is writing, and CSV append-only is bulletproof.

```
JobHunt/
├── TrackerPending.csv         (every prompt appends one row)
├── OutreachTracker.csv        (connect — one row per contact attempt)
└── JobSearchStatus.xlsx       (master tracker, reconciled manually)
```

Reconcile the CSVs into the master spreadsheet on whatever cadence fits — weekly is reasonable. Keep cloud-sync AutoSave **off** on the master while the prompts are running.

---

# PHASE 2 — Refresh the Context Library

The library is built once but shouldn't be left to rot. Two mechanisms keep it current.

## Quiet Accumulation (every per-role prompt does this)

As you run Phase 1, the prompts notice things and write them down. You don't have to ask.

| What gets observed | Where it lands |
|---|---|
| A company you've now evaluated, applied to, or interviewed with — plus what you thought of them | `Context/companies-observed.md` (appended) |
| A real person mentioned in a JDS, a recruiter you heard from, a referral path the eval surfaced | `Context/network-observed.md` (appended) |
| A new accomplishment you mentioned in conversation that wasn't in `project-list.md` | Flagged in `Context/project-list-gaps.md` for you to confirm |
| A voice-and-style observation from your written replies in chat (a phrase you used, a tone shift) | Flagged in `Context/voice-and-style-gaps.md` |
| A scoring criterion you appealed to ("this one's too small," "wrong stack") that isn't in the rubric | Flagged in `Context/scoring-rubric-gaps.md` |

These are append-only, low-friction notes. The point is to capture signal as it happens, not interrupt you.

## Periodic Refresh (you run this monthly-ish)

A single prompt — `refresh-context` — walks you through the accumulated notes and asks targeted yes/no questions:

- "You evaluated 12 new companies since last refresh. Want to promote any to a target list?"
- "You mentioned this accomplishment in three conversations but it's not in `project-list.md` — should I add it?"
- "Your replies have shifted slightly more formal since you started targeting public-sector roles. Update `voice-and-style.md`?"

You answer; the prompt updates the canonical context files. Five minutes, monthly. The library stays current without ever feeling like homework.

## Re-Seeding (rare)

If something big changes — you finish a degree, switch industries, write a book — re-run the relevant seeding prompt with new uploaded material. Most people will do this once or twice a year, not more.

---

## Key Constraints to Build In

These are guardrails worth bolting into the prompts themselves, not just trusting yourself to remember:

- **LinkedIn:** prompts draft and track only. No automated login, scraping, or auto-send. The human copy-pastes every message. (Automated LinkedIn activity gets accounts restricted, and the warm-intro context that makes outreach work doesn't survive automation anyway.)
- **Application submission:** the `application` prompt prepares the package. The human submits.
- **Outreach send:** `connect` drafts. The human sends.
- **Cover letters:** one page, under ~300 words of body, no pleasantries, lead with a value proposition tied to the company's specific need.
- **Tone calibration:** public sector and regulated industries warrant a more formal register than tech-native companies. `voice-and-style.md` should capture both registers and the per-role prompts should switch based on the posting.

---

## Full Folder Layout

```
JobHunt/
├── Seed/                                ← Phase 0 inputs (you upload here)
│   ├── VoiceSamples/
│   ├── Resumes/
│   └── Projects/
├── Context/                             ← Phase 0 outputs, Phase 2 keeps current
│   ├── about-me.md
│   ├── scoring-rubric.md
│   ├── voice-and-style.md
│   ├── resume-and-cover-conventions.md
│   ├── project-list.md
│   ├── companies-observed.md            ← accumulates from Phase 1
│   ├── network-observed.md              ← accumulates from Phase 1
│   └── *-gaps.md                        ← Phase 1 flags, Phase 2 resolves
├── Roles/                               ← Phase 1 — one folder per posting
│   ├── {CompanyName}-{ShortRoleTitle}/
│   └── ...
├── Unevaluated/                         ← drop new postings here for batch triage
├── Archive/                             ← roles that didn't proceed
├── TrackerPending.csv
├── OutreachTracker.csv
└── JobSearchStatus.xlsx
```

---

## How to Adopt This Workflow

1. **Set up the folders.** Create the structure shown above. Empty is fine.
2. **Collect seed material.** Pull together every resume version, ~20+ writing samples (emails count, blog posts count, cover letters count), and as many project write-ups as you can find. Drop them into `Seed/VoiceSamples/`, `Seed/Resumes/`, and `Seed/Projects/`.
3. **Run the five seeding prompts.** Plan a 2–3 hour block. The output is your Context library.
4. **Run a real posting through.** Drop a JDS into `Unevaluated/`. Triage with `jds-eval-light`. If it scores, go deep. Follow the pathway the deep eval recommends. Iterate on the prompts as you find friction.
5. **Run `refresh-context` monthly.** Five minutes. Keeps the library alive.

---

## Why This Works

Three properties of this design tend to surprise people on first use:

**The prompts are short because the context is rich.** A well-seeded `about-me.md` and `voice-and-style.md` mean the `application` prompt itself can be ~30 lines and still produce a tailored cover letter that sounds like you. The leverage lives in the context library, not the prompts.

**The pathway choice is upstream of the work.** Most people apply to everything and network as a hopeful afterthought. The deep eval forces a deliberate pathway choice per role, which is a much better filter than "did I have time today?"

**The library is built from what you already have.** Nobody starts a job hunt by sitting down to write a 2,000-word voice guide. They start by pulling together documents that already exist. The seeding prompts meet you where you are.

---

## What This Workflow Does Not Do

- It does not submit applications, send LinkedIn messages, or log into any account on your behalf.
- It does not promise an interview, an offer, or a specific job. It compounds your effort; it does not replace it.
- It does not work without the Context library. You can run the per-role prompts cold, but the output quality will be generic. Phase 0 is not optional.

---

## At a Glance

```
PHASE 0 — SEED (once)
   uploaded documents in Seed/*  ──►  five seeding prompts  ──►  Context/

PHASE 1 — RUN (per posting)
   JDS ─► light eval ─► deep eval ─► pathway ─► application / connect ─► interview-prep
                                                          │
                                                          ▼
                                                 quiet accumulation into Context/

PHASE 2 — REFRESH (monthly)
   refresh-context  ──►  promotes accumulated notes into canonical Context files
```
