# Path to your oh-my-zsh installation.
export ZSH="$HOME/.config/zsh/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

#p10k
source ~/powerlevel10k/powerlevel10k.zsh-theme

export PATH=$PATH:/usr/local/bin

# Set list of themes to pick from when loading at random
ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# No Duplicate History 
setopt hist_ignore_all_dups

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Extract the contents of the file based on its file extension.
ex ()
{
  if [ -f "$1" ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Which plugins would you like to load?
plugins=(
    git
    history-substring-search
    colored-man-pages
)

source $ZSH/oh-my-zsh.sh

# ------- MAIN ALIASES --------

# Navigation
up () {
  local d=""
  local limit="$1"

  # Default to limit of 1
  if [ -z "$limit" ] || [ "$limit" -le 0 ]; then
    limit=1
  fi

  for ((i=1;i<=limit;i++)); do
    d="../$d"
  done

  # perform cd. Show error if cd fails
  if ! cd "$d"; then
    echo "Couldn't go up $limit dirs."
  fi
}

# Code Editor - Vim, Visual Studio Code
alias vim="nvim"
alias code="code ."

# Changing "ls" to "exa"
alias l='ls'
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing

# Package Manager (Apt)
alias pakages="dpkg -l | fzf --preview 'dpkg -L {}' --layout=reverse --bind 'enter:execute(dpkg -L {} | less)'"
alias pkglast="ls -lt /var/lib/dpkg/info/ | awk 'NR<=10 {print \$9}'"
alias update-system='sudo apt-get update && sudo apt-get upgrade'           # update system packages
alias inst='sudo apt-get install'        # install packages
alias force-remove='sudo apt-get remove --purge'    # remove packages
alias cleanup='sudo apt-get autoremove'  # remove unused packages

# Get fastest mirrors for APT
alias mirror="sudo apt update && sudo apt install reflector -y && sudo reflector -c 'United States' --age 12 --protocol https --sort rate --save /etc/apt/sources.list"
alias mirrors="sudo apt update && sudo apt install reflector -y && sudo reflector --list-countries | sed 's/^/sudo reflector --verbose --protocol https --country /;s/$/ --age 12 --sort rate --save \/etc\/apt\/sources.list/' | sh"

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'

# Remove to Trash
alias rm="gio trash"
alias 'rm -rf'="gio trash"

# Adding flags
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias lynx='lynx -cfg=~/.lynx/lynx.cfg -lss=~/.lynx/lynx.lss -vikeys'
alias mocp='mocp -M "$XDG_CONFIG_HOME"/moc -O MOCDir="$XDG_CONFIG_HOME"/moc'

# ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'

# Merge Xresources
alias merge='xrdb -merge ~/.Xresources'

# Get error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# yt-dlp
alias yta-aac="yt-dlp --extract-audio --audio-format aac "
alias yta-best="yt-dlp --extract-audio --audio-format best "
alias yta-flac="yt-dlp --extract-audio --audio-format flac "
alias yta-m4a="yt-dlp --extract-audio --audio-format m4a "
alias yta-mp3="yt-dlp --extract-audio --audio-format mp3 "
alias yta-opus="yt-dlp --extract-audio --audio-format opus "
alias yta-vorbis="yt-dlp --extract-audio --audio-format vorbis "
alias yta-wav="yt-dlp --extract-audio --audio-format wav "
alias ytv-best="yt-dlp -f bestvideo+bestaudio "
# Only Video
alias ytv-list="yt-dlp -i -f mp4 --yes-playlist "
alias ytv-mp4="yt-dlp -i -f mp4 "

# Switch between shells easily
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="sudo chsh $USER -s /bin/fish && echo 'Now log out.'"

#Leftwm aliases
alias lti="leftwm-theme install"
alias ltu="leftwm-theme uninstall"
alias lta="leftwm-theme apply"
alias ltupd="leftwm-theme update"
alias ltupg="leftwm-theme upgrade"

alias wifir="sudo systemctl restart NetworkManager"
alias wifi="bash /$HOME/.config/rofi/rofi-network-manager/rofi-network-manager.sh"
alias hh="history"
alias kc="killall conky"
alias ck="conky"
alias lock='betterlockscreen -l --text "Error 404: Display not found"'
alias logout="gnome-session-quit --logout --no-prompt"
alias myip="curl ifconfig.me/"
alias vi="neovide "
alias batr="upower -i /org/freedesktop/UPower/devices/battery_BAT0"
alias grub="sudo nvim /etc/default/grub"
alias rldb="killall xidlehook && killall sxhkd && bspc wm -r"
# alias net-signal="watch -n1 "awk 'NR==3 {printf(\"WiFi Signal Strength = %.0f%%\\n\",\$3*10/7)}' /proc/net/wireless"" # https://askubuntu.com/questions/95676/a-tool-to-measure-signal-strength-of-wireless
alias window-identify="xprop | grep WM_CLASS"

#files
alias rc="nvim ~/.zshrc"
alias bspwmrc="nvim ~/.config/bspwm/bspwmrc"
alias sxhkdrc="nvim ~/.config/sxhkd/sxhkdrc"
alias polybar-modules="nvim ~/.config/polybar/modules.ini"
alias xinitrc="nvim ~/.xinitrc"
alias picomrc="nvim ~/.config/picom/picom.conf"

# File Manager
alias thunar="thunar \$(pwd)"
alias r="ranger"
alias k="killall"
alias art="clear && /home/$USER/.config/neofetch/ascii_art/unix"
alias kitty-themes="kitty +kitten themes"

# ncmpcpp custom
alias ncmpcpp='ncmpcpp -c ~/.config/ncmpcpp/config'

# Screen Recording - No Audio + w/ Audio - ffmpeg
alias rec-noaudio="ffmpeg -f x11grab -video_size 1920x1080 -framerate 25 -i \$DISPLAY -c:v h264_nvenc ~/Videos/Screen_Recording/Recording-\$(date +%B-%d-%Y_%H:%M:%S).mp4"
alias rec-intaudio="ffmpeg -f x11grab -video_size 1920x1080 -framerate 25 -i :0.0 -f pulse -i default -preset ultrafast -crf 18 -pix_fmt yuv420p ~/Videos/Screen_Recording/Recording_Internal-Audio\$(date +%B-%d-%Y_%H:%M:%S).mp4"

# Terminal rickroll :)
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'

# Personal/Programming
alias pi="python3 "

# Conky
alias conky="conky --config=$HOME/.config/conky/.conkyrc"

# clipboard
alias clip='xclip -selection clipboard'

# Personal/Scripts
alias t-stream='python /home/StealthIQ/MEGAsync/Projects/Python/torrent-strm/Main/_xmain_.py'
alias pax="python3 ~/MEGAsync/Projects/Python/passfx/main.py"

# Personal/Games
alias tic-tac-toe="python3 ~/tools/Tic-Tac-Toe/tictactoe.py"

# Github Alias
alias clone="git clone --depth 1"
alias gmit="bash ~/.scripts/git-licence-MIT.sh"

# --- Alias as Functions ----
bleachbit-cleanup() {
  bleachbit --list | grep --color=auto -E "[a-z0-9_\-]+\.[a-z0-9_\-]+" | xargs bleachbit --clean
}
wifi-range() {
  watch -n1 "awk 'NR==3 {printf(\"WiFi Signal Strength = %.0f%%\\n\",\$3*10/7)}' /proc/net/wireless"
}

# ----- Env Variables -----

# Pyenv  
export PATH="$HOME/.pyenv/bin:$PATH"w
eval "$(pyenv init -)"

# Rust
# export RUST="$HOME/.cargo/bin"

# XDG
export XDG_DATA_HOME="$HOME/.local/share" 
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache" 
export XDG_STATE_HOME="$HOME/.local/state"

# Go
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# Zoxide insted of cd
eval "$(zoxide init zsh)"
alias cd="z"
# Pyenv
eval "$(pyenv init - zsh)"

# Local Scripts
export PATH="$PATH:$HOME/.local/bin"

# Lang
export LANG=en_US.UTF-8

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
