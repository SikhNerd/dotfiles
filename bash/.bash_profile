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
export HISTSIZE=-1                   # big big history
export HISTFILESIZE=-1               # big big history
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
alias bs="reset;ssh -t bsg 'tmux -2 a'"

#most used ls alias
alias ll="ls -hal --color=auto"

#ls alias with octal permissions
alias ols="ls -hal | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\" %0o \",k);print}'"

#Attach to existing tmux session, else create one
alias tmu='tmux -2u a || tmux -2u'

#Pretty ping google dns
alias pg="pping 8.8.8.8"

#Start Firefox profile manager
#alias ffp="/Applications/Firefox.app/Contents/MacOS/firefox-bin -p"

#Status
alias gs="git status"

#alias ppv='/opt/puppetlabs/bin/puppet parser validate'
###### Environment Variables/Settings ######

#Vim should always be default
export EDITOR="vim"
export VISUAL="vim"

#Make less have colors and syntax highlighting
LESSPIPE=`which src-hilite-lesspipe.sh`
LESSPIPE="/usr/share/source-highlight/src-hilite-lesspipe.sh"
export LESSOPEN="| ${LESSPIPE} %s"
export LESS='-R'

#homebrew bash auto-completion
[ -f /etc/profile.d/bash_completion.sh ] && . /etc/profile.d/bash_completion.sh


# Convert mov file to gif with decent quality
movtogif(){
    ffmpeg -i "$1" -vf scale=800:-1 -r 10 -f image2pipe -vcodec ppm - |\
    convert -delay 5 -layers Optimize -loop 0 - "$2"
}

# add adb to my path
#export PATH=$PATH:/Users/ms/Library/Android/sdk/platform-tools
#export ANDROID_SDK_ROOT=/usr/local/share/android-sdk

# Tunnells
alias ssrq='sshuttle -r admin@sikhnerd.myqnapcloud.com 192.168.1.10'
alias ssrc='sshuttle -r bsg 10.142.0.0/16 10.0.0.0/20 10.110.0.0/16'
alias cht='ssh -D 9080 bsg'
alias ash='gcloud alpha cloud-shell ssh'

# Start an instance of chrome using a local proxy
#alias chpxy='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --user-data-dir="$HOME/chrome-proxy-profile" --proxy-server="socks5://localhost:9080"'
alias chpxy='chromium --user-data-dir="/home/ms/temp/l" --proxy-server="socks5://localhost:9080"'

# Current Millisecond Epoch
alias cmse='date +%s000'

# Fancy Bash
#source /home/ms/dotfiles/bash/bashline.sh
#source <("/home/ms/bin/starship" init bash --print-full-init)
eval "$(starship init bash)"

# Set Default java to 8
#export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

# Custom Binaries
export PATH=$PATH:/home/ms/bin


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/ms/Downloads/google-cloud-sdk-235.0.0-linux-x86_64/google-cloud-sdk/path.bash.inc' ]; then . '/home/ms/Downloads/google-cloud-sdk-235.0.0-linux-x86_64/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/ms/Downloads/google-cloud-sdk-235.0.0-linux-x86_64/google-cloud-sdk/completion.bash.inc' ]; then . '/home/ms/Downloads/google-cloud-sdk-235.0.0-linux-x86_64/google-cloud-sdk/completion.bash.inc'; fi

alias open='xdg-open'

alias ytdl="youtube-dl --external-downloader aria2c --external-downloader-args '-c -j 5 -x 3 -s 5 -k 1M' -f bestvideo+bestaudio"
alias ytdla="youtube-dl --external-downloader aria2c --external-downloader-args '-c -j 5 -x 3 -s 5 -k 1M' -f bestaudio --extract-audio --audio-format mp3"

# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

alias intel='system76-power graphics intel'
alias nvidia='system76-power graphics nvidia'
alias perf='system76-power profile performance'
alias balanced='system76-power profile balanced'
alias battery='system76-power profile battery'

alias cam0='gphoto2 --auto-detect'
alias cam1='sudo modprobe v4l2loopback exclusive_caps=1 max_buffers=2 devices=2 video_nr=10,9 card_label="Sony A6300","OBS"'
alias cam2='gphoto2 --stdout --capture-movie | ffmpeg -hwaccel nvdec -c:v mjpeg_cuvid -i - -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 /dev/video10'

alias mkvenv='python3 -m venv .venv'
alias svenv='source .venv/bin/activate'
alias svba='source .venv/bin/activate'

alias backup='rclone sync --progress --copy-links --multi-thread-streams 4 --transfers 34 /home/ms qnap:/share/CACHEDEV2_DATA/linuxbackups/backup/'
