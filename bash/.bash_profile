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

#Set git proxy to localhost
alias gps="git config --global http.proxy 'socks5://127.0.0.1:8080'"

#unset git proxy
alias gpu="git config --global --unset http.proxy"

#temp sysadmin-1
alias sa1='gcloud compute --project "high-plating-825" ssh --zone "us-central1-a" "munteksingh@sys-admin-1"'

# Start an instance of chrome using a local proxy
alias chpxy='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --user-data-dir="$HOME/chrome-proxy-profile" --proxy-server="socks5://localhost:1080"'

# SSH proxy to sa1
alias sa1p='gcloud compute --project "high-plating-825" ssh --zone "us-central1-a" "munteksingh@sys-admin-1" --ssh-flag="-D" --ssh-flag="1080" --ssh-flag="-N"'

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


#Go Exports
export PATH=$PATH:$GOPATH/bin
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/opt/go/libexec/bin

# The next line updates PATH for the Google Cloud SDK.
source '/Users/ms/google-cloud-sdk/path.bash.inc'

# The next line enables shell command completion for gcloud.
source '/Users/ms/google-cloud-sdk/completion.bash.inc'

# local rbenv setup
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Convert mov file to gif with decent quality
movtogif(){
    ffmpeg -i "$1" -vf scale=800:-1 -r 10 -f image2pipe -vcodec ppm - |\
    convert -delay 5 -layers Optimize -loop 0 - "$2"
}
