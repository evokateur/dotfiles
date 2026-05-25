# Context for Coding Agents

## General Strategy

- Always plan before coding
  - Let the user drive the planning process by asking questions and providing options
  - Write LLM generated plans as notes in the Obsidian vault in `projects/<project name>/llm-context/`
  - Do NOT start implementing until a plan has been persisted, reviewed, and approved
- Think hard before suggesting changes
  - Inspect related areas of the codebase for consistency
- Prefer minimal changes
  - Consider code simplification or removal before adding code
  - Reuse existing components, utilities, or logic whenever possible
- Keep it simple - NEVER over-engineer, ALWAYS simplify, NO unnecessary defensive programming. No extra features - focus on simplicity.
- Be concise. Keep README minimal. IMPORTANT: do not use emojis, except in the occasional ironic or whimsical cases.

## Coding Standards

- Make business rules explicit and visible
- Observe principles of Domain Driven Design whenever possible
- Let complexity drive the use of DDD patterns
  - Start simple, i.e. clear functions and consistent domain language, and only add patterns when complexity demands it
- Keep domain code pure to a pragmatic degree
  - Expressing the domain clearly is the main idea
  - A pure domain *interface* is more important than a pure implementation
  - Client code should depend on a domain abstraction

- Maintain a clear separation of concerns
  - Separate business logic from infrastructure and framework code
  - Use layers or modules to organize code by responsibility

- Naming
  - Use intention-revealing names for variables, functions, classes, and files
  - Use pronounceable names rather than abbreviations or acronyms
    - EXCEPTIONS:
      - standard abbreviations, e.g. `stdout`, `id`, `url`, etc.)
      - single letter variable names for loop counters (e.g. `i`, `j`, `k`) or mathematical concepts (e.g. `x`, `y`, `z`)
  - Avoid disinformation in names, e.g. don't use "get" for a function that modifies state or has side effects
  - Don't add unnecessary context to variable names – let namespaces and structure provide context
  - Name boolean variables and functions so as to a form a clear predicate in `if [thing] <name> then`
    - Examples: `isActive`, `is_not_active`, `hasPermission`, `does_not_have_permission`, `contains_y`, `doesNotContainY`

- Casing
  - Follow established conventions by language and codebase
    - Python: `snake_case` for variables and functions, `PascalCase` for classes
    - JavaScript: `camelCase` for variables and functions, `PascalCase` for classes

- Indentation
  - Follow the established convention of the codebase to keep diffs meaningful.
  - General preference:
    - Source code (`.py`, `.js`, `.c`, `.php`, etc.): 4 spaces (no tabs)
    - Markdown files (`.md`): 2 spaces

- Functions
  - Keep functions small and focused on a single task
  - Avoid long parameter lists; use objects or dictionaries if necessary
  - Avoid side effects in functions; they should be pure when possible

- Error Handling
  - Don't write forgiving code
  - Don't add defensive try/catch blocks. Let exceptions propagate out:
    - "Dead programs tell no lies"

- Comments
  - Use comments ONLY when necessary; code should be self-documenting
  - Don't leave commented out code
  - Don't add historical or process-based comments (e.g "increased timeout," "added handler")
  - Don't emphasize different versions of the code
  - Leave `__init__.py` files empty (they are often copied)

## Testing

- Test driven development is preferable. Write failing tests first, then an implementation that makes them pass.
- Do not write code specifically to make testing easier. Implementation should be test-agnostic.
- Do not use mocks. Fake it until you make it.

## Project Documents in Obsidian

- Project documents are kept in the Obsidian vault as notes:
  - General docs in the folder `projects/<project name>/`
  - LLM generated Markdown for context and planning in `projects/<project name>/llm-context/`
