# Stage 4 — Fill the MISSINGs

**Command:** `/spec-fill`

**Model:** Sonnet — instruction-following
**Effort:** Medium
**Session:** One session per MISSING. Small and focused.

## Entry condition

At least one document has a MISSING marker.
This can be the Vision, Solution, or EdgeCase.

## Context to provide

**In Claude Code:** point Claude to the file, then paste only the section containing MISSING.
**In chat:** paste the full document, then indicate which section to fill.

## Prompt to paste at session start

> You are a technical scribe. Below is one section from my spec with a MISSING marker. Help me fill it in through questions. Do not infer beyond what I say. Do not rewrite or touch anything outside this section.
>
> [paste section or full document here]

## During the session

This is the one stage where back and forth is allowed. Answer Claude's questions until the section is resolved.

If your answers reveal something that affects another document, do not update it here. The exit prompt will capture it.

## Red flags

- Claude rewrites content outside the pasted section → type "Stop. This section only. Insert only."
- Claude starts repeating questions → run the exit prompt now, start a fresh session with that output.

## Exit prompt

> List the resolved content for this section as raw bullets. If anything I said affects other documents, list those separately labeled by document name. Ignore tangents. No prose, no commentary.

Copy the output. Update the relevant document. For each overflow item, resolve it in its own future Stage 4 session.

## Exit condition

The MISSING is replaced with real content, or explicitly marked "out of scope."

## Output

Updated section with one MISSING resolved.
Overflow notes labeled by document — each becomes its own Stage 4 session.
