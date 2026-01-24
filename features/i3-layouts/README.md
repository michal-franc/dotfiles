# i3 Layouts

Predefined workspace layouts for common workflows.

## Components

| File | Description |
|------|-------------|
| `scripts/layout` | Layout launcher script |
| `layouts/*.json` | Layout definitions |
| `scripts/rename-current-workspace` | Rename workspace via rofi |

## Available Layouts

Check available layouts:
```bash
layout
```

Layouts are stored in `~/layouts/` as JSON files compatible with i3-layout-manager or similar tools.

## Features

### layout
- Lists available layouts when called without arguments
- Loads specified layout: `layout <name> [args]`

### rename-current-workspace
- Rofi prompt to rename current i3 workspace

## Dependencies

- i3wm
- i3-layout-manager or i3-resurrect (for layout restore)
- rofi (for workspace rename)

## Installation

1. Create layouts directory: `mkdir -p ~/layouts`
2. Add layout JSON files
3. Ensure scripts are in PATH

## Keybindings (i3)

```
# Load layout
bindsym $mod+l exec --no-startup-id ~/scripts/layout

# Rename workspace
bindsym $mod+n exec --no-startup-id ~/scripts/rename-current-workspace
```

## Usage

```bash
# List layouts
layout

# Load specific layout
layout coding
layout streaming

# Rename current workspace
rename-current-workspace
```

## Creating Layouts

1. Set up windows as desired
2. Save layout: `i3-save-tree --workspace X > ~/layouts/myworkflow.json`
3. Edit JSON to add swallows criteria
