---
description: Run three-round self-audit before delivery
agent: plan
---

Execute the mandatory three-round self-audit before delivery.

Load and follow: skills/core/three-round-self-audit/SKILL.md

## Round 1: The Architect
- Correctness: does the implementation match the spec?
- Completeness: all acceptance criteria met?
- Edge cases: empty, null, overflow handled?
- Error messages are helpful?
- Security implications considered?

## Round 2: The QA Engineer
- All HIGH severity issues fixed?
- MEDIUM issues acknowledged and tracked?
- Tests cover all new behavior?
- No debug code or incomplete items left in production?

## Round 3: The Human
- Is the deliverable genuinely useful?
- Would a real user benefit from this?
- Is the complexity justified by the value?

## What to Audit
$ARGUMENTS