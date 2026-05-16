---
name: spec-driven
description: Create a structured specification (SPEC.md) before writing code. Use when starting a feature, bug fix, or refactor. Follows Aperant's three-complexity-path: Simple (inline), Standard (SPEC.md), Complex (SPEC.md + research). Ensures alignment before implementation.
argument-hint: [feature or change description]
user-invocable: true
disable-model-invocation: false
context: inline
---

# Spec-Driven Development

Create specifications before implementation.

## When to Write a Spec

| Situation | Path |
|-----------|------|
| Single file, obvious change | Skip spec |
| Multi-file feature | Standard SPEC.md |
| Ambiguous or large scope | Full spec + research |
| User explicitly asks for spec | Always |

## Three Complexity Paths

### Simple (≤1-2 files)
Write spec as comments in the code itself.

### Standard (3-10 files)
Create `.ai-dev/specs/<id>/SPEC.md`:
- Context / Background
- Goal / Non-Goals
- Detailed Specification
- Acceptance Criteria

### Complex (>10 files or ambiguous)
Full spec + research phase + plan + review.

## Spec Template

```markdown
# SPEC: <title>

## Context & Background
Why are we doing this?

## Goal
What success looks like.

## Non-Goals
What we are explicitly NOT doing.

## Detailed Specification
- Data models
- API contracts
- User flows
- Edge cases

## Acceptance Criteria
- [ ] Criterion 1
- [ ] Criterion 2
```

## See Also

- [Orchestrator](../orchestrator/SKILL.md) — for decomposition
- [QA Reviewer](../qa-reviewer/SKILL.md) — for spec review
