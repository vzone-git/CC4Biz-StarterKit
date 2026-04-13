#!/bin/sh
# PreToolUse hook: blocks direct commits to main/master.
#
# If git is installed and this is a git repo, prevents Claude from committing
# directly to the main branch. If git is not installed or this isn't a repo,
# silently does nothing.
#
# No external dependencies (no python3, no jq).

input=$(cat)

# Extract command from JSON using grep+sed
command=$(echo "$input" | grep -o '"command"[[:space:]]*:[[:space:]]*"[^"]*"' | head -1 | sed 's/.*"command"[[:space:]]*:[[:space:]]*"//;s/"$//')

# Only check git commit and merge
case "$command" in
  *git\ commit*|*git\ merge*)
    ;;
  *)
    exit 0
    ;;
esac

# If git is not installed, skip silently
if ! command -v git >/dev/null 2>&1; then
  exit 0
fi

# If not inside a git repo, skip silently
if ! git -C "${CLAUDE_PROJECT_DIR:-.}" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  exit 0
fi

# Get current branch
current_branch=$(git -C "${CLAUDE_PROJECT_DIR:-.}" rev-parse --abbrev-ref HEAD 2>/dev/null)

if [ "$current_branch" = "main" ] || [ "$current_branch" = "master" ]; then
  echo "BLOCKED: Direct commit to '$current_branch' is not allowed." >&2
  echo "" >&2
  echo "  Create a working branch first:" >&2
  echo "    git checkout -b your-branch-name" >&2
  echo "" >&2
  echo "  This keeps your main branch as a clean 'last good version'" >&2
  echo "  while you iterate on changes." >&2
  exit 2
fi

exit 0
