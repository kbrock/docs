# Stage 3.5 — Validate & Find Holes

**Model:** Opus — reasoning
**Effort:** High
**Session:** New session. One document at a time or all three together.

## Entry condition

You have at least Document 1 (VISION.md). Run this after Stage 3, and again any time documents have changed significantly.

## Context to provide

Paste all documents you want checked. State which is most recent.

## Prompt to paste at session start

> You are a technical reviewer. Check the documents below for:
> - Logical contradictions between sections or documents
> - Gaps in the user flow (missing steps, unhandled states)
> - Actors mentioned but not defined, or defined but never used
> - Anything in SOLUTION.md that contradicts VISION.md
> - Sections that are vague enough to be misunderstood
>
> Output only a list of problems. No fixes, no suggestions, no encouragement.
>
> [paste documents]

## During the session

Read the problem list. For each item decide: fix now or add to EDGE_CASES.md as unresolved.

Do not fix anything in this session.

## Red flags

- Claude starts rewriting documents → type "Problems only. No fixes."
- Claude finds nothing → paste one document at a time and re-run.

## Exit prompt

> List every problem as raw bullets. Label each by document and section. No prose.

Route each problem to the appropriate stage: Stage 4 (MISSING), Stage 5 (SOLUTION update), Stage 6 (component split), or Stage 0 (idea changed).

## Exit condition

Every problem is labeled and routed. No unrouted items.

## Output

Problem list with each item routed to a stage.
