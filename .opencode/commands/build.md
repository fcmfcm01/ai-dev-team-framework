---
description: Start subagent build pipeline in parallel worktrees
agent: build
subtask: true
---

Execute the build phase using the AI Dev Team Framework subagent-driven workflow.

Load and follow: skills/core/subagent-driven/SKILL.md

## Build Rules
- Each subagent works in an isolated git worktree
- Never inherit the orchestrator's session history
- Two-stage review after each task: spec compliance → code quality
- Load relevant skill for each task

## Parallel Execution
Independent tasks should run in parallel worktrees:
```bash
git worktree add ../wt-<task-id> -b wt/<task-id> main
```

## TDD Cycle (per task)
Load and follow: skills/core/tdd/SKILL.md
1. RED: Write a failing test
2. GREEN: Write minimal code to pass
3. REFACTOR: Improve code

## Tasks to Build
$ARGUMENTS