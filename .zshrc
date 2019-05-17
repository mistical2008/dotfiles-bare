# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export TERM="xterm-256color"
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="powerlevel9k/powerlevel9k"
# ZSH_THEME="muse"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $HOME/.oh-my-zsh/themes/
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

# Source to ...
source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme

# Which plugins would you like to load?
# Standard plugins can be found in $HOME/.oh-my-zsh/plugins/*
# Custom plugins may be added to $HOME/.oh-my-zsh/custom/plugins/
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
	# zsh-autosuggestions
)

#===========================================================================
#=========================== WALL SETTINGS =================================
#===========================================================================
# (cat $HOME/.cache/wal/sequences &)
(cat $HOME/.config/wpg/sequences &)
# Alternative (blocks terminal for 0-3ms)
# cat $HOME/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
source $HOME/.cache/wal/colors-tty.sh
source $HOME/.cache/wal/colors.sh

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
# export SSH_KEY_PATH="$HOME/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate $HOME/.zshrc"
# alias ohmyzsh="mate $HOME/.oh-my-zsh"

#Powerlevel9K Settings
POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status context dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(nvm time)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="020"
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_TIME_BACKGROUND="black"
POWERLEVEL9K_TIME_FOREGROUND="249"
POWERLEVEL9K_DIR_BACKGROUND="046"
POWERLEVEL9K_DIR_FOREGROUND="006"
POWERLEVEL9K_VCS_BACKGROUND="black"
POWERLEVEL9K_VCS_FOREGROUND="010"
POWERLEVEL9K_STATUS_BACKGROUND="black"
POWERLEVEL9K_STATUS_FOREGROUND="009"
POWERLEVEL9K_DIR_WRITABLE_BACKGROUND="black"
POWERLEVEL9K_DIR_WRITABLE_FOREGROUND="009"
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M}"
POWERLEVEL9K_COLOR_SCHEME='dark'
POWERLEVEL9K_HIDE_BRANCH_ICON=false

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

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
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# Custom PATH
export PATH="$PATH:/mnt/Data/Scripts"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.gem/ruby/2.6.0/bin"

# Filmic blender path
export OCIO=$HOME/.config/blender/2.79/datafiles/colormanagement/config.ocio

# Wine prefixes
export W_PREFIXES=$HOME/.PlayOnLinux/wineprefix

# Variables
export SUDO_EDITOR=gedit
#export VISUAL=code
#export TERMINAL=/usr/bin/gnome-terminal
export GTK_IM_MODULE="xim"

export MON_PRIMARY=$(xrandr | grep -w "connected primary" | awk '{print $1}')

# Aliases from bash
if [ -f $HOME/.bash_aliases ]; then
	. $HOME/.bash_aliases
fi

# Point out to z.sh
. /media/Scripts/z.sh

## FUNCTIONS

# Configurations
conf() {
	case $1 in
	wacom) sudo nano $HOME/.config/xsetwacom-gnome-symbiotic/setup.sh && setwac-run ;;
	aliases) code -w $HOME/.bash_aliases && source $HOME/.zshrc && dfa $HOME/.bash_aliases && dfcm "Updated aliases" && dfp ;;
	bmblb) sudoedit /etc/bumblebee/bumblebee.conf ;;
	homepage)
		olddir=$(pwd) && cd $HOME/scripts/homepage.py && nano homepage.py && ./homepage.py
		cd $olddir
		;;
	mimeapps) code -w $HOME/.config/mimeapps.list && dfa $HOME/.config/mimeapps.list && dfcm "Updated mimeapps.list" && dfp ;;
	pacman) sudoedit /etc/pacman.conf ;;
	samba) sudoedit /etc/samba/smb.conf ;;
	fstab) sudoedit /etc/fstab ;;
	i3) code -w $HOME/.config/i3/config && dfa $HOME/.config/i3/config && dfcm "Updated i3 config" && dfp ;;
	maid) code -w $HOME/.maid/rules.rb && dfa $HOME/.maid/rules.rb && dfcm "Updated maid config" && dfp ;;
	todo) code -w $HOME/.config/todo/config && dfa $HOME/.config/todo/config && dfcm "Updated maid config" && dfp ;;
	compton) code -w $HOME/.config/i3/compton.conf && dfa $HOME/.config/i3/compton.conf && dfcm "Updated compton.conf" && dfp ;;
	polybar) code -w $HOME/.config/i3/polybar.conf && dfa $HOME/.config/i3/polybar.conf && dfcm "Updated polybar.conf" && dfp ;;
	dunst) code -w $HOME/.config/dunst/dunstrc && dfa $HOME/.config/dunst/dunstrc && dfcm "Updated dunstrc" && dfp ;;
	tmux) code -w $HOME/.tmux.conf && dfa $HOME/.tmux.conf && dfcm "Updated tmux.conf" && dfp ;;
	nano) code -w $HOME/.nanorc && dfa $HOME/.nanorc && dfcm "Updated nanorc" && dfp ;;
	xinit) code -w $HOME/.xinitrc && dfa $HOME/.xinitrc && dfcm "Updated xinitrc" && dfp ;;
	xres) code -w $HOME/.Xresources && xrdb $HOME/.Xresources ;;
	fonts-u) code -w $HOME/.config/fontconfig/70-emojione-color.conf && fc-cache -f -v ;;
	theme2) code -w $HOME/.themes/FlatStudioCustom/gtk-2.0/gtkrc ;;
	theme3) code -w $HOME/.themes/FlatStudioCustom/gtk-3.0/gtk.css ;;
	gtk2) code -w $HOME/.gtkrc-2.0 ;;
	gtk3) code -w $HOME/.config/gtk-3.0/settings.ini ;;
	zsh) code -w $HOME/.zshrc && source $HOME/.zshrc && dfa $HOME/.zshrc && dfcm "Updated zshrc" && dfp ;;
	hosts) sudoedit /etc/hosts ;;
	vhosts) sudoedit /etc/httpd/conf/extra/httpd-vhosts.conf ;;
	httpd) sudoedit /etc/httpd/conf/httpd.conf ;;
	*) echo "Unknown application: $1" ;;
	esac
}

# Other functions
function open() {
	xdg-open $1 &>/dev/null &
	disown
}
source ~/.purepower
