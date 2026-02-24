# Stage 0B — Brainstorm with Claude

**Command:** `/spec-dump-interactive`
**Exit command:** `/spec-dump-done`

Use when you don't have a friend available or want to pressure-test before talking to a person.

**Model:** Sonnet — instruction-following
**Effort:** Medium

## Entry condition

You have a rough idea but can't yet state the logline clearly.

## Prompt

Run `/spec-dump-interactive` or paste manually:

> I want to brainstorm an idea. Ask me one question at a time. Do not summarize, do not organize, do not encourage. Just ask the next most useful question.

## What to expect

Claude surfaces gaps and contradictions by questioning, not by building structure. You are thinking out loud. Claude is pressure-testing.

## Exit prompt

Run `/spec-dump-done` (writes to `docs/brainstorm.md`) or `/spec-dump-done docs/other.md` to override. Or paste manually:

> Bullet list everything we just discovered. No prose. No encouragement.

## Output

Raw bullet list written to `docs/brainstorm.md`.

## Exit condition

You can state the logline out loud. You have a rough sense of novelty.

```
mkdir -p my-project/docs && touch my-project/docs/state.md
```

## Red flag

If Claude starts summarizing or structuring unprompted — stop it. That's Stage 3's job.

Two things I noticed reviewing the stages against our conversation:
