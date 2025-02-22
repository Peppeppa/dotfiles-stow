#
#███████╗███████╗██╗  ██╗██████╗  ██████╗
#╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝
#  ███╔╝ ███████╗███████║██████╔╝██║     
# ███╔╝  ╚════██║██╔══██║██╔══██╗██║     
#███████╗███████║██║  ██║██║  ██║╚██████╗
#╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝
#
# medvidec 2024
#-------------------------------------------

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

#source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


#restore colorscheme
#if command -v wal &> /dev/null
#then
    # 'wal' ist installiert, Befehl ausführen
#    wal -R -q
#fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# command history

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

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


#	systemalias

alias vpon='wg-quick up v10Main'
alias vpoff='wg-quick down v10Main'
alias bashrc='v ~/.bashrc'
alias zshrc='v ~/.zshrc'
alias rlbash='source ~/.bashrc'
alias rlzsh='source ~/.zshrc'
alias v='nvim'
alias r='ranger'
alias y='yazi'
alias z='sudo zypper'


#	Git

alias g='git status'
alias ga='git add'
alias gaa='git add .'
alias gc='git commit -m'
alias gps='git push'
alias gpl='git pull'

alias gf='~/.config/scripts/git-flow-stow.sh'


