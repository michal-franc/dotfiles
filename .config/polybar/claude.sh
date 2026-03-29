#!/bin/bash

# Polybar module: Show active Claude Code instances and their status
# Each icon is clickable - clicking focuses that specific Claude's terminal window
# Checks transcript file modification time to determine state:
# - File modified in last 10s = working (Claude is actively writing)
# - Otherwise = idle (waiting for user input)

ICON_WORKING=$'\uf0e7'   # nf-fa-bolt U+F0E7
ICON_IDLE=$'\uf04c'      # nf-fa-pause U+F04C

PROJECTS_DIR="$HOME/.claude/projects"
ACTIVE_THRESHOLD=10  # seconds
now=$(date +%s)

# Get interactive claude PIDs (exclude automated/pipe/zombie)
mapfile -t claude_pids < <(ps -eo pid,stat,tty,comm,args --no-headers | \
    grep -E '^[[:space:]]*[0-9]+[[:space:]]+[A-Z][a-z]*\+?[[:space:]]+pts/.*[[:space:]]claude[[:space:]]' | \
    grep -v -- '--input-format' | \
    grep -v -- ' -p ' | \
    grep -v '^Z' | \
    awk '{print $1}')

if [ ${#claude_pids[@]} -eq 0 ]; then
    exit 1
fi

# Build i3 window ID -> con_id map
declare -A xid_to_conid
while IFS='|' read -r xid conid; do
    xid_to_conid[$xid]=$conid
done < <(i3-msg -t get_tree 2>/dev/null | python3 -c "
import json, sys
tree = json.load(sys.stdin)
def find(node):
    if node.get('window'):
        print(f\"{node['window']}|{node['id']}\")
    for c in node.get('nodes', []) + node.get('floating_nodes', []):
        find(c)
find(tree)
" 2>/dev/null)

icons=""
for cpid in "${claude_pids[@]}"; do
    # Determine working/idle: Claude PID -> cwd -> project transcript
    cwd=$(readlink "/proc/$cpid/cwd" 2>/dev/null)
    status="idle"
    if [ -n "$cwd" ]; then
        project_dir="${cwd//\//-}"
        transcript_dir="$PROJECTS_DIR/$project_dir"
        if [ -d "$transcript_dir" ]; then
            latest_ts=$(find "$transcript_dir" -name '*.jsonl' ! -name 'agent-*' -printf '%T@\n' 2>/dev/null | sort -rn | head -1)
            if [ -n "$latest_ts" ]; then
                age=$(( now - ${latest_ts%.*} ))
                [ "$age" -le "$ACTIVE_THRESHOLD" ] && status="working"
            fi
        fi
    fi

    # Resolve i3 con_id: Claude PID -> parent -> WINDOWID -> con_id
    # For direct terminals: parent is a shell with WINDOWID
    # For tmux: parent is tmux server, so find the attached tmux client instead
    con_id=""
    ppid=$(ps -o ppid= -p "$cpid" 2>/dev/null | tr -d ' ')
    window_id=""
    if [ -n "$ppid" ]; then
        parent_comm=$(ps -o comm= -p "$ppid" 2>/dev/null)
        if [[ "$parent_comm" == tmux* ]]; then
            # tmux-based: find the client attached to this server's session
            client_pid=$(tmux list-clients -F '#{client_pid}' 2>/dev/null | while read -r cp; do
                # check if this client's tmux process parent matches our tmux server
                cp_ppid=$(ps -o ppid= -p "$cp" 2>/dev/null | tr -d ' ')
                if [ -r "/proc/$cp_ppid/environ" ]; then
                    echo "$cp_ppid"
                    break
                fi
            done)
            if [ -n "$client_pid" ] && [ -r "/proc/$client_pid/environ" ]; then
                window_id=$(tr '\0' '\n' < "/proc/$client_pid/environ" 2>/dev/null | grep '^WINDOWID=' | cut -d= -f2)
            fi
        elif [ -r "/proc/$ppid/environ" ]; then
            window_id=$(tr '\0' '\n' < "/proc/$ppid/environ" 2>/dev/null | grep '^WINDOWID=' | cut -d= -f2)
        fi
    fi
    if [ -n "$window_id" ]; then
        con_id="${xid_to_conid[$window_id]}"
    fi

    # Build icon with click action
    if [ "$status" = "working" ]; then
        icon="%{T4}%{F#39d353}${ICON_WORKING}%{F-}%{T-}"
    else
        icon="%{T4}%{F#FF8C00}${ICON_IDLE}%{F-}%{T-}"
    fi

    if [ -n "$con_id" ]; then
        icons="${icons}%{A1:i3-msg [con_id=${con_id}] focus:}${icon}%{A} "
    else
        icons="${icons}${icon} "
    fi
done

# Trim trailing space
icons="${icons% }"

echo "${icons}"
