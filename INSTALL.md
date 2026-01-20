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

**⚠️ This is a PRIVATE repository. You need access before you can install.**

### 1. Get Added as a Collaborator

Contact the repository owner to be added as a collaborator:
- Repository: https://github.com/markiianb/myvault-content-plugin
- You'll receive an email invitation from GitHub
- Accept the invitation

### 2. Set Up GitHub Authentication

You need GitHub credentials configured on your machine. Choose ONE method:

**Option A: SSH Keys (Recommended)**

```bash
# Generate SSH key (if you don't have one)
ssh-keygen -t ed25519 -C "your.email@example.com"

# Copy your public key
cat ~/.ssh/id_ed25519.pub

# Add to GitHub: Settings → SSH and GPG keys → New SSH key
# Paste the key and save

# Test it works
ssh -T git@github.com
# Should say: "Hi username! You've successfully authenticated..."
```

**Option B: GitHub CLI**

```bash
# Install GitHub CLI (if needed)
brew install gh

# Login
gh auth login

# Test it works
gh auth status
```

### 3. Verify Access

Test that you can access the private repo:

```bash
git ls-remote https://github.com/markiianb/myvault-content-plugin.git
```

If this works, you're ready to install!

### 4. Claude Code

Claude Code must be installed and working:
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

### "Authentication failed" or "Repository not found"

**This means you don't have access or credentials aren't configured.**

1. Verify you're a collaborator:
   - Go to: https://github.com/markiianb/myvault-content-plugin
   - If you see "404 Not Found", you're not added yet
   - Contact the repository owner to be added

2. Test GitHub authentication:
   ```bash
   ssh -T git@github.com
   ```
   Should say: "Hi username! You've successfully authenticated"

   If it fails, set up SSH keys (see Prerequisites section above)

3. Test private repo access:
   ```bash
   git ls-remote https://github.com/markiianb/myvault-content-plugin.git
   ```
   If this fails, your credentials aren't working

### "Marketplace not found"
- Typo in the URL? Use: `https://github.com/markiianb/myvault-content-plugin`
- Try the full URL including `https://`

### "Plugin not found in marketplace"
- The marketplace was added but plugin wasn't found
- Wait a few seconds and try again (Git clone might still be running)
- Check: `ls ~/.claude/plugins/marketplaces/myvault-marketplace/`

### "Claude Code won't start"
- Check debug log: `cat ~/.claude/debug/latest`
- Look for marketplace configuration errors
- If corrupted, remove from: `~/.claude/plugins/known_marketplaces.json`

### Commands not working
- Run `/plugin list` to verify it's installed and enabled
- If disabled, run: `/plugin enable myvault-content@myvault-marketplace`
- Restart Claude Code

### Still having issues?
- Check if the repo is actually private: https://github.com/markiianb/myvault-content-plugin/settings
- Verify your GitHub email matches your work email
- Try using GitHub CLI: `gh auth login` then retry installation

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
