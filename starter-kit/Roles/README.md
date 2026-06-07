# Roles/

One folder per job posting you're actively pursuing. The operational prompts create and fill these —
you usually don't make them by hand.

Folder name convention: `{CompanyName}-{ShortRoleTitle}/` in PascalCase, no spaces
(e.g. `Acme-SeniorPM/`). **The folder name is the join key** — every prompt finds the previous prompt's
output by it, so don't rename a role folder once the pipeline has started.

What accumulates inside a role folder as you progress:

```
Acme-SeniorPM/
├── JDS.md / JDS.pdf            original posting
├── Acme-EvalLight.md          jds-eval-light output
├── JDSEvaluation.docx         jds-eval-deep output
├── Resume-Acme.docx           application output
├── Cover-Acme.docx            application output
├── Notes.md                   anything to flag before submitting
├── Outreach.md                connect output
└── InterviewPrep/
    └── PhoneScreen-2026-01-15/  briefing, stories, questions, glossary, positioning
```
