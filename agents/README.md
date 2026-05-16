# Agents

Agents are specialized AI personas that embody a specific professional role. Each agent has a YAML frontmatter (`name`, `role`, `toolsets`) followed by markdown content describing their expertise, workflows, and interaction patterns.

## Engineering Agents

| Agent | Role | Source |
|-------|------|--------|
| [frontend-developer](./engineering/frontend-developer/AGENT.md) | Frontend specialist (React/Vue/etc.) | [agency-agents](https://github.com/msitarzewski/agency-agents) |
| [backend-developer](./engineering/backend-developer/AGENT.md) | Backend architect | [agency-agents](https://github.com/msitarzewski/agency-agents) |
| [fullstack-developer](./engineering/fullstack-developer/AGENT.md) | Full-stack generalist | Custom |
| [qa-engineer](./engineering/qa-engineer/AGENT.md) | Quality assurance | [agency-agents](https://github.com/msitarzewski/agency-agents) |
| [security-engineer](./engineering/security-engineer/AGENT.md) | Security analysis | [agency-agents](https://github.com/msitarzewski/agency-agents) |
| [devops-engineer](./engineering/devops-engineer/AGENT.md) | DevOps automation | [agency-agents](https://github.com/msitarzewski/agency-agents) |
| [sre](./engineering/sre/AGENT.md) | Site reliability | [agency-agents](https://github.com/msitarzewski/agency-agents) |

## Design Agents

| Agent | Role | Source |
|-------|------|--------|
| [ux-architect](./design/ux-architect/AGENT.md) | UX strategy and research | [agency-agents](https://github.com/msitarzewski/agency-agents) |
| [ui-designer](./design/ui-designer/AGENT.md) | UI design and systems | [agency-agents](https://github.com/msitarzewski/agency-agents) |
| [visual-designer](./design/visual-designer/AGENT.md) | Visual/brand design | [agency-agents](https://github.com/msitarzewski/agency-agents) |

## Division Structure

- **engineering/** — software development agents
- **design/** — design and UX agents

## Agent Interaction

Agents are dispatched via the `subagent-driven` skill. Each agent operates in isolated context with their specialized skill set. The orchestrator routes tasks to the appropriate agent based on task type.
