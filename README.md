# Dotfiles
This repository contains my personal dotfiles managed by `chezmoi`. These configurations are tailored for my development environment and system preferences.

## Table of Contents
- [Dotfiles](#dotfiles)
  - [Table of Contents](#table-of-contents)
  - [Requirements](#requirements)
  - [Managed Files](#managed-files)
  - [Setup and Configuration on a New Machine](#setup-and-configuration-on-a-new-machine)
  - [Usage](#usage)
  - [Customization](#customization)
  - [References](#references)

## Requirements
* `git`
* `chezmoi`

## Managed Files
The following configuration files are managed by this repository:
- **Shell**: `.zshrc`, `.config/zsh/`
- **Git**: `.gitconfig`
- **SSH**: `.ssh/config`
- **Helix Editor**: `.config/helix/`
- **Bat**: `.config/bat/`
- **Ghostty**: `.config/ghostty/`
- **Oh My Posh**: `.config/oh-my-posh/`

## Setup and Configuration on a New Machine
1. Install prerequisites:
   ```bash
   sudo pacman -Syu git chezmoi
   ```
2. Apply dotfiles (replace gitea.example.com with your Gitea domain):
   ```bash
   chezmoi init git@gitea.example.com:dom1nux/dotfiles.git
   chezmoi apply
   ```
3. Verify installation:
   ```bash
   chezmoi doctor
   ```

## Usage
- To edit a managed file:
  ```bash
  chezmoi edit ~/.zshrc
  ```
- To update the repository:
  ```bash
  chezmoi cd
  git pull
  chezmoi apply
  ```
- To add a new file:
  ```bash
  chezmoi add ~/.newfile
  ```

## References
[1] “Quick start - chezmoi.” Available: https://www.chezmoi.io/quick-start/. [Accessed: Mar. 20, 2025]
