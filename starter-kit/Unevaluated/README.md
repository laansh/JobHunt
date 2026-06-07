# Unevaluated/

Your inbox for new postings. Whenever you spot something interesting, capture it here and move on —
don't stop to evaluate it.

## How to save a job posting here

- **Copy the text** into a new `.md` (or `.txt`) file — e.g. `Acme-SeniorPM.md`. Quickest for most boards.
- **Save it as a PDF.** In your browser, open the posting and use **Print → Save as PDF**, then drop the
  PDF in this folder. This is the reliable way to capture postings that are awkward to copy.
- **LinkedIn jobs:** open the job, then **Print → Save as PDF** from the browser (or use LinkedIn's
  "⋯ → Save as PDF" if shown) and drop the PDF here. *Do this by hand in your own browser — JobFlow never
  logs into or scrapes LinkedIn.*

Name files so you'll recognize them (company + role). `jds-eval-light` reads `.md`, `.txt`, and `.pdf`.

## Triage them in a batch — ideally overnight

You don't triage one at a time. Let postings pile up, then run `jds-eval-light` against the whole folder
(or tell the orchestrator "triage my unevaluated folder"). It scores each one and, for the keepers,
creates a folder under `../Roles/`; passes can be deleted or moved to `../Archive/`.

**Tip — schedule it nightly.** If your AI tool can run scheduled/automated tasks (e.g. Claude Code
routines/cron — a Tier A feature), point a **nightly** `jds-eval-light` run at this folder. Triage then
runs off-peak and doesn't eat your prime-time/interactive token budget. (On Tier B tools without
scheduling, just run the batch yourself at a quiet time.) After each run, processed postings should leave
this folder so the next run only sees new ones.
