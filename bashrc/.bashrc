#
#   ██████╗  █████╗ ███████╗██╗  ██╗██████╗  ██████╗
#   ██╔══██╗██╔══██╗██╔════╝██║  ██║██╔══██╗██╔════╝
#   ██████╔╝███████║███████╗███████║██████╔╝██║     
#   ██╔══██╗██╔══██║╚════██║██╔══██║██╔══██╗██║     
#██╗██████╔╝██║  ██║███████║██║  ██║██║  ██║╚██████╗
#╚═╝╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝
#                                                   
# medvidec 2023
#--------------------------------------------------

#restore colorscheme
if command -v wal &> /dev/null
then
    # 'wal' ist installiert, Befehl ausführen
    wal -R -q
fi
neofetch



# If not running interactively, don't do anything
[[ $- != *i* ]] && return


#----------------------------------
# █████╗ ██╗     ██╗ █████╗ ███████╗
#██╔══██╗██║     ██║██╔══██╗██╔════╝
#███████║██║     ██║███████║███████╗
#██╔══██║██║     ██║██╔══██║╚════██║
#██║  ██║███████╗██║██║  ██║███████║
#╚═╝  ╚═╝╚══════╝╚═╝╚═╝  ╚═╝╚══════╝
#                                   
#-----------------------------------

#	movement
#
alias cl='clear && ls -ahl --color=auto'
alias ..='cd ..'
alias ...='cd .. && cd ..'
alias c='clear && neofetch'
alias ls='ls --color=auto'
alias ll='ls -ahl --color=auto'
cdd() {
    cd "$1" && clear && ls -ahl --color=auto
}

alias grep='grep --color=auto'


#	systemalias

alias vpon='wg-quick up v10Main'
alias vpoff='wg-quick down v10Main'
alias stow='stow -d ~/git/dotfiles/ . -t ~/'
alias unstow='stow -D -d ~/git/dotfiles/ . -t ~/'
alias bashrc='v ~/.bashrc'
alias rlbash='source ~/.bashrc'
alias v='nvim'
alias r='ranger'


#	Git

alias g='git status'
alias ga='git add'
alias gaa='git add .'
alias gc='git commit -m'
alias gps='git push'
alias gpl='git pull'

alias gf='~/.config/scripts/git-flow-stow.sh'



#PS1='[\u@\h \W]\$ '
PROMPT_COMMAND='PS1_CMD1=$(git branch 2>/dev/null | grep '"'"'*'"'"' | colrm 1 2)'; PS1='\n[\D{%a %d %b} - \A] \w \n[\u@\h] ${PS1_CMD1}: '
