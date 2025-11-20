#### Mizuho Target Configuration ####
# Native Linux Development Machine - Implements: development + desktop + zinit

#### Custom config ####
# Variables #
export EDITOR="code"
export SUDO_EDITOR="helix"
export SSH_AUTH_SOCK=/home/dom1nux/.bitwarden-ssh-agent.sock

# Aliases #
alias hx='helix'
alias yayf="yay -Slq | fzf --multi --preview 'yay -Sii {1}' --preview-window=down:75% | xargs -ro yay -S"

#### Workloads ####
[[ -f ~/.config/zsh/workloads/development.zsh ]] && source ~/.config/zsh/workloads/development.zsh
[[ -f ~/.config/zsh/workloads/desktop.zsh ]] && source ~/.config/zsh/workloads/desktop.zsh
[[ -f ~/.config/zsh/workloads/zinit.zsh ]] && source ~/.config/zsh/workloads/zinit.zsh
