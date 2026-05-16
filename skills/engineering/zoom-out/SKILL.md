---
name: zoom-out
description: Tell the agent to zoom out and give broader context or a higher-level perspective. Use when you're unfamiliar with a section of code or need to understand how it fits into the bigger picture.
disable-model-invocation: true
---

I don't know this area of code well. Go up a layer of abstraction. Give me a map of all the relevant modules and callers, using the project's domain glossary vocabulary.

---

## Orchestrator Binding

**Source:** [mattpocock/skills](https://github.com/mattpocock/skills) — `skills/engineering/zoom-out/`

**Framework integration:**

| Context | Action |
|---------|--------|
| Agent is stuck on details | Activate `zoom-out` to get broader context |
| Entering unfamiliar code area | Activate `zoom-out` first |
| Planning a large feature | Activate `zoom-out` to understand the full scope |
| Code review: too much local detail | Activate `zoom-out` to check overall structure |

**Orchestrator protocol:**

1. When any agent (frontend-dev, backend-dev, fullstack-dev) enters unfamiliar code → activate `zoom-out` first
2. When stuck in details → activate `zoom-out` to get a module map
3. Use project domain glossary vocabulary (`CONTEXT.md`)
4. After zoom-out → decisions should be informed by the broader map
