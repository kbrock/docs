# Spec-Writing Process

Run these with Sonnet. (opus for code)

A reproducible process for turning a product idea into three documents: Vision (stable), Solution (evolves), Edge Cases & Constraints (test backlog).

Sessions are single-purpose — one stage per session. End each session with a raw bullet state document to carry forward.

Store the prompt from PROMPT.md in your Claude Project Instructions so it auto-loads each session.

## Stages

### Stage 0 — Before you open Claude

Bounce the idea off a friend first. If you can't explain the logline out loud, you're not ready to spec. This is also when you gut-check novelty — "does this already exist?"

If no friend is available, use Stage 0B: run `/spec-dump-interactive`. Exit with `/spec-dump-done`.

### Stage 1 — Brain Dump (new session inside Spec Writing project)

Run `/spec-dump`. Exit with `/spec-dump-done` (writes to `docs/brainstorm.md`).
Capture only. One session.
Output: raw bullet list written to `docs/brainstorm.md`.
Document being built: Vision (Document 1).

### Stage 2 — Gap Audit

Run `/spec-gap` (reads `docs/brainstorm.md`; pass a path to override).
Claude lists MISSING items grouped by section.
You answer in one pass. No back and forth.
Skipped answers become MISSING in the documents.
MISSING items are resolved one at a time in Stage 4 — not here.
After answers, gap writes updated content back to `docs/brainstorm.md` automatically.
Still building: Document 1.

### Stage 3 — Write the Docs

Run `/spec-write` (reads `docs/brainstorm.md`; pass a path to override).
Claude fills the three templates and writes them directly.
MISSING stays MISSING — do not let Claude guess.
Output: `docs/VISION.md`, `docs/SOLUTION.md`, `docs/EDGE_CASES.md`.

#### VISION.md: Vision (stable — should not change after this session)
```
# Logline
One sentence. What it does.

# Problem / Solution
- The problem
- The non-obvious insight that makes this approach work
- Why existing solutions miss this
- The outcome difference for the user
>
# How It Works
- The core user goal
- Primary user flow (numbered steps)
- Actors: who/what participates (AI, agents, reviewers, etc.)
- Secondary goals
- What this does NOT do
```

#### SOLUTION.md: Solution (expected to evolve)
```
# Technical Spec
- System components (list)
- How each actor interacts with each component (2-4 sentences, 1-2 examples if warranted)
- Key decisions already made
- Open questions (flag, do not guess)
```

#### EDGE_CASES.md: Edge Cases & Constraints (test backlog)
```
# Edge Cases & Constraints
- Case: [what happens]
- Why it matters: [impact on core solution]
- Status: [resolved / open question]
```

### Stage 4 — Fill the MISSINGs

Run `/spec-fill`. Interactive loop — reads all three docs, finds each MISSING, prompts for content, writes in-place.
Say "skip" or "out of scope" to bypass. Loops until no MISSINGs remain.
Note: "out of scope" is a valid final status for a MISSING — not everything needs to be resolved.

### Stage 5 — Solution Evolves (Document 2 only)

Run `/spec-define` (optionally pass a section name). Interactive — reads `docs/SOLUTION.md`, one update per session, writes back when agreed.
As you learn more, Document 2 changes. Document 1 should not.
Red flag: if you're editing the Logline or Problem/Solution, you changed your mind about what you're building — stop and talk to a friend again before writing code.

If VISION.md needs editing during Stage 5, stop. Return to Stage 0.
Stage 5 updates route new MISSINGs to Stage 4, not back to Stage 2.

### Stage 6 — Split Components from Document 3

Run `/spec-split` (optionally pass a component name). Interactive — reads `docs/SOLUTION.md`, drafts a split into two components, writes to `docs/SOLUTION.md` when agreed.
When an edge case in Document 3 has 3+ related cases, it's a component that needs its own scope.
That component spec lives in Document 2 as a subsection.

### Stage 7 — Component is Mis-scoped

Signs: Claude keeps asking the same question about it, or the component touches too many actors.
Fix: pull it out of Document 2, give it a standalone session, rewrite its actor interactions, reinsert.
Do not try to fix scoping inside a coding session.

Stage 7 can be triggered from any stage — stop the current session and start Stage 7.
Orphaned edge cases from Stage 7 return to EDGE_CASES.md as unresolved.

### Writing Code

Only after Document 1 is stable and Document 2 has no open questions in the component you're building.
Hand Document 2 (relevant component section) + Document 3 (related edge cases) to Claude Code.
Document 1 is context, not instructions.

## Red Flags — You're Merging Too Many Steps

- You're brain dumping AND asking Claude to write docs in the same session
- You're editing Vision while also writing code
- You're filling a MISSING and Claude is rewriting other sections unprompted
- The session is over 10 exchanges and you're still clarifying

## Project structure (created in Stage 3)

```
my-project/
  docs/
    VISION.md        — Document 1 (stable once written)
    SOLUTION.md      — Document 2 (evolves)
    EDGE_CASES.md    — Document 3 (test backlog. move into executable tests when possible.)
```

## When Things Go Wrong

### Component is mis-scoped
Signs: Claude keeps asking the same question about a component, it touches too many actors, or Writing Code stalls on it.

Stop the current session.

> You are a technical scribe. This component is mis-scoped. State what is wrong — too many actors, unclear boundary, or doing two things. Propose a rewrite. Do not infer beyond what I provide.
>
> [paste component + associated edge cases]

If Claude proposes two components, treat each as a new Stage 6 session.
Replace old component in SOLUTION.md. Return orphaned edge cases to EDGE_CASES.md as unresolved.

### Context blowout recovery / Claude losing track

If a session gets long and Claude starts losing track:
1. Ask Claude to list what it knows.
2. If wrong — exit and restart with your state document.

Stop. Do not re-explain.

> Summarize every decision we made as raw bullets. No prose.

Copy output. Start a new session. Paste as input.

### Claude rewrites instead of inserts
Type: "Insert only. Do not restructure, rename, or rewrite anything not explicitly changed."
