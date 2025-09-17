#### Variables ####
export BAT_THEME=ansi

#### Tools init ####
eval "$(oh-my-posh init zsh --config '~/.config/oh-my-posh/my_theme_rightprompt.toml')"
eval "$(mise activate zsh)"
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

#### Aliases ####
alias ls='eza --group-directories-first --icons=always'
alias lt='eza --tree --level=2 --long --icons --git'
alias lta='lt -a'
alias cat='bat -P --style plain'
alias ff="fzf --preview 'bat --style=numbers --color=always {}'"

# Development Aliases #
alias lg='lazygit'
alias d='docker'
alias dc='docker compose'
alias dps='docker ps'
alias di='docker images'
alias k='kubectl'
alias r='rails'

alias g='git'
alias gcm='git commit -m'
alias gcam='git commit -a -m'
alias gcad='git commit -a --amend'

#### Functions ####
n() { 
  if [ "$#" -eq 0 ]; then 
    nvim .
  else 
    nvim "$@"
  fi
}

function dexec() {
    docker exec -it "$1" "${2:-bash}"
}
