###### Bash Settings ######

PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "

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

# History Options
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
export HISTTIMEFORMAT='%F %T ' # Add timestamps to every line


# Don't try to complete on empty lines
shopt -s no_empty_cmd_completion

# Globs won't consider case
shopt -s nocaseglob

# Globs will consider hidden files, too
shopt -s dotglob

###### Alias' ######

#Login to vps and reattach to tmux session
alias vt="reset;ssh -t vc3 'tmux -2 a'"
alias bs="reset;ssh -t bs 'tmux -2 a'"

#most used ls alias
alias ll="ls -hal"

#ls alias with octal permissions
alias ols="ls -hal | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\" %0o \",k);print}'"

#Attach to existing tmux session, else create one
alias tmu='tmux -2u a || tmux -2u'

#Pretty ping google dns
alias pg="/usr/local/bin/pping 8.8.8.8"

#Start Firefox profile manager
alias ffp="/Applications/Firefox.app/Contents/MacOS/firefox-bin -p"

#Status
alias gs="git status"

# Start an instance of chrome using a local proxy
alias chpxy='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --user-data-dir="$HOME/chrome-proxy-profile" --proxy-server="socks5://localhost:9080"'

alias ppv='/opt/puppetlabs/bin/puppet parser validate'
###### Environment Variables/Settings ######

#Vim should always be default
export EDITOR="vim"
export VISUAL="vim"

#Make less have colors and syntax highlighting
LESSPIPE=`which src-hilite-lesspipe.sh`
export LESSOPEN="| ${LESSPIPE} %s"
export LESS='-R'

#homebrew bash auto-completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

#Go Exports
export PATH=$PATH:$GOPATH/bin
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/opt/go/libexec/bin

# local rbenv setup
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Convert mov file to gif with decent quality
movtogif(){
    ffmpeg -i "$1" -vf scale=800:-1 -r 10 -f image2pipe -vcodec ppm - |\
    convert -delay 5 -layers Optimize -loop 0 - "$2"
}

# add adb to my path
export PATH=$PATH:/Users/ms/Library/Android/sdk/platform-tools
export ANDROID_SDK_ROOT=/usr/local/share/android-sdk

# Tunnells
alias ssrq='sshuttle -r admin@sikhnerd.myqnapcloud.com 192.168.1.10'
alias ssrc='sshuttle -r bsg 10.142.0.0/16 10.0.0.0/20'
alias cmse='gdate +%s000'

#Fancy Bash
source /Users/ms/dotfiles/bash/bashline.sh

# Set Default java to 8
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

# GNU Coreutils:
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# Curl 
export PATH="/usr/local/opt/curl/bin:$PATH"

# Custom Binaries
export PATH=$PATH:/Users/ms/bin

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash

alias awt='source ~/code/aws-tools/.venv/bin/activate'

# Switch Auth0 Portfolio
alias sup='/Users/ms/.virtualenvs/scratch/bin/python /Users/ms/code/PycharmProjects/scratch/switch_auth0_portfolio.py'

# GCloud Command Autocompletion
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc'
