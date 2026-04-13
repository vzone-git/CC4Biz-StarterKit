---
name: executive-briefing-prep
description: Use when the user has an upcoming meeting and needs a pre-meeting brief on a person, company, or organization. Produces a one-page briefing document with background, recent news, relationship history, and talking points. Triggers on meeting prep, briefing requests, "I'm meeting with", or "what should I know about [person/company] before our call."
---

# Executive Briefing Prep

Produce a concise, one-page pre-meeting brief so the user walks into every meeting prepared. No fluff — just what they need to know and what they should say.

## When to Use

- User has an upcoming meeting with an external contact
- User asks "what should I know about [person/company]?"
- User asks for meeting prep or a briefing
- User says "I'm meeting with [name] from [company]"

## Process

### Step 1: Clarify Context
Ask (only if not already provided):
1. **Who** — person name and company
2. **When** — meeting date/time (for urgency)
3. **Purpose** — what's the meeting about?
4. **Desired outcome** — what does the user want to walk away with?

### Step 2: Research (use Haiku agents, run in parallel)
- **Person**: role, background, career history, LinkedIn highlights, recent public activity (talks, posts, articles)
- **Company**: what they do, size, funding, recent news (last 90 days), key metrics if public
- **Relationship history**: search the user's workspace for any prior documents, emails, or notes mentioning this person or company
- **Industry context**: any relevant market trends or news that affect the conversation

### Step 3: Produce the Brief

```
# Meeting Brief: [Person Name], [Title] — [Company]

**Meeting:** [date, time, format (call/in-person/video)]
**Purpose:** [one line]
**Your goal:** [what the user wants to achieve]

---

## Who They Are
- [Current role — one line]
- [Background — 2-3 bullet points: career path, expertise, notable]
- [Communication style if detectable — data-driven? relationship-first? direct?]

## Their Company
- [What they do — one line]
- [Size / stage / funding — one line]
- [Recent news — 2-3 bullets, last 90 days only]

## Your History
- [Prior interactions, documents, or deals involving this person/company]
- [If none: "No prior interactions found in workspace"]

## What They Likely Care About
- [2-3 points based on their role, company situation, and meeting purpose]
- [What problems are they trying to solve?]
- [What would make this meeting a win for them?]

## Talking Points
1. [Specific opener — reference something current about them]
2. [Bridge to your purpose — connect their interests to your ask]
3. [Proof point — one concrete data point or example to build credibility]

## Watch Out For
- [Potential objections or sensitive topics]
- [Competing relationships or conflicts of interest]
- [Anything that could derail the conversation]

## Suggested Ask
- [The specific request or next step to propose at the end]

---
*Sources: [list]*
```

### Step 4: Save
- Save to `output/research-reports/[date]-briefing-[person-or-company].md`
- Keep it to one page (roughly 400-500 words). Executives don't read two-page briefs.

## Principles

- **Recency matters.** A news article from last week is 10x more useful than a funding round from 2 years ago. Prioritize the last 90 days.
- **Actionable over informative.** "They just lost their VP of Sales" is more useful than "Founded in 2018."
- **Workspace-aware.** Always search the user's project files for prior mentions. Context from past interactions is gold.
- **Honest gaps.** If you can't find something, say so. "No recent news found" is better than filler.

## Cost Routing

- **Haiku**: all web research (person, company, news)
- **Sonnet**: writing the brief, formatting
- **Opus**: only for synthesizing conflicting information or strategic framing of talking points
