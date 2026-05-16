---
name: spec-driven
description: Spec creation pipeline — transform a request into a reviewed, approved spec artifact
triggers:
  - New feature request
  - Refactor with significant scope
  - Unclear requirements
  - "Let me check the spec" moment
---

# Spec-Driven Development

## Overview

**No spec = no code.** A spec is not documentation — it's a shared understanding artifact between human and AI about what will be built before any code is written.

## Spec Creation Pipeline

### Round 1: Researcher → Writer → Critic

```
Request → Researcher (context gathering) → Writer (draft spec)
    → Critic (review) → [Rounds 2-N if needed] → Approved Spec
```

**Number of rounds by complexity:**
- SIMPLE: 1 round (skip researcher)
- STANDARD: 2 rounds
- COMPLEX: 3 rounds

## Spec Document Structure

```markdown
# <Feature Name>

## 1. Overview
One paragraph: what this is and why it matters.

## 2. Goals / Non-Goals
- ✓ What this will accomplish
- ✗ What this explicitly will NOT include

## 3. User Stories
As a <role>, I want <action> so that <outcome>.

## 4. Technical Approach
- Architecture / patterns used
- API design (if applicable)
- Data model changes (if applicable)
- Dependencies added

## 5. Edge Cases
How does the system behave at the boundaries?

## 6. Acceptance Criteria
- [ ] <specific, testable criterion>
- [ ] <specific, testable criterion>
```

## Spec Review Checklist (Critic)

1. **Completeness** — Are all user stories covered?
2. **Consistency** — Do sections contradict each other?
3. **Feasibility** — Can this be built in the time/constraint?
4. **Testability** — Can every acceptance criterion be verified?
5. **Scope creep** — Are out-of-scope items truly out?

## When to Escalate

- Requirements are contradictory → Stop, ask human
- Technical approach is unclear → More research needed
- Scope keeps expanding → Flag to human

## Spec Location

Store specs at: `.ai-dev/specs/<change-id>/`

```
<change-id>/
├── SPEC.md              # Main spec
├── requirements.json    # Checklist format
├── context.json         # Tech context
└── implementation_plan.md
```

## Pitfalls

- **Skipping spec for "quick" tasks.** Quick tasks become long tasks without spec.
- **Writing specs that are too abstract.** "User-friendly" is not an acceptance criterion.
- **Not getting human sign-off.** Spec without approval is a guess.
- **Scope creep in spec.** If the spec grows beyond the original request, flag it.
