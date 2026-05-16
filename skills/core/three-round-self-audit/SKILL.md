---
name: three-round-self-audit
description: Quality self-check before delivery — three rounds of critical review as different personas
triggers:
  - Before delivering any change
  - Before opening a PR
  - Before merging to main
  - After QA review fixes
---

# Three-Round Self-Audit

## Overview

Before delivering any change, review it through three critical lenses. Each round changes your persona to eliminate blind spots.

## The Three Rounds

```
Round 1: The Architect  ← "Is this the right design?"
Round 2: The QA Engineer ← "Does this actually work?"
Round 3: The Human      ← "Would I want this?"
```

## Round 1: The Architect

**Persona:** Senior architect with 20 years experience
**Question:** "Is this the right design for the problem?"

Check:
- [ ] Is the architecture appropriate for the scale?
- [ ] Are there hidden coupling or dependencies?
- [ ] Will this scale? (2x, 10x, 100x users)
- [ ] Are there obvious performance issues?
- [ ] Is the tech stack the right choice?

**If issues found:** Go back to design. Fix before Round 2.

## Round 2: The QA Engineer

**Persona:** QA engineer who wants to break things
**Question:** "Does this actually work in all cases?"

Check:
- [ ] All acceptance criteria are testable and tested
- [ ] Edge cases are handled (empty, null, overflow)
- [ ] Error messages are helpful
- [ ] Security implications considered
- [ ] No debug code or TODOs in production

**If issues found:** Go back to implementation. Fix before Round 3.

## Round 3: The Human

**Persona:** The actual user who will interact with this
**Question:** "Would I want this? Is it intuitive?"

Check:
- [ ] User-facing text is clear and helpful
- [ ] Error messages don't require internal knowledge
- [ ] The UX flow makes sense
- [ ] Naming is intuitive
- [ ] The change is worth the complexity it adds

**If issues found:** Go back to spec. Fix before delivery.

## Audit Output

```markdown
## Three-Round Self-Audit: <change-id>

### Round 1: Architect
- Status: PASS / ISSUES FOUND
- Issues: <list if any>

### Round 2: QA Engineer
- Status: PASS / ISSUES FOUND
- Issues: <list if any>

### Round 3: Human
- Status: PASS / ISSUES FOUND
- Issues: <list if any>

### Final Verdict
APPROVED FOR DELIVERY / NEEDS REVISION
```

## When to Stop

- All three rounds pass → Deliver
- Any round finds issues → Fix, restart from that round
- Round 1 fails → Redesign (don't patch symptoms)
- Round 2 fails → Implement fixes
- Round 3 fails → Go back to spec with user needs

## Pitfalls

- **Skipping rounds.** Each persona catches different issues.
- **Rubber-stamping.** Actually think like the persona.
- **Fixing symptoms.** If Round 1 fails, don't just patch — redesign.
- **Self-justification.** "It's fine" is not an audit finding.
