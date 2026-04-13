#!/bin/sh
# PreToolUse hook: reminds Claude to make targeted edits, not full rewrites.
#
# The #1 problem business users hit: you ask Claude to fix one paragraph and
# it rewrites the entire document. This hook fires on every Write and reminds
# Claude to preserve what's already been reviewed.
#
# Non-blocking (exit 0). No external dependencies (no python3, no jq).

input=$(cat)

# Extract tool_name from JSON using grep+sed
tool_name=$(echo "$input" | grep -o '"tool_name"[[:space:]]*:[[:space:]]*"[^"]*"' | head -1 | sed 's/.*"tool_name"[[:space:]]*:[[:space:]]*"//;s/"$//')

# Extract file_path from JSON using grep+sed
file_path=$(echo "$input" | grep -o '"file_path"[[:space:]]*:[[:space:]]*"[^"]*"' | head -1 | sed 's/.*"file_path"[[:space:]]*:[[:space:]]*"//;s/"$//')

# Only fire on content files (md, html, txt, csv), not config/json
case "$file_path" in
  *.md|*.html|*.txt|*.csv|*.rtf)
    ;;
  *)
    exit 0
    ;;
esac

# Only warn on Write (full file replacement), not Edit (targeted changes)
if [ "$tool_name" = "Write" ]; then
  {
    echo ""
    echo "-------------------------------------------------------------"
    echo "REVISION REMINDER"
    echo "-------------------------------------------------------------"
    echo ""
    echo "You are about to REPLACE the entire file:"
    echo "  $file_path"
    echo ""
    echo "Before proceeding, verify:"
    echo "  - Did the user ask for a full rewrite, or just specific changes?"
    echo "  - If specific changes: use the Edit tool instead (preserves the rest)"
    echo "  - Are you keeping the user's approved tone, structure, and wording?"
    echo "  - Are you preserving sections the user didn't ask to change?"
    echo ""
    echo "If the user said 'fix the intro' -- only change the intro."
    echo "If the user said 'rewrite this' -- full replacement is fine."
    echo "-------------------------------------------------------------"
    echo ""
  } >&2
fi

exit 0
