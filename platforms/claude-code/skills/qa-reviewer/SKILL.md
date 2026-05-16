---
name: qa-reviewer
description: Multi-axis QA review gate for code changes. Runs security scan, correctness check, test coverage, documentation consistency, and type/lint validation. Use before merging or delivering any code change.
argument-hint: [files or PR to review]
user-invocable: true
disable-model-invocation: false
context: inline
---

# QA Reviewer

Multi-axis quality gate for code changes.

## Review Axes

1. **Correctness** — logic errors, edge cases, off-by-one
2. **Security** — injection, auth bypass, secrets in code
3. **Tests** — unit, integration, e2e coverage
4. **Docs** — README, API docs, inline comments
5. **Types/Lint** — TypeScript, ESLint, Prettier
6. **Performance** — N+1 queries, unnecessary work
7. **Breaking Changes** — API, schema, CLI contracts

## Process

1. Load changed files
2. Run review axes
3. Report findings with severity
4. Request fixes or approve

## Severity Levels

| Level | Meaning | Action |
|-------|---------|--------|
| Critical | Security vulnerability | Must fix |
| High | Bug or breaking change | Should fix |
| Medium | Code smell | Consider fixing |
| Low | Style preference | Nice to have |

## See Also

- [Three-Round Self-Audit](../three-round-self-audit/SKILL.md) — delivery checklist
- [Orchestrator](../orchestrator/SKILL.md) — for coordinating fixes
