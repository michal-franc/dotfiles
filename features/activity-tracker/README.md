# Activity Tracker

Track daily activities (window focus, git commits, terminal commands, browser history) and convert them into Taskwarrior done tasks.

## Components

| File | Description |
|------|-------------|
| `scripts/activity-logger` | i3 event-based window focus logger |
| `scripts/activity-review` | Aggregates daily activity into summary |
| `scripts/activity-to-tasks` | Rofi interface to create done tasks from activity |
| `.config/systemd/user/activity-logger.service` | Systemd service for auto-start |

## How it works

```
┌─────────────────────────────────────────────────────────┐
│  activity-logger (systemd service)                      │
│  Subscribes to i3 window focus events                   │
│  Logs to ~/.local/share/activity/windows-YYYY-MM-DD.log │
└─────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────┐
│  activity-review (run manually)                         │
│  Collects:                                              │
│    - Git commits from ~/Work repos                      │
│    - Window activity log                                │
│    - Zsh history (filtered)                             │
│    - Chrome browser history                             │
│    - Claude Code sessions (~/.claude/history.jsonl)     │
│  Outputs: /tmp/activity-summary-YYYY-MM-DD.md           │
│  Format: Potential todo items with [source:context]     │
└─────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────┐
│  activity-to-tasks (rofi interface)                     │
│    - Select activities to record                        │
│    - Edit descriptions                                  │
│    - Assign to projects                                 │
│    - Creates done tasks in Taskwarrior                  │
└─────────────────────────────────────────────────────────┘
```

## Dependencies

- i3wm
- jq
- rofi
- taskwarrior
- sqlite3 (for browser history)

## Installation

```bash
# 1. Install dependencies (if not already installed)
sudo apt install jq sqlite3

# 2. Reload systemd and enable the service
systemctl --user daemon-reload
systemctl --user enable activity-logger.service
systemctl --user start activity-logger.service

# 3. Verify it's running
systemctl --user status activity-logger.service
```

## Usage

### Check service status
```bash
systemctl --user status activity-logger
```

### View today's window log
```bash
cat ~/.local/share/activity/windows-$(date +%Y-%m-%d).log
```

### Generate activity summary
```bash
~/scripts/activity-review           # today
~/scripts/activity-review 2024-01-15  # specific date
```

### Create done tasks from activity (rofi)
```bash
~/scripts/activity-to-tasks         # today
~/scripts/activity-to-tasks 2024-01-15  # specific date
```

## Log format

Window log format: `timestamp|window_class|window_name`

```
2024-01-24 14:30:15|Alacritty|~/Work/project - zsh
2024-01-24 14:32:45|Google-chrome|GitHub - myrepo
2024-01-24 14:35:00|Code|main.go - project - Visual Studio Code
```

## Customization

### Change git directories to scan
Edit `~/scripts/activity-review` and modify the `GIT_DIRS` array:
```bash
GIT_DIRS=(
    "$HOME/Work"
    "$HOME/projects"
    "$HOME/dotfiles"
)
```

### Filter terminal commands
Edit the `grep -vE` patterns in `activity-review` to exclude/include commands.
