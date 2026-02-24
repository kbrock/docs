# Stage 3.5 — Validate & Find Holes

**Command:** `/spec-audit`

**Model:** Opus — reasoning
**Effort:** High
**Session:** New session. One document at a time or all three together.

## Entry condition

You have at least Document 1 (VISION.md). Run this after Stage 3, and again any time documents have changed significantly.

## Prompt to paste at session start

Run `/spec-audit`. Reads `docs/VISION.md`, `docs/SOLUTION.md`, `docs/EDGE_CASES.md`. Outputs problem list to screen.

## During the session

Read the problem list. For each item decide: fix now or add to EDGE_CASES.md as unresolved.

Do not fix anything in this session.

## Red flags

- Claude starts rewriting documents → type "Problems only. No fixes."
- Claude finds nothing → paste one document at a time and re-run.

## Exit condition

Every problem is labeled and routed. No unrouted items.

## Output

Problem list to screen with each item routed to a stage.
