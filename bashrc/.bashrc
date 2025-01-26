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

#export PATH="/opt/intellij:$PATH"
#export JAVA_HOME="/opt/intellij/idea-IC-243.22562.218"
#export IDEA_JDK="/opt/intellij/idea-IC-243.22562.218"


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
alias cl='clear && eza -ahl' #--color=auto'
alias ..='cd ..'
alias ...='cd .. && cd ..'
alias c='clear && neofetch'
alias ls='eza' #ls --color=auto'
alias ll='eza -hl' #--color=auto'
alias la='eza -ahl' #--color=auto'
cdd() {
    cd "$1" && clear && eza -ahl --color=auto
}
if command -v bat > /dev/null; then
  alias cat='bat'
elif command -v batcat > /dev/null; then
  alias cat='batcat'
fi

alias grep='grep --color=auto'


#	systemalias

alias vpon='wg-quick up v10Main'
alias vpoff='wg-quick down v10Main'
alias bashrc='v ~/.bashrc'
alias rlbash='source ~/.bashrc'
alias v='nvim'
alias r='ranger'
alias y='yazi'
alias zy='sudo zypper'


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

export PATH=$PATH:$HOME/.local/opt/go/bin
export PATH=$PATH:$HOME/.go/bin
