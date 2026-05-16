---
name: ai-dev-team-copilot
description: AI Dev Team Framework integration for VS Code Copilot
---

# AI Dev Team Framework — VS Code Copilot Plugin

## Overview

This plugin integrates the AI Dev Team Framework into VS Code Copilot Chat sessions.

## Setup

1. Copy `.copilot/` to your project root
2. In VS Code, the plugin activates when you mention `/team` in a chat

## Available Commands

### `@team orchestrator` — Orchestrator Mode

```
@team orchestrator
Help me add user authentication
```

### `@team spec` — Spec Creation

```
@team spec
Create a spec for adding OAuth login
```

### `@team build` — Build Pipeline

```
@team build
Build the authentication feature
```

### `@team qa` — QA Review

```
@team qa
Review the authentication implementation
```

## Agent Mentions

Switch to specialized agents:

```
@frontend-developer Help me build the login form
@backend-developer Design the auth API endpoints
@qa-engineer Write tests for the auth flow
@ux-architect Design the login user flow
```

## Skills Available

The framework skills are automatically loaded in context:

- Orchestrator coordination
- Spec-driven development
- TDD workflow
- QA review gates
- Planning and task breakdown

## Spec Location

Specs are stored at `.ai-dev/specs/<change-id>/`
