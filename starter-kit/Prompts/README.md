# JobFlow Prompts

The reusable prompts that drive JobFlow, grouped by phase. Each file is a self-contained prompt body:
it declares which Context files it reads, which folder it writes to, and the exact output format.

New here? Start with [../START-HERE.md](../START-HERE.md), then paste [orchestrator.md](orchestrator.md)
into your assistant — it ties everything below together.

## Conventions every prompt follows

- **Context library** lives in `JobFlow/Context/` (built by the seed prompts).
- **Per-role folders** live in `JobFlow/Roles/{CompanyName}-{ShortRoleTitle}/` (PascalCase, no spaces).
  The folder name is the join key — prompts find each other's outputs by it. Never rename mid-pipeline.
- **Trackers** are append-only CSVs (`TrackerPending.csv`, `OutreachTracker.csv`). Prompts append, never rewrite.
- **Hard limits:** prompts draft and track only. They never log in, scrape, submit applications, or
  send messages. The human does all sending/submitting. No LinkedIn automation, ever.

## Conductor

| Prompt | Purpose |
|---|---|
| [orchestrator](orchestrator.md) | Master prompt — paste once per session; routes you to the right step |

## Seed (run once — `seed/`)

| Prompt | Reads | Writes |
|---|---|---|
| [seed-about-me](seed/seed-about-me.md) | free-text dump | `Context/about-me.md` |
| [seed-scoring-rubric](seed/seed-scoring-rubric.md) | guided Q&A | `Context/scoring-rubric.md` |
| [seed-voice-and-style](seed/seed-voice-and-style.md) | `Seed/VoiceSamples/` | `Context/voice-and-style.md` |
| [seed-resume-library](seed/seed-resume-library.md) | `Seed/Resumes/` | `Context/resume-and-cover-conventions.md` |
| [seed-project-list](seed/seed-project-list.md) | `Seed/Projects/` | `Context/project-list.md` |

## Operational (run per posting — `operational/`)

| Prompt | When | Writes |
|---|---|---|
| [jds-eval-light](operational/jds-eval-light.md) | triage a new JDS | `{Company}-EvalLight.md` + tracker row |
| [jds-eval-deep](operational/jds-eval-deep.md) | light eval scored high | `JDSEvaluation.docx` + tracker row |
| [application](operational/application.md) | decided to apply | `Resume-{Company}.docx`, `Cover-{Company}.docx`, `Notes.md` |
| [connect](operational/connect.md) | networking pathway | `Outreach.md` + outreach tracker row |
| [interview-prep](operational/interview-prep.md) | interview scheduled | `InterviewPrep/{Round}-{date}/` |

## Refresh (run monthly — `refresh/`)

| Prompt | Reads | Writes |
|---|---|---|
| [refresh-context](refresh/refresh-context.md) | `*-observed.md`, `*-gaps.md` | promotes into canonical `Context/` files |

---
_JobFlow — by Laans Hokanson — github.com/laansh/jobflow — CC BY 4.0_
