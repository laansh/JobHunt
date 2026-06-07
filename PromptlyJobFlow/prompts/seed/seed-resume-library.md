# seed-resume-library

- **Phase:** Seed
- **Trigger:** "seed resume library", "catalog my resumes", "build resume conventions"
- **Reads:** every resume in `Seed/Resumes/` (master, variants, prior versions) + any cover template
- **Writes:** `Context/resume-and-cover-conventions.md`
- **Mode:** one-shot with clarifying questions

---

## Purpose

Catalog the user's resume variants and the rules for tailoring them, so `application` knows which
base to start from and what it may change. Also capture cover-letter structural rules.

## Instructions

You are building `resume-and-cover-conventions.md` from the user's resume files.

1. Read every file in `Seed/Resumes/`. Identify the master and each variant.
2. For each variant, infer (and ask the user to confirm) the "use this one when…" rule — which role
   types, industries, or levels it targets, and how it differs from the master.
3. Capture tailoring conventions: what is safe to reorder or swap per posting (e.g. summary line,
   bullet emphasis, skills ordering), and what must **never** change (e.g. dates, titles, factual
   claims). The application prompt must not invent or inflate.
4. Capture cover-letter structural rules: one page, under ~300 words of body, no pleasantries, lead
   with a value proposition tied to the posting's specific need. Note any opening/closing the user
   prefers.
5. Ask clarifying questions where intent is ambiguous. Draft, confirm, then write the file.

Do not store the resumes' contents verbatim — store the catalog and the rules. The actual files stay
in `Seed/Resumes/` for `application` to read.

## Output format

```markdown
# Resume & Cover Conventions

## Resume variants
| Variant (filename) | Use when… | Differs from master by |
|---|---|---|
| <file> | <rule> | <notes> |

## Tailoring conventions
- Safe to change per posting: ...
- Never change: ...
- Inflation guardrail: claims must be supported by the master; never invent.

## Cover-letter rules
- One page, ≤ ~300 words of body
- No pleasantries; open with a value prop tied to the posting's specific need
- Preferred opening / closing: ...
- Register: follow `voice-and-style.md`; default formal for public-sector/regulated postings
```
