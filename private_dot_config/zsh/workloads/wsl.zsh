#### WSL Aliases ####
alias explorer='explorer.exe'

#### Windows Integration ####
function open() {
    if [ $# -eq 0 ]; then
        explorer.exe .
    else
        explorer.exe "$@"
    fi
}