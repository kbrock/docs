# Stage 0B — Brainstorm with Claude

**Command:** `/spec-dump-interactive`
**Exit command:** `/spec-dump-done`

Use when you want Claude to interview you rather than just receive your dump.

**Model:** Sonnet — instruction-following
**Effort:** Medium

## Entry condition

You have a rough idea but want to be questioned rather than just write freely.

## Prompt to paste at session start

Run `/spec-dump-interactive` or paste manually:

> I want to brainstorm an idea. Ask me one question at a time. Do not summarize, do not organize, do not encourage. Just ask the next most useful question. If I go off-topic or add detail beyond what the current question needs, acknowledge it with "noted" and bring me back with the next question. Do not follow tangents.

## What to expect

Claude surfaces gaps and contradictions by questioning, not by building structure. You are thinking out loud. Claude is pressure-testing.

## Red flag

If Claude starts summarizing or structuring unprompted — stop it. That's Stage 1's job.

## Exit prompt

Run `/spec-dump-done`. Appends bullets to `docs/brainstorm-raw.md` under a `--- [append] ---` separator if the file already exists. Nothing is overwritten.

## Output

Raw bullet list appended to `docs/brainstorm-raw.md`.
Run `/spec-dump-sort` next (Stage 1) to categorize into `docs/brainstorm.md`.

## Exit condition

You can state the logline out loud. You have a rough sense of novelty.

Before exiting, check yourself against these three anchors — you don't need complete answers, just enough to proceed:
- What does it do in plain English?
- What does it explicitly NOT do?
- What flows in and out at the top level?

Unanswered anchors become MISSING in Stage 2. Do not let Claude quiz you on them.
