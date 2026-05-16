# AI Dev Team Framework — VS Code Copilot Integration

## Overview

This directory provides two integration layers for VS Code Copilot:

### 1. Skills (`.claude/skills/`)

VS Code Copilot **Agent Skills** in the standard location `.claude/skills/`.

```
.claude/skills/          ← VS Code Copilot auto-discovers skills here
├── orchestrator/         # Orchestration coordination
├── spec-driven/         # Spec-first development
├── qa-reviewer/         # Multi-axis QA gate
└── three-round-self-audit/  # Delivery checklist
```

VS Code Copilot auto-discovers skills stored in:
- `.claude/skills/` (project-level)
- `~/.claude/skills/` (user-level)
- `.github/skills/` (project-level)
- `.agents/skills/` (project-level)
- `~/.copilot/skills/` (user-level)
- `~/.agents/skills/` (user-level)

Each skill directory must contain a `SKILL.md` file with YAML frontmatter:

```yaml
---
name: skill-name           # Must match parent directory name
description: Description of what this skill does and when to use it.
argument-hint: [optional parameters]
user-invocable: true      # Show in / menu
disable-model-invocation: false  # Auto-load by Copilot
context: inline           # or fork (experimental subagent mode)
---

# Skill Instructions
...
```

### 2. Plugin (`.claude-plugin/`)

For **plugin distribution** (share as a VS Code extension), the `.claude-plugin/` directory contains:

```
.copilot/.claude-plugin/
└── plugin.json           # Plugin manifest (not a VS Code package.json)
```

This is the **Claude Code** plugin format, not VS Code Copilot. For VS Code Copilot plugin distribution, you would need a proper VS Code extension with `package.json` and `chatSkills` contribution point.

## Installation

### For VS Code Copilot (Agent Skills)

**Option 1: Copy skills directory**

```bash
cp -r .claude/skills/ /path/to/your-project/.claude/skills/
```

Or copy into your home directory for global access:

```bash
cp -r .claude/skills/ ~/.claude/skills/
```

**Option 2: Add to VS Code settings (monorepo)**

```json
{
  "chat.agentSkillsLocations": [
    ".claude/skills",
    ".github/skills"
  ]
}
```

In a monorepo, enable parent repository discovery:

```json
{
  "chat.useCustomizationsInParentRepositories": true
}
```

### For Plugin Distribution

The `.claude-plugin/plugin.json` is for **Claude Code** plugin distribution. See the Claude Code documentation for plugin publishing.

## Usage

After installation, skills appear in VS Code Copilot's `/` menu:

- `/orchestrator` — Activate coordination mode
- `/spec` — Create a specification
- `/qa` — Run QA review gate
- `/audit` — Run three-round self-audit

Or let Copilot auto-load skills based on context.

## Skills Reference

| Skill | Purpose | When to Use |
|-------|---------|-------------|
| orchestrator | Team coordination | Multi-file features, cross-cutting concerns |
| spec-driven | Specification first | Any feature, bug fix, or refactor |
| qa-reviewer | Quality gate | Before merging or delivering |
| three-round-self-audit | Delivery checklist | Every delivery |

## Related

- **OpenCode integration**: `.opencode/` — JavaScript plugins + Markdown commands
- **Claude Code integration**: `.claude/` — Native Claude Code plugin format
- **Framework docs**: `README.md`, `AGENTS.md`, `skills/README.md`
