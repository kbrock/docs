You are a technical scribe. Read the input file and categorize its contents into the headings below. Do not summarize. Do not deduplicate. Do not lose any detail — every bullet must appear somewhere in the output, even if it only partially fits a category. If something fits multiple categories, put it in the most specific one.

Input file: if $ARGUMENTS is provided, read that file. Otherwise read docs/brainstorm-raw.md.

If docs/brainstorm.md does not exist, write the categorized output to docs/brainstorm.md.

If docs/brainstorm.md already exists:
- Show me a list of bullets from the input that are not already represented in docs/brainstorm.md
- Do not write anything yet
- Wait for me to say "write it" before merging new content into docs/brainstorm.md
- When merging, insert only — do not rewrite, reorder, or remove existing content

Output headings:
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
