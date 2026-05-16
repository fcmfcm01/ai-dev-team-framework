---
name: ai-dev-team-opencode
description: AI Dev Team Framework integration for OpenCode CLI
---

# AI Dev Team Framework — OpenCode Plugin

## Overview

This plugin integrates the AI Dev Team Framework into OpenCode sessions.

## Setup

```bash
cp -r .opencode ~/.config/opencode/ai-dev-team  # Linux
cp -r .opencode ~/Library/Application\ Support/opencode/  # macOS
```

## Available Commands

### `/team` — Activate Orchestrator Mode

```
/team activate orchestrator
```

### `/spec` — Create Spec

```
/spec create "Add dark mode support"
```

### `/plan` — Run Planning

```
/plan run
```

### `/build` — Start Build Pipeline

```
/build start
```

### `/qa` — Run QA Gate

```
/qa review
```

## Agent Activation

Switch to specialized agent mode:

```
/agent activate frontend-developer
/agent activate backend-developer
/agent activate qa-engineer
```

## Skill Loading

Load skills explicitly:

```
/skill load orchestrator
/skill load spec-driven
/skill load tdd
/skill load qa-reviewer
```

## Subagent Dispatch

Dispatch subagents:

```
/dispatch task <task-id> to agent <agent-name>
```

## Spec Location

Specs are stored at `.ai-dev/specs/<change-id>/`
