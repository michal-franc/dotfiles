# Michal Franc's Dotfiles

A comprehensive Linux development environment focused on productivity, keyboard-driven workflows, and seamless task management integration.

## Quick Start

### Installation Instructions
- [Ubuntu/Xubuntu/Mint installation](/install_instructions/mint/README.md)
- [OUTDATED: Arch Linux installation](/install_instructions/arch)

### Key Documentation
1. [Layout system](/layouts) - i3 workspace automation
2. [Scripts](/scripts) - Productivity and automation scripts
3. [Visual Studio Code config](/.config/Code)

---

## Overview

This dotfiles repository represents a highly customized Linux environment built around:
- **i3 window manager** for efficient window management
- **Taskwarrior** integration for project-based task management
- **Custom scripts** for workflow automation
- **Vim/Neovim** for text editing
- **Polybar** for status bar with custom modules

### Philosophy

The setup emphasizes:
- Keyboard-driven workflows (minimal mouse usage)
- Context-aware task management (tasks automatically filtered by project)
- Quick screenshot and note-taking capabilities
- Automated workspace layouts for different activities
- Integration between tools (git repos → task projects, active tasks → directory navigation)

---

## Core Components

### Window Manager & Desktop Environment

#### i3 Window Manager
Tiling window manager configured with:
- Vim-style navigation keybindings (h/j/k/l)
- Alacritty as default terminal
- Rofi for application launching
- Custom workspace management
- **Configuration**: [.config/i3/config](.config/i3/config)

#### Polybar
Status bar with custom modules showing:
- Taskwarrior active task and context
- GitHub notifications
- Pomodoro timer statistics
- Tasks completed today
- Security indicators
- **Configuration**: [.config/polybar/](.config/polybar/)
- **Custom scripts**: [.config/polybar/*.sh](.config/polybar/)

#### Rofi
Application launcher and dmenu replacement
- **Configuration**: [.config/rofi/](.config/rofi/)

---

### Shell & Terminal

#### Zsh with Oh My Zsh
Shell configuration featuring:
- **Theme**: Spaceship prompt
- **Plugins**: git, gitfast, zoxide, aws, docker, taskwarrior, terraform
- **Vi mode**: Enabled with `kk` to enter command mode
- **Custom aliases**: Extensive git and taskwarrior shortcuts
- **Configuration**: [.zshrc](.zshrc)

Key customizations:
```bash
# Vi mode with fast escape
export KEYTIMEOUT=20
bindkey -M viins 'kk' vi-cmd-mode

# Taskwarrior shortcuts
alias tui="taskwarrior-tui"
alias tg=". tgoto"  # Jump to active task's project

# Modern replacements
alias cat='bat'     # Syntax-highlighted cat
```

#### Alacritty
GPU-accelerated terminal emulator
- **Configuration**: [.config/alacritty/](.config/alacritty/)

---

### Editors & IDEs

#### Neovim
Modern Vim configuration using Lua
- **Configuration**: [.config/nvim/init.lua](.config/nvim/init.lua)

#### Visual Studio Code
Full VS Code setup with extensions and keybindings
- **Extension installer**: [.config/Code/install-vs-code-extensions.sh](.config/Code/install-vs-code-extensions.sh)
- **Extension reloader**: [.config/Code/reload-vs-code-extensions.sh](.config/Code/reload-vs-code-extensions.sh)

---

### Task & Project Management

#### Taskwarrior Integration
Sophisticated task management workflow with custom scripts:

**Core Philosophy**: Tasks are automatically filtered by the current git repository, creating a seamless project-based workflow.

**Key Scripts** (see [scripts README](/scripts/README.md) for full details):
- `t` - Smart wrapper that filters tasks by current project
- `ts` - Start/stop task timers
- `tt` - Manage today's tasks
- `tgoto` - Navigate to active task's project directory
- `tstash` - Context switching (stash/restore task groups)
- `tdaily` - Generate daily standup notes from completed tasks
- `tsync` - Sync task database to git

**Workflow Example**:
```bash
cd ~/Projects/myapp       # Navigate to project
t                         # See only myapp tasks
ts 42                     # Start working on task 42
tg                        # Jump to task's project (uses zoxide)
tstash meeting            # Interrupt: stash current tasks
# ... handle meeting ...
tstash meeting pop        # Restore previous task context
tdaily                    # End of day: copy completed tasks to clipboard
```

---

### Productivity Scripts

Custom automation scripts for common workflows. See [scripts README](/scripts/README.md) for comprehensive documentation.

#### Screenshot & Screen Capture
- `screen` - Quick screenshot to clipboard
- `screenf` - Screenshot to file
- `screenn` - Screenshot with markdown formatting for notes
- `video` - Screen recording with region selection

#### Notes Management
- `n` - Quick note-taking
- `wl` - Work log management
- `links` - Organize bookmarks by tags
- `nsync` - Sync notes to git

#### System & Display
- `brightness` - Control display brightness (laptop + external monitors)
- `clearcaps` - Fix stuck Caps Lock
- `hibernate` / `spanie` - Power management shortcuts
- `wall_reload` - Random wallpaper selection

---

### Layout System

Automated i3 workspace configuration for different activities.

**Usage**:
```bash
layout              # List available layouts
layout code ~/Work  # Open development environment
layout book         # Reading layout with PDF viewer
layout notes pocket # Note-taking with web research
```

**Available Layouts**:
- **code** - Full development: terminals, VS Code, browser
- **book** - Reading: PDF viewer + note terminals
- **notes** - Research: browser + terminals for note-taking
- **planning** - Planning and organization
- **work** - Standard work layout
- **godot** - Game development with Godot

**Documentation**: [layouts/README.md](/layouts/README.md)

**How it works**:
1. Saves i3 window tree configuration as JSON
2. Paired script launches applications in correct order
3. Windows are "swallowed" into layout positions
4. Instant workspace setup for different activities

---

## Tools & Applications

### Command-Line Tools

#### Core Utilities
- **ripgrep** (`rg`) - Fast text search
- **bat** - Syntax-highlighted file viewer (replaces cat)
- **fzf** - Fuzzy finder
- **zoxide** - Smart directory jumping (enhanced cd)
- **entr** - Run commands when files change
- **jq** - JSON processor
- **tig** - Git interface

#### Development Tools
- **mise** - Development environment manager
- **taskwarrior** - Task management
- **taskwarrior-tui** - TUI for taskwarrior

#### System Tools
- **htop** - Process viewer
- **maim** - Screenshot utility
- **xclip** - Clipboard management
- **feh** - Image viewer and wallpaper setter

### GUI Applications

#### Daily Use
- **Google Chrome** - Primary browser
- **Alacritty** - Terminal emulator
- **Zathura** - PDF viewer
- **Obsidian** - Note-taking
- **GIMP** - Image editing

#### Development
- **Visual Studio Code** - Primary IDE
- **Neovim** - Terminal editor
- **Godot** - Game engine

#### Communication
- **Slack** - Team communication
- Configured through polybar integration

---

## Cool Features & Workflows

### 1. Context-Aware Task Management
Tasks automatically filter based on your current git repository. Change directories, see relevant tasks.

### 2. Instant Workspace Setup
Launch complete development environments with a single command using the layout system.

### 3. Screenshot → Markdown Pipeline
Take a screenshot with `screenn`, and the markdown image link is instantly in your clipboard ready to paste.

### 4. Task-Based Navigation
Working on a task? `tg` instantly jumps you to that project's directory using intelligent navigation.

### 5. Daily Standup Automation
`tdaily` generates a summary of completed tasks - perfect for standups or daily logs.

### 6. Stash/Pop Task Context
Working on something when an urgent task comes up? `tstash urgent` hides current tasks. `tstash urgent pop` brings them back.

### 7. Git-Integrated Workflow
Scripts detect git repositories and use them as context for tasks, notes, and project organization.

### 8. Polybar Integration
Status bar shows:
- Currently active task
- Active taskwarrior context
- Tasks completed today
- GitHub notifications
- Pomodoro statistics

### 9. Startup Automation
Automatic configuration on boot:
- Display setup (multi-monitor)
- Keyboard layout and settings
- Mouse configuration
- Polybar launch
- Wallpaper rotation
- **Configuration**: [.config/startup.sh](.config/startup.sh)

### 10. Vim-Style Everything
- i3 navigation: `h/j/k/l`
- Zsh command mode: `kk`
- Neovim for editing
- Keyboard-first philosophy throughout

---

## Configuration Files

### Primary Configs
- **i3**: [.config/i3/config](.config/i3/config)
- **Zsh**: [.zshrc](.zshrc)
- **Neovim**: [.config/nvim/init.lua](.config/nvim/init.lua)
- **Polybar**: [.config/polybar/config](.config/polybar/config)
- **Alacritty**: [.config/alacritty/](.config/alacritty/)
- **Rofi**: [.config/rofi/](.config/rofi/)

### System Setup
- **X initialization**: [.xinitrc](.xinitrc)
- **Startup script**: [.config/startup.sh](.config/startup.sh)
- **Keyboard setup**: [.config/keyboard.sh](.config/keyboard.sh)
- **Mouse setup**: [.config/mouse.sh](.config/mouse.sh)

### Tool Configs
- **Git**: [.gitconfig](.gitconfig)
- **Dunst (notifications)**: [.config/dunst/](.config/dunst/)
- **Compton (compositor)**: [.config/compton.conf](.config/compton.conf)

---

## Screenshots

![Desktop Environment](<images/dotfiles_example3.PNG>)
*Polybar with task integration and i3 tiling*

![Development Layout](images/dotfiles_example1.PNG)
*Multi-window development layout*

![Terminal Workflow](images/dotfiles_example2.PNG)
*Terminal-based workflow with taskwarrior*

---

## Dependencies

### Essential
```bash
# Window manager & UI
i3-wm polybar rofi dunst compton

# Terminal & shell
alacritty zsh oh-my-zsh

# Core tools
ripgrep bat fzf zoxide taskwarrior jq tig

# Screenshots & media
maim xclip feh ffmpeg slop

# Editors
neovim vim code

# System
xorg xinit xrandr
```

### Optional
```bash
# Enhanced task UI
taskwarrior-tui

# Development
mise docker terraform

# PDF & documents
zathura
```

See [install_instructions/mint/README.md](/install_instructions/mint/README.md) for complete installation guide.

---

## Project Structure

```
.
├── .config/              # Application configurations
│   ├── i3/              # i3 window manager config
│   ├── polybar/         # Polybar config and modules
│   ├── nvim/            # Neovim configuration
│   ├── Code/            # VS Code settings and extensions
│   ├── alacritty/       # Terminal emulator config
│   ├── rofi/            # App launcher config
│   └── ...
├── scripts/             # Custom automation scripts
│   └── README.md        # Full scripts documentation
├── layouts/             # i3 workspace layouts
│   └── README.md        # Layout system documentation
├── install_instructions/ # OS-specific setup guides
│   └── mint/            # Ubuntu/Mint installation
├── .zshrc               # Zsh configuration
├── .xinitrc             # X initialization
└── README.md            # This file
```

---

## Customization

This dotfiles repository is highly personalized but designed to be modular:

1. **Start with basics**: i3, polybar, zsh configuration
2. **Add taskwarrior**: If you use task management
3. **Adopt scripts**: Pick the ones that fit your workflow
4. **Customize layouts**: Create your own workspace layouts
5. **Modify keybindings**: Adjust to your preferences

Key files to customize:
- `.config/i3/config` - Keybindings and window rules
- `.zshrc` - Aliases and shell behavior
- `scripts/*` - Modify paths and preferences in scripts
- `.config/startup.sh` - System-specific hardware setup

---

## Tips for New Users

### Getting Started with i3
- `Mod+Enter` - New terminal
- `Mod+d` - Launch application (rofi)
- `Mod+h/j/k/l` - Navigate windows
- `Mod+Shift+q` - Close window
- `Mod+1-9` - Switch workspaces

### Taskwarrior Workflow
1. Start in a project directory: `cd ~/Projects/myapp`
2. See tasks: `t`
3. Add task: `t add "Fix the bug"`
4. Start task: `ts <id>`
5. Complete: `td <id>`

### Screenshot Workflow
- **Quick share**: `screen` (to clipboard)
- **Save file**: `screenf filename.png`
- **For markdown notes**: `screenn` (auto-generates markdown)

### Layout System
- List layouts: `layout`
- Use layout: `layout code ~/Projects/myapp`
- Create new: Follow [layouts/README.md](/layouts/README.md)

---

## Contributing

These are personal dotfiles, but feel free to:
- Fork and adapt for your own use
- Open issues for questions
- Submit PRs for bugs or improvements
- Share your own workflow adaptations

---

## License

MIT License - Feel free to use and modify

---

## Acknowledgments

- [i3 window manager](https://i3wm.org/)
- [Taskwarrior](https://taskwarrior.org/)
- [Oh My Zsh](https://ohmyz.sh/)
- Various tool authors and the open-source community
- Layout system inspired by i3's workspace save/restore functionality
