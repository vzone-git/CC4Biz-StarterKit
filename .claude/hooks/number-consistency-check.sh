#!/bin/sh
# PostToolUse hook: checks for inconsistent metrics in written documents.
#
# After Claude writes a content file, this scans for common business metrics
# (ARR, MRR, revenue, valuation) that appear with multiple different dollar
# values. Catches the classic problem: slide 3 says "$4.2M ARR" but slide 7
# says "$4.1M ARR."
#
# Non-blocking (exit 0). No external dependencies (no python3, no jq).

input=$(cat)

# Only fire on Write operations
tool_name=$(echo "$input" | grep -o '"tool_name"[[:space:]]*:[[:space:]]*"[^"]*"' | head -1 | sed 's/.*"tool_name"[[:space:]]*:[[:space:]]*"//;s/"$//')
[ "$tool_name" = "Write" ] || exit 0

# Only check content files (not config, code, etc.)
file_path=$(echo "$input" | grep -o '"file_path"[[:space:]]*:[[:space:]]*"[^"]*"' | head -1 | sed 's/.*"file_path"[[:space:]]*:[[:space:]]*"//;s/"$//')
case "$file_path" in
  *.md|*.html|*.txt) ;;
  *) exit 0 ;;
esac
[ -f "$file_path" ] || exit 0

# For each common metric label, find all associated dollar values.
# If the same label has more than one distinct value, warn.
warnings=""
for metric in ARR MRR revenue valuation; do
  values=$(grep -i "$metric" "$file_path" 2>/dev/null | grep -oE '\$[0-9][0-9,.]*[KMBTkmbt]?' | sort -u)
  num_distinct=$(echo "$values" | grep -c '\$' 2>/dev/null)
  if [ "$num_distinct" -gt 1 ]; then
    flat=$(echo "$values" | tr '\n' ', ' | sed 's/,$//')
    warnings="${warnings}  - ${metric}: found ${flat}\n"
  fi
done

if [ -n "$warnings" ]; then
  {
    echo ""
    echo "-------------------------------------------------------------"
    echo "NUMBER CONSISTENCY WARNING"
    echo "-------------------------------------------------------------"
    echo ""
    echo "The same metric appears with different values in:"
    echo "  $file_path"
    echo ""
    printf "%b" "$warnings"
    echo ""
    echo "If these represent different time periods, this may be fine."
    echo "Otherwise, pick one correct number and fix the others."
    echo "-------------------------------------------------------------"
    echo ""
  } >&2
fi

exit 0
