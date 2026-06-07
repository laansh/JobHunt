# JobFlow — Starter Kit

A prompt-driven job-hunt workflow you run with an AI assistant, out of a folder on your own computer.
No app, no account — your data stays with you.

**Works with** any AI tool that can either access a folder on your computer (**Tier A**) or keep a
project with files you upload (**Tier B**) — the free tiers of Claude, ChatGPT, and Gemini all work,
within their free-tier limits. A plain-chat (**Tier C**) version is coming via **PromptlyDo**, not this repo.

**👉 New here? Open [START-HERE.md](START-HERE.md).** It walks you through setup in plain language.

## The 30-second version

1. Put this folder somewhere safe (a cloud drive is ideal for backup).
2. Fill `Seed/` with your existing resumes, writing samples, and project docs.
3. Run the five **seed** prompts once to build your `Context/` library (your profile, voice, rubric…).
4. For each job: **triage → deep eval → apply and/or network → interview prep.**
5. Once a month, run **refresh** to keep your Context current.

Paste [`Prompts/orchestrator.md`](Prompts/orchestrator.md) into your AI assistant and it conducts all of
the above for you.

## What's in here

| Folder/file | What it's for |
|---|---|
| `Prompts/` | The 11 prompts + an orchestrator that ties them together |
| `Context/` | Your profile library (built by the seed prompts; see `Context/examples/`) |
| `Seed/` | Where you drop existing material for the seed prompts to read |
| `Roles/` | One folder per job you pursue |
| `Unevaluated/` | Inbox for new postings to triage |
| `Archive/` | Finished or passed-on jobs |
| `TrackerPending.csv`, `OutreachTracker.csv` | Append-only logs (open in Excel/Sheets) |

## Ground rules

JobFlow **drafts and tracks only**. It never logs in, scrapes, submits applications, or sends messages —
you do all of that. No LinkedIn automation. Your folder is always the single source of truth.

---
_JobFlow — by Laans Hokanson — github.com/laansh/jobflow — CC BY 4.0 (free to use and adapt with attribution)_
