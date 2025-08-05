#### Mizuki Target Configuration ####
# WSL Development Machine - Implements: development + wsl + zinit

#### Custom configs ####
# Variables
export EDITOR="hx"
export SUDO_EDITOR="hx"

# Tools init
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

#### Workloads ####
[[ -f ~/.config/zsh/workloads/development.zsh ]] && source ~/.config/zsh/workloads/development.zsh
[[ -f ~/.config/zsh/workloads/wsl.zsh ]] && source ~/.config/zsh/workloads/wsl.zsh
[[ -f ~/.config/zsh/workloads/zinit.zsh ]] && source ~/.config/zsh/workloads/zinit.zsh