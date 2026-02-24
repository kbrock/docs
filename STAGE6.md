# Stage 6 — Split Components from Document 3

**Command:** `/spec-split`

When an edge case in Document 3 has 3+ related cases, it's a component that needs its own scope. New session: paste those cases, ask Claude to draft a component spec. That component spec lives in Document 2 as a subsection.

## Entry condition

You've identified 3+ related edge cases in Document 3 that cluster around the same area.

## Starting prompt

Run `/spec-split`. Reads `docs/SOLUTION.md`. Optionally pass a component name as argument. Interactive split into two components. When agreed, writes updated sections to `docs/SOLUTION.md`.

## During the session

Review the drafted component spec. Correct it. The result becomes a subsection of Document 2.

## Exit condition

The component spec is drafted and inserted as a subsection of Document 2 (SOLUTION.md).

## Output

- Primary: new subsection in Document 2 scoped to this component
