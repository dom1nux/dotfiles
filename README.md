# dotfiles

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/), targeting Arch Linux on bare metal and WSL.

## Structure

```
~/.local/share/chezmoi/
├── dot_zshrc                    # ~/.zshrc
├── dot_gitconfig                # ~/.gitconfig
└── dot_config/
    ├── starship.toml            # ~/.config/starship.toml
    ├── dom1nux.omp.toml         # ~/.config/dom1nux.omp.toml
    ├── ghostty/config           # ~/.config/ghostty/config
    ├── hypr/                    # ~/.config/hypr/ (Hyprland)
    └── kanata/kanata.kbd        # ~/.config/kanata/kanata.kbd
```

## Requirements

| Tool | Purpose |
|---|---|
| [chezmoi](https://www.chezmoi.io/) | Dotfiles manager |
| [zsh](https://www.zsh.org/) | Shell |
| [oh-my-posh](https://ohmyposh.dev/) | Prompt |
| [zinit](https://github.com/zdharma-continuum/zinit) | Zsh plugin manager — auto-bootstraps on first launch |
| [fzf](https://github.com/junegunn/fzf) | Fuzzy finder |
| [fd](https://github.com/sharkdp/fd) | fzf backend |
| [bat](https://github.com/sharkdp/bat) | fzf previewer, `cat` replacement |
| [eza](https://github.com/eza-community/eza) | `ls` replacement |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | Smart `cd` |
| [fastfetch](https://github.com/fastfetch-cli/fastfetch) | System info on shell start |
| [nvim](https://neovim.io/) | Editor |
| [ripgrep](https://github.com/BurntSushi/ripgrep) | `grep` replacement |
| [lazygit](https://github.com/jesseduffield/lazygit) | Git TUI |
| [mise](https://mise.jdx.dev/) | Runtime version manager |
| [jj](https://github.com/jj-vcs/jj) | Jujutsu VCS (completion) |
| [pnpm](https://pnpm.io/) | JS package manager |

Install all at once on Arch:

```bash
sudo pacman -S zsh fzf fd bat eza zoxide fastfetch neovim ripgrep lazygit mise jj pnpm
```

Plus oh-my-posh (not in Arch repos):

```bash
curl -s https://ohmyposh.dev/install.sh | bash -s
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
