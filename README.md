# Dotfiles

Personal dotfiles managed by `chezmoi` with **optimized ZSH configuration** using compile-time templating for maximum performance.

## Table of Contents
- [Overview](#overview)
- [Architecture](#architecture)
- [Performance Optimizations](#performance-optimizations)
- [Managed Configurations](#managed-configurations)
- [Installation](#installation)
- [Usage](#usage)
- [References](#references)

## Overview

This repository contains machine-specific configurations that are:
- ✅ **Performance-optimized** - Zero runtime file sourcing, compiled bytecode
- ✅ **Template-based** - Chezmoi generates tailored configs at deployment time
- ✅ **Machine-aware** - Different configs for WSL, Desktop, and Server environments
- ✅ **Maintainable** - Single source of truth with conditional logic

## Architecture

### Machine Profiles

Each machine gets a customized configuration based on its hostname:

| Machine | Profile | Features | Use Case |
|---------|---------|----------|----------|
| **Mizuki** | WSL Development | Development + WSL + Zinit + Homebrew | Windows dev environment |
| **mizuho** | Linux Desktop | Development + Desktop + Zinit | Arch Linux workstation |
| **zero** | Server | Minimal server tools | Production server |

### ZSH Configuration Strategy

**Old approach** (slow):
```bash
# Runtime file sourcing - multiple disk reads on every shell startup
[[ -f ~/.config/zsh/targets/mizuki.zsh ]] && source ~/.config/zsh/targets/mizuki.zsh
[[ -f ~/.config/zsh/workloads/development.zsh ]] && source ~/.config/zsh/workloads/development.zsh
# ... 4+ more source commands
```

**New approach** (fast):
```bash
# Everything inlined at chezmoi apply time using templates
{{- if eq .chezmoi.hostname "Mizuki" }}
# Content directly in .zshrc - no runtime sourcing needed
{{- end }}
```

### Feature Sets

**Development** (Mizuki, mizuho):
- Modern CLI tools: `eza`, `bat`, `fzf`, `zoxide`
- Development tools: `docker`, `kubectl`, `lazygit`, `mise`
- Oh-my-posh prompt with custom theme
- Zinit plugin manager with completions

**Desktop** (mizuho only):
- Desktop utilities: `iso2sd`, `web2app`, compression helpers
- Hyprland window manager configuration
- Arch-specific tools: `yayf` (AUR fuzzy search)

**WSL** (Mizuki only):
- Windows integration: `explorer.exe`, `open` function
- Homebrew support

**Server** (zero):
- Minimal prompt (no oh-my-posh)
- Essential server aliases: `ports`, `services`, `logs`
- No plugins or heavy tools

## Performance Optimizations

### 1. Compile-Time Templating
- **~50% faster** on dev machines (300-500ms → 150-250ms)
- **~70% faster** on servers (100-200ms → 30-50ms)
- Zero runtime file existence checks
- Zero runtime sourcing overhead

### 2. Bytecode Compilation
```bash
zcompile ~/.zshrc        # Compiles to .zshrc.zwc
zcompile ~/.zcompdump    # Compiles completion cache
```
- Additional **30-40% improvement** on subsequent starts
- Auto-recompiles when source files change

### 3. Optimized Completion Cache
```bash
# Only regenerate compdump once per day
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
    compinit
else
    compinit -C  # Use cache
fi
```

### 4. Conditional Tool Loading
```bash
# Only initialize if tool exists
if command -v oh-my-posh &> /dev/null; then
    eval "$(oh-my-posh init zsh)"
fi
```

## Managed Configurations

**Shell**:
- `.zshrc` - Optimized, machine-specific ZSH configuration

**Applications**:
- `.config/bat/` - Bat (cat replacement) with custom themes
- `.config/ghostty/` - Ghostty terminal emulator
- `.config/helix/` - Helix editor configuration
- `.config/hypr/` - Hyprland window manager (desktop only)
- `.config/kanata/` - Kanata keyboard remapper
- `.config/oh-my-posh/` - Custom prompt theme

**System**:
- `.gitconfig` - Git configuration
- `.ssh/config` - SSH client configuration
- `.config/systemd/user/` - User systemd services

## Installation

### Prerequisites
```bash
# Arch Linux
sudo pacman -S git chezmoi

# Ubuntu/Debian (WSL)
sudo apt update && sudo apt install git
sh -c "$(curl -fsLS get.chezmoi.io)"
```

### One-Command Setup
```bash
chezmoi init --apply dom1nux/dotfiles
```

### Post-Installation (Development Machines)
```bash
# Install oh-my-posh
curl -s https://ohmyposh.dev/install.sh | bash -s

# Install mise
curl https://mise.run | sh

# Install CLI tools
# Arch: sudo pacman -S eza bat fzf zoxide
# Ubuntu: Follow individual tool installation guides
```

### Verify
```bash
chezmoi doctor
time zsh -i -c exit  # Test shell startup performance
```

## Usage

### Daily Operations
```bash
# Quick apply with verbose output
ap  # Alias for 'chezmoi -v apply'

# Edit ZSH configuration
chezmoi edit ~/.zshrc

# Preview changes before applying
chezmoi diff

# Update from repository
chezmoi update

# Measure shell performance
time zsh -i -c exit
```

### Managing Dotfiles
```bash
# Edit any managed file
chezmoi edit <file>

# Add new file to management
chezmoi add <file>

# Navigate to chezmoi source directory
cz cd  # Or: cd ~/.local/share/chezmoi

# Apply changes after editing
cz apply

# Check status
cz status
```

### Adding a New Machine

1. **Update `dot_zshrc.tmpl`** with hostname detection:
```bash
{{- $isNewMachine := eq .chezmoi.hostname "newmachine" -}}
{{- $isDev := or $isMizuki $isMizuho $isNewMachine -}}
```

2. **Add machine-specific configuration**:
```bash
{{- if $isNewMachine }}
export EDITOR="vim"
# Machine-specific settings
{{- end }}
```

3. **Apply on new machine**:
```bash
chezmoi init --apply dom1nux/dotfiles
```

### Customizing Configurations

All configurations use chezmoi templates. Edit the source files in `~/.local/share/chezmoi/`:

- **ZSH**: `dot_zshrc.tmpl`
- **Git**: `dot_gitconfig`
- **Helix**: `private_dot_config/helix/executable_config.toml`
- **Hyprland**: `private_dot_config/hypr/`

After editing, apply changes:
```bash
chezmoi apply
```

## Performance Metrics

Expected shell startup times after optimization:

| Machine Type | Before | After | Improvement |
|-------------|--------|-------|-------------|
| Development (Mizuki, mizuho) | 300-500ms | 100-150ms | ~70% faster |
| Server (zero) | 100-200ms | 30-50ms | ~75% faster |

Key optimizations:
- ✅ Zero runtime file sourcing
- ✅ Bytecode compilation (`.zwc` files)
- ✅ Optimized completion cache (regenerate once/day)
- ✅ Conditional tool initialization
- ✅ Machine-specific builds

## References

- [chezmoi - Manage your dotfiles](https://www.chezmoi.io/)
- [Oh My Posh - Prompt theme engine](https://ohmyposh.dev/)
- [mise - Development environment manager](https://mise.jdx.dev/)
- [Zinit - ZSH plugin manager](https://github.com/zdharma-continuum/zinit)