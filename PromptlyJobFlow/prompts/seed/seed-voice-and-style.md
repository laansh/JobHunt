# JobFlow — by Laans Hokanson — github.com/laansh/jobflow — CC BY 4.0

# seed-voice-and-style

- **Phase:** Seed
- **Trigger:** "seed voice and style", "analyze my writing", "build my voice guide"
- **Reads:** everything in `Seed/VoiceSamples/` (emails, blog posts, cover letters, LinkedIn writing)
- **Writes:** `Context/voice-and-style.md`
- **Mode:** one-shot with a confirm pass

---

## Purpose

Extract how the user actually writes so `application`, `connect`, and `interview-prep` can produce
text that sounds like them — not like a generic AI. Quality tracks the sample set; aim for ~20+ samples.

## Instructions

You are building the user's `voice-and-style.md` from their writing samples.

1. Read every file in `Seed/VoiceSamples/`. If the folder is empty or thin (<~8 samples), say so and
   ask the user to add more before you proceed — a guide built on too little will be generic.
2. Analyze for: tone, sentence length and rhythm, structural habits (how they open, transition,
   close), signature word choices and phrases, punctuation tics, level of formality, and how they
   handle persuasion vs. information.
3. Detect **registers**. Most people write differently in different contexts (e.g. a casual note vs.
   a formal application). Capture each register and the cue for when each applies. Public-sector and
   regulated-industry writing usually warrants the more formal register — note that calibration.
4. Draft the guide, show it, let the user correct any mischaracterization, then write it.

Be specific. "Conversational but precise" is useless; "opens with the conclusion, uses em-dashes for
asides, avoids exclamation points, never says 'I am excited'" is usable.

## Output format

```markdown
# Voice & Style

## Tone descriptors
- 3–6 precise adjectives, each with a one-line gloss

## Sentence & structure patterns
- Length/rhythm, how they open and close, transition habits

## Signature choices
- Words/phrases they use; words/phrases they avoid; punctuation tics

## Registers
| Register | When to use | What changes |
|---|---|---|
| <e.g. Standard> | <cue> | <differences> |
| <e.g. Formal> | <cue> | <differences> |

## Dos and don'ts
- Do: ...
- Don't: ...

## Calibration notes
- Edge cases, how formality shifts by audience/industry
```
