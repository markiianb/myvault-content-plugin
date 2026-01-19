#!/bin/bash
# Update MyVault Content Plugin
# Pulls latest changes from GitHub

set -e

MARKETPLACE_NAME="myvault-marketplace"

echo "=== MyVault Content Plugin Update ==="
echo ""

# Check if Claude CLI is available
if ! command -v claude &> /dev/null; then
    echo "Error: Claude Code CLI not found."
    echo "Make sure Claude Code is installed and in your PATH."
    exit 1
fi

# Update the marketplace (pulls from GitHub)
echo "Updating marketplace from GitHub..."
claude marketplace update "$MARKETPLACE_NAME"

if [ $? -ne 0 ]; then
    echo ""
    echo "Error: Failed to update marketplace."
    echo ""
    echo "Manual update:"
    echo "Run: claude marketplace update $MARKETPLACE_NAME"
    exit 1
fi

echo ""
echo "Update complete!"
echo ""
echo "Restart Claude Code to use the updated plugin."
