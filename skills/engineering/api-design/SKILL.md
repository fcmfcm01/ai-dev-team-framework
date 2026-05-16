---
name: api-design
description: Use when designing REST, GraphQL, or gRPC APIs — covers versioning, authentication, pagination, and contract testing
---

# API Design

## REST API Design

### Resource Naming
```
✓ /users, /orders, /products
✓ /users/:id/orders  (nested for strong ownership)
✗ /getUser, /createProduct  (no verbs in path)
```

### HTTP Methods
```
GET    — idempotent read
POST   — create
PUT    — full replace
PATCH  — partial update
DELETE — delete
```

### Query Parameters
```
?sort=-created_at,+name  (prefix - for desc)
?filter[status]=active&filter[role]=admin
?page=2&per_page=20
```

## GraphQL

### Schema Design
```graphql
type Query {
  user(id: ID!): User
  users(filter: UserFilter, page: PageInput): UserConnection!
}

type User {
  id: ID!
  name: String!
  email: String!
  posts: [Post!]!
}

type UserConnection {
  nodes: [User!]!
  pageInfo: PageInfo!
  totalCount: Int!
}
```

## Authentication

- **API Keys** — for server-to-server
- **JWT** — for user sessions (short-lived access + long-lived refresh)
- **OAuth 2.0** — for third-party access
- **Always use HTTPS**

## Pagination

| Type | Best For |
|------|----------|
| Offset | Random access, known total |
| Cursor | Real-time feeds, infinite scroll |
| Keyset | Large datasets, consistent ordering |
