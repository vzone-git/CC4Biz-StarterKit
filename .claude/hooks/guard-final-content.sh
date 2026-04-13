#!/bin/sh
# PreToolUse hook: blocks edits to files inside final/ or approved/ directories.
#
# When you've finalized a deliverable (presentation, report, memo), move it
# to the final/ or approved/ folder. This hook prevents Claude from modifying
# it unless you explicitly ask.
#
# No external dependencies (no python3, no jq).

input=$(cat)

# Extract file_path from JSON using grep+sed (works on macOS and Windows Git Bash)
file_path=$(echo "$input" | grep -o '"file_path"[[:space:]]*:[[:space:]]*"[^"]*"' | head -1 | sed 's/.*"file_path"[[:space:]]*:[[:space:]]*"//;s/"$//')

if echo "$file_path" | grep -qE '/(final|approved)/'; then
  echo "BLOCKED: This file is in a protected directory (final/ or approved/)." >&2
  echo "" >&2
  echo "  Files in final/ and approved/ are locked to prevent accidental changes." >&2
  echo "  If you need to revise it:" >&2
  echo "    1. Copy it to a working directory first" >&2
  echo "    2. Or ask the user to move it out of final/" >&2
  echo "" >&2
  echo "  File: $file_path" >&2
  exit 2
fi

exit 0
