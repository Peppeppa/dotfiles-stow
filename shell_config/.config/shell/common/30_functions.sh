#---- functions  -----

#   Alias cd -> clear screen -> modern ls
cdd() {
    cd "$1" && clear && eza -ahl --color=auto
}

