# Stage 0B — Brainstorm with Claude

**Command:** `/spec-brainstorm`

Use when you don't have a friend available or want to pressure-test before talking to a person.

**Model:** Sonnet — instruction-following
**Effort:** Medium

## Entry condition

You have a rough idea but can't yet state the logline clearly.

## Prompt

> I want to brainstorm an idea. Ask me one question at a time. Do not summarize, do not organize, do not encourage. Just ask the next most useful question. I will say DONE when I'm finished.

## What to expect

Claude surfaces gaps and contradictions by questioning, not by building structure. You are thinking out loud. Claude is pressure-testing.

## Exit prompt

> Bullet list everything we just discovered. No prose. No encouragement.

## Output

Raw bullet list you carry into Stage 1. Not a doc — just captured thinking.

## Exit condition

You can state the logline out loud. You have a rough sense of novelty.

```
mkdir -p my-project/docs && touch my-project/docs/state.md
```

## Red flag

If Claude starts summarizing or structuring unprompted — stop it. That's Stage 3's job.

Two things I noticed reviewing the stages against our conversation:
