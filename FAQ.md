# Frequently Asked Questions

Common problems and fixes, organized by when they happen.

---

## Setup Problems

### "The setup prompt ran but some plugins failed to install."

Run the setup prompt again — plugin installs are safe to retry. If a specific plugin keeps failing, ask Claude:
*"The [plugin name] plugin failed to install. Show me the exact error and help me fix it."*

If you see **"Marketplace file not found"**: this happens with `cc-plugin-decision-log` and `the-elements-of-style` because those repos don't have the standard marketplace structure. The setup prompt handles this with a wrapper approach — make sure you ran the full prompt from Step 2, not just part of it.

---

### "I get an error about the Xcode license on Mac."

Your system's built-in git is blocked until Apple's license is accepted. The easiest fix — install a separate git that doesn't require it:

```
brew install git
```

Then tell Claude: *"Use /opt/homebrew/bin/git for all git commands."*

If you don't have Homebrew yet, install it first: https://brew.sh

---

### "I get 'node: command not found'."

Node.js is required by the decision-log plugin. Install it:

- **Mac:** `brew install node`
- **Windows:** Download from https://nodejs.org/en/download/
- **Linux:** `sudo apt install nodejs`

After installing, re-run the setup prompt from Step 2.

---

### "I get 'claude: command not found'."

Claude Code isn't in your terminal's PATH. Try:
- Close and reopen Terminal, then try again
- On Mac: run `export PATH="$HOME/.claude/bin:$PATH"` then retry
- If neither works, reinstall Claude Code from https://docs.anthropic.com/en/docs/claude-code/overview

---

### "The setup said my ~/.claude/settings.json already exists."

That's fine — it means you already use Claude Code for other things. The setup merges just the `extraKnownMarketplaces` entries, leaving everything else untouched.

If the merge didn't happen automatically, ask Claude: *"Show me my ~/.claude/settings.json and the user-level-config/user-settings.json from the starter kit, then merge the extraKnownMarketplaces entries without removing anything existing."*

---

### "Permission denied when hooks run."

The hook scripts need to be marked as executable. Run this from inside your workspace folder:

```
chmod +x .claude/hooks/*.sh
```

Or ask Claude: *"Make all the hook scripts in .claude/hooks/ executable."*

---

### "I'm on Windows and chmod doesn't work."

`chmod` is a Mac/Linux command — skip it on Windows. Claude Code handles script permissions differently on Windows. If hooks still don't run, make sure you have **Git for Windows** installed (https://git-scm.com/download/win), which provides the shell that runs hook scripts.

---

## Plugin Problems

### "I installed the plugins but they don't seem to be doing anything."

**You need to restart Claude Code after installing plugins.** Plugins installed mid-session don't activate until the next session.

Close Claude Code completely, reopen it, navigate to your workspace, and try again.

To confirm plugins loaded, type `/plugins` in Claude Code — you should see your installed plugins listed.

---

### "How do I check which plugins are actually active?"

Ask Claude: *"Run `claude plugin list` and tell me which plugins are installed and enabled."*

Or type `/plugins` in Claude Code to see what's active in the current session.

---

### "A plugin shows as installed but the skills still don't appear."

Two common causes:

1. **Didn't restart** — close and reopen Claude Code completely
2. **Wrong scope** — if the plugin was installed for a different project only, it won't be active here. Reinstall at user level so it works everywhere:
   ```
   claude plugin install [plugin-name]@[marketplace] -s user
   ```

---

### "How do I update plugins to get the latest version?"

```
claude plugin update [plugin-name]@[marketplace]
```

To update all at once: `claude plugin update --all`

Restart Claude Code after updating.

---

### "How do I remove a plugin I don't want?"

```
claude plugin uninstall [plugin-name]@[marketplace] -s user
```

Example:
```
claude plugin uninstall the-elements-of-style@the-elements-of-style -s user
```

---

## Guardrail / Hook Problems

### "Claude is still rewriting my whole document even with the revision guardrail."

The revision guardrail is a reminder to Claude, not a hard block. It works most of the time but isn't 100% foolproof.

To help it work better:
- Be specific: *"Only update the executive summary section"* rather than *"improve this document"*
- If Claude still rewrites everything, say: *"You replaced the whole file. Please use the Edit tool and only change what I asked."*

---

### "The number consistency check keeps flagging things that are correct."

The check warns when the same metric (ARR, revenue, etc.) appears with different values in the same file. If the difference is intentional — showing before/after or growth over time — just tell Claude: *"Those numbers are intentional, they represent different time periods. Continue."*

The check is advisory and never blocks Claude from writing.

---

### "I accidentally edited a file in the final/ folder."

Ask Claude: *"Undo the last change to [filename]"*

Or if your workspace is a git repo: `git checkout -- path/to/file`

Going forward the guardrail should catch it. If it didn't, check that hooks are still executable: `ls -l .claude/hooks/`

---

### "Hooks seem to be running but Claude ignores the warnings."

Advisory hooks (revision reminder, confidentiality check, number consistency) show Claude a warning but don't force a stop — Claude makes the final call. The `final/` folder lock is the only hard block (exit code 2).

If Claude consistently ignores a specific warning, reinforce it in your message: *"The hook warned you about [X]. Please address that before proceeding."*

---

## Everyday Usage

### "Claude doesn't seem to know anything about my company."

Open `CLAUDE.md` in your workspace and fill it in. This file is what Claude reads at the start of every session — without it, Claude has no idea who you are or what's confidential.

Replace every placeholder example with your real information. The more specific, the better.

---

### "Claude isn't saving files to the right folders."

Check the "Output Preferences" section in your `CLAUDE.md` — make sure those folder paths are filled in. Also confirm Claude Code is opened from inside `my-workspace`, not from somewhere else:

```
cd ~/Documents/my-workspace && claude
```

---

### "Claude seems to forget what we discussed in earlier sessions."

That's expected — Claude doesn't automatically remember previous conversations. Two ways to handle it:

1. **Decision-log plugin:** Tell Claude *"Log this decision: [what was decided and why]"* — it saves decisions that get injected into future sessions automatically.
2. **CLAUDE.md:** Anything you always want Claude to know (company background, recurring constraints, preferred formats) should live there — it's re-read every session.

---

### "Can I use this kit across more than one project?"

Yes. Plugins and skills are installed at the user level and work across all projects. The guardrail hooks are project-specific.

For a second project:
1. Create a new folder (e.g. `~/Documents/project-two`)
2. Copy `.claude/`, `CLAUDE.md`, and `EXAMPLE-PROMPTS.md` from `my-workspace` into it
3. Update `CLAUDE.md` with the new project's context
4. Open Claude Code from that folder

---

### "I want to protect a different folder, not just final/."

Open `.claude/hooks/guard-final-content.sh` and find this line:

```sh
if echo "$file_path" | grep -qE '/(final|approved)/'; then
```

Add your folder name to the pattern. For example, to also protect a `signed/` folder:

```sh
if echo "$file_path" | grep -qE '/(final|approved|signed)/'; then
```

Save the file. The change takes effect immediately — no restart needed.

---

### "How do I reset everything and start fresh?"

Remove all plugins:
```
claude plugin uninstall superpowers@superpowers-dev -s user
claude plugin uninstall everything-claude-code@everything-claude-code -s user
claude plugin uninstall frontend-design@claude-plugins-official -s user
claude plugin uninstall cc-plugin-decision-log@cc-plugin-decision-log -s user
claude plugin uninstall the-elements-of-style@the-elements-of-style -s user
```

Reset your workspace: delete the `my-workspace` folder and re-run the setup prompt from Step 2.

Reset user-level config: delete `~/.claude/settings.json` and `~/.claude/skills/`, then re-run Step 5 of the setup prompt.

---

### "Something is broken and none of these answers help."

Tell Claude exactly what you tried and what happened — it can diagnose and fix most configuration issues on its own.

If the problem is with Claude Code itself (not this kit): https://github.com/anthropics/claude-code/issues
