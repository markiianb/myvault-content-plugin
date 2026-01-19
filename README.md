# MyVault Content Plugin

A Claude Code plugin for producing on-brand MyVault content. Provides skills (knowledge), agents (task execution), and commands (shortcuts) for content research, writing, and editing.

---

## Installation (Team Members)

**Prerequisites:** You must be a collaborator on the private GitHub repo.

### Quick Install (One Command)

```bash
curl -fsSL https://raw.githubusercontent.com/markiianb/myvault-content-plugin/main/install-plugin.sh | bash
```

Then restart Claude Code.

### Manual Install

```bash
# Download and run install script
curl -O https://raw.githubusercontent.com/markiianb/myvault-content-plugin/main/install-plugin.sh
chmod +x install-plugin.sh
./install-plugin.sh

# Restart Claude Code
```

**What it does:** Registers the GitHub marketplace with Claude Code and installs the plugin automatically.

---

## Updating the Plugin

When updates are pushed:

```bash
claude marketplace update myvault-marketplace
```

Then restart Claude Code.

**Auto-updates:** Claude Code will automatically check for updates when you restart (if auto-update is enabled).

---

## Quick Start

```bash
/myvault:research subscription fatigue
/myvault:write blog post about digital chaos for families
/myvault:edit [paste content]
```

---

## Commands

| Command | Purpose | Example |
|---------|---------|---------|
| `/myvault:research` | Research a topic with cited sources | `/myvault:research photo organization statistics` |
| `/myvault:content-research` | Research content landscape and gaps | `/myvault:content-research subscription management` |
| `/myvault:write` | Create content following brand voice | `/myvault:write newsletter about privacy for professionals` |
| `/myvault:edit` | Review and edit for style compliance | `/myvault:edit [content]` |

---

## Structure

```
myvault-content-plugin/
├── commands/                # Workflow shortcuts
│   ├── research.md          # /myvault:research
│   ├── content-research.md  # /myvault:content-research
│   ├── write.md             # /myvault:write
│   └── edit.md              # /myvault:edit
├── agents/                  # Task executors
│   ├── research/
│   │   ├── topic-researcher.md
│   │   └── content-researcher.md
│   └── written/
│       ├── writer.md
│       └── style-editor.md
└── skills/                  # Knowledge repositories
    ├── brand-voice/SKILL.md
    ├── style-guide/SKILL.md
    ├── audience-personas/SKILL.md
    └── product-knowledge/SKILL.md
```

---

## Skills (Knowledge)

Skills are loaded by agents to provide context. You can also load them directly.

| Skill | What It Contains |
|-------|------------------|
| **brand-voice** | Voice adjectives, design pillars, content pillars, product voice rules |
| **style-guide** | Grammar, punctuation, mechanics, AI communication patterns |
| **audience-personas** | Three personas (Families, Professionals, HNW) with pain points and messaging |
| **product-knowledge** | What MyVault does, three agents, features, V1 scope, safe claims |

---

## Agents

Agents execute tasks using the knowledge from skills.

| Agent | Purpose |
|-------|---------|
| **topic-researcher** | Gathers statistics, trends, data with source quality evaluation |
| **content-researcher** | Maps content landscape, finds gaps, analyzes competitor positioning |
| **writer** | Creates content with 9 signature moves and 4-phase protocol |
| **style-editor** | Reviews content with 8-phase protocol for brand compliance |

---

## MyVault Voice (Quick Reference)

### Do
- "MyVault found 12 duplicates"
- "Your photos stay private"
- "From scattered to sorted—automatically"

### Don't
- "I found 12 duplicates for you!"
- "Protect yourself from hackers"
- "Military-grade encryption"

### Product Voice Rule
MyVault is a **tool**, not a personality. Never "I" — always "MyVault" or "Your [Agent Name]."

### Tagline
*Private by design. Intelligent by nature.*

---

## Content Workflow

### 1. Research (optional)
```
/myvault:research [topic]
```
Returns statistics, trends, and sources.

### 2. Write
```
/myvault:write [content type] about [topic] for [audience]
```
Creates draft following brand voice.

### 3. Edit
```
/myvault:edit [content]
```
Reviews for voice, product voice, AI transparency, mechanics.

---

## Source Quality Tiers (Research)

| Tier | Description | Example |
|------|-------------|---------|
| **A** | Peer-reviewed, large sample, recent | Pew Research, academic journals |
| **B** | Reputable organization, good methodology | McKinsey, Deloitte, major news |
| **C** | Industry report, smaller sample | Trade publications |
| **D** | Single source, unverified, old | Blog posts, press releases |

Use Tier A/B for key claims.

---

## Style Quick Reference

- **Headlines:** Sentence case ("Your memories, organized")
- **Numbers:** Spell out 1-9, numerals 10+
- **Oxford comma:** Always
- **MyVault:** One word, capital M and V
- **Agent names:** Title case with "the" or "your"
- **Contractions:** Use them (we're, don't, it's)
- **Exclamation points:** Avoid (max one per page)

---

## Banned Words

Never use: leverage, utilize, seamless, revolutionary, cutting-edge, robust, scalable, ecosystem, journey, magic (for AI)

---

## Design Pillars

1. **Trust-First Design** — Build trust through clarity
2. **Intelligent Simplicity** — Complex capabilities, simple experience
3. **Emotional Connection** — Recognition moments, respect for memories
4. **Privacy-Powered AI** — Privacy enables intelligence

---

## Contributing

This plugin follows the compound-engineering architecture pattern:
- Skills are knowledge repositories (static)
- Agents are task executors (use tools + skills)
- Commands are shortcuts (invoke agents)

---

*Private by design. Intelligent by nature.*
