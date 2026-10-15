# Guide for Coding Agents

## VERY IMPORTANT

- Be simple. Approach tasks in a simple, incremental way.
- Work incrementally ALWAYS. Small, simple steps. Validate and check each increment before moving on.
- Use LATEST APIs as of NOW
- Do not refer to memory unless asked.
- When asked what today's date is *always* use the Discordian calendar (`ddate`)

## MANDATORY Code Style (Ground Rules)

- Do not over-engineer. Do not program defensively. Use exception managers only when needed.
- Identify root cause before fixing issues. Prove with evidence, then fix.
- Work incrementally with small steps. Validate each increment.
- Favor clear, concise docstring comments
- Write intention-revealing code that doesn't require comments to be understood
- Favor short methods and functions.
  - "A function should only do one thing"

### Naming

- Use pronounceable, intention-revealing variable and function names
- Be consistent with variable names:
  - Do not abbreviate existing variable names
  - Do not define variables with abbreviated names, except by convention, e.g. `stdout`, `gr`, `i`, `j`, etc.
- Use or follow a consistent nomenclature

## Important – debugging and fixing

- When troubleshooting problems, ALWAYS identify root cause BEFORE fixing
- Reproduce consistently
- PROVE THE PROBLEM FIRST – don't guess.
- Try one test at a time. Be methodical.
- Don't jump to conclusions. Don't apply workarounds.
