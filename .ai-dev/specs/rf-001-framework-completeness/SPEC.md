# Refactor: Framework Completeness Gap Closure

## 1. Overview

The AI Dev Team Framework is structurally complete but has critical content gaps. This refactoring fills those gaps to make the framework genuinely usable: real engineering skills, design skills, a test structure validator, and proper sub-skill organization.

## 2. Goals / Non-Goals

### Goals
- Fill `skills/engineering/` with real, usable skill documents
- Fill `skills/design/` with real, usable skill documents
- Create `scripts/test-structure.sh` to validate framework integrity
- Add Agent sub-skill directories for each engineering agent
- Ensure every skill has complete content (no TODOs, no placeholders)

### Non-Goals
- Do NOT change the existing core skill content (already solid)
- Do NOT add new agents or platforms (scope is completeness, not expansion)
- Do NOT create a full test suite for the framework itself (just structural validation)

## 3. User Stories

### Story 1
**As a** developer using the framework
**I want** real engineering skills (frontend-patterns, backend-patterns, testing)
**So that** I have actionable guidance when implementing features

### Story 2
**As a** developer using the framework
**I want** real design skills (ux-research, visual-design)
**So that** I can hand off design work with clear specifications

### Story 3
**As a** framework contributor
**I want** `scripts/test-structure.sh` validation
**So that** I can verify new skills and agents meet the format standard

## 4. Technical Approach

### Changes to `skills/engineering/`
Create three skill directories with full SKILL.md content:
- `frontend-patterns/SKILL.md` — React/Vue component patterns, CSS architecture
- `backend-patterns/SKILL.md` — API design, database patterns, service patterns
- `testing/SKILL.md` — Test strategy, coverage targets, automation

### Changes to `skills/design/`
Create two skill directories with full SKILL.md content:
- `ux-research/SKILL.md` — User research methods, persona creation, journey mapping
- `visual-design/SKILL.md` — Color theory, typography, layout principles, brand

### Changes to `agents/engineering/`
Create agent-specific sub-skill directories:
- `frontend-developer/frontend-patterns/SKILL.md` — Frontend agent patterns
- `backend-developer/backend-patterns/SKILL.md` — Backend agent patterns
- `qa-engineer/testing/SKILL.md` — QA agent test strategy

### Changes to `agents/design/`
- `ui-designer/design-system/SKILL.md` — Design token system, component specs

### New: `scripts/test-structure.sh`
A bash script that validates:
- All SKILL.md files have YAML frontmatter
- All AGENT.md files have YAML frontmatter
- No TODO/FIXME/PLACEHOLDER text in production content
- Directory structure matches specification

## 5. Edge Cases

| Scenario | Behavior |
|----------|----------|
| SKILL.md missing frontmatter | Script exits non-zero, prints file path |
| AGENT.md missing frontmatter | Script exits non-zero, prints file path |
| Placeholder text found | Script warns but continues |
| File with < 100 chars | Script warns (likely empty/incomplete) |

## 6. Acceptance Criteria

- [ ] `skills/engineering/frontend-patterns/SKILL.md` exists with > 2000 chars
- [ ] `skills/engineering/backend-patterns/SKILL.md` exists with > 2000 chars
- [ ] `skills/engineering/testing/SKILL.md` exists with > 2000 chars
- [ ] `skills/design/ux-research/SKILL.md` exists with > 1500 chars
- [ ] `skills/design/visual-design/SKILL.md` exists with > 1500 chars
- [ ] `agents/engineering/frontend-developer/frontend-patterns/SKILL.md` exists
- [ ] `agents/engineering/backend-developer/backend-patterns/SKILL.md` exists
- [ ] `agents/engineering/qa-engineer/testing/SKILL.md` exists
- [ ] `agents/design/ui-designer/design-system/SKILL.md` exists
- [ ] `scripts/test-structure.sh` exists and returns 0 on clean run
- [ ] Zero TODO/FIXME/PLACEHOLDER in any skill or agent file
- [ ] `scripts/test-structure.sh` validates all existing files correctly
