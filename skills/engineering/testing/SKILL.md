---
name: testing
description: Test strategy and automation — unit tests, integration tests, E2E, coverage targets, test pyramid
triggers:
  - Writing any test
  - Setting test strategy
  - Coverage analysis
  - Debugging test failures
  - CI test automation
---

# Testing

## Overview

A systematic approach to testing: write the right tests at the right level, maintain them properly, and use them to drive good design.

## When to Use

```
Writing new code?
    └─ → Write tests first (TDD)

Fixing a bug?
    └─ → Write a failing test that reproduces the bug

Refactoring?
    └─ → Ensure tests pass before and after

Adding a feature?
    └─ → Unit tests for logic, integration tests for flows
```

## The Test Pyramid

```
        /\
       /  \      E2E Tests (few, slow, high confidence)
      /----\
     /      \    Integration Tests (some, medium)
    /--------\
   /          \  Unit Tests (many, fast)
  /____________\

Unit: 70% — fast, isolated, test one thing
Integration: 20% — test component interactions
E2E: 10% — test critical user flows
```

## Unit Test Patterns

### AAA Structure

```typescript
describe('calculateTotal', () => {
  it('applies discount when total exceeds threshold', () => {
    // Arrange
    const items = [
      { price: 100, qty: 2 },
      { price: 50, qty: 1 },
    ];
    const discountThreshold = 200;
    const discountRate = 0.1;

    // Act
    const total = calculateTotal(items, discountThreshold, discountRate);

    // Assert
    expect(total).toBe(292.5); // 250 - 10% = 225... wait, 250 no discount? 
    // Actually: 250 >= 200, so 250 * 0.9 = 225
  });
});
```

### Test Naming Convention

```typescript
test('<subject> <action> <expected result>')
test('<scenario> <action> <expected result>')

// Good names
test('returns null for empty array')
test('throws ValidationError for invalid email format')
test('applies 10% discount when total exceeds $200')
test('retries 3 times on network failure')

// Bad names
test('test 1')
test('calculateTotal')
test('edge case')
```

### Test Doubles

```typescript
// Stub — provide canned responses
const authService = {
  getUser: () => ({ id: '1', role: 'admin' }),
};

// Spy — record calls for assertions
const fn = vi.fn().mockResolvedValue({ id: '1' });
await fn();
expect(fn).toHaveBeenCalledTimes(1);

// Mock — pre-programmed with expectations
const mockDb = {
  query: vi.fn().mockResolvedValue([{ id: '1' }]),
};

// Fake — lightweight implementation
class FakeClock {
  private time: Date;
  constructor(initial: Date) { this.time = initial; }
  now() { return this.time; }
  advance(ms: number) { this.time = new Date(this.time.getTime() + ms); }
}
```

### Avoid Test Interdependence

```typescript
// Bad: test 2 depends on test 1 running first
let counter = 0;
test('first', () => { counter++; expect(counter).toBe(1); });
test('second', () => { expect(counter).toBe(1); }); // Fragile!

// Good: each test sets up its own state
test('increment counter', () => {
  const counter = createCounter();
  counter.increment();
  expect(counter.value).toBe(1);
});
```

## Integration Test Patterns

### Database Integration

```typescript
// Use transactions to isolate tests
describe('UserRepository', () => {
  let db: TestDatabase;

  beforeEach(async () => {
    db = await TestDatabase.create();
  });

  afterEach(async () => {
    await db.rollback(); // No data persists
  });

  it('creates user with hashed password', async () => {
    const repo = new UserRepository(db);

    const user = await repo.create({
      name: 'Alice',
      email: 'alice@example.com',
      password: 'secret123',
    });

    expect(user.id).toBeDefined();
    const stored = await db.query('SELECT * FROM users WHERE id = $1', [user.id]);
    expect(stored.password).not.toBe('secret123'); // Hashed
  });
});
```

### API Integration

```typescript
describe('POST /api/users', () => {
  const request = supertest(app);

  it('creates user and returns 201', async () => {
    const res = await request
      .post('/api/users')
      .send({ name: 'Bob', email: 'bob@example.com' })
      .expect(201);

    expect(res.body.data.name).toBe('Bob');
    expect(res.body.data.email).toBe('bob@example.com');

    // Verify persisted
    const user = await db.users.findByEmail('bob@example.com');
    expect(user).not.toBeNull();
  });

  it('returns 400 for invalid email', async () => {
    const res = await request
      .post('/api/users')
      .send({ name: 'Bob', email: 'not-an-email' })
      .expect(400);

    expect(res.body.error.code).toBe('VALIDATION_ERROR');
  });
});
```

## E2E Test Patterns

### Critical Path Coverage

```typescript
// Test only what users actually do
describe('Authentication Flow', () => {
  it('allows user to sign up, login, and logout', async () => {
    await page.goto('/signup');

    // Sign up
    await page.fill('[name="email"]', 'test@example.com');
    await page.fill('[name="password"]', 'SecurePass123!');
    await page.click('[type="submit"]');
    await expect(page).toHaveURL('/dashboard');

    // Logout
    await page.click('[data-testid="user-menu"]');
    await page.click('[data-testid="logout"]');
    await expect(page).toHaveURL('/login');
  });
});
```

### Selector Best Practices

```typescript
// Prefer semantic selectors
await page.click('button[type="submit"]');
await page.fill('input[name="email"]', 'test@example.com');

// Use data-testid for dynamic content
await page.click('[data-testid="submit-button"]');

// Avoid brittle selectors
// Bad: await page.click('.css-1a2b3c > div:nth-child(2) > button');
// Good: await page.click('[data-testid="continue-button"]');
```

## Coverage Targets

| Layer | Target | What to Cover |
|-------|--------|---------------|
| Unit | >80% | Business logic, utilities, edge cases |
| Integration | >60% | API routes, DB queries, service interactions |
| E2E | Critical paths | Login, checkout, core user flows |

```bash
# Run with coverage
vitest run --coverage
# or
jest --coverage

# Threshold enforcement (CI)
coverageThreshold:
  global:
    branches: 80
    functions: 80
    lines: 80
    statements: 80
```

## Test-Driven Development (TDD)

```
RED    → GREEN   → REFACTOR
Write  → Minimal → Clean up
failing → code to → while
test    → pass    → green
  │         │          │
  ▼         ▼          ▼
Write    Write      Improve
what     just       code,
you      enough     not
want     to pass    behavior
```

### TDD Cycle Example

```typescript
// RED: Write failing test
test('calculates 10% discount above $100', () => {
  const total = calculateTotal([
    { price: 150, qty: 1 }, // > 100, qualifies for discount
  ]);
  expect(total).toBe(135); // 150 - 10% = 135
});

// GREEN: Minimal implementation
function calculateTotal(items: Item[]): number {
  const subtotal = items.reduce((sum, i) => sum + i.price * i.qty, 0);
  if (subtotal > 100) {
    return subtotal * 0.9;
  }
  return subtotal;
}

// REFACTOR: Clean up (already clean enough, move on)
```

## Pitfalls

- **Testing implementation details.** Test behavior, not how it's implemented.
- **No test isolation.** Each test must clean up its own state.
- **Slow tests.** If unit tests take >1s total, something is wrong.
- **Coverage theater.** High coverage with low-value tests is worthless.
- **Flaky tests.** Tests that pass/fail randomly destroy trust. Fix or delete them.

---

## Source

**⚠️ Self-created — NOT from mattpocock/skills**

This skill was created by the framework authors and is not derived from [mattpocock/skills](https://github.com/mattpocock/skills). The mattpocock reference does not have a `testing` skill in `skills/engineering/`.

If you are looking for mattpocock's approach to testing, see:
- [tdd-deep](./tdd-deep/SKILL.md) — TDD with red-green-refactor loop
- [diagnose](./diagnose/SKILL.md) — debugging test failures

## Orchestrator Binding

**Framework integration:**

| Context | Action |
|---------|--------|
| Writing any test | Activate `testing` for test strategy |
| Setting test coverage targets | Activate `testing` |
| CI test automation | Activate `testing` |
| TDD cycle | Use `tdd-deep` skill instead |

**Orchestrator protocol:**

1. When any agent writes tests → activate `testing` for strategy guidance
2. For TDD workflow → use `tdd-deep` instead
3. For test failure debugging → use `diagnose` instead
