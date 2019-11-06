# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# export TERM="xterm-256color"
export TERM="rxvt-unicode-256color"
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# source zplug
export ZPLUG_LOG_LOAD_SUCCESS="false"
export ZPLUG_LOG_LOAD_FAILURE="false"
source /usr/share/zsh/scripts/zplug/init.zsh
export ZPLUG_HOME="/usr/share/zsh/scripts/zplug"
# zplug 'zplug/zplug', hook-build:'zplug --self-manage'
bindkey -v # turn on vi-mode

HIST_STAMPS="mm/dd/yyyy" # variable used in oh-my-zsh/lib/history.zsh
zplug "robbyrussell/oh-my-zsh", use:"$ZSH/lib/{clipboard,completion,directories,history,termsupport,key-bindings,nvm,grep}.zsh"
zplug "plugins/git", from:oh-my-zsh, lazy:true
zplug "plugins/npm", from:oh-my-zsh, lazy:true
zplug "plugins/node", from:oh-my-zsh, lazy:true
zplug "plugins/yarn", from:oh-my-zsh, lazy:true
zplug "plugins/pip", from:oh-my-zsh, lazy:true
zplug "plugins/colored-man-pages", from:oh-my-zsh, lazy:true
zplug "plugins/extract", from:oh-my-zsh, lazy:true
zplug "plugins/tmux", from:oh-my-zsh, lazy:true
zplug "plugins/vscode", from:oh-my-zsh, lazy:true
zplug "plugins/github", from:oh-my-zsh, lazy:true
zplug "plugins/gitignore", from:oh-my-zsh, lazy:true
zplug "plugins/archlinux", from:oh-my-zsh, lazy:true
zplug "plugins/docker", from:oh-my-zsh, lazy:true
zplug "plugins/docker-compose", from:oh-my-zsh, lazy:true
zplug "plugins/gulp", from:oh-my-zsh, lazy:true
# zplug "plugins/z.sh", from:oh-my-zsh, lazy:true
# enhanced zsh vim mode
zplug "softmoth/zsh-vim-mode", lazy:true
zplug "skywind3000/z.lua"

# vi-mode settings:
MODE_INDICATOR_VIINS='%F{15}<%F{8}INSERT<%f'
MODE_INDICATOR_VICMD='%F{10}<%F{2}NORMAL<%f'
MODE_INDICATOR_REPLACE='%F{9}<%F{1}REPLACE<%f'
MODE_INDICATOR_SEARCH='%F{13}<%F{5}SEARCH<%f'
MODE_INDICATOR_VISUAL='%F{12}<%F{4}VISUAL<%f'
MODE_INDICATOR_VLINE='%F{12}<%F{4}V-LINE<%f'

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
# in .zshrc add this:
export WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>'
bindkey ';5D' backward-word
bindkey ';5C' forward-word

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
#
# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Source to ...
if [ -f $ZSH/oh-my-zsh.sh ]; then
	source $ZSH/oh-my-zsh.sh
fi

if [ -f $ZSH/oh-my-zsh.sh ]; then
	source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

if [ -f $ZSH/oh-my-zsh.sh ]; then
	source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Which plugins would you like to load?
# Standard plugins can be found in $HOME/.oh-my-zsh/plugins/*
# Custom plugins may be added to $HOME/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(
	# git
	# npm
	# node
	# yarn
	# pip
	# colored-man-pages
	# extract
	# tmux
	# vscode
	# github
	# gitignore
	# archlinux
	# zsh-autosuggestions
# )

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

# npm to $PATH
export PATH="$PATH:$HOME/.npm/bin"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# Custom PATH
export PATH="$PATH:/mnt/Data/Scripts"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"

# Filmic blender path
export OCIO=$HOME/.config/blender/2.79/datafiles/colormanagement/config.ocio

# Wine prefixes
export W_PREFIXES=$HOME/.PlayOnLinux/wineprefix

# Variables
function _get_editor { echo $(which vim) || echo $(which vi) || echo $(which nano)}
export SUDO_EDITOR="$(_get_editor)"
export EDITOR="$(_get_editor)"
export GTK_IM_MODULE="xim"
export MON_PRIMARY=$(xrandr | grep -w "connected primary" | awk '{print $1}')
export MANPATH="/usr/local/man:$MANPATH"
# You may need to manually set your language environment
#export LANG=ru_RU.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export FZF_DEFAULT_COMMAND='rg --files --follow --hidden'

# Aliases from bash
[ -f $HOME/.bash_aliases ] && source $HOME/.bash_aliases

# Point out to z.sh
# [ -f /media/Scripts/z.sh ] && source /media/Scripts/z.sh

# Points out to the purepower oh-my-zsh theme
[ -f ~/.purepower ] && source ~/.purepower

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /home/evgeniy/.config/cani/completions/_cani.zsh ] && source /home/evgeniy/.config/cani/completions/_cani.zsh
