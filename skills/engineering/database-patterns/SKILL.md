---
name: database-patterns
description: Use when designing database schemas, writing queries, or optimizing database performance
---

# Database Patterns

## Schema Design

### Normalization
- 3NF: eliminate redundant data
- Separate hot/warm/cold data
- Use UUIDs for public keys, integers for FKs

### Indexing Strategy
```
✓ Index foreign keys
✓ Index columns in WHERE, ORDER BY, JOIN
✓ Composite indexes for common query patterns
✗ Over-index (write-heavy tables)
```

## Query Patterns

### Soft Deletes
```sql
ALTER TABLE orders ADD COLUMN deleted_at TIMESTAMP;
CREATE INDEX idx_orders_deleted ON orders(deleted_at) WHERE deleted_at IS NULL;
```

### Audit Columns
```sql
created_at, updated_at, created_by, updated_by
```

### Time-Series Data
- Partition by time range (monthly/weekly)
- Use BRIN indexes for append-only tables

## Performance

- EXPLAIN ANALYZE all complex queries
- Batch inserts (COPY, bulk_insert_mappings)
- Connection pooling (PgBouncer, RDS Proxy)
- Read replicas for read-heavy workloads

## Migration Patterns

```python
# Always reversible
migration.add_column('users', 'email', String(255))
# ↓ equivalent down
migration.remove_column('users', 'email')
```

- Test migrations on production-size dataset
- Zero-downtime: add nullable columns first, backfill, then add constraints
