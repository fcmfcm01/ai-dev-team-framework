#!/bin/bash
# Install OpenCode integration
# Usage: ./install.sh [target-dir]
#   target-dir: where to install (default: current directory)

TARGET="${1:-.}"

if [ ! -d "$TARGET" ]; then
  echo "Error: $TARGET is not a directory"
  exit 1
fi

DEST="$TARGET"
SRC="$(cd "$(dirname "$0")" && pwd)"

# OpenCode uses ~/.config/opencode/ for global or .opencode/ for project-level
OPENCODE_DIR="$DEST/.opencode"

mkdir -p "$OPENCODE_DIR/commands"
mkdir -p "$OPENCODE_DIR/plugins"

# Copy opencode.json (plugin + settings, no command definitions)
cp "$SRC/opencode.json" "$OPENCODE_DIR/"

# Copy commands
cp -r "$SRC/commands/" "$OPENCODE_DIR/"

# Copy plugin
cp -r "$SRC/plugins/" "$OPENCODE_DIR/"

echo "Installed to: $OPENCODE_DIR"
echo ""
echo "Commands: /orchestrator, /spec, /plan, /build, /qa, /audit, /agent"
