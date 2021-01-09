# Created by newuser for 5.8

export TERM="xterm-256color"
# export TERM="rxvt-unicode-256color"
# Path to your oh-my-zsh installation.
# export ZSH="$HOME/.oh-my-zsh"

bindkey -v


HIST_STAMPS="mm/dd/yyyy" # variable used in oh-my-zsh/lib/history.zsh

# zplug "softmoth/zsh-vim-mode", lazy:true
# zplug "skywind3000/z.lua"

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
ZSH_THEME="powerlevel10k/powerlevel10k"

export WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>'
bindkey ';5D' backward-word
bindkey ';5C' forward-word

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Source to oh-my-zsh plugins
# if [ -f $ZSH/oh-my-zsh.sh ]; then
	# source $ZSH/oh-my-zsh.sh &&
	# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh &&
	# source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# fi
# [ -f $HOME/.oh-my-zsh/plugins/gitignore/gitignore.plugin.zsh ] && source $HOME/.oh-my-zsh/plugins/gitignore/gitignore.plugin.zsh
# [ -f $HOME/.oh-my-zsh/plugins/node/node.plugin.zsh ] && source $HOME/.oh-my-zsh/plugins/node/node.plugin.zsh
# [ -f $HOME/.oh-my-zsh/plugins/rsync/rsync.plugin.zsh ] && source $HOME/.oh-my-zsh/plugins/rsync/rsync.plugin.zsh
# [ -f $HOME/.oh-my-zsh/plugins/colored-man-pages/colored-man-pages.plugin.zsh ] && source $HOME/.oh-my-zsh/plugins/colored-man-pages/colored-man-pages.plugin.zsh
# [ -f $HOME/.oh-my-zsh/plugins/ripgrep/_ripgrep ] && source $HOME/.oh-my-zsh/plugins/ripgrep/_ripgrep
# [ -f ~/.purepower ] && source ~/.purepower # Points to the oh-my-zsh purepower theme


[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

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
setopt MAGIC_EQUAL_SUBST
# не обрабатывать escape sequence в echo без -e
# setopt BSD_ECHO
# поддержка комментариев в командной строке
# setopt INTERACTIVE_COMMENTS
# поддержка $(cmd) в $PS1 etc.
# setopt PROMPT_SUBST

# Aliases from bash
[ -f $HOME/.bash_aliases ] && source $HOME/.bash_aliases

# Point out to z.sh
# [ -f /media/Scripts/z.sh ] && source /media/Scripts/z.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /home/evgeniy/.config/cani/completions/_cani.zsh ] && source /home/evgeniy/.config/cani/completions/_cani.zsh

source ~/03_Drafts/05_finance/myfinance/.bashrc
# If exists ~/.exports source this file:
[ -f ~/.exports ] && source ~/.exports

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# Time meter (uncomment last and firs lines)
# zprof

source /home/evgeniy/.config/broot/launcher/bash/br
eval "$(starship init zsh)"
