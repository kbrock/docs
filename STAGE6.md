# Stage 6 — Split Components from Document 3

**Command:** `/spec-split`

When an edge case in Document 3 has 3+ related cases, it's a component that needs its own scope. New session: paste those cases, ask Claude to draft a component spec. That component spec lives in Document 2 as a subsection.

## Entry condition

You've identified 3+ related edge cases in Document 3 that cluster around the same area.

## Starting prompt

Paste the related edge cases, then:

```
You are a technical scribe. Below are related edge cases from my spec. They cluster around a single component. Draft a component spec with:
- What the component does (one sentence)
- Actors involved
- How it interacts with the rest of the system (2-4 sentences)
- The edge cases it must handle (from the list below)

Do not infer beyond what I say. Do not guess.

---
[paste the 3+ related edge cases from EDGE_CASES.md]
```

## During the session

Review the drafted component spec. Correct it. The result becomes a subsection of Document 2.

## Exit condition

The component spec is drafted and inserted as a subsection of Document 2 (SOLUTION.md).

## Output

- Primary: new subsection in Document 2 scoped to this component
