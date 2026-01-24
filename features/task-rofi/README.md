# Task Rofi

Rofi-based interface for Taskwarrior task management.

## Components

| File | Description |
|------|-------------|
| `scripts/task-menu` | Main task picker with actions (done, start, stop, schedule, etc.) |
| `scripts/task-menu-today` | Quick view of today's tasks only |
| `scripts/task-quick-add` | Fast task creation with auto +today tag |

## Features

### task-menu
- Lists all pending tasks sorted by urgency
- Visual indicators: priority icons, recurrent tasks, today highlighting
- Actions: Done, Start/Stop, Today, Tomorrow, Next Week, Park, Edit, Delete
- Record Done Task: Log completed tasks retroactively with project selection

### task-menu-today
- Focused view of tasks tagged with +today
- Same actions as main menu

### task-quick-add
- Single prompt to add task
- Auto-assigns to `project:quick_add` with +today tag

## Dependencies

- rofi
- taskwarrior
- jq
- libnotify (notify-send)

## Installation

Scripts are in `~/scripts/` - ensure this is in your PATH.

```bash
# Add to ~/.zshrc or ~/.bashrc
export PATH="$HOME/scripts:$PATH"
```

## Keybindings (i3)

Add to `~/.config/i3/config`:
```
bindsym $mod+t exec --no-startup-id ~/scripts/task-menu
bindsym $mod+Shift+t exec --no-startup-id ~/scripts/task-menu-today
bindsym $mod+a exec --no-startup-id ~/scripts/task-quick-add
```

## Usage

```bash
task-menu         # Open main task picker
task-menu-today   # Today's tasks only
task-quick-add    # Quick add a task
```
