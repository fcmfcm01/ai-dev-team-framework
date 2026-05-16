---
name: subagent-driven
description: Subagent dispatch pattern — dispatch fresh subagents per task with isolated context and two-stage review
triggers:
  - Independent parallel tasks identified
  - Need to scale implementation across files
  - Implementation plan with multiple workstreams
---

# Subagent-Driven Development

## Overview

Dispatch **fresh subagents** for each independent task. Each subagent gets isolated context (never inherits your session history), precise instructions, and is reviewed in two stages: spec compliance first, then code quality.

**Core principle:** Fresh subagent + isolated context + two-stage review = high quality, fast iteration.

## When to Use

```
Have implementation plan?
    ├─ No → Write plan first (use `planning` skill)
    └─ Yes → Are tasks independent?
                ├─ No → Sequential implementation
                └─ Yes → Can tasks run in same session?
                            ├─ Yes → subagent-driven (this skill)
                            └─ No → Parallel session dispatch
```

## Dispatch Template

```markdown
# Subagent Task: <task-name>

## Goal
<one specific thing this subagent must accomplish>

## Context
- Working directory: <path>
- Relevant files: <list>
- Tech stack: <what to use>
- Pattern to follow: <code style / conventions>

## Acceptance Criteria
- [ ] <criterion 1>
- [ ] <criterion 2>

## Skills to Load
- <skill 1>
- <skill 2>

## After Completing
Return a summary of:
1. What was done
2. Files changed
3. Tests added/modified
4. Any blockers or questions
```

## Two-Stage Review

### Stage 1: Spec Compliance
- Does the implementation match the spec?
- Are all acceptance criteria met?
- Are all edge cases handled?

### Stage 2: Code Quality
- Is the code readable and maintainable?
- Are tests adequate?
- Any obvious bugs or security issues?

## Parallel Execution

For truly independent tasks:

```python
# Pseudocode — actual implementation varies by platform
await Promise.allSettled([
  dispatch(task_1, subagent_a),
  dispatch(task_2, subagent_b),
  dispatch(task_3, subagent_c),
])
```

## Worktree Isolation

Each subagent works in an isolated git worktree:

```bash
# Create before dispatch
git worktree add ../wt-<task-id> -b wt/<task-id> main

# After merge
git checkout main
git merge wt/<task-id> --no-ff -m "feat: <description>"
git worktree remove ../wt-<task-id>
```

## Continuous Execution

Do not pause to check in with human between tasks. Only stop for:
- BLOCKED status you cannot resolve
- Genuine ambiguity that prevents progress
- All tasks complete

## Pitfalls

- **Subagent inherits session context.** Construct context explicitly — don't rely on history.
- **Vague acceptance criteria.** "Make it work" is not acceptable.
- **Skipping review stages.** Both stages are mandatory.
- **Too many parallel subagents.** Context switching overhead. Max 3-4 concurrent.
