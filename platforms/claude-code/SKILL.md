# Claude Code — Installation Guide

## Quick Install

```bash
# Project-level
cp -r platforms/claude-code/skills/ ~/.claude/skills/ai-dev-team/
# Or symlink for auto-update
ln -s "$(pwd)/platforms/claude-code/skills" ~/.claude/skills/ai-dev-team

# Then reference in any project:
echo '/acl .claude/skills/ai-dev-team' >> .claude/commands.md
```

## What's Included

```
platforms/claude-code/
├── SKILL.md              ← This file
└── skills/               ← Copy entire folder to ~/.claude/skills/
    ├── orchestrator/
    ├── spec-driven/
    ├── qa-reviewer/
    └── three-round-self-audit/
```

Each skill is a standalone Claude Code skill with its own `SKILL.md`.

## Requirements

- Claude Code CLI (`claude`) installed
- Claude Code version with skills support

## No plugin.json needed

Unlike VS Code Copilot, Claude Code auto-discovers skills from `~/.claude/skills/` directories — no plugin manifest required.