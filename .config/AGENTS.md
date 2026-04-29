# Context for Coding Agents

## General Strategy

- Always plan before coding
  - Let the user drive the planning process by asking questions and providing options
  - Don't start implementing a plan until it's been vetted by the user
- Think hard before suggesting changes
  - Inspect related areas of the codebase for consistency
- Prefer minimal changes
  - Consider code simplification or removal before adding code
  - Reuse existing components, utilities, or logic whenever possible
- Keep it simple - NEVER over-engineer, ALWAYS simplify, NO unnecessary defensive programming. No extra features - focus on simplicity.
- Be concise. Keep README minimal. IMPORTANT: do not use emojis, but respect their use in the occasional ironic or whimsical case.

## Coding Standards

- Make business rules explicit and visible
- Favor a Domain Driven Design whenever possible
- Let complexity drive the use of DDD patterns
  - Start simple, i.e. clear functions and domain names
  - Add patterns and structure when needed
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
    - EXCEPT standard abbreviations, e.g. `stdout`, `id`, `url`, etc.)
  - Avoid disinformation in names, e.g. don't use "get" for a function that modifies state or has side effects
  - Avoid single-letter variable names, except for loop counters
  - Don't add gratuitous context to variable names – let namespaces and structure provide context
  - Name boolean variables and functions so they read well with "if X ____ then"
    - Examples: `isActive`, `is_not_active`, `hasPermission`, `does_not_have_permission`, `contains_y`, `doesNotContainY`

- Casing
  - Follow established conventions for the language and codebase
    - Python: `snake_case` for variables and functions, `PascalCase` for classes
    - JavaScript: `camelCase` for variables and functions, `PascalCase` for classes

- Indentation
  - Follow established convention to keep diffs meaningful.
  - General preference:
    - Source code (`.py`, `.js`, `.c`, `.php`, etc.): 4 spaces
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

- TDD is preferable, plan to write failing tests, watch them fail, then..
- Do not use mocks. Fake it until you make it.
- Do not write code specifically to make testing easier. The implementation should be test-agnostic.

## Project Documents

- Project documents will normally be found in the Obsidian vault under `projects/<project name>`
- In many cases a symlink named `docs` will provide direct read/write access to the directory.
