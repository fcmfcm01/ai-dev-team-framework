---
name: qa-reviewer
description: QA validation gate — verify spec compliance and code quality after implementation
triggers:
  - After each subagent completes implementation
  - Before merging any worktree
  - During code review
  - Pre-delivery quality gate
---

# QA Reviewer

## Overview

QA review is a **mandatory gate** after every implementation. It happens in two stages: spec compliance first, code quality second. Never skip to code quality before confirming spec compliance.

## Two-Stage Review Process

```
Implementation Done
        │
        ▼
┌─────────────────┐
│ Stage 1: Spec   │ ← "Did we build what was specified?"
│  Compliance      │
└───────┬─────────┘
        │
   ┌────┴────┐
   │ Pass?   │
   └────┬────┘
        │
   ├─ Yes → Stage 2: Code Quality
   └─ No  → QA Fix Request → Fix → Stage 1 again
```

## Stage 1: Spec Compliance

Checklist:

- [ ] All acceptance criteria are met
- [ ] All user stories are addressed
- [ ] Edge cases from spec are handled
- [ ] API/data model matches spec
- [ ] No scope creep (features not in spec)
- [ ] Error handling matches spec

**If any item fails → QA Fix Request**

## Stage 2: Code Quality

Checklist:

- [ ] Code is readable and well-named
- [ ] No obvious bugs or security issues
- [ ] Tests cover new behavior
- [ ] Tests are maintainable
- [ ] Error messages are helpful
- [ ] No debug code left in
- [ ] Documentation updated if needed

## QA Report Format

```markdown
## QA Report: <change-id>

### Summary
- **Status:** PASS / FAIL / PARTIAL
- **Reviewer:** <agent name>
- **Date:** <timestamp>

### Spec Compliance
| Criterion | Status | Notes |
|-----------|--------|-------|
| AC-1      | ✓/✗   |       |

### Code Quality
| Issue | Severity | Location | Fix Required |
|-------|----------|----------|--------------|
|       |          |          | Yes/No       |

### Findings
<detailed description of any issues>

### Recommendations
<optional improvements not blocking release>
```

## QA Fix Request

When QA finds issues:

```markdown
## QA Fix Request

### Issues to Fix

1. **[HIGH]** <description>
   - Location: <file:line>
   - Current: <what's wrong>
   - Expected: <what it should be>

2. **[MEDIUM]** <description>
   - Location: <file:line>
   - Fix: <how to fix>
```

## Acceptance Criteria

A change can only be merged when:

1. All spec acceptance criteria are met
2. All HIGH severity issues are fixed
3. MEDIUM issues are acknowledged and tracked
4. Tests cover all new behavior
5. No debug code or TODOs left in production code

## Pitfalls

- **Skipping spec compliance.** Code quality doesn't matter if you built the wrong thing.
- **Rubber-stamping.** If something looks wrong, dig deeper.
- **Ignoring edge cases.** The spec's edge cases are the QA focus.
- **Incomplete fix requests.** "Fix the bug" is not a fix request. "Change line 42 to return null instead of throwing" is.
