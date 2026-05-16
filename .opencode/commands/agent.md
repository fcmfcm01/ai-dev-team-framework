---
description: Switch to a specialized agent mode
agent: build
---

Switch to a specialized agent mode for the AI Dev Team Framework.

Available agents:
$ARGUMENTS

## How to Dispatch
When you receive a task for a specialized agent, follow the subagent-driven workflow:
1. Load the agent definition from agents/<domain>/<name>/AGENT.md
2. Load relevant skills from skills/
3. Provide isolated context (fresh session, no inheritance)
4. Set clear goal + acceptance criteria
5. After completion: two-stage review

## Agent Definitions
Frontend: agents/engineering/frontend-developer/AGENT.md
Backend: agents/engineering/backend-developer/AGENT.md
Fullstack: agents/engineering/fullstack-developer/AGENT.md
QA: agents/engineering/qa-engineer/AGENT.md
DevOps: agents/engineering/devops-engineer/AGENT.md
UX: agents/design/ux-architect/AGENT.md
UI: agents/design/ui-designer/AGENT.md
Visual: agents/design/visual-designer/AGENT.md