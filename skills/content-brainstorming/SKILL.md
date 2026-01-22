---
name: content-brainstorming
description: This skill should be used before creating content to clarify WHAT to write, for WHOM, and WHY. It guides exploring content goals, audiences, angles, and messaging decisions before drafting. Triggers on "let's brainstorm content", "help me think through", "what should we write about", "explore angles", vague content requests, or when multiple valid approaches need clarification.
user_invocable: true
triggers:
  - "brainstorm content"
  - "content ideas"
  - "what should we write"
  - "help me think through content"
  - "explore content angles"
---

# Content Brainstorming

This skill provides detailed process knowledge for effective content brainstorming sessions that clarify **WHAT** to create before diving into **HOW** to write it.

## When to Use This Skill

Content brainstorming is valuable when:
- Content goal is unclear or ambiguous
- Multiple angles could work for the topic
- Audience isn't specified or could be multiple
- Content type/format needs to be decided
- User hasn't fully articulated what they want
- Messaging approach needs refinement

Content brainstorming can be skipped when:
- User has explicit content brief
- Audience, angle, and format are all specified
- User knows exactly what they want to say
- Request references existing content to follow

## Core Process

### Phase 0: Assess Requirement Clarity

Before diving into questions, assess whether brainstorming is needed.

**Signals that requirements are clear:**
- User specified content type (blog, newsletter, social)
- User identified target audience (families, professionals, HNW)
- User described the message or transformation
- User referenced existing content to follow

**Signals that brainstorming is needed:**
- User used vague terms ("write something about passwords")
- Multiple reasonable angles exist
- Audience unclear or could be multiple
- User seems unsure about the approach
- Topic is broad without clear focus

If requirements are clear, suggest: "Your brief seems clear. Consider proceeding directly to `/myvault:write` with this guidance."

### Phase 1: Understand the Intent

Ask questions **one at a time** to understand the user's content goals. Avoid overwhelming with multiple questions.

**Question Techniques:**

1. **Prefer multiple choice when natural options exist**
   - Good: "Who's the primary audience: (a) families, (b) professionals, or (c) high net worth individuals?"
   - Avoid: "Who should this be for?"

2. **Start broad, then narrow**
   - First: What's the content goal?
   - Then: Who's the audience?
   - Finally: What action should readers take?

3. **Validate assumptions explicitly**
   - "I'm assuming this is for our primary audience (families). Is that correct?"

4. **Ask about success criteria early**
   - "What should readers feel or do after reading this?"

**Key Topics to Explore:**

| Topic | Example Questions |
|-------|-------------------|
| Goal | What's the purpose? Why create this now? |
| Audience | Who's this for? What's their current state? |
| Content Type | Blog post, newsletter, social, website copy, help docs? |
| Message | What's the ONE thing they should remember? |
| Transformation | What changes for them? (Before → After) |
| Action | What should they do after reading? |
| Constraints | Any brand rules? Products to mention/avoid? |
| Existing Assets | Can we build on existing research or content? |

**Exit Condition:** Continue until the intent is clear OR user says "proceed" or "let's move on"

### Phase 2: Explore Angles

After understanding the intent, propose 2-3 concrete content angles.

**Structure for Each Angle:**

```markdown
### Angle A: [Name]

[2-3 sentence description of the approach]

**Opening Hook:** [How we'd start this piece]

**Design Pillar:** [Trust-first / Intelligent simplicity / Emotional connection / Privacy-powered AI]

**Content Pillar:** [Chaos→Calm / Family Protection / Smart Insights / Privacy / Your Data / Intelligent Assistance]

**Voice:** [Confident, warm, clear, empowering]

**Pros:**
- [Benefit 1]
- [Benefit 2]

**Cons:**
- [Drawback 1]
- [Drawback 2]

**Best when:** [Circumstances where this angle works best]
```

**Guidelines:**
- Lead with a recommendation and explain why
- Ensure all angles follow MyVault brand voice (never fear-based)
- Consider the audience's current emotional state
- Reference existing content patterns when relevant
- Choose angles that build confidence, not fear

**Brand Voice Guardrails:**
- ❌ Never use fear-based messaging ("protect yourself from hackers")
- ✅ Always confidence-based ("your photos stay private")
- ❌ Never make MyVault a personality ("I found your duplicates!")
- ✅ Always tool-based ("MyVault found 12 duplicates")
- ❌ Never use banned words (leverage, utilize, seamless, revolutionary, etc.)

### Phase 3: Capture the Content Brief

Summarize key decisions in a structured format.

**Content Brief Structure:**

```markdown
---
date: YYYY-MM-DD
topic: <kebab-case-topic>
content-type: [blog|newsletter|social|website|help-docs]
audience: [families|professionals|hnw|general]
---

# <Topic Title>

## What We're Creating
**Content Type:** [Blog post / Newsletter / Social post / etc.]
**Target Audience:** [Families / Professionals / HNW]
**Word Count:** [Target length]

## Content Goal
[What should this accomplish? 1-2 sentences]

## The Message
**One thing to remember:** [The core message]

**Transformation:** [Before state] → [After state]

## Chosen Angle
[Brief explanation of angles considered and why this one was chosen]

## Key Decisions
- **Design Pillar:** [Trust-first / Intelligent simplicity / Emotional connection / Privacy-powered AI]
- **Content Pillar:** [Chaos→Calm / Family Protection / etc.]
- **Opening Hook:** [How we'll start]
- **Call to Action:** [What readers should do]

## Voice & Tone
- Confident (not fearful)
- Warm (not clinical)
- Clear (not jargon-heavy)
- Empowering (not patronizing)

## Assets Needed
- [ ] Research on [topic]
- [ ] Statistics (Tier A/B sources)
- [ ] Product features to highlight
- [ ] Existing content to reference

## Next Steps
→ Run `/myvault:research [topic]` if research needed
→ Run `/myvault:write [brief]` to create draft
```

**Output Location:** `docs/content-briefs/YYYY-MM-DD-<topic>-brief.md`

### Phase 4: Handoff

Present clear options for what to do next:

1. **Need research?** → Run `/myvault:research [topic]`
2. **Ready to write?** → Run `/myvault:write [based on this brief]`
3. **Refine further?** → Continue exploring the angle
4. **Done for now** → User will return later

## Content Quality Principles

During brainstorming, actively enforce MyVault standards:

### Product Voice (Critical)
MyVault is a **tool**, not a personality.

| Never | Always |
|-------|--------|
| "I found 12 duplicates" | "MyVault found 12 duplicates" |
| "I'm here to help!" | Cut entirely |
| "I organized your photos" | "Your photos are organized" |

### Security Messaging
Build confidence, not fear.

| Fear-Based (Never) | Confidence-Based (Always) |
|--------------------|---------------------------|
| "Protect yourself from hackers" | "Your photos stay private" |
| "Don't let big tech spy on you" | "We can't see your photos" |
| "Before it's too late" | "Always secure" |

### Simplicity Over Complexity
- **Choose the simplest angle that achieves the goal**
- **Prefer clear, direct messaging over clever wordplay**
- **One clear message > multiple competing messages**
- **Defer decisions that don't need to be made now**

## Incremental Validation

Keep sections short—200-300 words maximum. After each section of output, pause to validate understanding:

- "Does this match what you had in mind?"
- "Any adjustments before we continue?"
- "Is this the direction you want to go?"

This prevents wasted effort on misaligned content direction.

## Anti-Patterns to Avoid

| Anti-Pattern | Better Approach |
|--------------|-----------------|
| Asking 5 questions at once | Ask one at a time |
| Jumping to writing | Stay focused on WHAT to say, not HOW to say it |
| Proposing fear-based angles | Always confidence-based messaging |
| Ignoring existing brand voice | Load brand-voice skill first |
| Making assumptions about audience | State assumptions explicitly and confirm |
| Creating lengthy briefs | Keep it concise—details go in the draft |
| Using banned words in examples | Follow style guide strictly |

## Integration with Writing

Brainstorming answers **WHAT** to create:
- Content goal and success criteria
- Target audience and their needs
- Chosen angle and messaging approach
- Design/content pillars to follow

Writing answers **HOW** to create it:
- Actual draft with headlines, body, CTA
- Specific word choices and examples
- Structure and flow
- Brand voice application

When content brief exists, `/myvault:write` should detect it and use it as input, skipping its own planning phase.

## Source Quality (for Research Phase)

When research is needed, enforce source quality:

| Tier | Description | Use For |
|------|-------------|---------|
| **A** | Peer-reviewed, large sample, recent | Key claims |
| **B** | Reputable organization, good methodology | Key claims |
| **C** | Industry report, smaller sample | Supporting details |
| **D** | Single source, unverified, old | Flag clearly |

Rule: Tier A/B for key claims. Never single-source without flagging.

---

*Private by design. Intelligent by nature.*
