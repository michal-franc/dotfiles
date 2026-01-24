# Polybar Taskwarrior Integration

Display Taskwarrior status in polybar - active task, completed count, context.

## Components

| File | Description |
|------|-------------|
| `.config/polybar/activetask.sh` | Shows currently active task (started with `task start`) |
| `.config/polybar/donetoday.sh` | Count of tasks completed today |
| `.config/polybar/taskstoday.sh` | Count of tasks scheduled for today |
| `.config/polybar/activecontext.sh` | Current Taskwarrior context |
| `.config/polybar/pomodoro-stats.sh` | Pomodoro completion/failure stats |

## Polybar Config

Add modules to `~/.config/polybar/config`:

```ini
[module/activetask]
type = custom/script
exec = ~/.config/polybar/activetask.sh
interval = 5
format-prefix = " "
format-prefix-foreground = ${colors.primary}

[module/donetoday]
type = custom/script
exec = ~/.config/polybar/donetoday.sh
interval = 30
format-prefix = " "
format-prefix-foreground = ${colors.success}

[module/taskstoday]
type = custom/script
exec = ~/.config/polybar/taskstoday.sh
interval = 30
format-prefix = " "
format-prefix-foreground = ${colors.warning}

[module/pomodoro]
type = custom/script
exec = ~/.config/polybar/pomodoro-stats.sh
interval = 5
```

## Dependencies

- taskwarrior
- jq (for pomodoro stats)

## How It Works

### activetask.sh
Queries `task +ACTIVE` to find the currently running task and displays project + description.

### donetoday.sh
Counts tasks with `end:today` status.

### taskstoday.sh
Counts pending tasks with `+today` tag or `scheduled:today`.

### pomodoro-stats.sh
Reads `/tmp/pomodoro-stats` JSON file (written by pomodoro app like gopom) and displays completions/failures.

## Installation

1. Copy scripts to `~/.config/polybar/`
2. Make executable: `chmod +x ~/.config/polybar/*.sh`
3. Add modules to polybar config
4. Restart polybar: `polybar-msg cmd restart`
