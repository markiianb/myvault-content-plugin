#!/bin/bash
# Install MyVault Content Plugin from GitHub
# Registers the marketplace with Claude Code to enable auto-updates

set -e

GITHUB_REPO="markiianb/myvault-content-plugin"
MARKETPLACE_NAME="myvault-marketplace"
PLUGIN_NAME="myvault-content"

echo "=== MyVault Content Plugin Installation ==="
echo ""
echo "This will register the MyVault marketplace with Claude Code."
echo "Claude will clone from: https://github.com/$GITHUB_REPO"
echo ""

# Check if Claude CLI is available
if ! command -v claude &> /dev/null; then
    echo "Error: Claude Code CLI not found."
    echo "Make sure Claude Code is installed and in your PATH."
    exit 1
fi

# Add the marketplace using Claude's built-in command
echo "Adding marketplace..."
claude marketplace add github "$GITHUB_REPO"

if [ $? -ne 0 ]; then
    echo ""
    echo "Error: Failed to add marketplace."
    echo ""
    echo "Manual installation:"
    echo "Run: claude marketplace add github $GITHUB_REPO"
    exit 1
fi

echo ""
echo "Marketplace added! Now installing the plugin..."
echo ""

# Install the plugin
claude plugin install "$PLUGIN_NAME@$MARKETPLACE_NAME"

if [ $? -ne 0 ]; then
    echo ""
    echo "Error: Failed to install plugin."
    echo ""
    echo "Manual installation:"
    echo "Run: claude plugin install $PLUGIN_NAME@$MARKETPLACE_NAME"
    exit 1
fi

echo ""
echo "Installation complete!"
echo ""
echo "Available commands:"
echo "  /myvault:research [topic]        - Research facts and statistics"
echo "  /myvault:content-research [topic] - Research content landscape"
echo "  /myvault:write [type] about [topic] - Create on-brand content"
echo "  /myvault:edit [content]          - Review for brand compliance"
echo ""
echo "Restart Claude Code to activate the plugin."
echo ""
echo "To update later, run: ./update-plugin.sh"
