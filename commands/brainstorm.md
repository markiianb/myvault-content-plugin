---
name: myvault:brainstorm
description: Brainstorm content ideas, angles, and messaging before writing. Clarifies WHAT to create, for WHOM, and WHY before diving into drafting.
argument-hint: "[content topic or vague idea]"
---

**Note: The current year is 2026.** Use this when discussing trends or current events.

# MyVault Content Brainstorming

Let's brainstorm content before we start writing.

**Topic/Idea:** $ARGUMENTS

## Instructions

1. **Load the content-brainstorming skill:**
   - This skill guides the brainstorming process
   - It ensures we clarify WHAT to create before HOW to write it

2. **Follow the brainstorming process:**
   - **Phase 0:** Assess if brainstorming is needed (are requirements clear?)
   - **Phase 1:** Understand the intent (goal, audience, message)
   - **Phase 2:** Explore 2-3 content angles
   - **Phase 3:** Capture the content brief
   - **Phase 4:** Handoff to next step (research or write)

3. **Apply MyVault brand voice throughout:**
   - Load the `brand-voice` skill for voice guardrails
   - Load the `style-guide` skill for writing standards
   - Load the `audience-personas` skill for audience insights
   - Load the `product-knowledge` skill for product context

4. **Ask questions one at a time:**
   - Never overwhelm with 5 questions at once
   - Use multiple choice when natural options exist
   - Validate understanding incrementally

5. **Output a content brief when done:**
   - Save to: `docs/content-briefs/YYYY-MM-DD-<topic>-brief.md`
   - Include: goal, audience, angle, key decisions
   - Provide clear next steps

## Key Principles

**WHAT vs. HOW:**
- This command clarifies WHAT to create (goal, audience, angle)
- `/myvault:write` handles HOW to create it (actual draft)

**Confidence, Not Fear:**
- ❌ Never propose fear-based angles
- ✅ Always confidence-based messaging

**Simplicity:**
- Choose the simplest angle that achieves the goal
- One clear message > multiple competing messages

**Brand Voice:**
- MyVault is a tool, not a personality
- Always warm, confident, clear, empowering

## Next Steps After Brainstorming

Based on the brief created, suggest:

1. **Research needed?** → `/myvault:research [topic]`
2. **Ready to write?** → `/myvault:write [based on this brief]`
3. **Content landscape?** → `/myvault:content-research [topic area]`
4. **Refine further?** → Continue brainstorming

---

*Private by design. Intelligent by nature.*
