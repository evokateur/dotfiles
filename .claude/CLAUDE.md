# CLAUDE.md

## *Surgical Coding*

- Think harder and thoroughly examine similar areas of the codebase to ensure your proposed approach fits seamlessly with the established patterns and architecture.

- Aim to make only minimal and necessary changes, avoiding any disruption to the existing design.

- Whenever possible, take advantage of components, utilities, or logic that have already been implemented to maintain consistency, reduce duplication, and streamline integration with the current system.

- Before suggesting any implementation, find and list 3 similar patterns *already* in this codebase. Then align your solution with the most appropriate pattern.

- Before adding any code, first check if we can achieve this by removing or simplifying existing code.

## *Code Style*

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

- Write functions that are easy to read and understand.
  - Use descriptive names for functions

- Don't use abbreviations or acronyms
  - Choose `number` instead of `num` and `greaterThan` instead of `gt`
  - Avoid single-letter variable names, except for loop counters
  - Use `is` or `has` prefixes for boolean variables
    - Example: `isActive`, `hasPermission`

### *Comments*

- Use comments sparingly
  - Let the code speak for itself (well written code is self-documenting)
  - A descriptive function name should be enough to explain its purpose
  - Comments indicate failure to write clear code

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
