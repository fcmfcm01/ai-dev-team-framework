# AI Dev Team Framework — OpenCode Plugin

## Overview

This directory provides OpenCode integration for the AI Dev Team Framework. OpenCode uses a different plugin architecture from Claude Code — it relies on **JavaScript plugins** (in `plugins/`) and **Markdown command files** (in `commands/`).

## Directory Structure

```
.opencode/
├── opencode.json         # OpenCode configuration (commands + plugin list)
├── SKILL.md              # This file
├── plugins/              # JavaScript plugin modules
│   └── ai-dev-team.js   # Main plugin — session hooks + custom tools
└── commands/             # Markdown command definitions
    ├── orchestrator.md   # /orchestrator — activate Orchestrator mode
    ├── spec.md          # /spec — create a new spec
    ├── plan.md          # /plan — break spec into tasks
    ├── build.md         # /build — start build pipeline
    ├── qa.md            # /qa — run QA review gate
    ├── audit.md         # /audit — three-round self-audit
    └── agent.md         # /agent — switch to specialized agent
```

## Installation

### Option 1: Project-level (recommended)

Copy this `.opencode/` directory into your project root:

```bash
cp -r .opencode/ /path/to/your-project/
```

### Option 2: Global installation

Copy to the global OpenCode plugins directory:

```bash
cp -r .opencode/ ~/.config/opencode/
```

This makes the framework available in all projects.

## Available Commands

After installation, these commands are available in OpenCode:

| Command | Description |
|---------|-------------|
| `/orchestrator` | Activate Orchestrator mode — coordinate a team of agents |
| `/spec <task>` | Create a new spec at `.ai-dev/specs/<change-id>/` |
| `/plan` | Break the current spec into independent tasks |
| `/build <tasks>` | Start subagent build pipeline in parallel worktrees |
| `/qa` | Run QA review gate on current implementation |
| `/audit` | Run three-round self-audit before delivery |
| `/agent <name>` | Switch to a specialized agent (frontend-developer, etc.) |

### With Arguments

```bash
/orchestrator Help me add user authentication
/spec Create a spec for OAuth login
/build Build the authentication feature
/agent frontend-developer
```

## Custom Tools (via Plugin)

The `ai-dev-team.js` plugin registers these tools:

| Tool | Description |
|------|-------------|
| `ai-dev-team.list-skills` | List all framework skills by category |
| `ai-dev-team.read-skill` | Read a skill file by path |
| `ai-dev-team.read-agent` | Read an agent definition by path |
| `ai-dev-team.list-specs` | List all specs in `.ai-dev/specs/` |

## Plugin Architecture

OpenCode plugins are JavaScript modules that export an async function. The function receives `{ project, client, $, directory, worktree }` and returns an object with hooks.

```javascript
export const MyPlugin = async ({ project, client, $, directory, worktree }) => {
  return {
    "session.created": async () => { /* on session start */ },
    "experimental.session.compacting": async (input, output) => { /* during compaction */ },
    tool: {
      "my-tool": { description: "...", args: {...}, execute: async (args, ctx) => {...} }
    }
  }
}
```

## Command File Format

Commands in `commands/*.md` use YAML frontmatter:

```yaml
---
description: Run tests with coverage
agent: build
model: anthropic/claude-3-5-sonnet-20241022
subtask: true
---

Your prompt content here. $ARGUMENTS will be replaced with user input.
```

Supported frontmatter fields:
- `description` — shown when typing the command
- `agent` — which agent to use (plan, build, etc.)
- `model` — override default model
- `subtask` — force run as subtask (boolean)

Template placeholders:
- `$ARGUMENTS` — entire user input after the command
- `$1`, `$2`, `$3` — positional arguments
- `!`command`` — inject shell command output
- `@filename` — inject file content

## Plugin Hooks Used

| Hook | Purpose |
|------|---------|
| `session.created` | Detect framework and log active status |
| `experimental.session.compacting` | Preserve framework context during compaction |
| `tool.execute.after` | Log worktree operations for observability |

## Relationship to Framework

This OpenCode plugin is an integration layer on top of the parent framework:
- Commands reference skills at `skills/core/<skill>/SKILL.md`
- Agents are defined at `agents/<domain>/<name>/AGENT.md`
- Specs are created at `.ai-dev/specs/<change-id>/`
- The plugin adds convenience tools but the actual workflow logic lives in the framework skills
