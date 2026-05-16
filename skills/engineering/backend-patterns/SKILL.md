---
name: backend-patterns
description: Use when building backend services, APIs, or server-side logic — covers API design, database access, error handling, and performance
---

# Backend Patterns

Patterns for building production-grade backend services.

## API Design

### REST Principles
```
GET    /users          — list users
GET    /users/:id      — get user
POST   /users          — create user
PATCH  /users/:id      — update user
DELETE /users/:id      — delete user
```

### Error Response Shape
```json
{
  "error": {
    "code": "USER_NOT_FOUND",
    "message": "User with id '123' not found",
    "details": {}
  }
}
```

### Versioning
```
/v1/users  → /v2/users  (major version in path)
GET /users?fields=name  → GET /users?select=name  (additive)
```

## Database Patterns

### Repository Pattern
```python
class UserRepository:
    def find_by_id(self, id: str) -> User | None:
        return self.db.query(User).filter(User.id == id).first()

    def save(self, user: User) -> User:
        self.db.add(user)
        self.db.commit()
        return user
```

### Unit of Work
```python
class UnitOfWork:
    def __enter__(self):
        self.db = get_db_session()
        self.users = UserRepository(self.db)
        return self

    def __exit__(self, *args):
        self.db.close()
```

### Query Objects
```python
class UserQuery:
    def __init__(self, session):
        self.session = session

    def active_admins(self):
        return self.session.query(User).filter(
            User.role == 'admin',
            User.active == True
        )
```

## Error Handling

| Error Type | HTTP Code | Action |
|------------|-----------|--------|
| Validation error | 400 | Return field errors |
| Not found | 404 | Return specific resource |
| Conflict | 409 | Return conflict details |
| Rate limited | 429 | Return retry-after |
| Server error | 500 | Log, return generic message |

## Performance

- **N+1 queries** — use eager loading (selectinload, joinedload)
- **Pagination** — always paginate list endpoints
- **Caching** — Redis for hot data, invalidate on write
- **Async I/O** — asyncpg, aiohttp for I/O-bound work
- **Connection pooling** — set pool size based on expected concurrency

## Security

- Input validation at API boundary (Pydantic, Zod)
- Parameterized queries (no string interpolation)
- Rate limiting on all public endpoints
- JWT with short expiry + refresh tokens
- Audit logging for sensitive operations
