#!/bin/bash
# Install MyVault Content Plugin from Private GitHub Repo
# Registers the marketplace with Claude Code to enable auto-updates

set -e

GITHUB_REPO="markiianb/myvault-content-plugin"
MARKETPLACE_NAME="myvault-marketplace"
PLUGIN_NAME="myvault-content"

echo "=== MyVault Content Plugin Installation ==="
echo ""
echo "This will register the MyVault marketplace with Claude Code."
echo "Repository: https://github.com/$GITHUB_REPO (private)"
echo ""
echo "Prerequisites:"
echo "  - You must be a collaborator on the repo"
echo "  - GitHub credentials must be configured (SSH keys or HTTPS token)"
echo ""

# Check if Claude CLI is available
if ! command -v claude &> /dev/null; then
    echo "Error: Claude Code CLI not found."
    echo "Make sure Claude Code is installed and in your PATH."
    exit 1
fi

# Test GitHub access
echo "Testing GitHub access..."
if ! git ls-remote "https://github.com/$GITHUB_REPO.git" HEAD &> /dev/null; then
    echo ""
    echo "Error: Cannot access the GitHub repository."
    echo ""
    echo "Make sure:"
    echo "  1. You're added as a collaborator: https://github.com/$GITHUB_REPO/settings/access"
    echo "  2. GitHub authentication is configured:"
    echo "     - SSH: ssh -T git@github.com"
    echo "     - HTTPS: gh auth login"
    exit 1
fi

echo "✓ GitHub access confirmed"
echo ""

# Add the marketplace using Claude's built-in command
echo "Adding marketplace..."
claude marketplace add github "$GITHUB_REPO"

if [ $? -ne 0 ]; then
    echo ""
    echo "Error: Failed to add marketplace."
    echo ""
    echo "Manual installation:"
    echo "  1. Run: claude marketplace add github $GITHUB_REPO"
    echo "  2. Or manually: git clone https://github.com/$GITHUB_REPO.git ~/.claude/plugins/marketplaces/$MARKETPLACE_NAME"
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
    echo "  Run: claude plugin install $PLUGIN_NAME@$MARKETPLACE_NAME"
    exit 1
fi

# Enable the plugin
echo ""
echo "Enabling plugin..."
claude plugin enable "$PLUGIN_NAME@$MARKETPLACE_NAME"

echo ""
echo "✓ Installation complete!"
echo ""
echo "Available commands:"
echo "  /myvault:research [topic]        - Research facts and statistics"
echo "  /myvault:content-research [topic] - Research content landscape"
echo "  /myvault:write [type] about [topic] - Create on-brand content"
echo "  /myvault:edit [content]          - Review for brand compliance"
echo ""
echo "Restart Claude Code to activate the plugin."
echo ""
echo "To update later, run:"
echo "  claude marketplace update $MARKETPLACE_NAME"
