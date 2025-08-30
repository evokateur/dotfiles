# CLAUDE.md

## Coding by LLMs

- Planning before coding
  - Always plan before coding
  - Use `/llm-context/` to keep planning docs or supporting context
    - Create it if it doesn't exist
  - Do not implement code without a documented plan
  - Think hard before suggesting changes
    - Inspect related areas of the codebase for consistency
    - Find and list 3 similar patterns already in the codebase, then align your solution with the most appropriate pattern
  - Prefer minimal changes
    - Consider code simplification or removal before adding code
    - Reuse existing components, utilities, or logic whenever possible

## Coding by LLMs and Humans

- Indentation
  - Source code (.py, .js, .c, .php, etc.): 4 spaces
  - Markdown files (.md): 2 spaces

- Naming
  - Use descriptive names instead of comments
  - Don't use abbreviations or acronyms (except standard ones, e.g. `stdout`, `id`, `url`, etc.)
  - Avoid single-letter variable names, except for loop counters
  - Follow conventions for specific languages:
    - Python: `snake_case` for variables and functions, `PascalCase` for classes
    - JavaScript: `camelCase` for variables and functions, `PascalCase` for classes
    - HTML: kebab-case for file names and CSS classes
  - Use is or has prefixes for boolean variables and functions
    - Example: `isActive` or `is_active`, `hasPermission` or `has_permission`

- Functions
  - Use descriptive function names
  - Keep functions small and focused on a single task
  - Avoid long parameter lists; use objects or dictionaries if necessary
  - Avoid side effects in functions; they should be pure when possible

- Error Handling
  - Don't write forgiving code
  - Don't add defensive try/catch blocks. Let exceptions propagate out
  - "Dead programs tell no lies"

- Comments
  - Use comments sparingly; code should be self-documenting
  - Don't comment out code
  - Don't add historical or process-based comments (e.g "increased timeout," "added handler")
  - Don't emphasize different versions of the code
  - Leave `__init__.py` files empty (they are often copied)
