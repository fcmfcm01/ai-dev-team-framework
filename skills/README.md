# Skills

Skills are reusable, self-contained units of AI agent behavior. Each skill has a YAML frontmatter (`name`, `description`) followed by markdown content.

## Core Workflow Skills

| Skill | When to Use | Source |
|-------|------------|--------|
| [orchestrator](./core/orchestrator/SKILL.md) | Assess task complexity, decide execution path | Custom |
| [spec-driven](./core/spec-driven/SKILL.md) | Create specs before writing code | Custom |
| [subagent-driven](./core/subagent-driven/SKILL.md) | Dispatch isolated subagents per task | [superpower](https://github.com/obra/superpower) |
| [tdd](./core/tdd/SKILL.md) | Write failing test before code | [superpower](https://github.com/obra/superpower) |
| [systematic-debugging](./core/systematic-debugging/SKILL.md) | Find root cause before fixing | [superpower](https://github.com/obra/superpower) |
| [verification-before-completion](./core/verification-before-completion/SKILL.md) | Verify before claiming done | [superpower](https://github.com/obra/superpower) |
| [writing-plans](./core/writing-plans/SKILL.md) | Write implementation plans | [superpower](https://github.com/obra/superpower) |
| [dispatching-parallel-agents](./core/dispatching-parallel-agents/SKILL.md) | Parallel dispatch independent tasks | [superpower](https://github.com/obra/superpower) |
| [finishing-branch](./core/finishing-branch/SKILL.md) | Complete development branch | [superpower](https://github.com/obra/superpower) |
| [executing-plans](./core/executing-plans/SKILL.md) | Inline plan execution | [superpower](https://github.com/obra/superpower) |
| [using-git-worktrees](./core/using-git-worktrees/SKILL.md) | Isolate work in git worktrees | [superpower](https://github.com/obra/superpower) |
| [receiving-code-review](./core/receiving-code-review/SKILL.md) | Respond to code review feedback | [superpower](https://github.com/obra/superpower) |
| [requesting-code-review](./core/requesting-code-review/SKILL.md) | Prepare code for review | [superpower](https://github.com/obra/superpower) |
| [brainstorming](./core/brainstorming/SKILL.md) | Explore problems before planning | [superpower](https://github.com/obra/superpower) |
| [planning](./core/planning/SKILL.md) | Break tasks into ordered steps | Custom |
| [qa-reviewer](./core/qa-reviewer/SKILL.md) | Enforce quality gates | Custom |
| [three-round-self-audit](./core/three-round-self-audit/SKILL.md) | Self-review before delivery | Custom |

## Engineering Skills

| Skill | When to Use | Source |
|-------|------------|--------|
| [diagnose](./engineering/diagnose/SKILL.md) | Investigate root cause of issues | [mattpocock/skills](https://github.com/mattpocock/skills) |
| [improve-codebase-architecture](./engineering/improve-codebase-architecture/SKILL.md) | Deepen codebase architecture | [mattpocock/skills](https://github.com/mattpocock/skills) |
| [grill-with-docs](./engineering/grill-with-docs/SKILL.md) | Challenge decisions with documentation | [mattpocock/skills](https://github.com/mattpocock/skills) |
| [tdd-deep](./engineering/tdd-deep/SKILL.md) | TDD with deep module design | [mattpocock/skills](https://github.com/mattpocock/skills) |
| [zoom-out](./engineering/zoom-out/SKILL.md) | Get broader context | [mattpocock/skills](https://github.com/mattpocock/skills) |
| [prototype](./engineering/prototype/SKILL.md) | Build throwaway prototypes | [mattpocock/skills](https://github.com/mattpocock/skills) |
| [triage](./engineering/triage/SKILL.md) | Issue tracker triage workflow | [mattpocock/skills](https://github.com/mattpocock/skills) |
| [to-issues](./engineering/to-issues/SKILL.md) | Break specs into vertical slices | [mattpocock/skills](https://github.com/mattpocock/skills) |
| [to-prd](./engineering/to-prd/SKILL.md) | Synthesize conversation into PRD | [mattpocock/skills](https://github.com/mattpocock/skills) |
| [testing](./engineering/testing/SKILL.md) | Test strategy and automation | ⚠️ Custom (self-created, not from mattpocock) |
| [frontend-patterns](./engineering/frontend-patterns/SKILL.md) | React/Vue component patterns | Custom |
| [backend-patterns](./engineering/backend-patterns/SKILL.md) | API/database patterns | Custom |
| [api-design](./engineering/api-design/SKILL.md) | REST/GraphQL API design | Custom |
| [database-patterns](./engineering/database-patterns/SKILL.md) | Schema/query patterns | Custom |
| [devops-patterns](./engineering/devops-patterns/SKILL.md) | CI/CD/deployment patterns | Custom |

## Design Skills

| Skill | When to Use | Source |
|-------|------------|--------|
| [ux-research](./design/ux-research/SKILL.md) | User research and personas | Custom |
| [design-system](./design/design-system/SKILL.md) | Design token/component system | Custom |

## Bucket Structure

Every skill must appear in one of three buckets:

- **core/** — framework/workflow skills (orchestrator, TDD, subagent, etc.)
- **engineering/** — domain skills (frontend, backend, diagnose, etc.)
- **design/** — design-specific skills

Skills in `personal/`, `in-progress/`, `deprecated/` are NOT part of the framework.
