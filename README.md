# Spec-Writing Process

Run these with Sonnet. (opus for code)

A reproducible process for turning a product idea into three documents: Vision (stable), Solution (evolves), Edge Cases & Constraints (test backlog).

Sessions are single-purpose — one stage per session. End each session with a raw bullet state document to carry forward.

Store the prompt from PROMPT.md in your Claude Project Instructions so it auto-loads each session.

## Stages

### Stage 0A — Brain Dump (new session inside Spec Writing project)

Run `/spec-dump`. Exit with `/spec-dump-done` (appends raw verbatim bullets to `docs/brainstorm-raw.md`).
Can be run multiple times — each run appends under a `--- [append] ---` separator. Nothing is lost.
Capture only. One session.

> `/spec-dump`: You are a technical scribe. Acknowledge each message with only "got it." Do not ask questions, do not organize, do not summarize.
>
> `/spec-dump-done`: Bullet list everything we just discovered. No prose. No encouragement. No deduplication. No summarizing — preserve every detail verbatim. Appends to docs/brainstorm-raw.md.

### Stage 0B — Brainstorm with Claude (new session)

Use when you want Claude to interview you rather than just receive your dump. Run `/spec-dump-interactive`. Exit with `/spec-dump-done` (appends bullets to `docs/brainstorm-raw.md`).

> `/spec-dump-interactive`: I want to brainstorm an idea. Ask me one question at a time. Do not summarize, do not organize, do not encourage. Just ask the next most useful question. If I go off-topic or add detail beyond what the current question needs, acknowledge it with "noted" and bring me back with the next question. Do not follow tangents.
>
> `/spec-dump-done`: Bullet list everything we just discovered. No prose. No encouragement. No deduplication. No summarizing — preserve every detail verbatim. Appends to docs/brainstorm-raw.md.

### Stage 1 — Sort (new session)

Run `/spec-dump-sort` after one or more Stage 0A or 0B sessions. Categorizes `brainstorm-raw.md` into `brainstorm.md` under the checklist headings. No content is lost — everything lands somewhere, even if only in Unclassified.

Run again any time you add more raw content. If `brainstorm.md` already exists, shows a diff of new content and waits for confirmation before merging.

Pass a different file as argument to sort content from another source: `/spec-dump-sort docs/notes.md`

> `/spec-dump-sort`: Reads docs/brainstorm-raw.md (or $ARGUMENTS). Categorizes into: Context and goals, System architecture/data flow, CRUD operations, Data formatting, Business rules, Specialized logic, Error messaging, Non-functional requirements, Out of scope, Unclassified. No summarizing, no deduplication. If brainstorm.md exists, shows diff and waits for confirmation before writing.

### Stage 2 — Gap Audit

Run `/spec-gap` (reads `docs/brainstorm.md`; pass a path to override).
Claude lists MISSING items grouped by section.
You answer in one pass. No back and forth.
Skipped answers become MISSING in the documents.
Deferred answers (internal to a component not yet defined) become `Status: defer to Stage 6` in EDGE_CASES.md — not MISSING in SOLUTION.md.
MISSING items are resolved one at a time in Stage 4 — not here.
After answers, gap writes updated content back to `docs/brainstorm.md` automatically.
Still building: Document 1.

> `/spec-gap`: You are a technical scribe. Read docs/brainstorm.md (or $ARGUMENTS if provided). List only the questions you need answered to fill the three documents below. Group by: Vision, Solution, Edge Cases. Do not write the documents yet. Do not ask follow-up questions. Wait for my answers. After I have answered all questions, write updated content back to docs/brainstorm.md (or $ARGUMENTS if provided).

### Stage 3 — Write the Docs

Run `/spec-write` (reads `docs/brainstorm.md`; pass a path to override).
Claude fills the three templates and writes them directly.
MISSING stays MISSING — do not let Claude guess.
Output: `docs/VISION.md`, `docs/SOLUTION.md`, `docs/EDGE_CASES.md`.

> `/spec-write`: You are a technical scribe. Read docs/brainstorm.md (or $ARGUMENTS if provided). Write the three documents using only what is provided. MISSING stays MISSING — do not guess, infer, or fill gaps. No encouragement, no commentary, no prose outside the documents. Write output to docs/VISION.md, docs/SOLUTION.md, docs/EDGE_CASES.md.

#### VISION.md: Vision (stable — should not change after this session)
```
# Logline
Helps [persona] do X by doing Y.

# Problem / Solution
- The problem
- Why existing solutions miss this
- The outcome difference for the user

# Personas
- Who uses this, in what context, and what they are trying to accomplish

# User Flow
- Numbered steps of the primary interaction

# System Actors
- What non-human participants do (AI, agents, validators, etc.)

# Out of Scope
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
- Status: [resolved / open question / defer to Stage 6]
```

### Stage 3.5 — Audit (new session, Opus)

Run `/spec-audit` after Stage 3, and again any time documents change significantly.
Checks consistency across all three documents and verifies completeness against a standard checklist.
Do not fix anything in this session — route each problem to Stage 4 or Stage 5.

> `/spec-audit`: You are a technical reviewer. Read docs/VISION.md, docs/SOLUTION.md, docs/EDGE_CASES.md. Check for:
> - Logical contradictions between sections or documents
> - Gaps in the user flow (missing steps, unhandled states)
> - Actors mentioned but not defined, or defined but never used
> - Anything in SOLUTION.md that contradicts VISION.md
> - Anything in the code that contradicts or is absent from the spec
> - Sections that are vague enough to be misunderstood
>
> Also verify that the three documents together cover each of the following. Flag any that are absent or too vague to be actionable:
> - Context and goals (plain English, no jargon)
> - System architecture or data flow (diagram or equivalent description)
> - CRUD operations: what inputs come in, what outputs go out
> - Data formatting: acceptable values, expected ranges
> - Business rules: given inputs, what outputs are expected
> - Specialized logic
> - Error messaging
> - Non-functional requirements: response times, capacity, uptime, resiliency, versioning, environment details
> - What is explicitly out of scope
>
> Output only a list of problems to screen. No fixes, no suggestions, no encouragement. Label each by document and section. No prose.

### Stage 4 — Fill the MISSINGs

Run `/spec-fill`. Interactive loop — reads all three docs, finds each MISSING, prompts for content, writes in-place.
Say "skip" or "out of scope" to bypass. Loops until no MISSINGs remain.
Note: "out of scope" is a valid final status for a MISSING — not everything needs to be resolved.

> `/spec-fill`: You are a technical scribe. Read docs/VISION.md, docs/SOLUTION.md, docs/EDGE_CASES.md. Find the first MISSING marker across all three documents. Ask me the questions needed to fill it. Do not infer beyond what I say. Do not rewrite or touch anything outside that section. When I have answered, write the resolved content in-place to the file. Then find the next MISSING and repeat. If I say "skip" or "out of scope", mark it accordingly and move to the next MISSING. When no MISSINGs remain, say so.

### Stage 5 — Solution Evolves (Document 2 only)

Run `/spec-define` (optionally pass a section name). Interactive — reads `docs/SOLUTION.md`, one update per session, writes back when agreed.
As you learn more, Document 2 changes. Document 1 should not.
Red flag: if you're editing the Logline or Problem/Solution, you changed your mind about what you're building — stop and talk to a friend again before writing code.

> `/spec-define`: You are a technical scribe. Read docs/SOLUTION.md. If $ARGUMENTS is provided, focus on that section. I have one update. Insert only. Do not rewrite surrounding content. Do not touch VISION.md. When we have agreed on the update, write it to docs/SOLUTION.md.

If VISION.md needs editing during Stage 5, stop. Return to Stage 0.
Stage 5 updates route new MISSINGs to Stage 4, not back to Stage 2.

### Stage 6 — Split Components from Document 3

Run `/spec-split` (optionally pass a component name). Interactive — reads `docs/SOLUTION.md`, drafts a split into two components, writes to `docs/SOLUTION.md` when agreed.
When an edge case in Document 3 has 3+ related cases, it's a component that needs its own scope.
That component spec lives in Document 2 as a subsection.

> `/spec-split`: You are a technical scribe. Read docs/SOLUTION.md. If $ARGUMENTS is provided, focus on that component. Identify related edge cases that cluster around a single component and draft a split into two components with: what each component does (one sentence each), actors involved, how each interacts with the rest of the system (2-4 sentences), the edge cases each must handle. Do not infer beyond what I say. Do not guess. When we have agreed on the split, write the updated component sections to docs/SOLUTION.md.

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

## Project setup (do this before Stage 1)

```bash
mkdir -p my-project/docs
cd my-project
git init
```

Create `CLAUDE.md` at the repo root:
```
Read docs/PROCESS.md at the start of each session to understand the spec-writing stages.
```

Copy or symlink README as `docs/PROCESS.md` so Claude Code sessions have stage context.

Also paste README into your Claude Project Instructions for web sessions.

## Project structure (files created in Stage 3)

```
my-project/
  CLAUDE.md
  docs/
    PROCESS.md       — copy of this README (context for Claude)
    brainstorm-raw.md — verbatim dump output (append-only, never edited)
    brainstorm.md    — categorized, created in Stage 1.5
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

### Too much detail in SOLUTION.md

Signs: you've been answering questions for more than an hour, decisions feel implementation-level, or you don't know the answer yet because you haven't built it.

Stop the current session.

> We're in the weeds. Read docs/SOLUTION.md. For each decision, classify it: does changing it affect the interface between components? If yes, keep it. If no, move it to EDGE_CASES.md with Status: defer to Stage 6. List what you would move before changing anything. Do not write yet.

Review the list. Confirm, then tell Claude to write.

### Claude rewrites instead of inserts
Type: "Insert only. Do not restructure, rename, or rewrite anything not explicitly changed."
