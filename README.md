# Spec-Writing Process

Run these with Sonnet. (opus for code)

A reproducible process for turning a product idea into three documents: Vision (stable), Solution (evolves), Edge Cases & Constraints (test backlog).

Sessions are single-purpose — one stage per session. End each session with a raw bullet state document to carry forward.

Store the prompt from PROMPT.md in your Claude Project Instructions so it auto-loads each session.

## Stages

### Stage 0 — Before you open Claude

Bounce the idea off a friend first. If you can't explain the logline out loud, you're not ready to spec. This is also when you gut-check novelty — "does this already exist?"

### Stage 1 — Brain Dump (new session inside Spec Writing project)

Capture only. One session. Say DONE when empty.
Output: raw state document (bullet list, you copy it out).
Document being built: Vision (Document 1).

### Stage 2 — Gap Audit (new session, paste state document)

Claude lists MISSING items grouped by section.
You answer in one pass. No back and forth.
Skipped answers become MISSING in the documents.
MISSING items are resolved one at a time in Stage 4 — not here.

Output: updated state document.
Still building: Document 1.

### Stage 3 — Write the Docs (new session, paste updated state document)

Claude fills the three templates.
MISSING stays MISSING — do not let Claude guess.
Output: Document 1 (Vision), Document 2 (Solution), Document 3 (Edge Cases).
Create your Project now. Store all three documents here.

### Stage 4 — Fill the MISSINGs

Each MISSING is a small session. One MISSING at a time.
Paste the specific section, talk it through, update that section only.
Do not reopen the whole document in one session.
Note: "out of scope" is a valid final status for a MISSING — not everything needs to be resolved.

### Stage 5 — Solution Evolves (Document 2 only)

As you learn more, Document 2 changes. Document 1 should not.
Red flag: if you're editing the Logline or Problem/Solution, you changed your mind about what you're building — stop and talk to a friend again before writing code.

If VISION.md needs editing during Stage 5, stop. Return to Stage 0.
Stage 5 updates route new MISSINGs to Stage 4, not back to Stage 2.

### Stage 6 — Split Components from Document 3

When an edge case in Document 3 has 3+ related cases, it's a component that needs its own scope.
New session: paste those cases, ask Claude to draft a component spec.
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
