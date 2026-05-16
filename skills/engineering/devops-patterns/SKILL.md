---
name: devops-patterns
description: Use when setting up CI/CD, containerization, or infrastructure automation
---

# DevOps Patterns

## Docker

### Multi-Stage Build
```dockerfile
FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci --production
COPY . .
RUN npm run build

FROM node:20-alpine AS runner
WORKDIR /app
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules
CMD ["node", "dist/index.js"]
```

### Security
- Run as non-root user
- Use specific version tags (not `latest`)
- Scan images (Trivy, Snyk)
- Minimal base images (alpine, distroless)

## CI/CD

### Pipeline Stages
```
Lint → Test → Build → Security Scan → Deploy to Staging → E2E → Deploy to Prod
```

### GitHub Actions
```yaml
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: '20'
          cache: 'npm'
      - run: npm ci
      - run: npm test
```

## Kubernetes

- Use Helm charts for complex deployments
- Liveness/readiness probes
- HorizontalPodAutoscaler for scaling
- PodDisruptionBudget for availability
- Resource requests and limits
