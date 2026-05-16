---
name: ai-dev-team-claude
description: AI Dev Team Framework integration for Claude Code
---

# AI Dev Team Framework — Claude Code Plugin

## Overview

This plugin integrates the AI Dev Team Framework into Claude Code sessions.

## Setup

### Option 1: Install as Plugin (Recommended)

```bash
# From Claude Code
/plugin install ai-dev-team@your-org/ai-dev-team-framework
```

### Option 2: Manual Copy

```bash
cp -r .claude ~/.claude/ai-dev-team
```

## Available Commands

### `/team` — Activate Orchestrator Mode

Loads the orchestrator skill and enters coordination mode.

### `/spec <description>` — Create Spec

Creates a new spec from a description.

### `/plan` — Run Planning

Runs the planning skill on the current spec.

### `/build` — Start Build Pipeline

Starts the subagent-driven build pipeline.

### `/qa` — Run QA Gate

Runs the QA reviewer on current work.

### `/audit` — Three-Round Self-Audit

Runs the three-round self-audit.

## Available Agents

Switch to a specialized agent mode:

```
/agent frontend-developer
/agent backend-developer
/agent fullstack-developer
/agent qa-engineer
/agent devops-engineer
/agent ux-architect
/agent ui-designer
/agent visual-designer
```

## Skills Auto-Loaded

When you enter orchestrator mode, these skills are automatically available:

- `skills/core/orchestrator/`
- `skills/core/spec-driven/`
- `skills/core/subagent-driven/`
- `skills/core/tdd/`
- `skills/core/qa-reviewer/`
- `skills/core/planning/`
- `skills/core/three-round-self-audit/`

## Spec Location

Specs are stored at `.ai-dev/specs/<change-id>/`

## Subagent Dispatch

In Claude Code, dispatch subagents using:

```
/subagent <task> with goal "<goal>" context "<context>"
```

Or use the `skills/core/subagent-driven/` skill for detailed instructions.
