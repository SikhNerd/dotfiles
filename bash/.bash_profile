#Simple prompt setup and coloring
PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "

#Login to vps and reattach to tmux session
alias vt="reset;ssh -t vc34 'tmux -2 a'"

#most used ls alias
alias ll="ls -hal"

#Attach to existing tmux session, else create one
alias tmux='tmux -2u a || tmux -2u'

#Pretty ping google dns
alias pg="/usr/local/bin/pping 8.8.8.8"

#Vim should always be default
export EDITOR="vim"
export VISUAL="vim"

#Make less have colors and syntax highlighting
LESSPIPE=`which src-hilite-lesspipe.sh`
export LESSOPEN="| ${LESSPIPE} %s"
export LESS='-R'

#homebrew bash auto-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
source `brew --repository`/Library/Contributions/brew_bash_completion.sh
