# Skills

Composable, tool-agnostic skill units that work with any AI coding harness.

## Core Skills

| Skill | Category | Purpose |
|-------|----------|---------|
| [orchestrator](core/orchestrator/) | core | Central coordination — when to delegate vs. do directly |
| [spec-driven](core/spec-driven/) | core | Spec creation pipeline — from request to approved spec |
| [subagent-driven](core/subagent-driven/) | core | How to dispatch fresh subagents per task |
| [tdd](core/tdd/) | core | Test-first development — red-green-refactor cycle |
| [qa-reviewer](core/qa-reviewer/) | core | QA validation gate — spec compliance + quality check |
| [planning](core/planning/) | core | Task breakdown — from spec to task list |
| [three-round-self-audit](core/three-round-self-audit/) | core | Quality self-check before delivery |

## Engineering Skills

| Skill | Purpose |
|-------|---------|
| [frontend-patterns](engineering/frontend-patterns/) | React, Vue, component patterns |
| [backend-patterns](engineering/backend-patterns/) | API design, database patterns |
| [testing](engineering/testing/) | Test strategy and automation |

## Design Skills

| Skill | Purpose |
|-------|---------|
| [ux-research](design/ux-research/) | User research and analysis |
| [visual-design](design/visual-design/) | Visual design principles |

## Skill Format

Every skill has:

```yaml
---
name: <skill-name>
description: One-line description
triggers:
  - <when this skill triggers>
---

# <Skill Name>

## Overview
<What this skill does>

## When to Use
<Decision graph or trigger conditions>

## Process
<Step-by-step>

## Pitfalls
<Common mistakes to avoid>
```
