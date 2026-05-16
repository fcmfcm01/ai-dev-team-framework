# mattpocock/skills — Upstream Integration Manifest

**Upstream:** https://github.com/mattpocock/skills
**Upstream commit:** `e74f006` (2026-05-13)
**Cloned to:** `/home/cafeng/projects/ai/references/skills-mattpocock/`
**Sync policy:** Manual — re-clone to update; do not auto-merge

---

## Skill Mapping Table

| Upstream path | Local path | Status | Notes |
|---------------|-----------|--------|-------|
| `skills/engineering/diagnose/` | `skills/engineering/diagnose/` | ✓ Synced | 7.1k chars |
| `skills/engineering/grill-with-docs/` | `skills/engineering/grill-with-docs/` | ✓ Synced | 3.6k chars |
| `skills/engineering/improve-codebase-architecture/` | `skills/engineering/improve-codebase-architecture/` | ✓ Synced | 5.1k chars + 3 refs |
| `skills/engineering/prototype/` | `skills/engineering/prototype/` | ✓ Synced | 3.3k chars + 2 refs |
| `skills/engineering/tdd/` | `skills/engineering/tdd-deep/` | ✓ Synced (renamed) | 4.4k chars + 5 refs |
| `skills/engineering/zoom-out/` | `skills/engineering/zoom-out/` | ✓ Synced | 430 chars |
| `skills/engineering/triage/` | — | ✗ Missing | Not yet imported |
| `skills/engineering/to-issues/` | — | ✗ Missing | Not yet imported |
| `skills/engineering/to-prd/` | — | ✗ Missing | Not yet imported |
| `skills/engineering/setup-matt-pocock-skills/` | — | ⊘ Skipped | Meta skill, not needed |
| `skills/engineering/testing/` | `skills/engineering/testing/` | ⚠ Self-created | **NOT from mattpocock** — this is a framework-original skill |

---

## How to Re-sync

```bash
# 1. Pull latest from upstream
cd /home/cafeng/projects/ai/references/skills-mattpocock
git checkout main && git pull

# 2. Check what changed
git log --oneline e74f006..HEAD

# 3. Re-clone specific skill (example: diagnose)
cp -r /home/cafeng/projects/ai/references/skills-mattpocock/skills/engineering/diagnose/ \
      /home/cafeng/projects/ai-dev-team-framework/skills/engineering/diagnose/

# 4. Update this manifest (upstream commit, sync date)
```

---

## Framework Integration Notes

Each mattpocock skill is bound into the AI Dev Team Framework's **Orchestrator-First** workflow:

| Skill | Orchestrator Trigger | Bound Agent |
|-------|---------------------|-------------|
| `diagnose` | User says "diagnose" / "debug" / "broken" / "failing" | qa-engineer |
| `grill-with-docs` | Before spec finalization, when decisions are unclear | orchestrator |
| `improve-codebase-architecture` | Architecture review round, large refactors | fullstack-dev |
| `prototype` | Explore unfamiliar territory, validate approach | any (delegated) |
| `tdd-deep` | Any feature development, red-green-refactor cycle | frontend-dev, backend-dev |
| `zoom-out` | When stuck on details, need broader context | any |
| `triage` | New issues arrive, need priority assessment | qa-engineer |
| `to-issues` | Requirements gathering, PRD → issues | product-manager |
| `to-prd` | Feature discussion → structured PRD | product-manager |

---

## Attribution

These skills are derived from [mattpocock/skills](https://github.com/mattpocock/skills) by Matt Pocock.
Used under MIT license.
