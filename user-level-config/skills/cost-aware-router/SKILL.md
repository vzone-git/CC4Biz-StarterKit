---
name: cost-aware-router
description: Use when starting any multi-step task to decompose work and route subtasks to the cheapest sufficient model via Agent tool, reducing rate limit pressure and cost on expensive models. Triggers on research projects, building presentations, writing reports, competitive analysis, investor materials, or any task with 2+ independent subtasks.
---

# Cost-Aware Model Router

Decompose tasks into subtasks and dispatch each to the **cheapest model that can handle it**. Opus is 19x more expensive than Haiku -- most subtasks don't need it.

## Core Principle

The parent conversation (Opus) should **orchestrate, not execute**. Break work into pieces, classify each, dispatch to the right tier, synthesize results. The parent does planning and synthesis only.

## Model Routing Table

| Tier | Model | Cost | Use For |
|------|-------|------|---------|
| **Cheap** | `haiku` | 1x | Web searches, reading articles, summarizing sources, finding data, checking facts, formatting |
| **Mid** | `sonnet` | 4x | Writing drafts, editing content, building slides, creating tables, analyzing data, writing emails |
| **Expensive** | `opus` | 19x | Complex analysis, strategic reasoning, synthesizing multiple sources into insights, nuanced business judgment |

## Decision Heuristic

Before dispatching a subtask, ask:

1. **Is it searching or gathering info?** Yes -> haiku. No -> continue.
2. **Is it writing or formatting a single deliverable?** Yes -> sonnet. No -> continue.
3. **Does it require cross-cutting judgment or synthesis?** Yes -> opus.

When uncertain, **start one tier lower** -- you can always escalate if the result is insufficient.

## Dispatch Pattern

Use the Agent tool's `model` parameter:

```
# Cheap: web research and data gathering
Agent(model: "haiku", prompt: "Search for recent funding rounds in health-tech and list the top 10")

# Cheap: read and summarize
Agent(model: "haiku", prompt: "Read this article and summarize the key points about market sizing")

# Mid: content creation
Agent(model: "sonnet", prompt: "Write the executive summary section of our investor memo based on these findings: ...")

# Mid: formatting and structuring
Agent(model: "sonnet", prompt: "Create an HTML slide comparing these three competitors in a table format")

# Expensive: only when genuinely needed
Agent(model: "opus", prompt: "Synthesize these 5 research summaries into a strategic recommendation with risk analysis")
```

## Task Decomposition Workflow

When receiving a task:

1. **Classify overall complexity**: simple (1 subtask) | moderate (2-4) | complex (5+)
2. **Identify independent subtasks**: what can run in parallel?
3. **Assign model tier** to each subtask using the routing table
4. **Dispatch parallel where possible**: use multiple Agent calls in one message
5. **Synthesize**: combine results in the parent (Opus) context

### Example: "Research the ROI of partnering with Company X"

| # | Subtask | Model | Why |
|---|---------|-------|-----|
| 1 | Search for Company X funding, traction, and recent news | haiku | Web search + read |
| 2 | Search for comparable partnership deals in the industry | haiku | Web search + summarize |
| 3 | Draft the financial model with assumptions | sonnet | Structured writing |
| 4 | Draft the risk analysis section | sonnet | Focused writing |
| 5 | Synthesize into strategic recommendation | opus | Cross-cutting judgment |

Subtasks 1-2 run in parallel (haiku). Then 3-4 run in parallel (sonnet). Then 5.
**Opus touches**: only orchestration + final synthesis.

### Example: "Build a pitch deck for our Series A"

| # | Subtask | Model | Why |
|---|---------|-------|-----|
| 1 | Research comparable raises and market benchmarks | haiku | Web search |
| 2 | Research competitor positioning and funding | haiku | Web search |
| 3 | Draft slide content for each section | sonnet | Content writing |
| 4 | Build the HTML presentation | sonnet | Formatting + code |
| 5 | Review for narrative coherence and investor readiness | opus | Strategic judgment |

## Anti-Patterns

| Don't | Do Instead |
|-------|------------|
| Use Opus to search the web | Haiku agent does searches |
| Use Opus to write a first draft | Sonnet writes, Opus reviews |
| Use Opus to read and summarize articles | Haiku reads and summarizes |
| Run all subtasks one at a time | Parallel dispatch where independent |
| Default to Opus "just in case" | Start low, escalate if quality is insufficient |

## Quick Reference

```
haiku  = "find it, read it, list it"
sonnet = "write it, format it, build it"
opus   = "judge it, synthesize it, decide it"
```
