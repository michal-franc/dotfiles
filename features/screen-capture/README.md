# Screen Capture

Screenshots and screen recording utilities.

## Components

| File | Description |
|------|-------------|
| `scripts/screen` | Selection screenshot to clipboard |
| `scripts/screenf` | Fullscreen screenshot |
| `scripts/screenn` | Screenshot with filename prompt |
| `scripts/gif` | Record selection as GIF |
| `scripts/video` | Record screen as video |

## Features

### screen
Takes a selection screenshot and copies to clipboard (ready to paste).

### screenf
Captures entire screen.

### screenn
Selection screenshot with custom filename.

### gif
Records selected area as animated GIF using byzanz or similar.

### video
Records screen as video file.

## Dependencies

- maim (screenshots)
- xclip (clipboard)
- byzanz-record or ffmpeg (GIF/video)

## Installation

```bash
# Ubuntu/Mint
sudo apt install maim xclip

# For GIF recording
sudo apt install byzanz
```

## Keybindings (i3)

```
# Selection screenshot to clipboard
bindsym Print exec --no-startup-id ~/scripts/screen

# Full screen screenshot
bindsym Shift+Print exec --no-startup-id ~/scripts/screenf

# Screenshot with save dialog
bindsym $mod+Print exec --no-startup-id ~/scripts/screenn
```

## Usage

```bash
screen    # Select area, copies to clipboard
screenf   # Full screen capture
screenn   # Select area, prompts for filename
gif       # Record GIF
video     # Record video
```
