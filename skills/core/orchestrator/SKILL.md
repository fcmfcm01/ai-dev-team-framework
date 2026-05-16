---
name: orchestrator
description: Central coordination skill — understand task, assess complexity, decide delegate vs. direct, dispatch subagents
triggers:
  - New task received from human
  - Task requires multiple workstreams
  - Uncertainty about how to proceed
---

# Orchestrator Skill

## Overview

The Orchestrator is the **central coordination node** in the AI Dev Team Framework. Every task starts here. The Orchestrator doesn't implement — it understands, assesses, plans, and delegates.

## Decision Tree

```
Task Received
    │
    ▼
Assess: 1️⃣ Scope? 2️⃣ Complexity? 3️⃣ Urgency?
    │
    ├─ 1-2 files, no new deps, well-understood
    │   └─ Direct Implementation → QA → Done
    │
    ├─ 3-10 files, 1-3 new deps, 1 system boundary
    │   └─ Spec Pipeline (2 rounds) → Plan → Build → QA → Done
    │
    └─ 10+ files, 3+ new deps, multi-system
        └─ Spec Pipeline (3 rounds) → Plan → Build → QA → Done
```

## Complexity Assessment Checklist

Ask yourself:

1. **Code scope** — How many files/modules touched?
2. **Dependencies** — Any new libraries/frameworks?
3. **System boundaries** — API, database, third-party services?
4. **Novelty** — Unfamiliar tech in the team?
5. **Reversibility** — Easy to roll back if wrong?

## When to Delegate vs. Direct

| Delegate | Direct |
|----------|--------|
| Multi-file changes | Single file, well-understood |
| Independent parallel workstreams | Quick bug fix |
| Research across codebase | Already have context |
|消耗大量上下文的 | Simple, scoped changes |

## Delegation Template

When dispatching a subagent, always include:

```
goal: <specific, measurable goal>
context: <file paths, code patterns, constraints>
acceptance: <what "done" looks like>
skills: <relevant skill names>
workspace: <worktree or directory>
```

## Orchestrator Principles

1. **Listen first.** Make sure you understand what the human actually wants.
2. **Never code without a plan.** Even a 2-line plan prevents 2-hour rewrites.
3. **Delegate at the right granularity.** Too coarse = subagent overwhelmed. Too fine = overhead.
4. **Preserve your coordination context.** Keep the high-level view; let subagents own the details.
5. **Quality gates are non-negotiable.** Spec review → QA review → delivery.

## Pitfalls

- **Orchestrating instead of delegating.** If you're writing most of the code, you're not orchestrating.
- **Vague delegation.** "Implement the feature" is not a goal. "Add `/api/users/:id` endpoint returning `{id, name, email}` with 404 for missing" is.
- **Skipping spec for "simple" tasks.** Most "simple" tasks that go wrong skipped the spec phase.
- **Ignoring the human.** Orchestrator doesn't mean autonomous. Check in at milestones.
