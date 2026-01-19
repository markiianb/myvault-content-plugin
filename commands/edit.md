---
name: myvault:edit
description: Edit content for MyVault brand voice, style, and quality. Reviews voice, product voice, AI transparency, and mechanics.
argument-hint: "[paste content to edit or file path]"
---

# MyVault Style Editor

Review and edit the following content for MyVault brand compliance:

**Content to Edit:** $ARGUMENTS

## Instructions

1. **Load knowledge skills:**
   - Load the `brand-voice` skill — voice DNA and design pillars
   - Load the `style-guide` skill — grammar and mechanics

2. **Read the full content first** — understand context, audience, purpose

3. **Execute 7-phase review:**

### Phase 1: Voice Check
Does it sound like MyVault? Check against:
- Confident but Approachable
- Warm but Professional
- Clear but Not Simplistic
- Empowering Not Dependent
- Transparent Not Mysterious

### Phase 2: Product Voice Check
**CRITICAL:** Is MyVault a tool or a personality?
- "I found" → "MyVault found"
- "I'm here to help" → Cut entirely
- Agents speak as tools, not friends

### Phase 3: AI Transparency Check
- Are AI decisions explained?
- Is confidence level appropriate?
- Is reasoning shown simply?

### Phase 4: Design Pillar Check
- Trust-first design
- Intelligent simplicity
- Emotional connection
- Privacy-powered AI

### Phase 5: Security/Confidence Check
- Fear-based → Confidence-based
- "Protect yourself from hackers" → "Your photos stay private"
- Jargon → Simple language

### Phase 6: Line Edit
- Hunt banned words (leverage, utilize, seamless, revolutionary, magic)
- Cut filler (actually, very, just, really, simply)
- Kill banned phrases ("We take your privacy seriously", "In today's digital world")
- Fix passive voice

### Phase 7: Mechanical Review
- Sentence case for headlines
- Oxford comma
- Em dashes—no spaces
- Numbers: spell out 1-9, numerals 10+
- MyVault (one word, M and V capitalized)
- Agent names: title case with "the" or "your"

## Output Format

```markdown
## Style Edit Results

### Summary
[1-2 sentences: Overall assessment]

### Voice Assessment
- Confident but Approachable: [✓/Needs work]
- Warm but Professional: [✓/Needs work]
- Clear but Not Simplistic: [✓/Needs work]
- Empowering Not Dependent: [✓/Needs work]
- Transparent Not Mysterious: [✓/Needs work]

### Critical Checks
- Product Voice (no "I"): [✓/Needs work]
- Confidence (not fear): [✓/Needs work]
- Simplicity (no jargon): [✓/Needs work]
- AI Transparency: [✓/Needs work/N/A]

### Edits ([count] total)

1. **[Category]**
   - Original: "[quoted text]"
   - Edited: "[corrected text]"
   - Rule: [Brief explanation]

[Continue for all issues]

### Patterns to Watch
[Recurring issues the author should focus on]

### Edited Content
[Full edited version]
```

## The Final Test

Read it out loud.

- Does it sound like a trusted friend who's great with technology?
- Does it build confidence or create fear?
- Is MyVault a helpful tool—or an AI trying to be your friend?
- Are AI decisions explained (when relevant)?

If all pass, deliver. If not, keep editing.
