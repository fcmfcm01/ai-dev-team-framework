#!/usr/bin/env bash
# AI Dev Team Framework — Structure Validation Script
# Validates all SKILL.md and AGENT.md files, plus required directories

set -e

FRAMEWORK_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
ERRORS=0
WARNINGS=0

ok() { echo "  OK: $1"; }
error() { echo "  ERROR: $1" 1>&2; ((ERRORS++)); }
warn() { echo "  WARNING: $1"; ((WARNINGS++)); }

echo "=== AI Dev Team Framework — Structure Validation ==="
echo "Framework root: $FRAMEWORK_ROOT"
echo ""

# --- Check SKILL.md files ---
echo "--- Checking SKILL.md frontmatter ---"
SKILL_ERRORS=0
for skill in "$FRAMEWORK_ROOT"/skills/**/SKILL.md; do
    if [[ ! -f "$skill" ]]; then continue; fi

    # Must have YAML frontmatter (lines 1-3 contain ---)
    if ! head -3 "$skill" | grep -q "^---"; then
        error "Missing frontmatter: $skill"
        ((SKILL_ERRORS++))
        continue
    fi

    # Extract frontmatter (between first --- and second ---)
    frontmatter=$(sed -n '/^---/{
        :a; N; /\n---/!ba; p; q
    }' "$skill")

    # Required fields: name, description
    if ! echo "$frontmatter" | grep -q "^name:"; then
        error "Missing 'name:' in $skill"
        ((SKILL_ERRORS++))
        continue
    fi
    if ! echo "$frontmatter" | grep -q "^description:"; then
        error "Missing 'description:' in $skill"
        ((SKILL_ERRORS++))
        continue
    fi

    ok "${skill#$FRAMEWORK_ROOT/}"
done

# Also check platform skill files
for skill in "$FRAMEWORK_ROOT"/platforms/*/skills/**/SKILL.md; do
    if [[ ! -f "$skill" ]]; then continue; fi
    if ! head -3 "$skill" | grep -q "^---"; then
        error "Missing frontmatter: $skill"
        ((SKILL_ERRORS++))
        continue
    fi
    frontmatter=$(sed -n '/^---/{
        :a; N; /\n---/!ba; p; q
    }' "$skill")
    if ! echo "$frontmatter" | grep -q "^name:"; then
        error "Missing 'name:' in $skill"
        ((SKILL_ERRORS++))
        continue
    fi
    ok "${skill#$FRAMEWORK_ROOT/}"
done

if [[ $SKILL_ERRORS -gt 0 ]]; then
    echo ""
    echo "SKILL.md errors: $SKILL_ERRORS"
fi
echo "Total SKILL.md files checked: $(find "$FRAMEWORK_ROOT"/skills -name SKILL.md 2>/dev/null | wc -l)"
echo ""

# --- Check AGENT.md files ---
echo "--- Checking AGENT.md frontmatter ---"
for agent in "$FRAMEWORK_ROOT"/agents/**/AGENT.md; do
    if [[ ! -f "$agent" ]]; then continue; fi

    if ! head -3 "$agent" | grep -q "^---"; then
        error "Missing frontmatter: $agent"
        continue
    fi

    frontmatter=$(sed -n '/^---/{
        :a; N; /\n---/!ba; p; q
    }' "$agent")

    if ! echo "$frontmatter" | grep -q "^role:"; then
        error "Missing 'role:' in $agent"
        continue
    fi

    ok "${agent#$FRAMEWORK_ROOT/}"
done
echo "Total AGENT.md files checked: $(find "$FRAMEWORK_ROOT"/agents -name AGENT.md 2>/dev/null | wc -l)"
echo ""

# --- Check required directories ---
echo "--- Checking required directories ---"
REQUIRED_DIRS=(
    "skills/core"
    "agents/engineering"
    "agents/design"
    "platforms/claude-code"
    "platforms/opencode"
    "platforms/copilot"
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

# --- Check root files ---
echo "--- Checking root files ---"
for file in README.md AGENTS.md CLAUDE.md; do
    if [[ -f "$FRAMEWORK_ROOT/$file" ]]; then
        ok "$file"
    else
        error "Missing root file: $file"
    fi
done
echo ""

# --- Check platform plugins (each platform must have its install script) ---
echo "--- Checking platform plugins ---"
for platform in claude-code opencode copilot; do
    plugin_dir="$FRAMEWORK_ROOT/platforms/$platform"
    install_script="$plugin_dir/install.sh"
    if [[ -d "$plugin_dir" ]]; then
        ok "platforms/$platform/"
        if [[ -f "$install_script" ]]; then
            ok "platforms/$platform/install.sh"
        else
            warn "Missing install.sh: platforms/$platform/install.sh"
        fi
    else
        warn "Missing platform: platforms/$platform/"
    fi
done
echo ""

# --- Summary ---
echo "=== Summary ==="
echo "Errors:   $ERRORS"
echo "Warnings: $WARNINGS"
echo ""

if [[ $ERRORS -gt 0 ]]; then
    echo "RESULT: FAILED — $ERRORS errors found"
    exit 1
elif [[ $WARNINGS -gt 0 ]]; then
    echo "RESULT: PASSED — $WARNINGS warnings (no errors)"
    exit 0
else
    echo "RESULT: PASSED — All checks successful"
    exit 0
fi