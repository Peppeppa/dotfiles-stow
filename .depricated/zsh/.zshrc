#
#███████╗███████╗██╗  ██╗██████╗  ██████╗
#╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝
#  ███╔╝ ███████╗███████║██████╔╝██║     
# ███╔╝  ╚════██║██╔══██║██╔══██╗██║     
#███████╗███████║██║  ██║██║  ██║╚██████╗
#╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝
#-------------------------------------------

#-----   Load config   -----

CONFIG_DIR="$HOME/.config/shell"

load_shell_config () {
  local SHELL_DIR="$CONFIG_DIR/$(basename "$SHELL")"
  for file in "$CONFIG_DIR/common/"*.sh "$SHELL_DIR/"*.sh;
  do
    [ -f "$file" ] && source "$file"
  done
}



#-----   History   -------


HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY


#-----   Alias   -------

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

#	systemalias

alias bashrc='v ~/.bashrc'
alias zshrc='v ~/.zshrc'
alias rlbash='source ~/.bashrc'
alias rlzsh='source ~/.zshrc'

alias v='nvim'
alias r='ranger'
alias y='yazi'
alias z='sudo zypper'

