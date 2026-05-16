# mattpocock/skills — Upstream Integration Manifest

**Upstream:** https://github.com/mattpocock/skills
**Upstream commit:** `e74f006` (2026-05-13)
**Sync policy:** Manual — clone to update; do not auto-merge

---

## Skill Mapping Table

| Upstream path | Framework path | Status | Notes |
|---------------|---------------|--------|-------|
| `skills/engineering/diagnose/` | `skills/engineering/diagnose/` | ✓ Synced | 7.1k chars |
| `skills/engineering/grill-with-docs/` | `skills/engineering/grill-with-docs/` | ✓ Synced | 3.6k chars |
| `skills/engineering/improve-codebase-architecture/` | `skills/engineering/improve-codebase-architecture/` | ✓ Synced | 5.1k chars + 3 refs |
| `skills/engineering/prototype/` | `skills/engineering/prototype/` | ✓ Synced | 3.3k chars + 2 refs |
| `skills/engineering/tdd/` | `skills/engineering/tdd-deep/` | ✓ Synced (renamed) | 4.4k chars + 5 refs |
| `skills/engineering/zoom-out/` | `skills/engineering/zoom-out/` | ✓ Synced | 430 chars |
| `skills/engineering/triage/` | `skills/engineering/triage/` | ✓ Synced | Issue tracker triage workflow |
| `skills/engineering/to-issues/` | `skills/engineering/to-issues/` | ✓ Synced | Break specs into vertical slices |
| `skills/engineering/to-prd/` | `skills/engineering/to-prd/` | ✓ Synced | Synthesize conversation into PRD |
| `skills/engineering/setup-matt-pocock-skills/` | — | ⊘ Skipped | Meta skill, not needed |
| `skills/engineering/testing/` | `skills/engineering/testing/` | ⚠ Self-created | **NOT from mattpocock** — framework-original skill |

---

## How to Re-sync

```bash
# 1. Clone or pull latest from upstream
git clone https://github.com/mattpocock/skills /tmp/mattpocock-skills
# or: cd /tmp/mattpocock-skills && git pull

# 2. Check what changed
cd /tmp/mattpocock-skills
git log --oneline e74f006..HEAD

# 3. Copy updated skill to framework
cp -r /tmp/mattpocock-skills/skills/engineering/<skill-name>/ \
      $(dirname $0)/../../skills/engineering/<skill-name>/

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
