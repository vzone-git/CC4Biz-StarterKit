---
name: partner-scorecard
description: Use when the user asks to evaluate, score, compare, or rank potential partners or alliances. Produces a structured scorecard with consistent criteria across all candidates. Triggers on partner evaluation, alliance assessment, partnership comparison, vendor scoring, or "should we partner with" questions.
---

# Partner Scorecard

Evaluate potential partners using a consistent, repeatable framework. Every partner gets scored on the same criteria so comparisons are apples-to-apples.

## When to Use

- User asks to evaluate one or more potential partners
- User asks "should we partner with [company]?"
- User needs to compare or rank partnership candidates
- User is preparing a partnership recommendation for leadership

## Scoring Framework

Score each partner on these dimensions (1-5 scale):

| Dimension | What to Assess | 1 = Weak | 5 = Strong |
|-----------|---------------|----------|------------|
| **Strategic Fit** | Does their mission, market, and trajectory align with ours? | Tangential overlap | Core to both strategies |
| **Market Reach** | Do they give us access to customers or segments we can't reach alone? | Same customers we already have | Opens a new market entirely |
| **Technical Compatibility** | How easy is it to integrate, co-build, or co-deliver? | Requires heavy custom work | Plug-and-play or API-ready |
| **Financial Strength** | Are they funded, profitable, or otherwise stable? | Cash-strapped or unclear | Well-funded or profitable |
| **Revenue Potential** | What's the realistic revenue impact in 12-24 months? | < $100K incremental | > $1M incremental |
| **Speed to Value** | How fast can we get a joint win? | 12+ months to first deal | < 3 months to first deal |
| **Champion Access** | Do we have (or can we get) a decision-maker relationship? | No contacts, cold outreach | Warm intro or existing relationship |

## Process

### Step 1: Gather Information
For each partner, research (use Haiku agents for web searches):
- What they do and who they sell to
- Funding, revenue stage, recent news
- Current partnerships and integrations
- Key decision-makers
- Any existing relationship or warm connections

### Step 2: Score
Apply the framework above. Be honest — inflated scores defeat the purpose. Include a one-line justification for each score.

### Step 3: Output Format

For a **single partner**, produce a detailed scorecard:

```
# Partner Scorecard: [Company Name]

**Date:** [date]
**Evaluated by:** [user context from CLAUDE.md]

## Summary
[2-3 sentence recommendation: pursue, pass, or explore further]

## Scores

| Dimension | Score | Justification |
|-----------|-------|---------------|
| Strategic Fit | X/5 | [one line] |
| Market Reach | X/5 | [one line] |
| Technical Compatibility | X/5 | [one line] |
| Financial Strength | X/5 | [one line] |
| Revenue Potential | X/5 | [one line] |
| Speed to Value | X/5 | [one line] |
| Champion Access | X/5 | [one line] |
| **Total** | **XX/35** | |

## Key Strengths
- [top 2-3 reasons to pursue]

## Key Risks
- [top 2-3 reasons to be cautious]

## Recommended Next Steps
- [specific actions if pursuing]

## Sources
- [list sources used in research]
```

For **multiple partners**, produce a comparison matrix:

```
# Partner Comparison Matrix

**Date:** [date]

| Dimension | Partner A | Partner B | Partner C |
|-----------|-----------|-----------|-----------|
| Strategic Fit | X/5 | X/5 | X/5 |
| Market Reach | X/5 | X/5 | X/5 |
| ... | ... | ... | ... |
| **Total** | **XX/35** | **XX/35** | **XX/35** |

## Recommendation
[Ranked list with one-line reasoning for each]

## Detailed Scorecards
[Full scorecard for each partner below]
```

### Step 4: Save
- Save to `output/research-reports/[date]-partner-scorecard-[company].md`
- If comparing multiple partners: `output/research-reports/[date]-partner-comparison.md`

## Customization

If the user has defined custom scoring criteria or weights in CLAUDE.md, use those instead of the defaults. Always ask: "I have a standard partner scoring framework with 7 dimensions. Do you want to customize the criteria, or should I use the defaults?"

## Cost Routing

- **Haiku**: web research and data gathering for each partner
- **Sonnet**: writing individual scorecards and formatting the matrix
- **Opus**: final ranking, strategic recommendation, and cross-partner synthesis
