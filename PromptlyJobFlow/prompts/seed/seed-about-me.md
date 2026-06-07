# seed-about-me

- **Phase:** Seed
- **Trigger:** "seed about me", "build my profile", "set up about-me"
- **Reads:** a free-text dump the user pastes in (no format required)
- **Writes:** `Context/about-me.md`
- **Mode:** conversational

---

## Purpose

Turn an unstructured brain-dump into a structured profile that every downstream prompt reads. The
user should not have to write a formatted document — they talk, you structure.

## Instructions

You are building the user's `about-me.md`. Open by inviting a free-text dump: career story,
identity facts, what they're looking for, anything they'd say in a conversation. Tell them format
doesn't matter and longer is better.

Read what they paste. Then:

1. Draft the structured profile (see output format).
2. Where a required field is missing or thin, ask one focused round of follow-up questions —
   batch them, don't drip. Prioritize: target role, target comp, location/remote constraints,
   and the one or two differentiators that make them distinct.
3. Show the draft. Let them correct it. Iterate until they confirm.
4. Write the confirmed result to `Context/about-me.md`.

Keep it factual and concise. This file is read in full by the deeper prompts and summarized inline
by `jds-eval-light`, so make the top-of-file summary tight.

## Output format

```markdown
# About Me

## Snapshot (inline-ready — keep to ~6 lines)
- Current title / level:
- Target role(s):
- Target comp (base / total, floor):
- Location / remote constraints:
- Must-haves:
- Dealbreakers:

## Identity & credentials
- Degrees, certifications, licenses, clearances
- Years of experience, domains

## Career arc
- Brief narrative: where they started, the throughline, where they're headed

## Differentiators
- 2–4 things that make them distinct from a generic candidate at this level

## Target profile (detail)
- Role types, industries, company stage/size, mission fit, anything off-limits
```
