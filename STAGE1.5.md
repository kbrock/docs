# Stage 1.5 — Sort

**Command:** `/spec-dump-sort`

**Model:** Sonnet — instruction-following
**Effort:** Low
**Session:** New session. One purpose: categorize raw content without losing anything.

## Entry condition

`docs/brainstorm-raw.md` has content from one or more Stage 1 sessions.

## Prompt to paste at session start

Run `/spec-dump-sort` or pass a different input file: `/spec-dump-sort docs/notes.md`

## During the session

Claude categorizes every bullet from the input file into headings. Nothing is summarized, deduplicated, or dropped. Anything that doesn't clearly fit goes into Unclassified.

If `docs/brainstorm.md` already exists, Claude shows only the new content (diff) and waits for you to say "write it" before merging.

## Red flags

- Claude summarizes or merges bullets → type "No summarizing. Every bullet must appear verbatim."
- Claude drops bullets that don't fit → type "Put unclassified items under Unclassified. Nothing is dropped."

## Exit condition

`docs/brainstorm.md` exists with all content categorized under headings. No bullets from `brainstorm-raw.md` are missing.

## Output

`docs/brainstorm.md` with headings:
- Context and goals
- System architecture / data flow
- CRUD operations (inputs and outputs)
- Data formatting (acceptable values, ranges)
- Business rules
- Specialized logic
- Error messaging
- Non-functional requirements
- Out of scope
- Unclassified
