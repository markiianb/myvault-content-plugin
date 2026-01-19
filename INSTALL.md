# MyVault Content Plugin - Installation

## Quick Start

**Inside Claude Code, run these 2 commands:**

```
/plugin marketplace add https://github.com/markiianb/myvault-content-plugin
/plugin install myvault-content@myvault-marketplace
```

**Then restart Claude Code.**

---

## Prerequisites

Before installation:

1. **GitHub Access**: You must be a collaborator on the private repo
   - Test: `ssh -T git@github.com`
   - Or: `gh auth login` (if using GitHub CLI)

2. **Claude Code**: Must be installed and working
   - Test: Open Claude Code in any directory

---

## Installation Commands (Copy/Paste)

Open Claude Code and run:

### Step 1: Add Marketplace
```
/plugin marketplace add https://github.com/markiianb/myvault-content-plugin
```

You should see: "Successfully added marketplace: myvault-marketplace"

### Step 2: Install Plugin
```
/plugin install myvault-content@myvault-marketplace
```

You should see: "Successfully installed plugin: myvault-content"

### Step 3: Restart
Close and reopen Claude Code.

---

## Verify Installation

After restarting, in Claude Code run:

```
/plugin list
```

You should see `myvault-content@myvault-marketplace` with status `✔ enabled`.

---

## Available Commands

After installation:

- `/myvault:research [topic]` - Research with cited sources
- `/myvault:content-research [topic]` - Research content landscape
- `/myvault:write [type] about [topic]` - Create on-brand content
- `/myvault:edit [content]` - Review for brand compliance

---

## Updating

When updates are pushed to GitHub, run inside Claude Code:

```
/plugin marketplace update myvault-marketplace
```

Then restart Claude Code.

---

## Troubleshooting

### "Marketplace not found"
- Check you're added as a collaborator: https://github.com/markiianb/myvault-content-plugin/settings/access
- Test GitHub access: `ssh -T git@github.com`

### "Plugin not found in marketplace"
- The marketplace was added but plugin wasn't found
- Check the repo has `.claude-plugin/marketplace.json` in the root

### "Claude Code won't start"
- Check debug log: `cat ~/.claude/debug/latest`
- Look for marketplace configuration errors
- If corrupted, remove from: `~/.claude/plugins/known_marketplaces.json`

### Commands not working
- Run `/plugin list` to verify it's installed and enabled
- If disabled, run: `/plugin enable myvault-content@myvault-marketplace`
- Restart Claude Code

---

## For Maintainers

After making changes:

```bash
cd /path/to/myvault-content-plugin
git add .
git commit -m "Update: [description]

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>"
git push
```

Notify team: "Plugin updated! Run: `/plugin marketplace update myvault-marketplace`"
