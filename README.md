# Claude Code Starter Kit for Business & Research

A curated set of plugins, guardrails, and skills for using Claude Code to build presentations, research markets, write business cases, analyze ROI, and create investor-facing materials.

**No coding or terminal experience needed.**

---

## What Is Claude Code?

Claude Code is Anthropic's AI assistant that runs on your computer. Unlike ChatGPT or the Claude web app, it can read and write files on your machine, search the web, and build things like presentations and reports as actual files you can open, edit, and share.

Think of it as having a very capable research analyst and content creator sitting at your computer.

## What Is This Starter Kit?

This kit makes Claude Code dramatically better at business work by adding three things:

### Plugins — add-on skill packs that expand what Claude can do

| Plugin | What It Adds |
|--------|-------------|
| **superpowers** | Forces Claude to brainstorm and plan before diving in. Without this, Claude just starts writing immediately. With it, Claude asks clarifying questions, explores different angles, and presents options before committing. The difference between generic AI output and something that reflects your thinking. |
| **everything-claude-code** | A collection of 150+ specialized skills. The ones that matter for you: **deep-research** (cited web research), **market-research** (competitive analysis, TAM/SAM/SOM), **frontend-slides** (HTML presentations), **investor-materials** (pitch decks, memos, financial models), **investor-outreach** (cold emails, follow-ups), **article-writing** (blog posts, newsletters), **content-engine** (LinkedIn, X, multi-platform content), **exa-search** (live web search), **product-lens** (idea validation). |
| **frontend-design** | Makes Claude's visual output look professional and distinctive instead of generic. Pushes toward bold typography, intentional layouts, and atmospheric design. Specifically fights the template-y, AI-generated look. |

### Hooks — automated guardrails that run in the background

| Hook | What It Prevents |
|------|-----------------|
| **guard-final-content** | Blocks Claude from editing files in your `final/` or `approved/` folders. Once you've signed off on a deliverable, it's protected from accidental changes. |
| **revision-guardrail** | When Claude is about to replace an entire file, reminds it to only change what you asked for. Prevents the classic problem: "I asked you to fix paragraph 3 and you rewrote my entire report." |
| **guard-main-branch** | If you use git (optional), prevents Claude from committing directly to the main branch. Keeps a clean "last known good" version. If you don't use git, this hook does nothing — it won't cause errors. |

### Skills — reusable instructions that teach Claude a specific workflow

| Skill | What It Does |
|-------|-------------|
| **cost-aware-router** | Teaches Claude to use cheaper AI models for simple tasks (web searches, summarizing) and save the expensive model for complex judgment calls. A 10-step research project might use the expensive model for 2 steps instead of 10. Saves cost and rate limit headroom. |

---

## Setup

### What You Need First

- **Claude Code installed.** Download from: https://docs.anthropic.com/en/docs/claude-code/overview
- **This starter kit downloaded.** Click the green **"Code"** button on this repo's GitHub page, then **"Download ZIP."** Unzip it wherever you like (your Downloads folder is fine).

### The Setup Prompt

Once you have Claude Code installed and this kit unzipped, here's all you need to do:

1. Open Claude Code (the terminal app or desktop app)
2. Copy and paste the prompt below
3. Replace `STARTER_KIT_PATH` with where you unzipped the kit (see examples below the prompt)

---

**Copy this entire block and paste it into Claude Code:**

```
I just downloaded a Claude Code starter kit to set up my workspace for business research and presentations. The unzipped folder is at: STARTER_KIT_PATH

Please do the following:

1. READ the README.md in that folder so you understand what this kit contains.

2. INSTALL PLUGINS — run these three commands:
   /install-plugin obra/superpowers
   /install-plugin affaan-m/everything-claude-code
   /install-plugin claude-plugins-official/frontend-design

3. SET UP MY PROJECT — Create a workspace folder for my work:
   - Create a folder called "my-workspace" in my Documents folder
   - Copy the .claude/ folder (with settings.json and hooks/) from the starter kit into my-workspace/
   - Copy the CLAUDE.md template from the starter kit into my-workspace/
   - Copy the EXAMPLE-PROMPTS.md from the starter kit into my-workspace/
   - Create these subfolders: output/research-reports, output/presentations, output/investor-materials, final/
   - Make the hook scripts executable (chmod +x on Mac/Linux, or skip on Windows)

4. SET UP USER-LEVEL CONFIG — these apply to all my projects:
   - Check if I already have a settings file at ~/.claude/settings.json
   - If I don't have one, copy user-level-config/user-settings.json to ~/.claude/settings.json
   - If I do have one, merge the "extraKnownMarketplaces" entries into my existing file
   - Create ~/.claude/skills/cost-aware-router/ and copy the SKILL.md from user-level-config/skills/cost-aware-router/

5. VERIFY everything works:
   - Confirm the .claude/hooks/ scripts exist in my-workspace and are executable
   - Confirm the plugins were installed
   - Confirm ~/.claude/skills/cost-aware-router/SKILL.md exists
   - Tell me if anything failed and how to fix it

6. Show me a summary of what was set up and what I can do next.

Handle macOS vs Windows differences automatically. If a step doesn't apply to my OS, skip it and tell me.
```

---

**Replace `STARTER_KIT_PATH` with your actual path. Examples:**

- **Mac (downloaded to Downloads):**
  `~/Downloads/claude-code-starter-kit-main`

- **Windows (downloaded to Downloads):**
  `C:\Users\YourName\Downloads\claude-code-starter-kit-main`

> **Tip:** If you're not sure of the path, just tell Claude: "I downloaded the starter kit zip and unzipped it in my Downloads folder. Can you find it?"

---

### After Setup

Open Claude Code from your new workspace:
- **Mac:** Open Terminal, type `cd ~/Documents/my-workspace && claude`
- **Windows:** Open Command Prompt, type `cd %USERPROFILE%\Documents\my-workspace && claude`
- **Or:** Open Claude Code's desktop app and point it at the `my-workspace` folder

Then just start asking for things naturally. See `EXAMPLE-PROMPTS.md` for copy-paste prompts, or try:
- "Research the competitive landscape for [your industry]"
- "Create a presentation about [your topic]"
- "Write a business case for [your proposal]"

---

## How the Guardrails Protect Your Work

### The "Final Folder" Pattern
When you're happy with a deliverable, ask Claude to move it to `final/`:
```
"Move the pitch deck to the final folder"
```
Now it's protected. If you later say "update the pitch deck," Claude works on the draft in `output/`, not your approved version.

### The Revision Guardrail
Without it:
- You: "Make the market sizing more conservative"
- Claude: *rewrites the entire 20-page report, changes your intro, loses your specific wording*

With it:
- You: "Make the market sizing more conservative"
- Claude gets a reminder, surgically updates just that section, leaves everything else untouched

---

## What Each Skill Does

### Research
```
"Research the ROI of enterprise AI partnerships in healthcare"
"What's the competitive landscape for clinical documentation software?"
"Do a deep dive on the Series A market for health-tech in 2026"
```

### Presentations
```
"Create a presentation about our Q2 partnership strategy"
"Build a pitch deck for our Series A raise"
"Turn these notes into a 10-slide investor presentation: [paste notes]"
```
Claude will ask about your preferred style and show preview options. The frontend-design plugin ensures distinctive, professional results.

### Business Cases & ROI
```
"Write a business case for investing in X partnership"
"Build an ROI analysis comparing vendors A, B, and C"
"Draft a one-pager for our board on the enterprise expansion opportunity"
```

### Investor Materials
```
"Create our investor memo for the seed round"
"Draft a cold email to [investor name] at [fund]"
"Update our pitch deck with new traction numbers: [paste data]"
```

### Writing & Content
```
"Write a LinkedIn post announcing our partnership with X"
"Turn this research report into a blog post"
"Draft a newsletter issue about [topic]"
```

---

## Tips

1. **Let the brainstorming happen.** When Claude asks questions before working, answer them. That's the superpowers plugin making sure the output matches what you need.

2. **Fill in CLAUDE.md.** Open it in your workspace and add your company info, audience, and style preferences. The more context you give, the less you repeat every conversation.

3. **Paste your raw material.** Claude works best with something to work with: meeting notes, rough outlines, data, competitor URLs, previous versions.

4. **Ask for revisions, not rewrites.** "Make the market sizing more conservative" beats "redo the whole thing."

5. **Use the final/ folder.** When something is approved, move it there to protect it.

6. **Start a new conversation when things get slow.** Long conversations use more context. If Claude seems to be losing the thread, start fresh.

---

## Folder Structure After Setup

```
my-workspace/
  CLAUDE.md                  <-- Your project context (fill this in!)
  EXAMPLE-PROMPTS.md         <-- Copy-paste prompt templates
  .claude/
    settings.json            <-- Plugin + hook config
    hooks/
      guard-final-content.sh
      revision-guardrail.sh
      guard-main-branch.sh
  output/                    <-- Work in progress
    research-reports/
    presentations/
    investor-materials/
  final/                     <-- Approved deliverables (protected)
```

---

## Power-Ups (Optional)

These add-ons give Claude access to live web data during research. Without them, Claude uses its training knowledge (up to early 2025). With them, it can search the live web for current news, company data, and market info.

You only need ONE of these — pick whichever appeals to you. You can always add more later.

### Gemini Deep Research (Recommended for Business Users)

Google's Deep Research is one of the best tools for thorough, multi-source research. It takes 3-20 minutes per query but produces comprehensive reports with citations — like having a research analyst work for you.

**Cost:** ~$2-5 per deep research query. The Gemini API key is free to create; you pay per use.

**Setup — paste this into Claude Code:**

```
I want to set up Gemini Deep Research so you can do thorough web research for me.

Please add this MCP server to my Claude Code configuration:

Server name: gemini-deep-research
Command: npx
Args: -y @bharatvansh/gemini-deep-research-mcp
Environment variable: GEMINI_API_KEY = MY_API_KEY_HERE

Add it to my user-level MCP config so it works across all my projects.
After adding it, verify the server is reachable.
```

**To get your API key:**
1. Go to https://aistudio.google.com/apikey
2. Sign in with your Google account
3. Click "Create API Key"
4. Copy the key and replace `MY_API_KEY_HERE` in the prompt above

**After setup, use it naturally:**
```
"Do a deep research report on the enterprise SaaS partnership landscape in healthcare"
"Research everything about [Company X] — funding, leadership, strategy, recent news"
```

> **Note:** Deep research takes 3-20 minutes per query. Claude will let you know it's working. For quick lookups, it will use its built-in knowledge or Exa (if set up) instead.

### Exa Web Search (Faster Alternative)

Exa is a neural search engine. Faster than Gemini Deep Research (results in seconds) but less thorough. Good for quick lookups, company searches, and current news.

**Setup — paste this into Claude Code:**

```
I want to set up Exa web search so you can search the live web for me.

Please add this MCP server to my Claude Code configuration:

Server name: exa-web-search
Command: npx
Args: -y exa-mcp-server
Environment variable: EXA_API_KEY = MY_API_KEY_HERE

Add it to my user-level MCP config so it works across all my projects.
```

**To get your API key:**
1. Go to https://exa.ai
2. Create an account
3. Go to your API settings and copy the key
4. Replace `MY_API_KEY_HERE` in the prompt above

### Using Both Together

If you set up both, Claude will automatically choose the right one:
- **Quick lookups** (company info, recent news, fact-checking) -> Exa (seconds)
- **Deep analysis** (market research, competitive landscape, due diligence) -> Gemini Deep Research (minutes)

---

## Troubleshooting

**"Permission denied" when hooks run:**
Ask Claude: "Make the hook scripts in .claude/hooks/ executable." It will run the right command for your OS.

**Plugins don't seem active:**
Run `/install-plugin` again for each one. If that doesn't work, ask Claude: "Check if my superpowers and everything-claude-code plugins are installed and active."

**Claude rewrites entire files when you asked for small changes:**
The revision-guardrail hook should catch this. If it's not working, ask Claude: "Check that .claude/hooks/revision-guardrail.sh exists and is executable in my workspace."

**Something else isn't working:**
Just tell Claude what's wrong. It can usually diagnose and fix configuration issues itself.
