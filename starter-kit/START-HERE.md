# Start Here — JobFlow

Welcome. JobFlow is a job-hunt workflow you run with an AI assistant out of **a folder on your own
computer**. This folder is the whole system — there's no app, no account, no website that holds your
data. **Everything stays with you.** That's the point: your career history, salary targets, and drafts
never leave your machine unless you choose to share them.

This guide gets you from "I just unzipped this" to "I'm running real job postings through it." It's
written for non-technical users — if you can unzip a file and type into a chat box, you can do this.

> **Who JobFlow is for (current version):** anyone using an AI tool that can either **work in a folder
> on your computer** (Tier A) or **keep a project with files you upload** (Tier B). Both are covered
> below, and the free tiers of Claude, ChatGPT, and Gemini all qualify. A simplified **Tier C** version
> for plain, no-memory chat is **underway** — until it ships, use one of the Tier A or B options.

---

## 1. What you just downloaded

```
JobFlow/
├── START-HERE.md      ← you are here
├── README.md          ← one-screen overview
├── Prompts/           ← the instructions your AI runs (you rarely open these directly)
├── Context/           ← your profile library (built in Phase 0; examples included)
├── Seed/              ← drop your existing resumes / writing / project docs here
├── Roles/             ← one folder per job you pursue (created as you go)
├── Unevaluated/       ← drop new job postings here to triage later
├── Archive/           ← finished or passed-on jobs
├── TrackerPending.csv ← running log of everything (open in Excel/Sheets)
└── OutreachTracker.csv← running log of networking
```

Put this `JobFlow/` folder somewhere you'll find it — your Documents folder, or a cloud drive like
OneDrive, Google Drive, iCloud, or Dropbox so it's backed up.

---

## 2. How to open and edit the `.md` files

JobFlow's files end in **`.md`** ("markdown") — just plain text with light formatting. Before AI tools
made them common, most people never touched these, so here's the short version: **a `.md` file is a
text file. You can open and edit it with almost anything.**

Easiest options:

- **Already on your computer:** **Notepad** (Windows) or **TextEdit** (Mac) opens any `.md` file.
  (On Mac TextEdit, use *Format → Make Plain Text* so it doesn't add formatting.)
- **Nicer free apps** that show the formatting prettily: **VS Code** (code.visualstudio.com),
  **Obsidian** (obsidian.md), or **Typora**. Any of these let you read and edit comfortably.
- **Your AI tool itself** can often read and write these files for you — in which case you may barely
  need an editor at all (see Tier A below).

To open one: right-click the file → *Open with* → pick an app. That's it.

---

## 3. Pick your path — which describes your AI tool?

JobFlow works with most AI assistants, but *how* you run it depends on what your tool can do. Find
yourself below.

### 🟢 Tier A — your AI can open files on your computer
Tools like **Claude Code**, **Cursor**, **Cline**, or other "agentic" assistants that work inside a
folder. **This is the smoothest experience** — the AI reads and writes your JobFlow files directly.

**Setup:**
1. Open your tool and point it at this `JobFlow/` folder (open the folder as your workspace/project).
2. Open `Prompts/orchestrator.md`, copy everything below its "paste" line, and send it to the assistant.
3. It will check whether your `Context/` library exists yet and walk you into Phase 0 (below).

That's all — from here on you just tell it what you want ("triage this posting," "prep me for my
interview") and it runs the right prompt and saves the output into the right folder.

### 🔵 Tier B — your AI keeps a project/workspace with uploaded files
Tools like **Claude (Projects)**, **ChatGPT (Projects / Custom GPTs)**, or **Google Gemini (Gems)**.
These can't reach into your computer, but they remember files you upload and keep your conversation.

**Setup:**
1. Create a new Project / Custom GPT / Gem named "JobFlow."
2. Upload the contents of `Prompts/` and (once built) your `Context/` files into the project's
   knowledge/files area.
3. Paste `Prompts/orchestrator.md` (everything below its "paste" line) as the project's instructions
   or as your first message.
4. When the assistant produces a file (a resume, an evaluation, an outreach message), **save it
   yourself** into the matching folder on your computer — it'll tell you the exact filename and folder.

You'll do a little more copy-paste than Tier A, but it works well.

> **Only have a plain chat with no projects or file memory (e.g. a free, basic chat)?** JobFlow's
> simplified "Chat Mode" (Tier C) for that case is **underway**. For now, the free tiers of Claude,
> ChatGPT, and Gemini all include the project features above — using one of those is the easiest path.

---

## 4. Phase 0 — build your Context library (do this once)

Everything good downstream comes from this. You're going to create the five files in `Context/` that
teach the AI who you are, how you write, and what you want. **You don't write them by hand** — the seed
prompts build them from material you provide.

1. **Load up `Seed/`** with what you already have:
   - `Seed/VoiceSamples/` — emails, posts, old cover letters (aim for ~20+)
   - `Seed/Resumes/` — every resume version + a cover template
   - `Seed/Projects/` — case studies, post-mortems, retros (aim for ~10+)
2. **Run the five seed prompts** (the orchestrator will walk you through these, or run them yourself
   from `Prompts/seed/`):
   - `seed-about-me` — you paste a free-text "here's my story" dump; it structures it
   - `seed-scoring-rubric` — it asks ~15 questions about what you want; it builds your scoring system
   - `seed-voice-and-style` — it reads `VoiceSamples/` and learns your voice
   - `seed-resume-library` — it catalogs your resumes and tailoring rules
   - `seed-project-list` — it turns your project docs into reusable bullets and stories
3. **Peek at `Context/examples/`** first if you want to see what the finished files look like (they're
   fictional samples for the persona "Jordan Rivera").

Budget a couple of hours. When you're done, `Context/` holds your five files and you're ready to run jobs.

---

## 5. Daily use — run a posting through

When a job catches your eye:

1. **Triage** — capture the posting in `Unevaluated/` and run **`jds-eval-light`**. It scores it against
   your rubric and says pursue or pass.
   - *Capturing postings:* paste the text into a `.md` file, or use your browser's **Print → Save as
     PDF** and drop the PDF in `Unevaluated/` — including **LinkedIn** jobs (save them by hand; JobFlow
     never logs into LinkedIn). See `Unevaluated/README.md` for details.
   - *Batch it, ideally overnight:* let postings pile up and triage them together. If your tool can run
     scheduled tasks (Tier A), set `jds-eval-light` to run **nightly** so triage happens off-peak and
     doesn't burn your prime-time tokens.
2. **Go deep** — if it scores well, run **`jds-eval-deep`**. This is the big one: fit analysis, pay
   research, and a **recommended pathway** — apply cold, apply *and* network in parallel, network first,
   or network only.
3. **Execute** — follow the pathway:
   - **`application`** builds a tailored resume + cover letter (you submit them).
   - **`connect`** drafts outreach messages and finds warm-intro paths (you send them).
4. **Interview** — when one's scheduled, run **`interview-prep`** for a briefing, STAR stories, smart
   questions, and a positioning script. Re-run it for each round.

JobFlow drafts and tracks; **you** do all the submitting and sending. It never logs into anything or
messages anyone on your behalf.

---

## 6. Keep it fresh (monthly, ~5 minutes)

As you use JobFlow it quietly notes companies you've seen, people you've encountered, and gaps in your
profile. Once a month, run **`refresh-context`** — it asks a few yes/no questions and folds the useful
bits into your Context library so it gets sharper over time.

---

## A few ground rules baked into JobFlow

- **Your folder is the source of truth.** The AI is just a helper pointed at it.
- **It drafts; you send.** No auto-applying, no auto-messaging, no logging into LinkedIn. (Automated
  LinkedIn activity gets accounts restricted — and the personal touch that makes outreach work doesn't
  survive automation anyway.)
- **Nothing leaves your machine** unless you paste or upload it somewhere yourself.

---

_JobFlow — by Laans Hokanson — github.com/laansh/jobflow — CC BY 4.0_
