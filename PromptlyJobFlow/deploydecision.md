# Deployment Decision

How JobFlow reaches end users. Compressed from the deployment discussion (2026-06-07).

## The constraint

Privacy + per-user context that grows over time = **no app**. Each user owns their files; the LLM
is just a processor pointed at their folder. **The user's folder is always the single source of
truth**, in every tier. Lead onboarding with this framing — it reassures privacy-conscious,
non-technical users.

## Two separable problems

1. **Build the folder skeleton** — one-time, LLM-independent (folders + markdown on the user's device).
2. **Connect an LLM to it** — ongoing; varies entirely by whether the user's tool persists and can
   read/write files.

The skeleton is trivial and identical for everyone. The connection is the whole game.

## Tool capability tiers

| Tier | Example tools | LLM can | Experience |
|---|---|---|---|
| **A — Filesystem access** | Claude Code, Cursor, Cline | Read/write the folder directly | Designed experience |
| **B — Project persistence** | Claude Projects, ChatGPT Projects/Custom GPTs, Gemini Gems | Hold uploaded context + durable threads; user uploads/downloads | Very good, some shuttling |
| **C — Plain stateless chat** | Free bare chat thread | Nothing persists; cold each session | **DESCOPED — see below** |

## Scope decisions

- **Primary product targets Tiers A & B only** ("Project Mode" — the full modular file structure;
  prompts read/write the Context files).
- **Tier C (stateless "Chat Mode") is DESCOPED** from the primary product but **underway via PromptlyDo**,
  sequenced after the primary product ships. The consolidated single-`MyContext.md` paste-in idea is the
  seed of that work. User-facing docs should describe Tier C as "underway."
- **Lowest-common-denominator user:** can unzip a file and edit markdown in a text editor. We design to
  that floor (no terminal assumed).

## Distribution

- **Lead with a downloadable template, not a script.** GitHub's "Code → Download ZIP" is the free
  vehicle; a clean `starter-kit/` subtree *is* the kit.
- **Script optional** (`setup.ps1` / `setup.sh`), for technical Tier-A users only. Not the primary
  path — Windows execution policy, Mac quarantine, and two scripts to maintain make it friction for
  the people who least need it.

## Deliverable set (primary product)

1. **`starter-kit/`** — full folder tree, a README in each folder, the 11 prompts, empty tracker CSVs
   (headers only), and illustrative (fictional) Context templates.
2. **`START-HERE.md`** — onboarding guide. Opens with *"Which best describes your AI tool?"* → branches
   into **A / B**. May **name specific products** (Claude, ChatGPT, Gemini, Cursor, etc.). Must include
   a short **"how to edit `.md` files"** primer — editing markdown was uncommon before LLM use, so name
   simple editors (Notepad / TextEdit, VS Code, Obsidian, Typora, or even the LLM tool itself).
3. **Orchestrator prompt** — the master "tie-it-together" prompt for A & B that walks the user through
   Phase 0 seeding.
4. *(optional)* `setup.ps1` / `setup.sh`.

## Licensing

Repo `LICENSE` is **CC BY 4.0** (Attribution 4.0 International). Every prompt and shipped artifact
carries the banner:

```
# JobFlow — by Laans Hokanson — github.com/laansh/jobflow — CC BY 4.0
```
