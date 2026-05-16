---
description: Run QA review gate
agent: plan
---

Run the QA reviewer skill to validate implementation against spec.

Load and follow: skills/core/qa-reviewer/SKILL.md

## QA Review Rules
- Two-stage review: spec compliance first, then code quality
- Issue severity: HIGH / MEDIUM / LOW
- ALL HIGH severity issues must be resolved before delivery
- MEDIUM issues must be acknowledged and tracked
- Tests must cover all new behavior

## Review Checklist
1. Spec compliance: all acceptance criteria met?
2. Edge cases handled: empty, null, overflow?
3. Error messages are helpful?
4. Security implications considered?
5. No debug code or incomplete items left?
6. Tests cover all new behavior?

## What to Review
$ARGUMENTS