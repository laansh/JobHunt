# JobFlow

A prompt-driven **job-hunt workflow** you run with an AI assistant, out of a folder on your own
computer. No app, no account, no data leaving your machine. Free and open under **CC BY 4.0**.

Works with any AI tool that can access a folder (**Tier A**, e.g. Claude Code/Cursor) or keep an
uploaded-file project (**Tier B**, e.g. Claude/ChatGPT/Gemini projects, including their free tiers). A
plain-chat **Tier C** version is coming via **PromptlyDo**, not this repo.

## Are you here to *use* JobFlow?

**Everything you need is in [`starter-kit/`](starter-kit/).** Either:

- **Download it (recommended):** get the `JobFlow-starter-kit` zip from the
  [latest release](https://github.com/laansh/JobFlow/releases/latest), unzip to get a ready-to-use
  `JobFlow/` folder, and open `START-HERE.md` inside it; or
- **Browse it** here, starting at [`starter-kit/START-HERE.md`](starter-kit/START-HERE.md).

That guide explains setup in plain language for any AI tool, technical or not.

## What it does

Build a one-time **Context library** about yourself (profile, scoring rubric, writing voice, resume
conventions, project history) from material you already have. Then, per job posting, run a pipeline:

**triage → deep evaluation → pathway choice (apply / network / both) → tailored application and/or
outreach → interview prep.** A monthly refresh keeps your Context current.

JobFlow drafts and tracks; **you** submit and send. It never logs into or messages anyone on your behalf.

## Repo layout

| Path | What it is |
|---|---|
| [`starter-kit/`](starter-kit/) | **The product** — what end users download and run |
| [`docs/`](docs/) | Design docs: the spec ([`JobFlow.md`](docs/JobFlow.md)) and the deployment decision |
| `CLAUDE.md` | Notes for contributors working on this repo |
| `LICENSE` | CC BY 4.0 |

## License

JobFlow — by Laans Hokanson — © CC BY 4.0. Use, share, and adapt it freely **with attribution**.
