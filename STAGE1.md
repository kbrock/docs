# Stage 1 — Brain Dump

**Command:** `/spec-dump`
**Exit command:** `/spec-dump-done`

**Model:** Sonnet — instruction-following
**Effort:** Low
**Session:** New session inside Spec Writing project. One session. One purpose.

## Entry condition

You passed Stage 0. You can state the logline out loud.

## Prompt to paste at session start

Run `/spec-dump` or paste manually:

> You are a technical scribe. Acknowledge each message with only "got it." Do not ask questions, do not organize, do not summarize.

## During the session

Say everything in your head about the project. One blob or many messages — your choice. Claude responds only with "got it."

## Red flags

- Claude asks a question → type "Stenographer only. Got it responses only." then continue.
- You feel the urge to ask Claude to organize while dumping → don't. That is Stage 2.

## Exit prompt

Run `/spec-dump-done`. Writes to `docs/brainstorm.md`. Override with `/spec-dump-done docs/other.md`.

## Output

Raw bullet list written to `docs/brainstorm.md`, grouped by Vision, Solution, Edge Cases.
Document being built: Vision (VISION.md).
