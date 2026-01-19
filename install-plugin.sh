#!/bin/bash
# Install MyVault Content Plugin
# First-time setup for Claude Code

set -e

PLUGIN_DIR="$(cd "$(dirname "$0")" && pwd)"
PLUGIN_NAME="myvault-content"
MARKETPLACE_NAME="myvault-marketplace"
VERSION="1.0.0"

CLAUDE_DIR="$HOME/.claude/plugins"
MARKETPLACE_DIR="$CLAUDE_DIR/marketplaces/$MARKETPLACE_NAME"
CACHE_DIR="$CLAUDE_DIR/cache/$MARKETPLACE_NAME/$PLUGIN_NAME/$VERSION"
KNOWN_MARKETPLACES="$CLAUDE_DIR/known_marketplaces.json"
INSTALLED_PLUGINS="$CLAUDE_DIR/installed_plugins.json"

echo "=== MyVault Content Plugin Installation ==="
echo ""

# Check if Claude plugins directory exists
if [ ! -d "$CLAUDE_DIR" ]; then
    echo "Error: Claude Code plugins directory not found at $CLAUDE_DIR"
    echo "Make sure Claude Code is installed."
    exit 1
fi

# Check if already installed
if [ -d "$CACHE_DIR" ]; then
    echo "Plugin already installed. Use update-plugin.sh to update."
    exit 0
fi

echo "Installing MyVault Content Plugin..."
echo ""

# Create directories
echo "Creating directories..."
mkdir -p "$MARKETPLACE_DIR"
mkdir -p "$CACHE_DIR"

# Copy to marketplace directory
echo "Copying to marketplace directory..."
cp -r "$PLUGIN_DIR"/agents "$MARKETPLACE_DIR"/
cp -r "$PLUGIN_DIR"/commands "$MARKETPLACE_DIR"/
cp -r "$PLUGIN_DIR"/skills "$MARKETPLACE_DIR"/
cp -r "$PLUGIN_DIR"/.claude-plugin "$MARKETPLACE_DIR"/
cp "$PLUGIN_DIR"/README.md "$MARKETPLACE_DIR"/
cp "$PLUGIN_DIR"/CLAUDE.md "$MARKETPLACE_DIR"/

# Copy to cache directory
echo "Copying to cache directory..."
cp -r "$PLUGIN_DIR"/agents "$CACHE_DIR"/
cp -r "$PLUGIN_DIR"/commands "$CACHE_DIR"/
cp -r "$PLUGIN_DIR"/skills "$CACHE_DIR"/
cp -r "$PLUGIN_DIR"/.claude-plugin "$CACHE_DIR"/
cp "$PLUGIN_DIR"/README.md "$CACHE_DIR"/
cp "$PLUGIN_DIR"/CLAUDE.md "$CACHE_DIR"/

# Update known_marketplaces.json
echo "Registering marketplace..."
if [ -f "$KNOWN_MARKETPLACES" ]; then
    # Check if marketplace already registered
    if grep -q "$MARKETPLACE_NAME" "$KNOWN_MARKETPLACES"; then
        echo "Marketplace already registered."
    else
        # Add marketplace entry (insert after opening brace)
        TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%S.000Z")
        MARKETPLACE_ENTRY="\"$MARKETPLACE_NAME\": { \"source\": { \"source\": \"local\", \"path\": \"$PLUGIN_DIR\" }, \"installLocation\": \"$MARKETPLACE_DIR\", \"lastUpdated\": \"$TIMESTAMP\" },"

        # Use sed to insert after first {
        if [[ "$OSTYPE" == "darwin"* ]]; then
            sed -i '' "s|^{|{\n  $MARKETPLACE_ENTRY|" "$KNOWN_MARKETPLACES"
        else
            sed -i "s|^{|{\n  $MARKETPLACE_ENTRY|" "$KNOWN_MARKETPLACES"
        fi
    fi
else
    echo "Warning: known_marketplaces.json not found. Creating new file."
    TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%S.000Z")
    cat > "$KNOWN_MARKETPLACES" << EOF
{
  "$MARKETPLACE_NAME": {
    "source": {
      "source": "local",
      "path": "$PLUGIN_DIR"
    },
    "installLocation": "$MARKETPLACE_DIR",
    "lastUpdated": "$TIMESTAMP"
  }
}
EOF
fi

# Update installed_plugins.json
echo "Registering plugin..."
if [ -f "$INSTALLED_PLUGINS" ]; then
    # Check if plugin already registered
    if grep -q "$PLUGIN_NAME@$MARKETPLACE_NAME" "$INSTALLED_PLUGINS"; then
        echo "Plugin already registered."
    else
        # Add plugin entry
        TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%S.000Z")
        PLUGIN_ENTRY="\"$PLUGIN_NAME@$MARKETPLACE_NAME\": [{ \"scope\": \"user\", \"installPath\": \"$CACHE_DIR\", \"version\": \"$VERSION\", \"installedAt\": \"$TIMESTAMP\", \"lastUpdated\": \"$TIMESTAMP\" }],"

        # Insert after "plugins": {
        if [[ "$OSTYPE" == "darwin"* ]]; then
            sed -i '' "s|\"plugins\": {|\"plugins\": {\n    $PLUGIN_ENTRY|" "$INSTALLED_PLUGINS"
        else
            sed -i "s|\"plugins\": {|\"plugins\": {\n    $PLUGIN_ENTRY|" "$INSTALLED_PLUGINS"
        fi
    fi
else
    echo "Warning: installed_plugins.json not found. Creating new file."
    TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%S.000Z")
    cat > "$INSTALLED_PLUGINS" << EOF
{
  "version": 2,
  "plugins": {
    "$PLUGIN_NAME@$MARKETPLACE_NAME": [
      {
        "scope": "user",
        "installPath": "$CACHE_DIR",
        "version": "$VERSION",
        "installedAt": "$TIMESTAMP",
        "lastUpdated": "$TIMESTAMP"
      }
    ]
  }
}
EOF
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
