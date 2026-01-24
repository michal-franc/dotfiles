#!/bin/bash
# Display GitHub-style activity boxes for task completions
# Green border (underline) indicates a daily note exists for that day

DAYS=14
DAILY_NOTES_DIR="/home/mfranc/Work/notes/Daily"

# GitHub-style green color scale (dark theme)
COLOR_0="#333333"      # No tasks - dark gray
COLOR_1="#0e4429"      # 1-2 tasks - dark green
COLOR_2="#006d32"      # 3-4 tasks - medium green
COLOR_3="#26a641"      # 5-6 tasks - bright green
COLOR_4="#39d353"      # 7+ tasks - brightest green
BORDER_COLOR="#39d353" # Green border for daily note

get_color() {
    local count=$1
    if [ "$count" -eq 0 ]; then
        echo "$COLOR_0"
    elif [ "$count" -le 2 ]; then
        echo "$COLOR_1"
    elif [ "$count" -le 4 ]; then
        echo "$COLOR_2"
    elif [ "$count" -le 6 ]; then
        echo "$COLOR_3"
    else
        echo "$COLOR_4"
    fi
}

has_daily_note() {
    local date=$1
    local year="${date:0:4}"
    # Check both in year folder and root Daily folder
    if [ -f "$DAILY_NOTES_DIR/$year/🗓️ $date.md" ] || \
       [ -f "$DAILY_NOTES_DIR/🗓️ $date.md" ] || \
       [ -f "$DAILY_NOTES_DIR/$year/$date.md" ] || \
       [ -f "$DAILY_NOTES_DIR/$date.md" ]; then
        return 0
    fi
    return 1
}

# Get task counts per day for the last N days
declare -A task_counts
while IFS= read -r line; do
    count=$(echo "$line" | awk '{print $1}')
    dateraw=$(echo "$line" | awk '{print $2}')
    task_counts[$dateraw]=$count
done < <(task rc.verbose=nothing rc.gc=no end.after:today-${DAYS}days status:completed export 2>/dev/null | \
         jq -r '.[].end // empty' 2>/dev/null | \
         cut -d'T' -f1 | sort | uniq -c)

output=""
for i in $(seq $((DAYS-1)) -1 0); do
    date=$(date -d "today - $i days" +%Y-%m-%d)
    datekey=$(date -d "today - $i days" +%Y%m%d)
    count=${task_counts[$datekey]:-0}
    color=$(get_color "$count")

    if has_daily_note "$date"; then
        # Box with green underline for daily note
        output+="%{u$BORDER_COLOR}%{+u}%{F$color}█%{F-}%{-u}"
    else
        # Box without underline
        output+="%{F$color}█%{F-}"
    fi
done

echo "$output"
