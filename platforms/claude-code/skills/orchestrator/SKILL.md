---
name: orchestrator
description: Orchestrator coordination for AI Dev Team Framework. Use when starting a new feature, refactor, or multi-file task — breaks work into workstreams, dispatches specialized agents. Coordinates: frontend-dev, backend-dev, fullstack-dev, qa-engineer, devops-engineer, and design agents. Never codes directly.
argument-hint: [task description]
user-invocable: true
disable-model-invocation: false
context: inline
---

# Orchestrator Skill

Central coordination for AI Dev Team Framework.

## When to Activate

Activate when user describes a task that requires:
- Multiple files or components
- Frontend + backend coordination
- Cross-cutting concerns (security, performance)
- A team of specialized agents

Skip for: single-file edits, obvious fixes, simple questions.

## Complexity Assessment (First Step)

1. **1-2 files, straightforward** → direct build path
2. **Multi-file or ambiguous** → spec pipeline
3. **Large refactor** → spec + plan + build pipeline

## Orchestration Protocol

1. **Understand** — confirm goal, scope, constraints
2. **Decompose** — break into atomic workstreams
3. **Dispatch** — assign to specialized agents via `delegate_task`
4. **Coordinate** — merge results, resolve conflicts
5. **Verify** — run three-round self-audit before delivery

## Available Agents

| Agent | Role |
|-------|------|
| frontend-dev | React, Vue, CSS, UI components |
| backend-dev | APIs, databases, server logic |
| fullstack-dev | Full stack features |
| qa-engineer | Test strategy, test writing |
| devops-engineer | CI/CD, infrastructure |
| ux-architect | UX research, information architecture |
| ui-designer | Visual design, component specs |
| visual-designer | Brand, illustrations |

## See Also

- [Spec-Driven Development](../spec-driven/SKILL.md) — for the spec pipeline
- [QA Reviewer](../qa-reviewer/SKILL.md) — for the verification gate
- [Three-Round Self-Audit](../three-round-self-audit/SKILL.md) — for delivery checklist
