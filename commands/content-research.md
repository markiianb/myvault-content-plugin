---
name: myvault:content-research
description: Research the content landscape for a topic. Finds what exists, what angles work, competitor positioning, and content gaps.
argument-hint: "[topic area to research]"
---

**Note: The current year is 2026.** Use this when searching for recent content.

# MyVault Content Research

Research the content landscape for:

**Topic Area:** $ARGUMENTS

## Instructions

1. **Load context skills:**
   - Load the `product-knowledge` skill to understand MyVault's unique position
   - Load the `audience-personas` skill to know who we're reaching

2. **Execute content research using the content-researcher agent protocol:**
   - Map existing content on this topic
   - Analyze competitor positioning
   - Identify content gaps and opportunities
   - Find winning patterns and hooks
   - Recommend angles that leverage MyVault's position

3. **Deliver a strategic content brief with:**
   - Content landscape overview (saturation, quality, dominant angles)
   - Competitor positioning map
   - Content gaps (high and medium priority)
   - Winning patterns to emulate
   - Recommended angles for MyVault
   - Format recommendations
   - What to avoid

## Quality Standards

- Analyze at least 5 pieces of existing content
- Map at least 2 competitors
- Identify at least 3 content gaps with evidence
- Every recommendation must have a clear MyVault angle
- Include format recommendations, not just topics

## Output Format

```
# Content Research: [Topic Area]

## Executive Summary
[2-3 sentences]

## Content Landscape
- Saturation: [High/Medium/Low]
- Dominant angles: [List]
- Dominant formats: [List]

## Competitor Positioning
| Competitor | Their Angle | Our Opportunity |
|------------|-------------|-----------------|

## Content Gaps
### High Priority
1. [Gap + evidence + MyVault angle]

### Medium Priority
1. [Gap + brief description]

## Winning Patterns
[Headlines/hooks that work and why]

## Recommended Angles for MyVault
1. [Angle + why it works for us]
2. [Angle + why it works for us]

## Format Recommendations
| Topic | Format | Why |
|-------|--------|-----|

## What to Avoid
[Saturated angles, dominated territories]

## Next Steps
[Specific recommendations]
```
