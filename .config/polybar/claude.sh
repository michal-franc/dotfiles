#!/bin/bash

# Polybar module: Show active Claude Code instances and their status
# Checks transcript file modification time to determine state:
# - File modified in last 10s = working (Claude is actively writing)
# - Otherwise = idle (waiting for user input)

# Icons (Nerd Font - using unicode escapes since literal chars get stripped)
ICON_WORKING=$'\uf0e7'   # nf-fa-bolt U+F0E7
ICON_IDLE=$'\uf04c'      # nf-fa-pause U+F04C

PROJECTS_DIR="$HOME/.claude/projects"
ACTIVE_THRESHOLD=10  # seconds

# Count interactive claude processes on a tty (exclude automated/pipe/zombie)
process_count=$(ps -eo stat,tty,comm,args --no-headers | \
    grep -E '^[A-Z][a-z]*[+]?[[:space:]]+pts/.*[[:space:]]claude[[:space:]]' | \
    grep -v -- '--input-format' | \
    grep -v -- ' -p ' | \
    grep -v '^Z' | \
    wc -l)

if [ "$process_count" -eq 0 ]; then
    exit 1
fi

# Count how many transcripts were modified in the last ACTIVE_THRESHOLD seconds
now=$(date +%s)
working=$(find "$PROJECTS_DIR" -name '*.jsonl' ! -name 'agent-*' -printf '%T@\n' 2>/dev/null | \
    while read -r ts; do
        age=$(( now - ${ts%.*} ))
        [ "$age" -le "$ACTIVE_THRESHOLD" ] && echo "w"
    done | wc -l)

# Clamp working to process_count (can't have more working than total)
[ "$working" -gt "$process_count" ] && working=$process_count
idle=$(( process_count - working ))

# Build icon string: working first, then idle
icons=""
for ((i=0; i<working; i++)); do
    icons="${icons}%{T4}%{F#39d353}${ICON_WORKING}%{F-}%{T-} "
done
for ((i=0; i<idle; i++)); do
    icons="${icons}%{T4}%{F#FF8C00}${ICON_IDLE}%{F-}%{T-} "
done

# Trim trailing space
icons="${icons% }"

echo "${icons}"
