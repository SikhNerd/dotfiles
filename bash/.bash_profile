###### Bash Settings ######

#If Powerline is Installed, use it, else use my old PS1
powerline_path=$(python -c 'import pkgutil; print pkgutil.get_loader("powerline").filename' 2>/dev/null)

if [[ "$powerline_path" != "" ]]; then
    source ${powerline_path}/bindings/bash/powerline.sh
else
    PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
    # Setup your normal PS1 here.
fi

# Entering a directory name as a bare word will change into that directory
shopt -s autocd

# Automatically correct off-by-one typing mistakes when changing directories
shopt -s cdspell

# Make Bash wrap text properly if the terminal size changes
shopt -s checkwinsize

# Store multi-line commands in shell history as one-liners for easy editing
shopt -s cmdhist

# Correct off-by-one typing mistakes when tab-completing directories
shopt -s dirspell

# Allow aliases to be expanded even in non-interactive sessions
shopt -s expand_aliases

# Don't clobber other sessions' changes to global history when exiting
shopt -s histappend

# Don't try to complete on empty lines
shopt -s no_empty_cmd_completion

# Globs won't consider case
shopt -s nocaseglob

# Globs will consider hidden files, too
shopt -s dotglob

###### Alias' ######

#Login to vps and reattach to tmux session
alias vt="reset;ssh -t vc34 'tmux -2 a'"

#most used ls alias
alias ll="ls -hal"

#ls alias with octal permissions
alias ols="ls -hal | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\" %0o \",k);print}'"

#Attach to existing tmux session, else create one
alias tmux='tmux -2u a || tmux -2u'

#Pretty ping google dns
alias pg="/usr/local/bin/pping 8.8.8.8"

###### Environment Variables/Settings ######

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

