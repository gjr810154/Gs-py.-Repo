#!/data/data/com.termux/files/usr/bin/bash
# Install Claude Code (claude) in Termux

set -e

echo "=== Installing Claude Code in Termux ==="

# Update packages
pkg update -y && pkg upgrade -y

# Install required dependencies
pkg install -y nodejs git

# Verify Node.js version (Claude Code requires Node 18+)
NODE_VERSION=$(node --version | sed 's/v//' | cut -d. -f1)
if [ "$NODE_VERSION" -lt 18 ]; then
  echo "ERROR: Node.js 18+ required. Current: $(node --version)"
  exit 1
fi

echo "Node.js $(node --version) - OK"
echo "npm $(npm --version) - OK"

# Install Claude Code globally via npm
npm install -g @anthropic-ai/claude-code

echo ""
echo "=== Claude Code installed successfully! ==="
echo ""
echo "Next steps:"
echo "  1. Run:  claude"
echo "  2. Follow the login prompt to authenticate with your Anthropic account."
echo ""
echo "To set your API key manually:"
echo "  export ANTHROPIC_API_KEY='your-api-key-here'"
echo "  Add that line to ~/.bashrc or ~/.zshrc to persist it."
