# Stage 3 — Write the Docs

**Command:** `/spec-write`

**Model:** Sonnet — instruction-following
**Effort:** Medium
**Session:** New session. Paste docs/state.md. One purpose: produce three documents.

## Entry condition

You have the updated state document from Stage 2 with all answers and MISSING markers.

## Prompt to paste at session start

> You are a technical scribe. I will paste my state document. Write the three documents below using only what I have provided. MISSING stays MISSING — do not guess, infer, or fill gaps. No encouragement, no commentary, no prose outside the documents.
>
> VISION.md: Vision (stable — should not change after this session)
> ```
> # Logline
> One sentence. What it does.
>
> # Problem / Solution
> - The problem
> - The non-obvious insight that makes this approach work
> - Why existing solutions miss this
> - The outcome difference for the user
>
> # How It Works
> - The core user goal
> - Primary user flow (numbered steps)
> - Actors: who/what participates (AI, agents, reviewers, etc.)
> - Secondary goals
> - What this does NOT do
> ```
>
> SOLUTION.md: Solution (expected to evolve)
> ```
> # Technical Spec
> - System components (list)
> - How each actor interacts with each component (2-4 sentences, 1-2 examples if warranted)
> - Key decisions already made
> - Open questions (flag, do not guess)
> ```
>
> EDGE_CASES.md: Edge Cases & Constraints (test backlog)
> ```
> # Edge Cases & Constraints
> - Case: [what happens]
> - Why it matters: [impact on core solution]
> - Status: [resolved / open question]
> ```

Then paste your state document.

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
