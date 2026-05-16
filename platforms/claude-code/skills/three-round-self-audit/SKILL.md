---
name: three-round-self-audit
description: Mandatory three-axis self-audit before delivering any artifact. Architecture Review (correct patterns, scalable design) → QA Review (correctness, security, tests) → Human Review (clarity, completeness, tone). Use before every delivery.
argument-hint: [artifact to audit]
user-invocable: true
disable-model-invocation: false
context: inline
---

# Three-Round Self-Audit

Mandatory quality gate before delivery.

## Round 1 — Architecture Review

- Correct architectural patterns?
- Scalable design for future growth?
- Proper separation of concerns?
- No premature optimization?

**If failing:** Refactor before proceeding.

## Round 2 — QA Review

- Correctness: logic errors, edge cases?
- Security: injection, auth, secrets?
- Tests: coverage, quality?
- Types/Lint: no errors?

**If failing:** Fix and re-audit.

## Round 3 — Human Review

- Clear, jargon-free language?
- Complete (no missing steps)?
- Appropriate tone for audience?
- Actionable next steps?

**If failing:** Rewrite and re-audit.

## Delivery Gate

All three rounds must pass. If any round fails:
1. Fix the finding
2. Re-run that round
3. Only deliver when all three are green

## See Also

- [QA Reviewer](../qa-reviewer/SKILL.md) — for Round 2 details
- [Orchestrator](../orchestrator/SKILL.md) — for coordinating delivery
