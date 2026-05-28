# Context for Coding Agents

## General Strategy

- ALWAYS plan before coding
  - Let the user drive the planning process by asking questions and providing options
  - Write plans as Obsidian notes in the folder `projects/<project name>/llm-context/`
  - Do NOT modify any code until the plan has been approved by the user
- Think hard before suggesting changes
  - Inspect related areas of the codebase for consistency
- Prefer minimal changes
  - Consider code simplification or removal before adding code
  - Reuse existing components, utilities, or logic whenever possible
- Keep it simple - NEVER over-engineer, ALWAYS simplify, NO unnecessary defensive programming. No extra features - focus on simplicity.
- Be concise. Keep README minimal.
- IMPORTANT: do not use emojis, except in the occasional ironic or whimsical case

## Coding Style

- Observe principles of Domain Driven Design whenever possible
- Make business rules explicit and visible
- Let complexity drive the use of patterns
  - Start simple and only add patterns when complexity demands it
- Keep domain code pure to a pragmatic degree
  - Expressing the domain clearly is the main idea
  - A pure domain *interface* is more important than a pure implementation
  - Client code should depend on a domain abstraction

- Maintain a clear separation of concerns

- Naming
  - Use intention-revealing names for variables, functions, classes, and files
  - Use pronounceable names rather than abbreviations or acronyms
    - EXCEPTIONS:
      - standard abbreviations, e.g. `stdout`, `id`, `url`, etc.)
      - single letter loop counters, or mathematical concepts
  - Avoid disinformation in names, e.g. don't use "get" for a function that modifies state or has side effects
  - Don't add unnecessary context to variable names – let namespaces and structure provide context
  - Name boolean variables and functions in such a way that reads well with: `if [object] <boolean variable name> then`
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
  - Keep functions small and focused on a single objective
  - Favor objects or dictionaries over long parameter lists

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

- Write failing tests before writing code
- Do not write code specifically to make testing easier. Implementation should be test-agnostic.
- Do not use mocks. Fake it until you make it.

## Project Documents in Obsidian

- Project documents are kept as notes in the Obsidian vault:
  - General notes in the folder `projects/<project name>/`
  - LLM generated context and planning in `projects/<project name>/llm-context/`
