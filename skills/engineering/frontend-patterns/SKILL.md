---
name: frontend-patterns
description: Use when building React, Vue, or other frontend components — covers component design, state management, performance, and accessibility
---

# Frontend Patterns

Patterns for building production-grade frontend applications.

## Component Design

### Single Responsibility
Each component does one thing. If a component needs "and" in its name, split it.

```
✓ UserCard, UserAvatar, UserBadge
✗ UserProfileWithAvatarAndBadge
```

### Container vs Presentational
Separate data-fetching from rendering:

```
✓ Container: fetches data, manages state
✓ Presentational: receives props, renders UI
```

### Compound Components
For related UI elements that share state:

```jsx
<Select>
  <Select.Trigger />
  <Select.Options>
    <Select.Option value="a">Option A</Select.Option>
  </Select.Options>
</Select>
```

## State Management

| Scenario | Approach |
|----------|----------|
| Local UI state (open/close) | useState |
| Shared state (user session) | React Context / Zustand |
| Server data (API calls) | React Query / SWR / TanStack Query |
| URL state (filters, pagination) | useSearchParams |
| Form state | React Hook Form / Zod |

## Performance

- **Memo only when profiling shows it matters** — unnecessary memoization adds overhead
- **Virtualize long lists** — react-window / react-virtual
- **Lazy load routes** — React.lazy + Suspense
- **Image optimization** — next/image, srcset, WebP/AVIF
- **Bundle analysis** — @next/bundle-analyzer

## Accessibility

- Semantic HTML (button, nav, main, article)
- ARIA labels for interactive elements
- Keyboard navigation (Tab, Enter, Escape)
- Color contrast ≥ 4.5:1
- Focus management in modals/dialogs

## Testing

- Unit: Jest + React Testing Library
- Component: snapshot tests for stable UIs
- E2E: Playwright / Cypress for critical paths
- Accessibility: jest-axe

## File Structure

```
src/
  components/
    ui/           # Primitives (Button, Input, Modal)
    features/     # Feature-specific (UserCard, ProductGrid)
    layouts/      # Layout components (Sidebar, Header)
  hooks/          # Custom hooks
  contexts/       # React contexts
  utils/          # Pure utility functions
```
