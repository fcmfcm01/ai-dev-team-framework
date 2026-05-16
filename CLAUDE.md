# CLAUDE.md — AI Dev Team Framework

## For AI Agents Working on This Framework

This is the **source of truth** for AI agents that are modifying or extending the framework itself.

## Project Identity

**Name:** AI Dev Team Framework
**Purpose:** A complete AI software development team framework that works across VS Code Copilot, OpenCode, Claude Code, and any Claude/MCP-compatible tool.
**Inspiration:** superpowers, OpenSpec, mattpocock/skills, agency-agents, Aperant

## Architecture

The framework has three layers:

1. **Platform Plugins** (`platforms/claude-code/`, `platforms/opencode/`, `platforms/copilot/`) — Tool-specific, fully isolated from each other
2. **Core Skills** (`skills/core/`) — Tool-agnostic workflow skills
3. **Domain Agents** (`agents/engineering/`, `agents/design/`) — Specialized agent definitions

## Contribution Rules

### Adding a New Skill

1. Create `skills/<category>/<skill-name>/SKILL.md`
2. Add YAML frontmatter: `name`, `description`, `triggers`
3. Follow the skill template: Overview → When to Use → Process → Pitfalls
4. Keep it small and composable — one skill, one concern
5. Add it to `skills/README.md`

### Adding a New Agent

1. Create `agents/<domain>/<agent-name>/AGENT.md`
2. Follow the agent template: Identity → Expertise → Workflow → Deliverables
3. Reference relevant skills from `skills/core/`
4. Add to `agents/README.md`

### Adding a New Platform Plugin

1. Create `platforms/<name>/` with isolated structure (skills/, commands/, plugins/ as needed)
2. Do NOT mix platform-specific files with core framework dirs (skills/, agents/)
3. Add an install.sh script for easy adoption
4. Add to `README.md` compatibility table

## Quality Gates

- SKILL.md must start with YAML frontmatter
- Every skill needs: name, description, triggers, When to Use decision graph
- Every agent needs: Identity, Expertise, Workflow, Deliverables
- No placeholder text — all content must be actionable
- Mermaid diagrams preferred for process documentation

## Testing

Run `./scripts/test-structure.sh` to validate:
- All SKILL.md files have valid frontmatter
- All AGENT.md files have required sections
- Directory structure matches specification

## File Naming

- Skills: `skills/<category>/<skill-name>/SKILL.md`
- Agents: `agents/<domain>/<agent-name>/AGENT.md`
- Specs: `specs/templates/<template-name>/SPEC.md`
- Platform: `.<platform>/SKILL.md`
