# AI Dev Team Framework

A complete AI software development team framework that works across **VS Code Copilot**, **OpenCode**, **Claude Code**, and any Claude/MCP-compatible tool.

Inspired by: [superpowers](https://github.com/obra/superpowers) · [OpenSpec](https://github.com/Fission-AI/OpenSpec) · [mattpocock/skills](https://github.com/mattpocock/skills) · [agency-agents](https://github.com/msitarzewski/agency-agents) · [Aperant](https://github.com/AndyMik90/Aperant)

## What It Is

An **Orchestrator-First** AI development team where a coordinating agent dispatches specialized engineering and design agents to execute tasks in parallel worktrees, following a spec-driven workflow with built-in QA gates.

## Architecture

```
You (Human Partner)
    │
    ▼
┌─────────────────────────────────────┐
│          Orchestrator Agent          │  ← Central coordinator
│  (understanding → planning → dispatch)│
└──────────┬──────────┬───────────────┘
           │          │
    ┌──────┴──┐ ┌────┴────────┐
    ▼         ▼ ▼             ▼
Engineering  Design  QA & Review  Planning
  Agents    Agents    Agents      Skills
    │         │         │           │
    └─────────┴─────────┴───────────┘
                     │
              Subagents per task
            (fresh context each time)
```

## Quick Start

```bash
# Clone the framework into your project
git clone https://github.com/YOUR_USER/ai-dev-team-framework.git .ai-dev-team

# Run the install script
cd .ai-dev-team && ./scripts/install.sh
```

Or copy the `.claude/`, `.opencode/`, or `.copilot/` directories into your project root.

## Directory Structure

```
ai-dev-team-framework/
├── README.md                    # This file
├── CLAUDE.md                    # For AI coding agents
├── AGENTS.md                    # For AI agent-to-agent communication
├── skills/
│   ├── core/                   # Core workflow skills
│   │   ├── orchestrator/        # Orchestrator role
│   │   ├── spec-driven/        # Spec-driven development
│   │   ├── subagent-driven/    # Subagent dispatch pattern
│   │   ├── tdd/               # Test-driven development
│   │   ├── qa-reviewer/       # QA review gate
│   │   ├── planning/           # Task breakdown
│   │   └── three-round-self-audit/
│   ├── engineering/            # Engineering skills
│   └── design/                 # Design skills
├── agents/
│   ├── orchestrator/           # Orchestrator agent definition
│   ├── engineering/           # Engineering agents
│   │   ├── frontend-developer/
│   │   ├── backend-developer/
│   │   ├── fullstack-developer/
│   │   ├── qa-engineer/
│   │   └── devops-engineer/
│   └── design/                 # Design agents
│       ├── ux-architect/
│       ├── ui-designer/
│       └── visual-designer/
├── specs/
│   └── templates/              # OpenSpec-style spec templates
├── .claude/                    # Claude Code plugin
├── .opencode/                  # OpenCode plugin
├── .copilot/                  # VS Code Copilot plugin
└── scripts/
    └── install.sh             # Cross-platform install
```

## Core Workflow

### The 5-Phase Pipeline

```
1. ORCHESTRATE    ← Understand task, assess complexity, assign role
        ↓
2. SPEC           ← Write spec (OpenSpec-style artifact)
        ↓
3. PLAN           ← Break spec into independent tasks
        ↓
4. BUILD          ← Subagents implement in parallel worktrees
        ↓
5. QA GATE        ← QA reviewer validates, fixer resolves issues
```

### Per-Task Subagent Pattern

Each task in the plan gets a **fresh subagent** with:
- Isolated context (never inherits orchestrator's session history)
- Complete goal + acceptance criteria
- Relevant skill loaded
- Two-stage review: spec compliance → code quality

## Engineering Agents

| Agent | Specialty | Best For |
|-------|-----------|----------|
| `frontend-developer` | React/Vue/HTML-CSS | UI features, components, responsive |
| `backend-developer` | APIs, databases, services | Server logic, data pipelines |
| `fullstack-developer` | End-to-end features | APIs + UI together |
| `qa-engineer` | Test strategy, automation | Test suites, E2E, coverage |
| `devops-engineer` | CI/CD, infra, containers | Deployments, pipelines |

## Design Agents

| Agent | Specialty | Best For |
|-------|-----------|----------|
| `ux-architect` | User research, information architecture | Wireframes, flows, personas |
| `ui-designer` | Visual components, design systems | UI specs, component libraries |
| `visual-designer` | Graphics, branding, illustration | Icons, illustrations, branding |

## Skills (Composable Units)

Core skills are tool-agnostic and work with any AI coding harness:

| Skill | Purpose | When |
|-------|---------|------|
| `orchestrator` | Central coordination logic | Every task |
| `spec-driven` | Spec writing and review | New features |
| `subagent-driven` | How to dispatch subagents | Parallel work |
| `tdd` | Test-first development | All implementation |
| `qa-reviewer` | Validation gate | After each task |
| `planning` | Task breakdown | Plan phase |
| `three-round-self-audit` | Quality self-check | Before delivery |

## Multi-Platform Support

### Claude Code
```bash
cp -r .claude ~/.claude/  # Or install as plugin
```

### OpenCode (OpenAI)
```bash
cp -r .opencode ~/Library/Application Support/opencode/  # macOS
cp -r .opencode ~/.config/opencode/  # Linux
```

### VS Code Copilot
```bash
cp -r .copilot ~/.config/Claude/  # VS Code Copilot
```

## License

MIT
