---
name: ai-dev-team
description: AI Dev Team Framework integration for VS Code Copilot
---

# AI Dev Team Framework — VS Code Copilot Plugin

## Overview

This plugin integrates the AI Dev Team Framework into VS Code Copilot Chat sessions. It provides slash commands, skills, and coordination workflows.

## Installation

### Option 1: From a VS Code Copilot Plugin Marketplace (Recommended when published)
```bash
# Install from marketplace (example command — depends on marketplace)
```

### Option 2: Local Development / Testing
```bash
# Copy this plugin directory into your project's .copilot/ folder
# The plugin is at .copilot/ relative to the framework root
```

## Plugin Structure

```
.copilot/
├── .claude-plugin/
│   └── plugin.json       # Plugin manifest (VS Code Copilot plugin format)
├── skills/               # Skill definitions (delegated to parent framework)
│   ├── orchestrator/
│   ├── spec-driven/
│   ├── qa-reviewer/
│   └── three-round-self-audit/
└── commands/            # Slash command definitions
    ├── orchestrator.md
    ├── spec.md
    ├── qa.md
    └── audit.md
```

## Available Commands

| Command | Description |
|---------|-------------|
| `/ai-dev-team:orchestrator` | Activate Orchestrator mode |
| `/ai-dev-team:spec` | Create a new spec |
| `/ai-dev-team:qa` | Run QA review gate |
| `/ai-dev-team:audit` | Run three-round self-audit |

## Example Usage

```
/ai-dev-team:orchestrator
Help me add user authentication to the app

/ai-dev-team:spec
Create a spec for adding OAuth login

/ai-dev-team:qa
Review the authentication implementation
```

## Skills Available

Skills are loaded from `skills/core/` in the parent framework directory:

- `orchestrator` — Central coordination
- `spec-driven` — Spec creation pipeline
- `qa-reviewer` — QA review gate
- `three-round-self-audit` — Quality self-check

## For Full Framework Content

The complete framework (skills, agents, specs) lives in the parent directory.
This plugin provides VS Code Copilot integration on top of that framework.
