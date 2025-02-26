#-----   Alias   -------

#	movement
#
alias c='clear && neofetch'
alias cl='clear && eza -ahl' #--color=auto'

alias ..='cd ..'
alias ...='cd .. && cd ..'

alias ls='eza' #ls --color=auto'
alias ll='eza -hl' #--color=auto'
alias la='eza -ahl' #--color=auto'

if command -v bat > /dev/null; then
  alias cat='bat'
elif command -v batcat > /dev/null; then
  alias cat='batcat'
fi

alias repos='cd $REPOS'
alias dot='cd $DOTFILES'
alias scripts='cd $SCRIPTS'
alias conf='cd $DOTCONFIG'



#	systemalias
alias rlbash='source ~/.bashrc'
alias rlzsh='source ~/.zshrc'
alias stow='stow -t ~'

alias v='nvim'
alias r='ranger'
alias y='yazi'
alias z='sudo zypper'
alias t='tmux'


#	Git

alias g='git status'
alias ga='git add'
alias gaa='git add .'
alias gc='git commit -m'
alias gps='git push'
alias gpl='git pull'

alias gf='~/.config/scripts/git-flow-stow.sh'
