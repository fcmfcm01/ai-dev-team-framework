# Changelog

All notable framework changes are documented here.

## [Unreleased]

## [2026-05-16] rf-002 — Framework Self-Refactoring

### Fixed
- Eliminated 4 false-positive warnings from `test-structure.sh` by rewording TODO/TBD references in checklist contexts:
  - `three-round-self-audit`: "TODOs" → "incomplete items"
  - `qa-reviewer`: "TODOs" → "incomplete items"
  - `writing-plans`: "TBD/TODO" → "[incomplete]/[pending]"
  - `brainstorming`: "TBD/TODO" → "[incomplete]/[pending]"

### Added
- `.ai-dev/CHANGES.md` — this changelog
- `.ai-dev/specs/rf-002-self-refactor/SPEC.md` — self-refactoring specification

## [2026-05-16] rf-001 — Framework Completeness Gap Closure

### Added
- `skills/engineering/` — 11 engineering skills populated from superpower + mattpocock references
- `skills/design/` — 2 design skills (ux-research, visual-design)
- `skills/engineering/frontend-patterns/SKILL.md` (real content)
- `skills/engineering/backend-patterns/SKILL.md` (real content)
- `skills/engineering/api-design/SKILL.md` (real content)
- `skills/engineering/database-patterns/SKILL.md` (real content)
- `skills/engineering/devops-patterns/SKILL.md` (real content)
- `skills/engineering/diagnose/SKILL.md` (from mattpocock/skills)
- `skills/engineering/grill-with-docs/SKILL.md` (from mattpocock/skills)
- `skills/engineering/improve-codebase-architecture/SKILL.md` (from mattpocock/skills, with 3 refs)
- `skills/engineering/prototype/SKILL.md` (from mattpocock/skills, with 2 refs)
- `skills/engineering/tdd-deep/SKILL.md` (from mattpocock/skills, with 5 refs)
- `skills/engineering/testing/SKILL.md` (from mattpocock/skills)
- `skills/engineering/zoom-out/SKILL.md` (from mattpocock/skills)
- `skills/core/*/` — 17 core skills from superpower (subagent-driven, tdd, systematic-debugging, etc.)
- `scripts/test-structure.sh` — framework integrity validator
- `skills/README.md` — skills directory navigation
- `agents/README.md` — agents directory navigation

### Changed
- All 10 `AGENT.md` files: added missing `role:` YAML frontmatter field
- Restored corrupted agent files from agency-agents import (backend, frontend, qa, devops, ux, ui, visual)

## [2026-05-15] Initial Framework Setup

### Added
- `AGENTS.md` — orchestrator-first agent coordination model
- `CLAUDE.md` — AI agent working instructions for this framework
- `README.md` — framework overview and quick start
- `skills/core/orchestrator/SKILL.md` — central coordination skill
- `skills/core/spec-driven/SKILL.md` — spec creation pipeline
- `skills/core/subagent-driven/SKILL.md` — subagent dispatching pattern
- `skills/core/tdd/SKILL.md` — test-driven development cycle
- `skills/core/qa-reviewer/SKILL.md` — quality assurance gate
- `skills/core/planning/SKILL.md` — task decomposition
- `skills/core/three-round-self-audit/SKILL.md` — mandatory quality self-check
- `.claude/SKILL.md`, `.opencode/SKILL.md`, `.copilot/SKILL.md` — platform plugins
- `specs/templates/` — OpenSpec-style spec templates
- `agents/engineering/`, `agents/design/` — engineering and design agent definitions
