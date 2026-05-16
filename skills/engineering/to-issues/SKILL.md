---
name: to-issues
description: Break a plan, spec, or PRD into independently-grabbable issues using tracer-bullet vertical slices. Use when user wants to convert a plan into issues, create implementation tickets, or break down work into issues.
---

# To Issues

Break a plan into independently-grabbable issues using vertical slices (tracer bullets).

## Process

### 1. Gather context

Work from whatever is already in the conversation context. If the user passes an issue reference as an argument, fetch it from the issue tracker and read its full body and comments.

### 2. Explore the codebase (optional)

If you have not already explored the codebase, do so to understand the current state. Issue titles and descriptions should use the project's domain glossary vocabulary, and respect ADRs in the area you're touching.

### 3. Draft vertical slices

Break the plan into **tracer bullet** issues. Each issue is a thin vertical slice that cuts through ALL integration layers end-to-end, NOT a horizontal slice of one layer.

<vertical-slice-rules>
- Each slice delivers a narrow but COMPLETE path through every layer (schema, API, UI, tests)
- A completed slice is demoable or verifiable on its own
- Prefer many thin slices over few thick ones
</vertical-slice-rules>

Slices may be 'HITL' or 'AFK'. HITL slices require human interaction (architectural decisions, design review). AFK slices can be implemented and merged without human interaction.

### 4. Quiz the user

Present the proposed breakdown as a numbered list. For each slice, show:

- **Title**: short descriptive name
- **Type**: HITL / AFK
- **Blocked by**: which other slices must complete first
- **User stories covered**: which user stories this addresses

Ask the user:
- Does the granularity feel right?
- Are the dependency relationships correct?
- Should any slices be merged or split further?
- Are the correct slices marked as HITL and AFK?

Iterate until the user approves the breakdown.

### 5. Publish the issues

Publish issues in dependency order (blockers first). Use the issue body template:

```
## Parent
Reference to the parent issue (if any).

## What to build
Concise description of this vertical slice. Describe the end-to-end behavior.

## Acceptance criteria
- [ ] Criterion 1
- [ ] Criterion 2

## Blocked by
Reference to the blocking ticket, or "None - can start immediately".
```

---

## Orchestrator Binding

**Source:** [mattpocock/skills](https://github.com/mattpocock/skills) — `skills/engineering/to-issues/`

**Framework integration:**

| Context | Action |
|---------|--------|
| PRD or spec is ready to be broken down | Activate `to-issues` |
| Sprint planning | Activate `to-issues` after `triage` surfaces ready items |
| Feature kickoff | Hand off from `spec-driven` to `to-issues` |

**Orchestrator protocol:**

1. After spec is approved → hand off to `to-issues` to break into vertical slices
2. After `triage` surfaces `ready-for-agent` items → hand off to `to-issues` for breakdown
3. Slices marked AFK → can be dispatched to agents directly
4. Slices marked HITL → require human review before dispatch
