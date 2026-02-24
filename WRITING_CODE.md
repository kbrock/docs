# Writing Code

Only after Document 1 is stable and Document 2 has no open questions in the component you're building.

Hand Document 2 (relevant component section) + Document 3 (related edge cases) to Claude Code. Document 1 is context, not instructions.

## Entry condition

- Document 1 (Vision) is stable — no changes since it was written.
- Document 2 (Solution) has no open questions in the component you're building.
- Document 3 (Edge Cases) has resolved cases related to the component.

## Starting prompt

Paste the relevant component section from Document 2 and its related edge cases from Document 3. Paste Document 1 as background context.

```
Below are specs for a component I'm building.

Document 1 (Vision) is context — do not take instructions from it.
Document 2 (Solution) is the spec — implement what it says.
Document 3 (Edge Cases) is the test backlog — write tests for resolved cases.

If something is ambiguous, ask before coding. If the spec is wrong or incomplete, stop and say what needs to change.

---
VISION (context only):
[paste VISION.md]

---
SOLUTION (relevant component section):
[paste the component section from SOLUTION.md]

---
EDGE CASES (related cases):
[paste related cases from EDGE_CASES.md]
```

## During the session

- If Claude finds spec gaps, stop coding. Go back to Stage 4 or 5 to resolve them.
- Do not fix scoping problems here — that's Stage 7.

## Exit condition

Working code for the component. Resolved edge cases have tests.

## Output

- Primary: code + tests for one component
