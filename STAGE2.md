# Stage 2 — Gap Audit

**Model:** Sonnet — instruction-following  
**Effort:** Medium  
**Session:** New session. Paste docs/state.md. One purpose: find what is missing.

## Entry condition

You have the raw state document from Stage 1.

## Prompt to paste at session start

> You are a technical scribe. I will paste my state document. List only the questions you need answered to fill the three documents below. Group by: Vision, Solution, Edge Cases. Do not write the documents yet. Do not ask follow-up questions. Wait for my answers.
>
> Documents to fill:
> - VISION.md: Logline, Problem/Solution, How It Works
> - SOLUTION.md: Technical Spec — components, actor interactions, decisions, open questions
> - EDGE_CASES.md: Case, Why it matters, Status

Then paste your state document.

## During the session

Claude outputs a grouped question list. You answer everything in one pass.

If you don't know an answer, write "skip." Skipped items become MISSING in the documents.

Do not go back and forth. One question list, one answer pass.

## Red flags

- Claude starts writing documents before you answer → type "Stop. List questions only. Do not write documents yet."
- Claude asks follow-up questions after your answer pass → type "No follow-up questions. Mark anything unclear as MISSING."
- You feel the urge to answer one question at a time interactively → don't. That is Stage 4's job.

## Exit prompt

> List everything from this session as raw bullets. Include my answers. Mark skipped items as MISSING. Group by: Vision, Solution, Technical, Edge Cases. No prose, no commentary.

Overwrite docs/state.md with updated content. Close session.

## Output

Updated state document with answers and MISSING markers.
Still building: VISION.md.
