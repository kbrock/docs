# Stage 4 — Fill the MISSINGs

**Command:** `/spec-fill`

**Model:** Sonnet — instruction-following
**Effort:** Medium
**Session:** Interactive loop. One session fills all MISSINGs.

## Entry condition

At least one document has a MISSING marker.
This can be the Vision, Solution, or EdgeCase.

## Prompt to paste at session start

Run `/spec-fill`. Reads `docs/VISION.md`, `docs/SOLUTION.md`, `docs/EDGE_CASES.md`. Finds the first MISSING, asks questions, writes resolved content in-place. Loops to the next MISSING. Say "skip" or "out of scope" to bypass. When no MISSINGs remain, it says so.

## During the session

Back and forth is allowed. Answer Claude's questions until the section is resolved. Say "skip" to mark a MISSING as skipped; say "out of scope" to mark it out of scope.

## Red flags

- Claude rewrites content outside the section → type "Stop. This section only. Insert only."
- Claude starts repeating questions → stop. Start a fresh session.

## Exit condition

All MISSINGs are resolved, skipped, or marked out of scope.

## Output

All three documents updated in-place.
