# Claude Code Starter Kit for Business & Research

> Plugins, guardrails, and skills that turn Claude Code into a business machine — sharper research, professional deliverables, and built-in protection for your approved work.

**No coding or terminal experience needed.** Setup takes 5 minutes.

Created by **[Vignesh Rama](https://www.linkedin.com/in/vramapro/)** | [MIT License](LICENSE)

---

## Get Started in 3 Steps

### Step 1 — Download the Kit

Click the green **"Code"** button at the top of this page, then **"Download ZIP."** Unzip it anywhere (Downloads folder is fine).

> Don't have Claude Code yet? Install it first: https://docs.anthropic.com/en/docs/claude-code/overview

### Step 2 — Paste One Prompt

Open Claude Code and paste this entire block. Replace `STARTER_KIT_PATH` with where you unzipped the kit.

**Mac path example:** `~/Downloads/CC4Biz-StarterKit-main`
**Windows path example:** `C:\Users\YourName\Downloads\CC4Biz-StarterKit-main`

> **Not sure of the path?** Just tell Claude: *"I downloaded a starter kit zip and unzipped it in my Downloads folder. Can you find it?"*

```
I just downloaded a Claude Code starter kit to set up my workspace for business research and presentations. The unzipped folder is at: STARTER_KIT_PATH

Please do the following:

1. READ the README.md in that folder so you understand what this kit contains.

2. INSTALL PLUGINS — run these commands:
   /install-plugin obra/superpowers
   /install-plugin affaan-m/everything-claude-code
   /install-plugin claude-plugins-official/frontend-design
   /install-plugin alirezarezvani/claude-skills
   /install-plugin obra/cc-plugin-decision-log
   /install-plugin obra/the-elements-of-style

3. SET UP MY PROJECT — Create a workspace folder for my work:
   - Create a folder called "my-workspace" in my Documents folder
   - Copy the .claude/ folder (with settings.json and hooks/) from the starter kit into my-workspace/
   - Copy the CLAUDE.md template from the starter kit into my-workspace/
   - Copy the EXAMPLE-PROMPTS.md from the starter kit into my-workspace/
   - Copy the CHEAT-SHEET.html from the starter kit into my-workspace/
   - Create these subfolders: output/research-reports, output/presentations, output/investor-materials, partner-facing/, final/
   - Make the hook scripts executable (chmod +x on Mac/Linux, or skip on Windows)

4. SET UP USER-LEVEL CONFIG — these apply to all my projects:
   - Check if I already have a settings file at ~/.claude/settings.json
   - If I don't have one, copy user-level-config/user-settings.json to ~/.claude/settings.json
   - If I do have one, merge the "extraKnownMarketplaces" entries into my existing file
   - Create ~/.claude/skills/cost-aware-router/ and copy the SKILL.md from user-level-config/skills/cost-aware-router/
   - Create ~/.claude/skills/partner-scorecard/ and copy the SKILL.md from user-level-config/skills/partner-scorecard/
   - Create ~/.claude/skills/executive-briefing-prep/ and copy the SKILL.md from user-level-config/skills/executive-briefing-prep/

5. VERIFY everything works:
   - Confirm the .claude/hooks/ scripts exist in my-workspace and are executable
   - Confirm the plugins were installed
   - Confirm all three skills exist under ~/.claude/skills/
   - Tell me if anything failed and how to fix it

6. Show me a summary of what was set up and what I can do next.

Handle macOS vs Windows differences automatically. If a step doesn't apply to my OS, skip it and tell me.
```

### Step 3 — Open Your Workspace and Go

```
# Mac
cd ~/Documents/my-workspace && claude

# Windows
cd %USERPROFILE%\Documents\my-workspace && claude
```

Or open the Claude Code desktop app and point it at `my-workspace`.

**Open `CHEAT-SHEET.html` in your browser** — it's a visual quick-reference with click-to-copy prompts for everything below. Keep it as a tab while you work.

Now just start talking to Claude:

| Try This | What You Get |
|----------|-------------|
| *"Research the competitive landscape for [your industry]"* | Cited research report with executive summary |
| *"Create a pitch deck for our Series A"* | Professional HTML presentation |
| *"Score these partners: Acme, Globex, Initech"* | Ranked comparison matrix (1-5 scoring) |
| *"I'm meeting with [Name] at [Company] tomorrow — prep me"* | One-page briefing with talking points |
| *"Write a business case for [your proposal]"* | Structured doc with ROI and risk analysis |
| *"Draft a LinkedIn post about [your news]"* | Ready-to-post content |

**That's it. You're set up.** Everything below is reference material — expand any section to learn more.

---

<details>
<summary><strong>What's in the Kit?</strong> — 6 plugins, 5 guardrails, 3 skills (click to expand)</summary>

### Plugins — expand what Claude can do

| Plugin | What It Adds |
|--------|-------------|
| **superpowers** | Claude brainstorms and asks questions before diving in — instead of giving you generic first-draft output |
| **everything-claude-code** | 150+ skills: deep-research, market-research, frontend-slides, investor-materials, investor-outreach, article-writing, content-engine, product-lens |
| **frontend-design** | Professional, distinctive visuals — fights the generic, template-y AI look |
| **claude-skills** | 34 C-level advisory skills (CEO/CFO/CRO advisors, board-deck-builder, M&A-playbook, competitive-intel, scenario-war-room) + finance and business-growth skills |
| **decision-log** | Tracks decisions across conversations — options considered, rationale, outcome |
| **elements-of-style** | Clear, direct writing — fights verbose corporate prose |

### Guardrails — protect your work automatically

| Guardrail | What It Does |
|-----------|-------------|
| **Final folder lock** | Files in `final/` or `approved/` can't be accidentally changed |
| **Revision guard** | Prevents Claude from rewriting your whole document when you asked for one small edit |
| **Main branch guard** | Blocks direct commits to main branch (only applies if you use git) |
| **Confidentiality check** | Warns when writing to `partner-facing/` or `external/` directories — reminds Claude to check for internal data. You define what's confidential in CLAUDE.md |
| **Number consistency** | Catches "$4.2M ARR" on slide 3 and "$4.1M ARR" on slide 7 — before your board does |

### Skills — structured workflows for repeat tasks

| Skill | What It Does |
|-------|-------------|
| **cost-aware-router** | Uses cheaper AI models for simple tasks, saves the expensive model for complex judgment. Cuts cost without cutting quality |
| **partner-scorecard** | Scores partners on 7 dimensions (strategic fit, market reach, financial strength, etc.) — 1-5 scale, ranked comparison matrix. Same criteria every time |
| **executive-briefing-prep** | One-page pre-meeting brief: background, recent news, relationship history, talking points, recommended ask. Done in minutes, saves 30-45 min per meeting |

</details>

<details>
<summary><strong>How the Guardrails Work</strong> (click to expand)</summary>

### The "Final Folder" Pattern
When you're happy with a deliverable, tell Claude:
```
"Move the pitch deck to the final folder"
```
Now it's protected. If you later say "update the pitch deck," Claude works on the draft in `output/`, not your approved version.

### The Revision Guardrail

**Without it:** You say "make the market sizing more conservative" — Claude rewrites your entire 20-page report, changes your intro, loses your specific wording.

**With it:** Claude gets a reminder, surgically updates just that section, leaves everything else untouched.

### The Confidentiality Guard
When Claude writes to `partner-facing/`, `external/`, or `shared/` directories, it gets a warning to check for confidential data — revenue figures, margins, valuations, or other partners' deal terms.

You control what counts as confidential. Open `CLAUDE.md` in your workspace and fill in the "Confidential Information" section.

### The Number Consistency Check
After Claude writes a document, this scans for the same business metric appearing with different values — catching things like "$4.2M ARR" on one slide and "$4.1M ARR" on another.

</details>

<details>
<summary><strong>Folder Structure</strong> (click to expand)</summary>

```
my-workspace/
  CLAUDE.md                  <-- Your project context (fill this in!)
  EXAMPLE-PROMPTS.md         <-- Copy-paste prompt templates
  CHEAT-SHEET.html           <-- Open in browser for visual quick-reference
  .claude/
    settings.json            <-- Plugin + hook config
    hooks/
      guard-final-content.sh
      revision-guardrail.sh
      guard-main-branch.sh
      confidentiality-guard.sh
      number-consistency-check.sh
  output/                    <-- Work in progress
    research-reports/
    presentations/
    investor-materials/
  partner-facing/            <-- External docs (confidentiality-checked)
  final/                     <-- Approved deliverables (protected)
```

</details>

<details>
<summary><strong>Power-Ups</strong> — live web research, Google Workspace, CRM (optional, click to expand)</summary>

### What Is MCP?

MCP is how you give Claude Code new abilities — like searching the live web or reading your Google Sheets. Each "MCP server" is a small connector that runs on your machine. You set it up once, and Claude automatically uses it when relevant. You don't have to tell Claude which tool to use — it picks the right one.

### Research Tools

#### Gemini Deep Research (Recommended)

Thorough, multi-source research with citations. Takes 3-20 minutes per query. ~$2-5 per query.

**Setup — paste into Claude Code:**

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

**Get your API key:** Go to https://aistudio.google.com/apikey → Sign in → Create API Key → replace `MY_API_KEY_HERE` above.

#### Exa Web Search (Faster Alternative)

Results in seconds. Good for quick lookups, company searches, current news.

**Setup — paste into Claude Code:**

```
I want to set up Exa web search so you can search the live web for me.

Please add this MCP server to my Claude Code configuration:

Server name: exa-web-search
Command: npx
Args: -y exa-mcp-server
Environment variable: EXA_API_KEY = MY_API_KEY_HERE

Add it to my user-level MCP config so it works across all my projects.
```

**Get your API key:** Go to https://exa.ai → Create account → API settings → replace `MY_API_KEY_HERE` above.

> **Using both?** Claude automatically picks Exa for quick lookups and Gemini for deep analysis.

### Productivity Tools

#### Google Workspace (Sheets, Docs, Slides, Drive)

**Setup — paste into Claude Code:**

```
I want to connect Claude to my Google Workspace so you can read and write my Google Sheets, Docs, and Drive files.

Please add this MCP server to my Claude Code configuration:

Server name: google-workspace
Command: npx
Args: -y @anthropic-ai/google-workspace-mcp

Add it to my user-level MCP config so it works across all my projects.
Follow the OAuth setup instructions to connect my Google account.
```

#### Notion

**Setup — paste into Claude Code:**

```
I want to connect Claude to my Notion workspace.

Please add this MCP server to my Claude Code configuration:

Server name: notion
Transport: http
URL: https://mcp.notion.com/mcp

Add it to my user-level MCP config so it works across all my projects.
Follow the authentication instructions to connect my Notion account.
```

### CRM & Data Tools

| Tool | What It Connects | Install Command |
|------|-----------------|----------------|
| **Salesforce** (official) | Deals, accounts, pipeline data | `claude mcp add salesforce -- npx -y @salesforce/mcp` |
| **HubSpot** (official) | Contacts, companies, deals (read-only) | `claude mcp add hubspot -- npx -y @hubspot/mcp-server` |
| **Confluence/Jira** (official) | Knowledge bases, project tracking | `claude mcp add atlassian --transport http --url https://mcp.atlassian.com/v1/mcp` |
| **Slack** (official) | Channel history, send messages | See [Slack MCP docs](https://docs.slack.dev/ai/slack-mcp-server/) |

</details>

<details>
<summary><strong>Tips for Best Results</strong> (click to expand)</summary>

1. **Let the brainstorming happen.** When Claude asks questions before working, answer them. That's the superpowers plugin making sure the output matches what you need.

2. **Fill in CLAUDE.md.** Add your company info, audience, confidential terms, and style preferences. The more context you give, the less you repeat every conversation.

3. **Paste your raw material.** Meeting notes, rough outlines, data, competitor URLs, previous versions — Claude works best with something to work with.

4. **Ask for revisions, not rewrites.** "Make the market sizing more conservative" beats "redo the whole thing."

5. **Use the final/ folder.** When something is approved, move it there to protect it.

6. **Use partner-facing/ for external docs.** Anything in this folder triggers the confidentiality check.

7. **Start a new conversation when things get slow.** Long conversations use more context. If Claude seems to be losing the thread, start fresh.

</details>

<details>
<summary><strong>Troubleshooting</strong> (click to expand)</summary>

**"Permission denied" when hooks run:**
Ask Claude: *"Make the hook scripts in .claude/hooks/ executable."*

**Plugins don't seem active:**
Run `/install-plugin` again for each one. Or ask Claude: *"Check if my plugins are installed and active."*

**Claude rewrites entire files when you asked for small changes:**
Ask Claude: *"Check that .claude/hooks/revision-guardrail.sh exists and is executable."*

**Number consistency warnings on intentional differences:**
If your document shows metrics across different time periods (e.g., "ARR was $3M in Q1, now $4.2M"), the hook may flag it. That's expected — confirm and continue.

**Something else isn't working:**
Just tell Claude what's wrong. It can usually diagnose and fix configuration issues itself.

</details>

---

## License

MIT License. Use it, modify it, share it. See [LICENSE](LICENSE) for details.

Created by **[Vignesh Rama](https://www.linkedin.com/in/vramapro/)**
