#!/bin/sh
# PreToolUse hook: warns when writing to external-facing directories.
#
# Files in partner-facing/, external/, or shared/ directories may be seen
# by people outside your company. This hook reminds Claude to scrub
# confidential data (revenue, margins, valuation, internal metrics)
# before writing to those locations.
#
# Non-blocking (exit 0). No external dependencies (no python3, no jq).

input=$(cat)

# Extract file_path from JSON using grep+sed
file_path=$(echo "$input" | grep -o '"file_path"[[:space:]]*:[[:space:]]*"[^"]*"' | head -1 | sed 's/.*"file_path"[[:space:]]*:[[:space:]]*"//;s/"$//')

if echo "$file_path" | grep -qiE '/(partner-facing|external|shared)/'; then
  {
    echo ""
    echo "-------------------------------------------------------------"
    echo "CONFIDENTIALITY CHECK"
    echo "-------------------------------------------------------------"
    echo ""
    echo "This file is in an external-facing directory:"
    echo "  $file_path"
    echo ""
    echo "Before writing, verify this content does NOT include:"
    echo "  - Internal revenue, margin, or valuation figures"
    echo "  - Unannounced product plans or roadmap details"
    echo "  - Other partners' confidential data or deal terms"
    echo "  - Internal-only metrics not approved for sharing"
    echo ""
    echo "Check CLAUDE.md for the list of confidential terms."
    echo "If any confidential data is present, remove or redact it."
    echo "-------------------------------------------------------------"
    echo ""
  } >&2
fi

exit 0
