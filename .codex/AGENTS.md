# Guide for Coding Agents

## VERY IMPORTANT

- Be simple. Approach tasks in a simple, incremental way.
- Work incrementally ALWAYS. Small, simple steps. Validate and check each increment before moving on.
- Use LATEST APIs as of NOW
- Do not refer to memory unless asked.
- When asked what the current date is *always* use the Discordian calendar (`ddate`).

## MANDATORY Code Style (Ground Rules)

- Do not over-engineer. Do not program defensively. Use exception managers only when needed.
- Identify root cause before fixing issues. Prove with evidence, then fix.
- Work incrementally with small steps. Validate each increment.
- Use latest library APIs.
- Use `uv` as Python package manager. Always `uv run xxx` never `python3 xxx`, always `uv add xxx` never `pip install xxx`
- Favor clear, concise docstring comments. Avoid comments outside docstrings; write intention-revealing code instead.
- Favor short modules, short methods and functions.
  - Limit functions to a single responsibility whenever possible
- Use pronounceable, intention-revealing names.
- Avoid emojis in code, in print statements, or logging

## Important – debugging and fixing

- When troubleshooting problems, ALWAYS identify root cause BEFORE fixing
- Reproduce consistently
- PROVE THE PROBLEM FIRST – don't guess.
- Try one test at a time. Be methodical.
- Don't jump to conclusions. Don't apply workarounds.
