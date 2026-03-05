# dotfiles

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/), targeting Arch Linux on bare metal and WSL.

## Structure

```
~/.local/share/chezmoi/
├── dot_zshrc                    # ~/.zshrc
├── dot_gitconfig                # ~/.gitconfig
└── dot_config/
    ├── starship.toml            # ~/.config/starship.toml
    ├── ghostty/config           # ~/.config/ghostty/config
    ├── hypr/                    # ~/.config/hypr/ (Hyprland)
    ├── kanata/kanata.kbd        # ~/.config/kanata/kanata.kbd
    └── oh-my-posh/              # ~/.config/oh-my-posh/
```

## Requirements

| Tool | Purpose |
|---|---|
| [chezmoi](https://www.chezmoi.io/) | Dotfiles manager |
| [zsh](https://www.zsh.org/) | Shell |
| [starship](https://starship.rs/) | Prompt |
| [zinit](https://github.com/zdharma-continuum/zinit) | Zsh plugin manager — auto-bootstraps on first launch |
| [fzf](https://github.com/junegunn/fzf) | Fuzzy finder |
| [fd](https://github.com/sharkdp/fd) | fzf backend |
| [bat](https://github.com/sharkdp/bat) | fzf previewer, `cat` replacement |
| [eza](https://github.com/eza-community/eza) | `ls` replacement |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | Smart `cd` |
| [fastfetch](https://github.com/fastfetch-cli/fastfetch) | System info on shell start |
| [nvim](https://neovim.io/) | Editor |

Install all at once on Arch:

```bash
sudo pacman -S zsh starship fzf fd bat eza zoxide fastfetch neovim
```

## Apply

Fresh machine:

```bash
chezmoi init --apply dom1nux
```

Already cloned:

```bash
chezmoi apply
```
