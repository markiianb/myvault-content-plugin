# MyVault Content Plugin

A Claude Code plugin for producing on-brand MyVault content. This file explains the repository structure and how to work with the plugin.

## Repository Structure

```
myvault-content-plugin/
├── .claude-plugin/
│   ├── plugin.json           # Plugin metadata
│   └── marketplace.json      # Marketplace metadata
├── agents/                   # 4 specialized agents
│   ├── research/
│   │   ├── topic-researcher.md
│   │   └── content-researcher.md
│   └── written/
│       ├── writer.md
│       └── style-editor.md
├── commands/                 # 4 slash commands
│   ├── research.md           # /myvault:research
│   ├── content-research.md   # /myvault:content-research
│   ├── write.md              # /myvault:write
│   └── edit.md               # /myvault:edit
├── skills/                   # 4 knowledge skills
│   ├── brand-voice/SKILL.md
│   ├── style-guide/SKILL.md
│   ├── audience-personas/SKILL.md
│   └── product-knowledge/SKILL.md
├── install-plugin.sh         # First-time installation script
├── update-plugin.sh          # Update script for team members
├── README.md                 # User documentation
└── CLAUDE.md                 # This file
```

## Team Workflow

This plugin is distributed via a **private GitHub repo**. Team members must be collaborators.

### First-Time Installation

```bash
# Clone the repo (requires GitHub access)
git clone git@github.com:markiianb/myvault-content-plugin.git ~/myvault-plugin

# Run install script
cd ~/myvault-plugin
./install-plugin.sh

# Restart Claude Code
```

### Updating the Plugin

When the maintainer pushes updates:

```bash
cd ~/myvault-plugin
./update-plugin.sh

# Restart Claude Code
```

### For Maintainers: Pushing Updates

```bash
# Make changes to plugin files
cd /path/to/myvault-content-plugin

# Commit and push
git add .
git commit -m "Update: [description]"
git push

# Notify team to run ./update-plugin.sh
```

### How Installation Works

The scripts manage these Claude Code files:

| Location | Purpose |
|----------|---------|
| `~/.claude/plugins/marketplaces/myvault-marketplace/` | Marketplace registration |
| `~/.claude/plugins/cache/myvault-marketplace/myvault-content/1.0.0/` | Installed plugin files |
| `~/.claude/plugins/known_marketplaces.json` | Marketplace registry |
| `~/.claude/plugins/installed_plugins.json` | Plugin registry |

### Troubleshooting

**Plugin not loading after install:**
- Restart Claude Code completely (close terminal, reopen)
- Check that files exist in cache directory

**Permission denied on scripts:**
```bash
chmod +x install-plugin.sh update-plugin.sh
```

**Git clone fails:**
- Ensure you're added as a collaborator on the repo
- Ensure SSH keys are configured: `ssh -T git@github.com`

---

## Philosophy: Content as Product

Content should be as carefully crafted as code. This plugin enforces:

1. **Consistent Voice** — Every piece sounds like MyVault
2. **Product Voice** — MyVault is a tool, never a personality
3. **Confidence Over Fear** — Security messaging that reassures
4. **Cited Sources** — Every statistic has attribution

## Architecture Pattern

This plugin follows the compound-engineering architecture:

| Component | Purpose | Example |
|-----------|---------|---------|
| **Skills** | Knowledge repositories (static) | brand-voice, product-knowledge |
| **Agents** | Task executors (use tools + skills) | writer, style-editor |
| **Commands** | Shortcuts (invoke agents) | /myvault:write, /myvault:edit |

### How They Connect

```
Command (/myvault:write)
    ↓
Agent (writer.md)
    ↓
Loads Skills (brand-voice, style-guide, audience-personas, product-knowledge)
    ↓
Uses Tools (WebSearch, WebFetch for research)
    ↓
Produces Content
```

## Working with This Plugin

### Using Commands

```bash
# Research facts about a topic
/myvault:research subscription fatigue

# Research content landscape
/myvault:content-research subscription management

# Write content
/myvault:write blog post about digital chaos for families

# Edit content
/myvault:edit [paste content]
```

### Loading Skills Directly

Skills can be loaded independently for reference:

```bash
# Load brand voice rules
Load the brand-voice skill

# Load product knowledge
Load the product-knowledge skill
```

## Adding New Components

### Adding a New Skill

1. Create skill directory: `skills/skill-name/`
2. Add `SKILL.md` with YAML frontmatter:
   ```markdown
   ---
   name: skill-name
   description: What this skill contains
   user_invocable: true
   triggers:
     - "keyword1"
     - "keyword2"
   ---

   # Skill Title

   Content...
   ```
3. Update README.md skills table
4. Update this file's structure diagram
5. Update plugin.json component counts

### Adding a New Agent

1. Create agent file: `agents/category/agent-name.md`
2. Include YAML frontmatter with name, description, model
3. Follow the pattern:
   - Worldview Axioms
   - Canon / Anti-Canon
   - Signature Moves
   - Multi-phase Protocol
   - Output Format
4. Update README.md agents table
5. Update this file's structure diagram
6. Update plugin.json component counts

### Adding a New Command

1. Create command file: `commands/command-name.md`
2. Use `myvault:` namespace prefix
3. Include YAML frontmatter:
   ```markdown
   ---
   name: myvault:command-name
   description: What this command does
   argument-hint: "[expected arguments]"
   ---

   Instructions...
   ```
4. Update README.md commands table
5. Update this file's structure diagram
6. Update plugin.json component counts

## Content Workflow

### Standard Flow

1. **Content Research** (optional): `/myvault:content-research [topic area]`
   - Maps existing content landscape
   - Identifies gaps and opportunities
   - Analyzes competitor positioning
   - Recommends angles for MyVault

2. **Topic Research** (optional): `/myvault:research [topic]`
   - Gathers statistics, trends, sources
   - Evaluates source quality (Tier A/B/C/D)
   - Connects findings to MyVault narrative

3. **Write**: `/myvault:write [type] about [topic] for [audience]`
   - Loads all knowledge skills
   - Follows 4-phase protocol (Think → Structure → Draft → Review)
   - Applies 9 signature moves

4. **Edit**: `/myvault:edit [content]`
   - 8-phase review process
   - Checks voice, product voice, AI transparency, mechanics
   - Outputs structured edit results

### Quality Gates

Every piece of content must pass:

- [ ] Voice check (confident, warm, clear, empowering)
- [ ] Product voice check (no "I" from product)
- [ ] Confidence check (not fear-based)
- [ ] AI transparency check (decisions explained)
- [ ] Mechanical check (style guide compliance)
- [ ] Read-aloud test

## Key Rules

### Product Voice (Critical)

MyVault is a **tool**, not a personality.

| Never | Always |
|-------|--------|
| "I found 12 duplicates" | "MyVault found 12 duplicates" |
| "I'm here to help!" | Cut entirely |
| "I organized your photos" | "Your photos are organized" |

### Agent Voice

Agents speak as tools, not friends:

| Never | Always |
|-------|--------|
| "Your Insurance Agent is excited to tell you..." | "Your Insurance Agent found..." |
| "I saved you money" | "The Insurance Agent identified savings" |

### Security Messaging

Build confidence, not fear:

| Fear-Based (Never) | Confidence-Based (Always) |
|--------------------|---------------------------|
| "Protect yourself from hackers" | "Your photos stay private" |
| "Don't let big tech spy on you" | "We can't see your photos" |
| "Before it's too late" | "Always secure" |

### Banned Words

Never use: leverage, utilize, seamless, revolutionary, cutting-edge, robust, scalable, ecosystem, journey, magic (for AI)

## Source Quality (Research)

| Tier | Description | Use For |
|------|-------------|---------|
| **A** | Peer-reviewed, large sample, recent | Key claims |
| **B** | Reputable organization, good methodology | Key claims |
| **C** | Industry report, smaller sample | Supporting details |
| **D** | Single source, unverified, old | Flag clearly |

Rule: Tier A/B for key claims. Never single-source without flagging.

## Audiences

| Audience | Primary Need | Lead With |
|----------|--------------|-----------|
| **Tech-Forward Families** (Primary) | Family protection | Chaos → Calm |
| **Security-Conscious Professionals** | Privacy control | Privacy architecture |
| **High Net Worth Individuals** | Estate organization | Legacy/consolidation |

Default to Families when unspecified.

## Validation Commands

### Count Components

```bash
# Count agents
find agents -name "*.md" | wc -l

# Count commands
find commands -name "*.md" | wc -l

# Count skills
find skills -name "SKILL.md" | wc -l
```

### Validate JSON

```bash
cat .claude-plugin/plugin.json | jq .
```

## Commit Conventions

```
Add [component type]: [name]
Update [file] - [what changed]
Fix [issue]
Remove [component]

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>
```

## Key Learnings

_Capture important learnings as we work on this plugin._

### 2026-01-19: Initial Plugin Created

Built the MyVault content plugin following compound-engineering architecture patterns:
- Skills as knowledge repositories
- Agents with worldview axioms, signature moves, multi-phase protocols
- Commands as namespace shortcuts (myvault:*)
- Source quality tiers for research

**Learning:** The compound-engineering patterns (axioms, canon/anti-canon, signature moves) translate well to content production. The key adaptation is enforcing product voice (tool, not personality) throughout.

---

*Private by design. Intelligent by nature.*
