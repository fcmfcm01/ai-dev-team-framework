#!/bin/bash
# AI Dev Team Framework — Structure Validation Script
# Validates SKILL.md and AGENT.md files meet format standards

set -e

FRAMEWORK_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
ERRORS=0
WARNINGS=0

echo "=== AI Dev Team Framework — Structure Validation ==="
echo "Framework root: $FRAMEWORK_ROOT"
echo ""

# Helper functions
error() {
    echo "ERROR: $1"
    ERRORS=$((ERRORS + 1))
}

warn() {
    echo "WARN: $1"
    WARNINGS=$((WARNINGS + 1))
}

ok() {
    echo "  OK: $1"
}

# Check: SKILL.md files have YAML frontmatter
echo "--- Checking SKILL.md frontmatter ---"
SKILL_COUNT=0
for file in $(find "$FRAMEWORK_ROOT/skills" -name "SKILL.md" 2>/dev/null); do
    SKILL_COUNT=$((SKILL_COUNT + 1))
    first_line=$(head -1 "$file")
    if [[ "$first_line" != "---" ]]; then
        error "$file: SKILL.md must start with YAML frontmatter (---)"
    else
        # Check for name and description in frontmatter
        if ! grep -q "^name:" "$file"; then
            error "$file: SKILL.md frontmatter must have 'name:' field"
        fi
        if ! grep -q "^description:" "$file"; then
            error "$file: SKILL.md frontmatter must have 'description:' field"
        fi
        ok "$(echo "$file" | sed "s|$FRAMEWORK_ROOT/||")"
    fi

    # Check for placeholder text
    if grep -qE "(TODO|FIXME|PLACEHOLDER|TBD)" "$file"; then
        warn "$file: contains TODO/FIXME/PLACEHOLDER/TBD"
    fi

    # Check for minimum content (100 chars)
    char_count=$(wc -c < "$file")
    if [[ $char_count -lt 100 ]]; then
        warn "$file: file is very short ($char_count chars), may be incomplete"
    fi
done
echo "  Total SKILL.md files checked: $SKILL_COUNT"
echo ""

# Check: AGENT.md files have YAML frontmatter
echo "--- Checking AGENT.md frontmatter ---"
AGENT_COUNT=0
for file in $(find "$FRAMEWORK_ROOT/agents" -name "AGENT.md" 2>/dev/null); do
    AGENT_COUNT=$((AGENT_COUNT + 1))
    first_line=$(head -1 "$file")
    if [[ "$first_line" != "---" ]]; then
        error "$file: AGENT.md must start with YAML frontmatter (---)"
    else
        if ! grep -q "^name:" "$file"; then
            error "$file: AGENT.md frontmatter must have 'name:' field"
        fi
        if ! grep -q "^role:" "$file"; then
            error "$file: AGENT.md frontmatter must have 'role:' field"
        fi
        ok "$(echo "$file" | sed "s|$FRAMEWORK_ROOT/||")"
    fi

    if grep -qE "(TODO|FIXME|PLACEHOLDER|TBD)" "$file"; then
        warn "$file: contains TODO/FIXME/PLACEHOLDER/TBD"
    fi

    char_count=$(wc -c < "$file")
    if [[ $char_count -lt 100 ]]; then
        warn "$file: file is very short ($char_count chars), may be incomplete"
    fi
done
echo "  Total AGENT.md files checked: $AGENT_COUNT"
echo ""

# Check: Required directories exist
echo "--- Checking required directories ---"
REQUIRED_DIRS=(
    "skills/core"
    "agents/engineering"
    "agents/design"
    ".claude"
    ".opencode"
    ".copilot"
    "specs/templates"
    "scripts"
)

for dir in "${REQUIRED_DIRS[@]}"; do
    if [[ -d "$FRAMEWORK_ROOT/$dir" ]]; then
        ok "$dir/"
    else
        error "Missing required directory: $dir/"
    fi
done
echo ""

# Check: Root documentation files
echo "--- Checking root files ---"
ROOT_FILES=(
    "README.md"
    "AGENTS.md"
    "CLAUDE.md"
)

for file in "${ROOT_FILES[@]}"; do
    if [[ -f "$FRAMEWORK_ROOT/$file" ]]; then
        ok "$file"
    else
        error "Missing root file: $file"
    fi
done
echo ""

# Check: Platform SKILL.md files
echo "--- Checking platform plugins ---"
for platform in claude opencode copilot; do
    plugin_file="$FRAMEWORK_ROOT/.$platform/SKILL.md"
    if [[ -f "$plugin_file" ]]; then
        ok ".$platform/SKILL.md"
    else
        warn "Missing plugin: .$platform/SKILL.md"
    fi
done
echo ""

# Summary
echo "=== Summary ==="
echo "Errors:   $ERRORS"
echo "Warnings: $WARNINGS"
echo ""

if [[ $ERRORS -gt 0 ]]; then
    echo "RESULT: FAILED — $ERRORS error(s) found"
    exit 1
elif [[ $WARNINGS -gt 0 ]]; then
    echo "RESULT: PASSED WITH WARNINGS — $WARNINGS warning(s)"
    exit 0
else
    echo "RESULT: PASSED — All checks successful"
    exit 0
fi
