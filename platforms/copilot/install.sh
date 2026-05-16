#!/bin/bash
# Install VS Code Copilot integration
# Usage: ./install.sh [target-dir]
#   target-dir: where to install (default: current directory)

TARGET="${1:-.}"

if [ ! -d "$TARGET" ]; then
  echo "Error: $TARGET is not a directory"
  exit 1
fi

DEST="$TARGET"
SRC="$(cd "$(dirname "$0")" && pwd)"

# VS Code Copilot uses .claude/skills/ for Agent Skills
CLAUDE_DIR="$DEST/.claude"
SKILLS_DIR="$CLAUDE_DIR/skills/ai-dev-team"

mkdir -p "$SKILLS_DIR"

# Copy command files (for slash commands)
mkdir -p "$CLAUDE_DIR"
cp -r "$SRC/commands/" "$CLAUDE_DIR/"

# Copy skills
cp -r "$SRC/../claude-code/skills/" "$SKILLS_DIR/"

echo "Installed to: $CLAUDE_DIR"
echo ""
echo "Commands: /orchestrator, /spec, /qa, /audit"
echo "Skills auto-discovered by VS Code Copilot from .claude/skills/"
