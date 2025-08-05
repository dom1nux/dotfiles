# Dotfiles
This repository contains my personal dotfiles managed by `chezmoi`. These configurations use a **workload-based architecture** where different targets implement several workloads.

## Table of Contents
- [Dotfiles](#dotfiles)
  - [Table of Contents](#table-of-contents)
  - [Architecture](#architecture)
  - [Requirements](#requirements)
  - [Managed Files](#managed-files)
  - [Setup and Configuration on a New Machine](#setup-and-configuration-on-a-new-machine)
  - [Usage](#usage)
  - [Customization](#customization)
  - [References](#references)

## Architecture

This dotfiles setup follows a **"targets implement workloads"** philosophy:

### Targets (Systems)
Each system is a target that implements one or more workloads:
- **Mizuki** (WSL): Development + WSL + Zinit
- **mizuho** (Arch Linux): Development + Desktop + Zinit  
- **zero** (Server): Server only

### Workloads
Workloads define functionality sets that can be mixed and matched:
- **development**: Modern CLI tools (eza, bat, fzf, zoxide), Docker, Git, oh-my-posh, mise
- **desktop**: GUI desktop environment integrations
- **server**: Minimal server-focused tools
- **wsl**: Windows integration for WSL environments
- **zinit**: Zsh plugin manager and plugins

### File Structure
```
~/.config/zsh/
├── workloads/           # Reusable functionality modules
│   ├── development.zsh  # Modern dev environment
│   ├── desktop.zsh      # GUI-specific tools
│   ├── server.zsh       # Server utilities
│   ├── wsl.zsh          # Windows integration
│   └── zinit.zsh        # Plugin management
└── targets/             # System-specific configurations
    ├── mizuki.zsh       # WSL development machine
    ├── mizuho.zsh       # Native Linux desktop
    └── zero.zsh         # Server configuration
```

## Requirements
* `git`
* `chezmoi`
* Modern CLI tools (installed per workload):
  - `eza`, `bat`, `fzf`, `zoxide` (development workload)
  - `oh-my-posh` (installed to `~/.local/bin`)
  - `mise` (SDK/runtime management)

## Managed Files
The following configuration files are managed by this repository:
- **Shell**: `.zshrc` (targets implement workloads)
- **Workloads**: `.config/zsh/workloads/` (reusable functionality)
- **Targets**: `.config/zsh/targets/` (system-specific configs)
- **Git**: `.gitconfig`
- **SSH**: `.ssh/config`
- **Editors**: `.config/helix/`, `.config/ghostty/`
- **Tools**: `.config/bat/`, `.config/oh-my-posh/`
- **Window Manager**: `.config/hypr/` (desktop systems only)

## Setup and Configuration on a New Machine
1. Install prerequisites:
   ```bash
   # Arch Linux
   sudo pacman -Syu git chezmoi
   
   # Ubuntu/Debian (WSL)
   sudo apt update && sudo apt install git
   # Install chezmoi from GitHub releases
   ```

2. Apply dotfiles:
   ```bash
   chezmoi init --apply https://github.com/dom1nux/dotfiles.git
   ```

3. Install modern CLI tools (for development workload):
   ```bash
   # Install oh-my-posh
   curl -s https://ohmyposh.dev/install.sh | bash -s
   
   # Install mise
   curl https://mise.run | sh
   
   # Install other tools via package manager
   # Arch: sudo pacman -S eza bat fzf zoxide
   # Ubuntu: Follow individual installation guides
   ```

4. Verify installation:
   ```bash
   chezmoi doctor
   ```

## Usage
- To edit a managed file:
  ```bash
  chezmoi edit ~/.zshrc
  ```
  
- To edit a workload:
  ```bash
  chezmoi edit ~/.config/zsh/workloads/development.zsh
  ```
  
- To edit a target configuration:
  ```bash
  chezmoi edit ~/.config/zsh/targets/mizuki.zsh
  ```

- To update the repository:
  ```bash
  chezmoi cd
  git pull
  chezmoi apply
  ```

- To add a new target:
  1. Create target file: `chezmoi add ~/.config/zsh/targets/newtarget.zsh`
  2. Define workloads in target file
  3. Update `.zshrc.tmpl` to include the new target

- To add a new workload:
  1. Create workload file: `chezmoi add ~/.config/zsh/workloads/newworkload.zsh`
  2. Source it in relevant target files

## Customization

### Adding a New System
1. Define system properties in `.chezmoi.toml.tmpl`
2. Create target file in `~/.config/zsh/targets/hostname.zsh`
3. Source appropriate workloads in the target file
4. Add target to main `.zshrc.tmpl`

### Creating a New Workload
1. Create workload file in `~/.config/zsh/workloads/workloadname.zsh`
2. Add functionality (aliases, functions, tool initialization)
3. Source the workload in target files that need it

### Example Target Implementation
```bash
#### MyTarget Configuration ####
# Description - Implements: workload1 + workload2

#### Load Workloads ####
[[ -f ~/.config/zsh/workloads/development.zsh ]] && source ~/.config/zsh/workloads/development.zsh
[[ -f ~/.config/zsh/workloads/desktop.zsh ]] && source ~/.config/zsh/workloads/desktop.zsh

#### Target-Specific Config ####
export EDITOR="vim"
alias myalias="echo 'Hello from MyTarget'"
```

## References
[1] "Quick start - chezmoi." Available: https://www.chezmoi.io/quick-start/. [Accessed: Mar. 20, 2025]  
[2] "Oh My Posh - A prompt theme engine for any shell." Available: https://ohmyposh.dev/. [Accessed: Aug. 5, 2025]  
[3] "mise-en-place - The front-end to your dev env." Available: https://mise.jdx.dev/. [Accessed: Aug. 5, 2025]ts (systems) implement specific workloads based on their purpose and capabilities.