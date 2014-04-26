PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
alias vt="reset;ssh -t vc34 'tmux -2 a'"
alias ll="ls -hal"
alias tmux='tmux -2u a || tmux -2u'
alias pg="/usr/local/bin/pping 8.8.8.8"
export EDITOR="vim"
export VISUAL="vim"
LESSPIPE=`which src-hilite-lesspipe.sh`
export LESSOPEN="| ${LESSPIPE} %s"
export LESS='-R'
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
source `brew --repository`/Library/Contributions/brew_bash_completion.sh
