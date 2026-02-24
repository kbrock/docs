# Stage 5 — Solution Evolves

**Command:** `/spec-define`

**Model:** Sonnet — instruction-following
**Effort:** Medium
**Session:** One session per update. Document 2 only.

## Entry condition

You have a specific new decision, technical discovery, or added component that affects SOLUTION.md.

## Prompt to paste at session start

Run `/spec-define`. Reads `docs/SOLUTION.md`. Optionally pass a section name as argument. Interactive update — state the specific decision or fact that changed. When agreed, writes to `docs/SOLUTION.md`.

## During the session

State the specific decision or fact that changed. One update per session.

If your update reveals a new MISSING, note it — resolve it in a Stage 4 session, not here.

## Red flags

- Claude edits sections you did not intend → type "Stop. This section only. Insert only."
- Claude suggests changes to VISION.md → stop. Your idea changed. Go to Stage 0, not Stage 5.
- You find yourself narrating context instead of stating a decision → stop and restate as a single fact.

## Exit condition

SOLUTION.md is updated. VISION.md is untouched.

## Output

Updated section written to `docs/SOLUTION.md`.
Overflow items routed to Stage 4.
