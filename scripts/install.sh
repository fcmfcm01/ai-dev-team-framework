#!/bin/bash
# AI Dev Team Framework — Cross-Platform Install Script

set -e

FRAMEWORK_DIR="$(cd "$(dirname "$0")/.." && pwd)"

usage() {
  cat << EOF
Usage: $0 [OPTIONS]

Install AI Dev Team Framework plugins for your AI coding tools.

OPTIONS:
  --tool <name>    Target tool: claude-code, opencode, copilot, all (default: all)
  --path <path>    Project directory to install into (default: current directory)
  --uninstall      Remove installed plugins
  -h, --help       Show this help

EXAMPLES:
  $0                           # Install all plugins to current directory
  $0 --tool claude-code        # Install Claude Code plugin only
  $0 --tool opencode --path ~/myproject  # Install OpenCode plugin to ~/myproject
  $0 --uninstall               # Remove all installed plugins from current directory

EOF
}

# Each tool installs to its own standard location.
# No tool writes to the same directory as another — no cross-contamination.

install_claude_code() {
  local target="$1"
  # Claude Code auto-discovers skills from ~/.claude/skills/
  local skills_dir="$target/.claude/skills/ai-dev-team"
  mkdir -p "$skills_dir"
  cp -r "$FRAMEWORK_DIR/platforms/claude-code/skills/"* "$skills_dir/"
  echo "✓ Claude Code skills installed to $skills_dir"
}

install_opencode() {
  local target="$1/.opencode"
  mkdir -p "$target/commands" "$target/plugins"
  cp "$FRAMEWORK_DIR/platforms/opencode/opencode.json" "$target/"
  cp -r "$FRAMEWORK_DIR/platforms/opencode/commands/" "$target/"
  cp -r "$FRAMEWORK_DIR/platforms/opencode/plugins/" "$target/"
  echo "✓ OpenCode plugin installed to $target"
}

install_copilot() {
  local target="$1"
  # VS Code Copilot uses .claude/skills/ for Agent Skills (not .copilot/)
  local claude_dir="$target/.claude"
  local skills_dir="$claude_dir/skills/ai-dev-team"
  local commands_dir="$claude_dir/commands"

  mkdir -p "$skills_dir" "$commands_dir"

  # Copy skills from claude-code platform (they're the same skills)
  cp -r "$FRAMEWORK_DIR/platforms/claude-code/skills/"* "$skills_dir/"

  # Copy slash commands (markdown files in .claude/commands/)
  cp -r "$FRAMEWORK_DIR/platforms/copilot/commands/" "$claude_dir/"

  echo "✓ VS Code Copilot installed to $claude_dir"
  echo "  Skills: $skills_dir"
  echo "  Commands: $commands_dir"
}

uninstall_all() {
  local target="$1"
  rm -rf "$target/.claude/skills/ai-dev-team" "$target/.claude/commands" "$target/.opencode" 2>/dev/null || true
  echo "✓ Uninstalled all AI Dev Team Framework plugins from $target"
}

TOOL="all"
TARGET="$(pwd)"

while [[ $# -gt 0 ]]; do
  case $1 in
    --tool)
      TOOL="$2"
      shift 2
      ;;
    --path)
      TARGET="$2"
      shift 2
      ;;
    --uninstall)
      uninstall_all "$TARGET"
      exit 0
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown option: $1"
      usage
      exit 1
      ;;
  esac
done

if [[ ! -d "$TARGET" ]]; then
  echo "Error: $TARGET is not a directory"
  exit 1
fi

echo "Installing AI Dev Team Framework to $TARGET..."
echo ""

case "$TOOL" in
  all)
    install_claude_code "$TARGET"
    install_opencode "$TARGET"
    install_copilot "$TARGET"
    ;;
  claude-code)
    install_claude_code "$TARGET"
    ;;
  opencode)
    install_opencode "$TARGET"
    ;;
  copilot)
    install_copilot "$TARGET"
    ;;
  *)
    echo "Unknown tool: $TOOL"
    echo "Available: all, claude-code, opencode, copilot"
    exit 1
    ;;
esac

echo ""
echo "Installation complete! Restart your AI coding tool to activate."
echo ""
echo "Quick start:"
echo "  Claude Code:  /acl .claude/skills/ai-dev-team"
echo "  OpenCode:     /orchestrator"
echo "  VS Code:      Use @agent commands in Copilot chat"