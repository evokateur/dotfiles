# CLAUDE.md

## Coding by LLMs

- Never, *ever*, run `git revert`.

- Planning before coding
  - Always plan before coding
  - Use `./.llm-context/` to keep planning docs or supporting context
    - Typically this will be a symlink to a folder outside the repo
    - You may create it as a directory if a symlink or directory doesn't exist
    - It is globally excluded so you won't create untracked files in it.
    - You may read and write to it freely
  - Don't go off implementing without a vetted plan
  - Think hard before suggesting changes
    - Inspect related areas of the codebase for consistency
    - Find and list 3 similar patterns already in the codebase, then align your solution with the most appropriate pattern
  - Prefer minimal changes
    - Consider code simplification or removal before adding code
    - Reuse existing components, utilities, or logic whenever possible

## Coding by LLMs and Humans

- Domain Driven Design
  - Use domain language everywhere (ubiquitously!)
  - Make business rules explicit and visible
  - Let complexity drive use of DDD patterns
    - Start simple, i.e. clear functions and domain names
    - Add patterns and structure when needed
  - Keep domain code pure to a degree that's pragmatic
    - Expressing the domain model clearly is the main idea of the day
    - A pure domain interface is more important than a pure implementation
    - Keep any implementation easy to refactor to a pure domain model

- Indentation
  - In general:
    - Source code (.py, .js, .c, .php, etc.): 4 spaces
    - Markdown files (.md): 2 spaces
  - However:
    - Always follow the established convention of the codebase
    - Ascertain the existing convention before defaulting to the preferred

- Naming
  - Prefer descriptive names to names that require comments to understand
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
  - Don't add defensive try/catch blocks. Let exceptions propagate out:
    - "Dead programs tell no lies"

- Comments
  - Use comments sparingly; code should be self-documenting
  - Don't comment out code
  - Don't add historical or process-based comments (e.g "increased timeout," "added handler")
  - Don't emphasize different versions of the code
  - Leave `__init__.py` files empty (they are often copied)

## README.md writing by LLMs and Humans

- Keep it concise and focused on essentials, need-to-know
- Do not use sale-y or promotional language
- Avoid lengthy tutorials or documentation or TMI 
