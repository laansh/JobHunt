_JobFlow — by Laans Hokanson — github.com/laansh/jobflow — CC BY 4.0_

# connect

- **Phase:** Run (Gate 3 — the network leg: parallel-network, network-first, or network-only)
- **Trigger:** "do the outreach for {Company}", "draft the LinkedIn message", "run connect", "network play"
- **Reads:** `about-me.md`, `voice-and-style.md`, role's `JDSEvaluation` (esp. the pathway section) + `JDS`
- **Writes:** `Roles/{Company}-{Role}/Outreach.md` + one row per contact to `OutreachTracker.csv`; appends observed notes
- **Mode:** one-shot

---

## Purpose

Produce copy-paste-ready outreach and identify warm-intro paths. **Drafts and tracks only — the
human sends every message.** No automated login, scraping, or auto-send, ever. (Automation gets
accounts restricted and the warm-intro context that makes outreach work doesn't survive it.)

## Instructions

1. Read the deep eval's pathway section to confirm the play (parallel / network-first / network-only)
   and any people or referral paths it already surfaced.
2. **Identify warm-intro paths from public sources only:** shared connections, alumni overlap, mutual
   communities, people who've posted about the team/role. Note the basis for each ("both X alumni").
   Do not scrape or log in — work from what's public and what the user can see in their own network.
3. **Draft messages**, each ≤ ~75 words, on-voice (`voice-and-style.md`), specific, with a clear ask:
   - A warm-intro request (to the mutual connection)
   - A direct outreach to a hiring manager / team member
   - A recruiter reply (if one reached out)
   - A short follow-up for each, for use after silence
4. Save `Outreach.md`. Append one `OutreachTracker.csv` row per intended contact (status = drafted).
5. **Quiet accumulation:** append people and paths to `Context/network-observed.md`.

Tell the user clearly which messages go to whom and in what order. They send.

## Output

`Outreach.md`:
```markdown
# {Company} — Outreach

## Warm-intro paths (public basis)
- <Person> — <basis> — ask <mutual> for intro

## Messages (copy-paste; you send)
### Warm-intro request → <mutual>
<≤75 words>
### Direct → <hiring manager/team member>
<≤75 words>
### Follow-up (after ~5 business days of silence)
<≤50 words>
```

Tracker row: `date,company,contact,relationship,channel,status=drafted,folder`
