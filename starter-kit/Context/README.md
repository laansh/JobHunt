# Context/

Your **context library** — the five files that make every JobFlow prompt sound like you and judge
postings by your priorities. You don't hand-write these; the **seed prompts** build them from material
you upload into `../Seed/`. After they're built you can edit them by hand any time — they're just markdown.

The five files (created here by the seed prompts):

| File | Built by | What it holds |
|---|---|---|
| `about-me.md` | `seed-about-me` | Your profile: identity, target role/comp/location, differentiators |
| `scoring-rubric.md` | `seed-scoring-rubric` | Weighted dimensions + tiers used to score postings |
| `voice-and-style.md` | `seed-voice-and-style` | How you write, so drafts sound like you |
| `resume-and-cover-conventions.md` | `seed-resume-library` | Which resume to use when; tailoring + cover rules |
| `project-list.md` | `seed-project-list` | Your accomplishments as reusable bullets and STAR stories |

Over time, JobFlow also drops `*-observed.md` and `*-gaps.md` notes here; the monthly `refresh-context`
prompt promotes them into the files above.

**See [`examples/`](examples/) for fictional, filled-in versions** so you know what "good" looks like
before you run the seed prompts. They are illustrations only — your real files replace them.
