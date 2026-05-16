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
  $0 --uninstall               # Remove all installed plugins

EOF
}

install_claude_code() {
  local target="$1/.claude"
  mkdir -p "$target"
  cp -r "$FRAMEWORK_DIR/.claude/"* "$target/"
  echo "✓ Claude Code plugin installed to $target"
}

install_opencode() {
  local target="$1/.opencode"
  mkdir -p "$target"
  cp -r "$FRAMEWORK_DIR/.opencode/"* "$target/"
  echo "✓ OpenCode plugin installed to $target"
}

install_copilot() {
  local target="$1/.copilot"
  mkdir -p "$target"
  cp -r "$FRAMEWORK_DIR/.copilot/"* "$target/"
  echo "✓ VS Code Copilot plugin installed to $target"
}

uninstall_all() {
  local target="$1"
  rm -rf "$target/.claude/ai-dev-team" "$target/.opencode/ai-dev-team" "$target/.copilot/ai-dev-team" 2>/dev/null || true
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
echo "Installation complete!"
echo "Restart your AI coding tool to activate the framework."
echo ""
echo "Quick start:"
echo "  Claude Code: /team orchestrator"
echo "  OpenCode:    /team activate orchestrator"
echo "  Copilot:     @team orchestrator"
