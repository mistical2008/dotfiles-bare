# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/evgeniy/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"
# ZSH_THEME="agnoster"

# export TERM="xterm-256color"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  npm
  node
	yarn
	pip
  colored-man-pages
  extract
  tmux
	vscode
  github
  gitignore
  archlinux
  zsh-autosuggestions
)

# Source to ...
source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#===========================================================================
#=========================== WALL SETTINGS =================================
#===========================================================================
(cat ~/.cache/wal/sequences &)
# Alternative (blocks terminal for 0-3ms)
# cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh
source ~/.cache/wal/colors.sh

#===========================================================================
#=========================== wall settings end =============================
#===========================================================================

# User configuration
# традиционный стиль перенаправлений fd
# unsetopt MULTIOS
# поддержка ~… и file completion после = в аргументах
# setopt MAGIC_EQUAL_SUBST
# не обрабатывать escape sequence в echo без -e
# setopt BSD_ECHO
# поддержка комментариев в командной строке
# setopt INTERACTIVE_COMMENTS
# поддержка $(cmd) в $PS1 etc.
# setopt PROMPT_SUBST

export MANPATH="/usr/local/man:$MANPATH"
# You may need to manually set your language environment
#export LANG=ru_RU.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='nano'
# else
#   export EDITOR='mnano'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#Powerlevel9K Settings
POWERLEVEL9K_MODE="awesome-patched"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status context dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="white"
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_TIME_BACKGROUND="black"
POWERLEVEL9K_TIME_FOREGROUND="249"
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M}"
POWERLEVEL9K_COLOR_SCHEME='dark'
# POWERLEVEL9K_VCS_GIT_ICON='\uE1AA'
# POWERLEVEL9K_VCS_GIT_GITHUB_ICON='\uE1AA'
POWERLEVEL9K_HIDE_BRANCH_ICON=true

# POWERLEVEL9K_MODE='awesome-patched'
# POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
# POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
# POWERLEVEL9K_STATUS_VERBOSE=false
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status os_icon load context dir vcs)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time)
# POWERLEVEL9K_SHOW_CHANGESET=true
# POWERLEVEL9K_CHANGESET_HASH_LENGTH=6З

# Bashrc settings (moved)
# npm to $PATH
export PATH="$PATH:$HOME/.npm/bin"
export NVM_DIR="/home/evgeniy/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Custom PATH
export PATH="$PATH:/mnt/Data/Scripts"
export PATH="$PATH:/home/evgeniy/.local/bin"

# Filmic blender path
export OCIO=/home/evgeniy/.config/blender/2.79/datafiles/colormanagement/config.ocio

# Wine prefixes
export W_PREFIXES=$HOME/.PlayOnLinux/wineprefix

# Variables
export SUDO_EDITOR=gedit
#export VISUAL=code
#export TERMINAL=/usr/bin/gnome-terminal
export GTK_IM_MODULE="xim"

# Aliases from bash
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Point out to z.sh
. /media/Scripts/z.sh


## FUNCTIONS

# Configurations
conf() {
	case $1 in
		wacom) sudo nano /home/evgeniy/.config/xsetwacom-gnome-symbiotic/setup.sh  ;;
		aliases) nano ~/.bash_aliases && dotfiles-push ;;
		bmblb) sudoedit /etc/bumblebee/bumblebee.conf  ;;
		homepage)	olddir=$(pwd) && cd ~/scripts/homepage.py && nano homepage.py && ./homepage.py; cd $olddir ;;
		pacman)		sudoedit /etc/pacman.conf ;;
		samba)	sudoedit /etc/samba/smb.conf ;;
		fstab)	sudoedit /etc/fstab ;;
		i3)  code /home/evgeniy/.config/i3/config && dotfiles-push ;;
		compton)  code /home/evgeniy/.config/i3/compton.conf && dotfiles-push ;;
		polybar)  code /home/evgeniy/.config/i3/polybar.conf && dotfiles-push ;;
		dunst)  code /home/evgeniy/.config/dunst/dunstrc && dotfiles-push ;;
		tmux)		code ~/.tmux.conf && dotfiles-push ;;
		nano)		code ~/.nanorc && dotfiles-push ;;
		xinit)		code ~/.xinitrc && dotfiles-push ;;
		xres)	code ~/.Xresources && xrdb ~/.Xresources ;;
		fonts-u) gedit ~/.config/fontconfig/70-emojione-color.conf && fc-cache -f -v ;;
		theme2)		code ~/.themes/FlatStudioCustom/gtk-2.0/gtkrc ;;
		theme3)		code ~/.themes/FlatStudioCustom/gtk-3.0/gtk.css ;;
		gtk2)		code ~/.gtkrc-2.0 ;;
		gtk3)		code ~/.config/gtk-3.0/settings.ini ;;
		zsh)		code ~/.zshrc && source ~/.zshrc && dotfiles-push ;;
		hosts)		sudoedit /etc/hosts ;;
		vhosts)		sudoedit /etc/httpd/conf/extra/httpd-vhosts.conf ;;
		httpd)		sudoedit /etc/httpd/conf/httpd.conf ;;
		*)			echo "Unknown application: $1" ;;
	esac
}

# Other functions
function open() { xdg-open $1 &> /dev/null &disown; }
