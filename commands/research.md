---
name: myvault:research
description: Research a topic for MyVault content. Gathers statistics, trends, and data with cited sources.
argument-hint: "[topic to research]"
---

**Note: The current year is 2026.** Use this when searching for recent statistics and trends.

# MyVault Topic Research

Research the following topic for MyVault content:

**Topic:** $ARGUMENTS

## Instructions

1. **Load context skills:**
   - Load the `product-knowledge` skill to understand MyVault
   - Load the `audience-personas` skill to know who we're writing for

2. **Execute research using the topic-researcher agent protocol:**
   - Define the research question clearly
   - Search for statistics, trends, and expert opinions
   - Evaluate source quality (Tier A/B/C/D)
   - Connect findings to MyVault's narrative (chaos → calm, privacy, family protection)

3. **Deliver a structured research brief with:**
   - Key statistics (minimum 5, with sources and dates)
   - Trends (what's changing)
   - Surprising findings (content hooks)
   - MyVault narrative connections
   - Research gaps (what we couldn't verify)

## Quality Standards

- Every statistic must have a source and date
- Prefer Tier A/B sources (Pew, McKinsey, major publications)
- Flag single-source claims
- Note when data is older than 2 years
- Connect every finding to MyVault's story

## Output Format

Deliver the research brief in this structure:

```
# Research Brief: [Topic]

## Executive Summary
[2-3 sentences]

## Key Statistics
[5-7 stats with sources]

## Trends
[2-4 trends with evidence]

## Surprising Findings
[Counterintuitive data for content hooks]

## MyVault Angles
[How to use these findings in content]

## Research Gaps
[What we couldn't find or verify]

## Sources
[Full source list with tiers]
```
