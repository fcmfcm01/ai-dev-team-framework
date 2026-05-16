---
name: to-prd
description: Turn the current conversation context into a PRD and publish it to the project issue tracker. Use when user wants to create a PRD from the current context.
---

# To PRD

Turn the current conversation context into a Product Requirements Document (PRD) and publish it to the project issue tracker. Do NOT interview the user — just synthesize what you already know.

## Process

1. **Explore the repo** to understand the current state of the codebase, if you haven't already. Use the project's domain glossary vocabulary throughout the PRD, and respect any ADRs in the area you're touching.

2. **Sketch out major modules** you will need to build or modify. Actively look for opportunities to extract deep modules that can be tested in isolation. A deep module encapsulates a lot of functionality in a simple, testable interface.

3. **Check with the user** that these modules match their expectations and which modules they want tests written for.

4. **Write the PRD** using the template below, then publish it to the project issue tracker. Apply the `ready-for-agent` triage label.

## PRD Template

```
## Problem Statement
The problem that the user is facing, from the user's perspective.

## Solution
The solution to the problem, from the user's perspective.

## User Stories
A LONG, numbered list of user stories in the format:
1. As an <actor>, I want a <feature>, so that <benefit>

## Implementation Decisions
- The modules that will be built/modified
- The interfaces that will be modified
- Technical clarifications from the developer
- Architectural decisions
- Schema changes
- API contracts

## Testing Decisions
- What makes a good test (test external behavior, not implementation details)
- Which modules will be tested
- Prior art for the tests

## Out of Scope
Things that are explicitly out of scope for this PRD.

## Further Notes
Any further notes about the feature.
```

---

## Orchestrator Binding

**Source:** [mattpocock/skills](https://github.com/mattpocock/skills) — `skills/engineering/to-prd/`

**Framework integration:**

| Context | Action |
|---------|--------|
| Feature discussion in conversation | Activate `to-prd` to synthesize a PRD |
| User wants to formalize a feature request | Activate `to-prd` |
| Before spec creation | Optionally activate `to-prd` first |

**Orchestrator protocol:**

1. When user describes a feature in conversational form → activate `to-prd` to formalize
2. After PRD is published → hand off to `to-issues` for breakdown
3. PRD is the input to the spec pipeline (see `spec-driven` skill)
4. User stories from `to-prd` → feed into `to-issues` for vertical slice breakdown
