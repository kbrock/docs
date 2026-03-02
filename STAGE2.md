# Stage 2 — Gap Audit

**Command:** `/spec-gap`

**Model:** Sonnet — instruction-following
**Effort:** Medium
**Session:** New session. One purpose: find what is missing.

## Entry condition

You have `docs/brainstorm.md` from Stage 1 (Sort).

## Prompt to paste at session start

Run `/spec-gap`. Reads `docs/brainstorm.md` (or pass a path as argument to override).

## During the session

Claude outputs a grouped question list. You answer everything in one pass.

If you don't know an answer, write "skip." Skipped items become MISSING in the documents.

If a question feels premature — internal to a component that doesn't exist yet — write "defer." It becomes `Status: defer to Stage 6` in EDGE_CASES.md, not MISSING in SOLUTION.md.

Do not go back and forth. One question list, one answer pass.

## Red flags

- Claude starts writing documents before you answer → type "Stop. List questions only. Do not write documents yet."
- Claude asks follow-up questions after your answer pass → type "No follow-up questions. Mark anything unclear as MISSING."
- You feel the urge to answer one question at a time interactively → don't. That is Stage 4's job.
- Claude asks more than ~10 questions for Solution → too granular. Type: "Stop. Flag anything component-internal as defer to Stage 6. Only ask interface-level questions."

## Output

After you answer all questions, gap writes updated content back to `docs/brainstorm.md` automatically.
Still building: VISION.md.
