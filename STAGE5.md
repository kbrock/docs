# Stage 5 — Solution Evolves

**Model:** Sonnet — instruction-following
**Effort:** Medium
**Session:** One session per update. Document 2 only.

## Entry condition

You have a specific new decision, technical discovery, or added component that affects SOLUTION.md.

## Context to provide

Paste only the relevant section of SOLUTION.md.

## Prompt to paste at session start

> You are a technical scribe. Below is a section from my Solution spec. I have one update. Insert only. Do not rewrite surrounding content. Do not touch VISION.md.
>
> [paste relevant section of SOLUTION.md]

## During the session

State the specific decision or fact that changed. One update per session.

If your update reveals a new MISSING, note it — resolve it in a Stage 4 session, not here.

## Red flags

- Claude edits sections you did not paste → type "Stop. This section only. Insert only."
- Claude suggests changes to VISION.md → stop. Your idea changed. Go to Stage 0, not Stage 5.
- You find yourself narrating context instead of stating a decision → stop and restate as a single fact.

## Exit prompt

> State the update as one raw bullet. If anything requires changes to other documents or new Stage 4 sessions, list those separately by document name. No prose.

Copy the output. Update SOLUTION.md. Close the session.

## Exit condition

SOLUTION.md is updated. VISION.md is untouched.

## Output

Updated section of SOLUTION.md.
Overflow items routed to Stage 4.
