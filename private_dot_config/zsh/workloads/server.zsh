#### Server Environment ####
# Minimal prompt for servers
PS1='%n@%m:%~$ '

#### Server Aliases ####
alias df='df -h'
alias free='free -h'
alias top='htop'

#### System Management ####
alias ports='netstat -tuln'
alias services='systemctl list-units --type=service'
alias logs='journalctl -f'