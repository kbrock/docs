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
- Claude combines or reorders sections → type "Follow the template exactly. Insert only."
- You feel the urge to wordsmith → don't. Wordsmithing is a distraction. Accuracy first.

## Exit condition

All three documents exist. Every section is filled or marked MISSING. No invented content.

## After this session

Create your project directory. Store the three documents:
```
my-project/
  docs/
    VISION.md        (stable once written)
    SOLUTION.md      (evolves)
    EDGE_CASES.md    (test backlog)
```

This is also when you create your Claude Project and store these files in Project Instructions or as reference documents.

## Output

Write output to docs/VISION.md, docs/SOLUTION.md, docs/EDGE_CASES.md. state.md is now retired.
