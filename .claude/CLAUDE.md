# CLAUDE.md

## 🎨 Code Style

- Use consistent indentation
  - Indent with 4 spaces in source code files (.py, .js, etc.)
  - Indent with 2 spaces in Markdown files (.md)

- Prefer editing an existing file to creating a new one.
- Never create documentation files (`*.md` or README).
  - Only create documentation files if explicitly requested by the user.

- Don't write forgiving code
- Don't add defensive try/catch blocks
  - Usually we let exceptions propagate out
  - Dead programs tell no lies

- Use meaningful, pronounceable variable names.
- Use function names that describe their purpose
  - Example: `greaterThan` instead of `gt`
  - Don't worry about the length of function names
- Don't use abbreviations or acronyms
  - Choose `number` instead of `num` and `greaterThan` instead of `gt`

### Commenting

- Don't use comments, if possible
  - Let the code speak for itself
  - Well written code is self-documenting
  - I prefer a long, descriptive names to comments
- Don't comment out code
  - Remove it instead
- Don't add comments that describe the process of changing code
  - Comments should not include past tense verbs like added, removed, or changed
  - Example: `this.timeout(10_000); // Increase timeout for API calls`
  - This is bad because a reader doesn't know what the timeout was increased from, and doesn't care about the old behavior
- Don't add comments that emphasize different versions of the code, like "this code now handles"
- Do not use end-of-line comments
  - Place comments above the code they describe
- Leave `__init__.py` files empty
  - I often copy them to subdirectories
