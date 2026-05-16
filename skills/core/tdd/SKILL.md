---
name: tdd
description: Test-first development — red-green-refactor cycle, always write failing test before production code
triggers:
  - Any feature implementation
  - Any bug fix
  - Any refactor
  - Any behavior change
---

# Test-Driven Development (TDD)

## The Iron Law

```
NO PRODUCTION CODE WITHOUT A FAILING TEST FIRST
```

## Red-Green-Refactor Cycle

```
    RED          GREEN         REFACTOR
 Write failing  Minimal code   Clean up
 test first     to pass        while staying
     │              │              │         green
     ▼              ▼              ▼
 ┌─────────────────────────────────────┐
 │          Stay in the green          │
 └─────────────────────────────────────┘
```

## When to Apply TDD

**Always:**
- New features
- Bug fixes
- Refactoring
- Behavior changes

**Ask human first:**
- Throwaway prototypes
- Generated code
- Configuration files
- One-off scripts

## RED Phase — Write Failing Test

Write **one minimal test** showing what should happen:

```typescript
// Good: specific, minimal, clear failure message
test('retries failed operations 3 times', async () => {
  let attempts = 0;
  const operation = async () => {
    attempts++;
    throw new Error('network failure');
  };

  const result = await retry(operation, { maxAttempts: 3 });
  expect(attempts).toBe(3);
  expect(result).toBeNull();
});
```

**Bad patterns:**
- Test that covers too much at once
- Test without a clear failure message
- Test that depends on previous tests

## GREEN Phase — Minimal Code

Write the **minimum code** to make the test pass:

- Don't write "perfect" code — write just enough
- Don't anticipate future requirements (YAGNI)
- If the test is complicated, the code is trying to tell you something

## REFACTOR Phase — Clean Up

Keep tests green, improve code:

- Remove duplication
- Improve naming
- Extract helpers
- Add comments

**Do not add new behavior in refactor phase.**

## Test Naming

```
test('<action> <subject> <expected result>')

test('returns 404 for missing user')
test('encrypts password with bcrypt')
test('throws ValidationError for invalid email')
```

## Test Structure

```typescript
describe('<subject>', () => {
  describe('<scenario>', () => {
    it('<action> <expected>', () => {
      // Arrange
      const input = { email: 'invalid' };

      // Act
      const result = validate(input);

      // Assert
      expect(result).toBeNull();
    });
  });
});
```

## Pitfalls

- **Writing code before test.** Delete the code. Write the test first.
- **Keeping "reference" code.** Delete it.
- **Testing too much at once.** One assertion focus per test.
- **Skipping TDD for "simple" fixes.** Simple bugs usually had complex root causes.
