# Claude Code Starter Kit for Business & Research

> Plugins, guardrails, and skills that turn Claude Code into a business machine — sharper research, professional deliverables, and built-in protection for your approved work.

**No coding experience needed.** Setup takes 5–10 minutes. | **[Open Cheat Sheet](https://vzone-git.github.io/CC4Biz-StarterKit/CHEAT-SHEET.html)**

Created by **[Vignesh Rama](https://www.linkedin.com/in/vramapro/)** | [MIT License](LICENSE)

---

## Before You Start — Prerequisites

You need three things installed before running setup:

| Requirement | Check | Install |
|-------------|-------|---------|
| **Claude Code** | Type `claude --version` in Terminal | [Install guide](https://docs.anthropic.com/en/docs/claude-code/overview) |
| **Node.js** | Type `node --version` in Terminal | [nodejs.org](https://nodejs.org/en/download/) |
| **git** | Type `git --version` in Terminal | Comes with Xcode tools on Mac; [git-scm.com](https://git-scm.com/download/win) on Windows |

> **Mac tip:** If `git --version` gives you an error about the Xcode license, see [Troubleshooting](#troubleshooting) below.

---

## Get Started in 3 Steps

### Step 1 — Download the Kit

Click the green **"Code"** button at the top of this page, then **"Download ZIP."** Unzip it anywhere (Downloads folder is fine).

### Step 2 — Paste One Prompt

Open Claude Code and paste this entire block. Replace `STARTER_KIT_PATH` with where you unzipped the kit.

**Mac path example:** `~/Downloads/CC4Biz-StarterKit-main`
**Windows path example:** `C:\Users\YourName\Downloads\CC4Biz-StarterKit-main`

> **Not sure of the path?** Tell Claude: *"I downloaded a starter kit zip and unzipped it in my Downloads folder. Can you find it?"*

```
I just downloaded a Claude Code starter kit to set up my workspace for business research and presentations. The unzipped folder is at: STARTER_KIT_PATH

Please do the following:

1. READ the README.md in that folder so you understand what this kit contains.

2. CHECK PREREQUISITES:
   - Run: node --version
     If node is not found: on Mac run `brew install node`; on Windows go to https://nodejs.org/en/download/
   - Run: git --version
     If git fails on Mac with an "Xcode license" message: run `brew install git` and use /opt/homebrew/bin/git for any git commands in this session.

3. INSTALL PLUGINS — run these commands one by one:

   First, register the plugin marketplaces:
   claude plugin marketplace add obra/superpowers
   claude plugin marketplace add affaan-m/everything-claude-code

   Then install the standard plugins:
   claude plugin install superpowers@superpowers-dev -s user
   claude plugin install everything-claude-code@everything-claude-code -s user
   claude plugin install frontend-design@claude-plugins-official -s user

   For these two plugins the repos need a small wrapper to install correctly — do this for each:

   cc-plugin-decision-log:
   - Clone https://github.com/obra/cc-plugin-decision-log.git to a temporary folder (e.g. /tmp/cc-plugin-decision-log)
   - Write this exact content to <temp-folder>/.claude-plugin/marketplace.json:
     {"name":"cc-plugin-decision-log","plugins":[{"name":"cc-plugin-decision-log","source":"./","version":"0.1.0","description":"Logs decisions and problem-solving approaches to survive context compaction"}]}
   - Run: claude plugin marketplace add <temp-folder>
   - Run: claude plugin install cc-plugin-decision-log@cc-plugin-decision-log -s user

   the-elements-of-style:
   - Clone https://github.com/obra/the-elements-of-style.git to a temporary folder (e.g. /tmp/the-elements-of-style)
   - Write this exact content to <temp-folder>/.claude-plugin/marketplace.json:
     {"name":"the-elements-of-style","plugins":[{"name":"the-elements-of-style","source":"./","version":"1.0.0","description":"Writing guidance based on The Elements of Style"}]}
   - Run: claude plugin marketplace add <temp-folder>
   - Run: claude plugin install the-elements-of-style@the-elements-of-style -s user

4. SET UP MY WORKSPACE — Create a folder for my work:
   - Create a folder called "my-workspace" in my Documents folder
   - Copy the .claude/ folder (with settings.json and hooks/) from the starter kit into my-workspace/
   - Copy CLAUDE.md, EXAMPLE-PROMPTS.md, and CHEAT-SHEET.html from the starter kit into my-workspace/
   - Create these subfolders: output/research-reports, output/presentations, output/investor-materials, partner-facing/, final/
   - Make the hook scripts executable: chmod +x on Mac/Linux (skip on Windows)

5. SET UP USER-LEVEL CONFIG — these settings apply across all your projects:
   - Check if ~/.claude/settings.json already exists
   - If it doesn't: copy STARTER_KIT_PATH/user-level-config/user-settings.json to ~/.claude/settings.json
   - If it does: merge the "extraKnownMarketplaces" entries from user-settings.json into the existing file without removing any existing entries
   - Create ~/.claude/skills/cost-aware-router/ and copy the SKILL.md from user-level-config/skills/cost-aware-router/
   - Create ~/.claude/skills/partner-scorecard/ and copy the SKILL.md from user-level-config/skills/partner-scorecard/
   - Create ~/.claude/skills/executive-briefing-prep/ and copy the SKILL.md from user-level-config/skills/executive-briefing-prep/

6. VERIFY everything installed correctly:
   - Run: claude plugin list
   - Confirm hooks exist and are executable in my-workspace/.claude/hooks/
   - Confirm the three skills exist under ~/.claude/skills/
   - Tell me if anything failed and how to fix it

7. Show me a summary of what was set up and what I can do next.

8. IMPORTANT: Remind me that I need to restart Claude Code for the newly installed plugins to take effect.

Handle macOS vs Windows differences automatically. If a step doesn't apply to my OS, skip it and tell me.
```

> **After setup:** Restart Claude Code before testing plugins — they won't be active in the same session where they were installed.

### Step 3 — Open Your Workspace and Go

```
# Mac / Linux
cd ~/Documents/my-workspace && claude

# Windows
cd %USERPROFILE%\Documents\my-workspace && claude
```

Or open the Claude Code desktop app and point it at `my-workspace`.

**[Open the Cheat Sheet](https://vzone-git.github.io/CC4Biz-StarterKit/CHEAT-SHEET.html)** — a visual quick-reference with click-to-copy prompts. Bookmark it or keep it as a tab while you work.

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
<summary><strong>What's in the Kit?</strong> — 5 plugins, 5 guardrails, 3 skills (click to expand)</summary>

### Plugins — expand what Claude can do

| Plugin | What It Adds |
|--------|-------------|
| **superpowers** | Claude brainstorms and asks questions before diving in — instead of giving you generic first-draft output |
| **everything-claude-code** | 459 skills: deep-research, market-research, frontend-slides, investor-materials, investor-outreach, article-writing, content-engine, and more |
| **frontend-design** | Professional, distinctive visuals — fights the generic, template-y AI look |
| **decision-log** | Tracks decisions across conversations — options considered, rationale, outcome. Survives context compaction |
| **elements-of-style** | Clear, direct writing — fights verbose corporate prose |

### Guardrails — protect your work automatically

| Guardrail | What It Does |
|-----------|-------------|
| **Final folder lock** | Files in `final/` or `approved/` can't be accidentally changed |
| **Revision guard** | Prevents Claude from rewriting your whole document when you asked for one small edit |
| **Main branch guard** | Blocks direct commits to main branch (only relevant if you use git) |
| **Confidentiality check** | Warns when writing to `partner-facing/` or `external/` directories — reminds Claude to check for internal data. You define what's confidential in CLAUDE.md |
| **Number consistency** | Catches "$4.2M ARR" on slide 3 and "$4.1M ARR" on slide 7 — before your board does |

### Skills — structured workflows for repeat tasks

| Skill | What It Does |
|-------|-------------|
| **cost-aware-router** | Uses cheaper AI models for simple tasks, saves the expensive model for complex judgment. Cuts cost without cutting quality |
| **partner-scorecard** | Scores partners on 7 dimensions (strategic fit, market reach, financial strength, etc.) — 1-5 scale, ranked comparison matrix. Same criteria every time |
| **executive-briefing-prep** | One-page pre-meeting brief: background, recent news, relationship history, talking points, recommended ask. Done in minutes |

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
<summary id="troubleshooting"><strong>Troubleshooting</strong> (click to expand)</summary>

**Plugins don't seem active after setup:**
You must restart Claude Code after installing plugins — they don't activate mid-session. Close and reopen Claude Code, then test again.

**"Permission denied" when hooks run:**
Ask Claude: *"Make the hook scripts in .claude/hooks/ executable."*
Or run: `chmod +x my-workspace/.claude/hooks/*.sh`

**`git` error on Mac: "Xcode license agreements"**
Your system git is blocked until the Xcode license is accepted. The easiest fix — install Homebrew's git, which doesn't require any license agreement:
```
brew install git
```
Then tell Claude: *"Use /opt/homebrew/bin/git for all git operations."*

**`node` not found:**
Node.js is required by the decision-log plugin. Install it:
- Mac: `brew install node`
- Windows: Download from https://nodejs.org/en/download/
- Linux: `sudo apt install nodejs` or use your distro's package manager

**`claude plugin install` fails with "Marketplace file not found":**
Some plugin repos (like `cc-plugin-decision-log` and `the-elements-of-style`) don't have a built-in marketplace manifest. The setup prompt above handles this automatically. If you're installing manually, ask Claude: *"Help me install the cc-plugin-decision-log plugin — it needs a marketplace wrapper."*

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
