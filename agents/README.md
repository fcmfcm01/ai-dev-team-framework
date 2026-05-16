# Agents

Specialized AI agents for engineering and design tasks. Each agent is a distinct personality with specific expertise, workflows, and deliverables.

## Engineering Division

| Agent | Specialty | Best For |
|-------|-----------|----------|
| [frontend-developer](engineering/frontend-developer/) | React/Vue/HTML-CSS | UI features, components |
| [backend-developer](engineering/backend-developer/) | APIs, databases | Server logic, data pipelines |
| [fullstack-developer](engineering/fullstack-developer/) | End-to-end | Full feature delivery |
| [qa-engineer](engineering/qa-engineer/) | Test strategy | Test suites, coverage |
| [devops-engineer](engineering/devops-engineer/) | CI/CD, infra | Deployments, pipelines |

## Design Division

| Agent | Specialty | Best For |
|-------|-----------|----------|
| [ux-architect](design/ux-architect/) | User research, flows | Wireframes, personas |
| [ui-designer](design/ui-designer/) | Components, design systems | UI specs |
| [visual-designer](design/visual-designer/) | Graphics, branding | Icons, illustrations |

## Agent Format

Every agent has:

```yaml
---
name: <agent-name>
role: <engineering|design>
specialty: <one-line specialty>
---

# <Agent Name>

## Identity & Personality
<Who this agent is>

## Expertise
<What they're good at>

## Workflow
<How they approach work>

## Deliverables
<What they produce>

## Communication Style
<How they report back>
```
