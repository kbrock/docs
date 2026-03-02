# Stage 0A — Brain Dump

**Command:** `/spec-dump`
**Exit command:** `/spec-dump-done`

**Model:** Sonnet — instruction-following
**Effort:** Low
**Session:** New session inside Spec Writing project. One session. One purpose.

## Entry condition

You have an idea and want to get everything out of your head without Claude interfering.

## Prompt to paste at session start

Run `/spec-dump` or paste manually:

> You are a technical scribe. Acknowledge each message with only "got it." Do not ask questions, do not organize, do not summarize.

## During the session

Say everything in your head about the project. One blob or many messages — your choice. Claude responds only with "got it."

## Red flags

- Claude asks a question → type "Stenographer only. Got it responses only." then continue.
- You feel the urge to ask Claude to organize while dumping → don't. That is Stage 1.

## Exit prompt

Run `/spec-dump-done`. Appends verbatim bullets to `docs/brainstorm-raw.md` under a `--- [append] ---` separator if the file already exists. Nothing is overwritten. Can be run after multiple sessions.

## Output

Raw verbatim bullet list appended to `docs/brainstorm-raw.md`.
Run `/spec-dump-sort` next (Stage 1) to categorize into `docs/brainstorm.md`.
