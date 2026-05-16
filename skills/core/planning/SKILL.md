---
name: planning
description: Task breakdown — transform an approved spec into an ordered, parallelizable task list
triggers:
  - Spec approved and ready to implement
  - Need to break down a feature into tasks
  - "What's the implementation order?" question
---

# Planning Skill

## Overview

Transform an approved spec into an ordered, prioritized task list. The output is a set of independent tasks that can be dispatched to subagents in parallel.

## Planning Process

```
Approved Spec
    │
    ▼
┌─────────────────────────────────────┐
│ 1. Identify all changes             │
│    (files, modules, tests, docs)     │
└──────────────────┬──────────────────┘
                   │
                   ▼
┌─────────────────────────────────────┐
│ 2. Determine dependencies           │
│    (what must come first)            │
└──────────────────┬──────────────────┘
                   │
                   ▼
┌─────────────────────────────────────┐
│ 3. Group into parallelizable tasks   │
│    (independent → parallel)           │
└──────────────────┬──────────────────┘
                   │
                   ▼
┌─────────────────────────────────────┐
│ 4. Order dependent tasks            │
│    (dependencies first)              │
└──────────────────┬──────────────────┘
                   │
                   ▼
              Task List
```

## Task Definition

```yaml
task:
  id: <unique-id>
  title: <short name>
  description: <what this task does>
  files: [<affected files>]
  skills: [<required skills>]
  acceptance:
    - <criterion 1>
    - <criterion 2>
  parallel_with: [<task-ids that can run in parallel>]
  depends_on: [<task-ids that must complete first>]
```

## Dependency Analysis

Ask for each task:

1. Does this require any other task's output?
2. Does this need the database schema to be ready?
3. Does this need the API contract to be defined?
4. Can this be built in isolation?

## Parallelization Strategy

**Independent tasks (can run in parallel):**
- Different features
- Frontend and backend of same feature
- Tests and implementation
- Documentation and code

**Dependent tasks (must run sequentially):**
- Database schema before API implementation
- Core logic before wrapper utilities
- Foundation before features

## Task List Example

```markdown
## Task List: Add Dark Mode

### Phase 1: Foundation (sequential)
- [ ] **T1** Add theme CSS variables to `theme.css`
- [ ] **T2** Create `useTheme()` hook
- [ ] **T3** Add theme context provider

### Phase 2: Components (parallel)
- [ ] **T4** Update Button component (T3 done)
- [ ] **T5** Update Card component (T3 done)
- [ ] **T6** Update Modal component (T3 done)

### Phase 3: Integration (sequential)
- [ ] **T7** Wire up theme toggle (T4, T5, T6 done)
- [ ] **T8** Add localStorage persistence (T3 done)

### Phase 4: Testing (parallel with integration)
- [ ] **T9** Unit tests for useTheme hook (T3 done)
- [ ] **T10** E2E tests for theme toggle (T7, T8 done)
```

## Priority Guidelines

1. **Foundation first** — Schema, types, interfaces
2. **Independent second** — Can parallelize
3. **Integration last** — Wiring things together
4. **Tests in parallel** — Can run alongside implementation

## Pitfalls

- **Over-decomposing.** Tasks smaller than 30 minutes aren't worth the overhead.
- **Under-decomposing.** "Build the whole feature" is not a task.
- **Ignoring dependencies.** False parallelism causes rework.
- **No acceptance criteria.** Tasks without clear done-ness cause scope creep.
