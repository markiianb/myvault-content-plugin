#!/bin/bash
# Update MyVault Content Plugin
# Pulls latest from git and copies to Claude Code cache

set -e

PLUGIN_DIR="$(cd "$(dirname "$0")" && pwd)"
CACHE_DIR="$HOME/.claude/plugins/cache/myvault-marketplace/myvault-content/1.0.0"

echo "=== MyVault Content Plugin Update ==="
echo ""

# Check if we're in a git repo
if [ ! -d "$PLUGIN_DIR/.git" ]; then
    echo "Error: Not a git repository. Clone the repo first."
    exit 1
fi

# Pull latest changes
echo "Pulling latest from GitHub..."
git -C "$PLUGIN_DIR" pull

# Check if cache directory exists
if [ ! -d "$CACHE_DIR" ]; then
    echo "Error: Plugin not installed. Run install-plugin.sh first."
    exit 1
fi

# Copy files to cache
echo "Copying to Claude Code cache..."
cp -r "$PLUGIN_DIR"/agents "$CACHE_DIR"/
cp -r "$PLUGIN_DIR"/commands "$CACHE_DIR"/
cp -r "$PLUGIN_DIR"/skills "$CACHE_DIR"/
cp -r "$PLUGIN_DIR"/.claude-plugin "$CACHE_DIR"/
cp "$PLUGIN_DIR"/README.md "$CACHE_DIR"/
cp "$PLUGIN_DIR"/CLAUDE.md "$CACHE_DIR"/

echo ""
echo "Update complete!"
echo "Restart Claude Code to apply changes."
