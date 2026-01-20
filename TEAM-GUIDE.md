# MyVault Content Plugin - Team Guide

A Claude Code plugin that helps you create on-brand MyVault content.

---

## What It Does

This plugin gives you 4 commands in Claude Code to help with content creation:

1. **Research topics** with cited sources
2. **Research content landscape** and find gaps
3. **Write content** following MyVault brand voice
4. **Edit content** for brand compliance

All content follows MyVault's brand guidelines automatically.

---

## Installation (One-Time Setup)

### Prerequisites
- Be added as a collaborator on the GitHub repo (ask Mark)
- GitHub authentication set up on your machine

**Test GitHub auth:**
```bash
ssh -T git@github.com
```
Should say: "Hi yourname! You've successfully authenticated"

**If this fails, set up SSH keys:**
```bash
# Generate key
ssh-keygen -t ed25519 -C "your.email@example.com"

# Copy the key
cat ~/.ssh/id_ed25519.pub

# Add to GitHub: Settings → SSH and GPG keys → New SSH key
```

### Install the Plugin

In Claude Code, type these two commands:

```
/plugin marketplace add https://github.com/markiianb/myvault-content-plugin
/plugin install myvault-content@myvault-marketplace
```

Restart Claude Code.

---

## How to Use

Open Claude Code in any directory and use these commands:

### Research a Topic
```
/myvault:research subscription fatigue statistics
```
Gets facts, statistics, and cited sources.

### Research Content Landscape
```
/myvault:content-research password management
```
Analyzes what content exists, finds gaps, suggests angles.

### Write Content
```
/myvault:write blog post about digital chaos for families
/myvault:write newsletter about photo privacy for professionals
/myvault:write social media post about password security
```
Creates content in MyVault's brand voice.

### Edit Content
```
/myvault:edit [paste your draft here]
```
Reviews for brand compliance and suggests improvements.

---

## Brand Voice Rules (Applied Automatically)

The plugin enforces these automatically:

✅ **Confident, not fearful** - "Your photos stay private" not "Protect yourself from hackers"
✅ **MyVault is a tool** - "MyVault found duplicates" not "I found duplicates"
✅ **Warm and clear** - Simple language, no jargon
✅ **Cited sources** - All statistics have attribution

---

## Getting Updates

When the plugin is updated, run in Claude Code:

```
/plugin marketplace update myvault-marketplace
```

Then restart Claude Code.

---

## Need Help?

- **Installation issues?** See [INSTALL.md](INSTALL.md) for detailed troubleshooting
- **Questions about usage?** Ask in team chat
- **Found a bug?** Report to Mark

---

That's it! Start creating on-brand content. 🚀
