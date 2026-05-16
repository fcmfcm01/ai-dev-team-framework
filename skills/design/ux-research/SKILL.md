---
name: ux-research
description: UX research methods — user personas, journey mapping, usability analysis, information architecture, accessibility
triggers:
  - Starting a new design project
  - Creating user personas
  - Mapping user journeys
  - Usability testing
  - Accessibility audit
---

# UX Research

## Overview

UX research methods for understanding users, mapping their journeys, and creating research-backed design decisions.

## When to Use

```
Starting new feature?
    ├─ No existing user research? → ux-research
    └─ Research exists? → Review and build on it

Redesigning existing feature?
    └─ → ux-research (usability audit)

Validating design decisions?
    └─ → ux-research
```

## User Persona Template

```markdown
## Persona: [Name]

### Demographics
- **Age:** [range]
- **Location:** [city/country]
- **Occupation:** [job title]
- **Income:** [range]

### Goals
- [Goal 1 — what they want to achieve]
- [Goal 2 — what they want to achieve]

### Frustrations
- [Frustration 1 — what's preventing them]
- [Frustration 2 — what's preventing them]

### Tech Proficiency
- [Beginner / Intermediate / Expert]
- [How they typically interact with technology]

### Quote
> "[What they would say about their needs]"

### Behavioral Patterns
- [When they use the product — time, frequency]
- [How they access — mobile, desktop, both]
- [What triggers their use — problem occurrence]
```

## User Journey Mapping

### Journey Map Structure

```
┌─────────────────────────────────────────────────────────┐
│ User Journey: [Action the user takes]                   │
├─────────────────────────────────────────────────────────┤
│ Phase          │ Touchpoint │ Action  │ Thought         │
├────────────────┼────────────┼─────────┼─────────────────┤
│ Awareness      │ [How they] │ [What]  │ [What are they] │
│                │ hear about │ do      │ thinking?       │
│                │ product]   │         │                 │
├────────────────┼────────────┼─────────┼─────────────────┤
│ Consideration  │            │         │                 │
├────────────────┼────────────┼─────────┼─────────────────┤
│ Decision       │            │         │                 │
├────────────────┼────────────┼─────────┼─────────────────┤
│ Onboarding     │            │         │                 │
├────────────────┼────────────┼─────────┼─────────────────┤
│ Ongoing Use    │            │         │                 │
└────────────────┴────────────┴─────────┴─────────────────┘

Opportunities: [Where we can improve the experience]
Pain Points:   [Where users struggle or drop off]
Solutions:     [How to address each pain point]
```

## Usability Testing

### Test Plan Template

```markdown
## Usability Test Plan

### Objectives
1. [Primary objective — what we're measuring]
2. [Secondary objective]

### Participants
- **Number:** 5-8 per user segment
- **Recruitment:** [How participants were recruited]
- **Screening criteria:** [Who qualifies]

### Tasks
| Task | Success Metric | Completion Rate Target |
|------|---------------|----------------------|
| [Task 1] | [What counts as success] | >90% |
| [Task 2] | [What counts as success] | >85% |

### Severity Rating
- **Critical:** Blocks task completion
- **Major:** Causes significant frustration or time
- **Minor:** Minor inconvenience
- **Cosmetic:** Nice-to-have improvement

### Findings Summary
[Paste test observations, quotes, metrics]
```

### Moderator Guide

```markdown
## Opening Script
"Thank you for joining this usability test. I'm here to observe how you use
the product — not to test you. There are no wrong answers. Please think aloud
as you navigate."

## During the Test
- "What are you thinking right now?"
- "What would you do next?"
- "Is this what you expected?"
- DO NOT say: "Did you like it?" (too subjective)
- DO say: "Walk me through what you're doing."
```

## Information Architecture

### Site Map

```markdown
## Information Architecture: [Product Name]

Root
├── Home
├── [Section 1]
│   ├── [Page 1.1]
│   ├── [Page 1.2]
│   └── [Page 1.3]
├── [Section 2]
│   ├── [Page 2.1]
│   └── [Page 2.2]
├── [Section 3]
│   └── (nested pages...)
└── [Utility]
    ├── Help/FAQ
    ├── Contact
    └── Legal

### Labelling Principles
- Use user language (not system language)
- Be specific, not generic
- Keep labels short (2-3 words)
- Parallel structure within sections
```

## Accessibility Audit

### WCAG 2.1 AA Checklist

| Criterion | Requirement | How to Test |
|-----------|-------------|-------------|
| Perceivable | | |
| 1.1.1 Non-text | Images have text alternatives | alt text on all images |
| 1.3.1 Info/Roles | Structure is programmatically determinable | Semantic HTML |
| 1.4.3 Contrast | Text has 4.5:1 contrast ratio | Color contrast checker |
| 1.4.4 Resize | Text resizes to 200% without loss | Browser zoom test |
| Operable | | |
| 2.1.1 Keyboard | All functions available via keyboard | Tab through interface |
| 2.4.1 Bypass Blocks | Skip navigation links | Page landarks |
| 2.4.3 Focus Order | Logical focus order | Tab through interface |
| 2.4.4 Link Purpose | Link purpose is clear in context | Read link text |
| Understandable | | |
| 3.1.1 Language | Page language is set | HTML lang attribute |
| 3.3.1 Error ID | Errors are identified | Form validation |
| 3.3.2 Labels | Labels are provided | Form labels |
| Robust | | |
| 4.1.2 Name/Role | UI components have accessible names | ARIA labels |

### Keyboard Navigation Flow

```
Tab → Move to next focusable element
Shift+Tab → Move to previous
Enter → Activate buttons/links
Space → Activate buttons
Arrow keys → Navigate within components (menus, trees)
Escape → Close modals/dropdowns
```

## Pitfalls

- **Designing for yourself.** You're not the user. Research, don't assume.
- **Interviews without observation.** Watch what people do, not just what they say.
- **Ignoring negative feedback.** Pain points are opportunities.
- **Over-researching.** At some point, ship it and learn from real users.
- **Accessibility as afterthought.** Integrate from the start, not at the end.
