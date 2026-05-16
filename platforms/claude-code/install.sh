#!/bin/bash
# Install Claude Code integration
# Usage: ./install.sh [target-dir]
#   target-dir: where to install (default: current directory)

TARGET="${1:-.}"

if [ ! -d "$TARGET" ]; then
  echo "Error: $TARGET is not a directory"
  exit 1
fi

DEST="$TARGET"
SRC="$(cd "$(dirname "$0")" && pwd)"

mkdir -p "$DEST"

# Skills go to ~/.claude/skills/ (user-level) or PROJECT/.claude/skills/ (project-level)
CLAUDE_DIR="$DEST/.claude"
SKILLS_DIR="$CLAUDE_DIR/skills/ai-dev-team"

mkdir -p "$SKILLS_DIR"

# Copy skills
cp -r "$SRC/skills/"* "$SKILLS_DIR/"

echo "Installed to: $SKILLS_DIR"
echo ""
echo "To use in Claude Code, reference the skills:"
echo "  /acl .claude/skills/ai-dev-team"
