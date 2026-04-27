# Shared Agent Guidance

These rules apply across the agents in this `opencode` configuration unless a project-specific override says otherwise.

## Coding style

- Follow PEP 8 and local project conventions.
- Prefer short, simple code over unnecessary abstraction.
- Add type hints on important function and interface boundaries.
- Document public functions with Google-style docstrings where appropriate.

## Design

- Keep core logic decoupled from infrastructure concerns where practical.
- Avoid unnecessary computation, repeated work, and wasteful data processing.
- Prefer small, correct changes that fit the existing codebase.

## Testing

- Do not optimize for coverage percentage alone.
- Test core behavior first.
- Cover important corner cases, boundary values, and expected failure paths when the risk justifies it.
- Keep tests simple and focused.

## Documentation

- Keep documentation and usage guidance aligned with code changes.
