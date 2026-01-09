# Scripts Documentation

A collection of productivity and automation scripts for Linux/i3 workflow management.

## Table of Contents

- [Screenshot & Screen Capture](#screenshot--screen-capture)
- [Task Management (Taskwarrior)](#task-management-taskwarrior)
- [Notes Management](#notes-management)
- [i3 Window Manager](#i3-window-manager)
- [System & Display](#system--display)
- [Git Shortcuts](#git-shortcuts)
- [Layout System](#layout-system)

---

## Screenshot & Screen Capture

### `screen`
Takes a selection screenshot and copies it to clipboard.
```bash
screen
```
Uses maim to capture a selected area and pipes directly to clipboard as PNG.

### `screenf`
Saves a screenshot to a file.
```bash
screenf              # Saves to ~/Pictures/timestamp.png
screenf myfile.png   # Saves to current directory with specified name
```

### `screenn`
Creates a screenshot for note-taking with automatic markdown formatting.
```bash
screenn              # Creates in .images/ folder
screenn subfolder    # Creates in .images/subfolder/
```
Automatically:
- Creates `.images` folder structure
- Saves with timestamp filename
- Copies markdown image link to clipboard: `![note-image](.images/note-timestamp.png)`

Perfect for quickly adding images to markdown notes.

### `video`
Records a screen region to video.
```bash
video
```
Uses slop for region selection and ffmpeg to record to `output.mp4`.

---

## Task Management (Taskwarrior)

A suite of wrapper scripts around [Taskwarrior](https://taskwarrior.org/) for project-based task management.

### `t`
Smart taskwarrior wrapper that automatically filters by project based on git repository.
```bash
t                    # Shows tasks for current project
t add "Do something" # Adds task to current project
t 42 done           # Marks task 42 as done
```

Features:
- Auto-detects git repository and uses it as project name
- Respects taskwarrior context
- Special handling for `todo.work` folder
- Falls back to current directory name

### `tall`
Shows all tasks (clears screen and runs basic taskwarrior).
```bash
tall
```

### `tt`
Manages tasks tagged for today.
```bash
tt              # Shows all +today tasks
tt 42           # Adds +today tag to task 42
```

### `td`
Quick shortcut to mark a task as done.
```bash
td 42
```

### `ts`
Start/stop task timer.
```bash
ts              # Stops currently active task
ts 42           # Starts task 42
```
Ensures only one task is active at a time.

### `tgoto`
Navigates to the directory of the currently active task's project.
```bash
tgoto           # or use with alias: tg
```
Requires exactly one active task and uses zoxide for directory jumping.

### `tstash`
Stash and restore tasks with custom tags.
```bash
tstash                  # Lists available stashes
tstash meeting          # Stashes +today tasks with +meetingstash tag
tstash meeting pop      # Restores stashed tasks back to +today
```

Useful for context switching - temporarily hide current tasks and restore them later.

### `tbulk`
Bulk add tasks from a file.
```bash
tbulk tasks.txt pro:myproject +tag
```
Reads file line by line and creates tasks with specified arguments.

### `tdaily`
Copies today's completed tasks description to clipboard.
```bash
tdaily
```
Great for daily standups or logging what you accomplished.

### `tdir`
Determines project name based on current directory/git repository.
```bash
tdir
```
Used internally by other task scripts. Returns the git repo basename or current directory name.

### `tsync`
Syncs taskwarrior database to git.
```bash
tsync
```
Interactive script that:
- Shows git status
- Asks for confirmation
- Commits and pushes taskwarrior database to remote

---

## Notes Management

### `n`
Quick note-taking script.
```bash
n                           # Shows last 10 notes
n This is a quick note      # Adds note to quicknotes.md
n nvim                      # Opens notes file in nvim
```

Appends to `~/Work/notes/quicknotes.md` with bullet point formatting.

### `wl`
Worklog management (same interface as `n` but for work log).
```bash
wl                          # Shows last 10 worklog entries
wl Completed feature X      # Adds entry to worklog.md
wl nvim                     # Opens worklog in nvim
```

### `links`
Organizes links by tags.
```bash
links                       # Lists all link collections
links golang                # Shows links tagged with 'golang'
links golang https://...    # Adds link to golang collection
```

Stores links in `~/Work/notes/Archive/links-dump/TAG.md` files.

### `nsync`
Syncs notes repository to git.
```bash
nsync
```
Interactive script for committing and pushing notes to remote.

---

## i3 Window Manager

### `rename-current-workspace`
Renames the currently focused i3 workspace.
```bash
rename-current-workspace myproject
```

Preserves workspace number and formats as: `1: 1:myproject`

### `i3-get-window-criteria`
Gets i3 window criteria for configuration rules.
```bash
i3-get-window-criteria
```

After running, click on any window to get its properties (class, instance, title, etc.) for use in i3 config file rules.

Based on [this gist](https://gist.github.com/jottr/8645010).

---

## System & Display

### `brightness`
Controls laptop and external monitor brightness.
```bash
brightness              # Sets to normal/high brightness
brightness low          # Dims displays
brightness vlow         # Very low brightness
brightness vvlow        # Extremely low brightness
```

Adjusts both Intel backlight and external monitors (DP-1, DP-2).

### `clearcaps`
Clears stuck Caps Lock state.
```bash
clearcaps
```

Uses Python ctypes to unlock Caps Lock modifier via X11 API. Handy when Caps Lock gets stuck.

### `hibernate`
System hibernation shortcut.
```bash
hibernate
```

### `spanie`
System suspend shortcut.
```bash
spanie
```

### `wall_reload`
Reloads wallpaper with random selection.
```bash
wall_reload
```

Uses feh to randomly select and apply wallpaper from `~/images/wallpapers/`.

### `mouse`
Configures mouse settings (sensitivity, acceleration, etc.).

### `keyboard`
Configures keyboard settings and layouts.

---

## Git Shortcuts

### `gpom`
Quick git push to origin master.
```bash
gpom
```

Equivalent to `git push origin master`.

---

## Layout System

### `layout`
Launches predefined i3 workspace layouts.
```bash
layout              # Lists available layouts
layout code ~/Work  # Opens code layout in specified folder
layout book         # Opens book reading layout
```

See the [layouts README](/layouts/README.md) for detailed documentation on the layout system.

---

## Installation

Scripts are added to PATH in `.zshrc`:
```bash
export PATH=$PATH:$HOME/scripts
```

Some scripts have additional dependencies:
- **Screenshot scripts**: maim, xclip
- **Task scripts**: taskwarrior, zoxide
- **Video recording**: slop, ffmpeg
- **i3 scripts**: jq, i3-msg, xwininfo, xprop

---

## Tips & Tricks

### Task Management Workflow

1. Navigate to your project directory
2. Use `t` to see project-specific tasks
3. Start working: `ts 42`
4. Navigate to task's project: `tg`
5. Need to context switch? `tstash meeting`
6. Later: `tstash meeting pop`
7. End of day: `tdaily` for standup notes

### Screenshot Workflow

- Quick share: `screen` (copies to clipboard)
- Save for later: `screenf myfile.png`
- Documentation: `screenn` (auto-formats for markdown)

### i3 Workspace Organization

- Use `rename-current-workspace projectname` to organize workspaces
- Use `layout code ~/Projects/myapp` to quickly set up development environment
- Window criteria needed? Run `i3-get-window-criteria` and click window
