# Stage 3 — Write the Docs

**Command:** `/spec-write`

**Model:** Sonnet — instruction-following
**Effort:** Medium
**Session:** New session. One purpose: produce three documents.

## Entry condition

You have the updated state document from Stage 2 with all answers and MISSING markers.

## Prompt to paste at session start

Run `/spec-write`. Reads `docs/brainstorm.md` (or pass a path as argument to override). Writes `docs/VISION.md`, `docs/SOLUTION.md`, `docs/EDGE_CASES.md` directly.

## During the session

Review each document. Correct factual errors only. Do not wordsmith.

## Red flags

- Claude fills a MISSING with invented content → type "Revert that section. Write MISSING."
- Claude marks a deferred item as MISSING → type "That is deferred. Status: defer to Stage 6."
- Claude combines or reorders sections → type "Follow the template exactly. Insert only."
- You feel the urge to wordsmith → don't. Wordsmithing is a distraction. Accuracy first.

## Exit condition

All three documents exist. Every section is filled or marked MISSING. No invented content.

## After this session

Three documents now exist in `docs/`. Commit them. Your repo should have been created before Stage 1 — if not, do it now before continuing.

## Output

Write output to docs/VISION.md, docs/SOLUTION.md, docs/EDGE_CASES.md. state.md is now retired.
