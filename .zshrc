eval "$(starship init zsh)"
 
# The following lines were added by compinstall
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle :compinstall filename '/home/evgeniy/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall
# Completion for kitty
kitty + complete setup zsh | source /dev/stdin
#
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
export HISTTIMEFORMAT="[%F %T] "
# End of lines configured by zsh-newuser-install

export TERM="xterm-256color"
# export TERM="rxvt-unicode-256color"
# Path to your oh-my-zsh installation.
# export ZSH="$HOME/.oh-my-zsh"

# vi-mode settings:
bindkey -v
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
# ZSH_THEME="powerlevel10k/powerlevel10k"

export WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>'
# bindkey ';5D' backward-word
# bindkey ';5C' forward-word

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
# [ -f $HOME/.oh-my-zsh/plugins/gitignore/gitignore.plugin.zsh ] && source $HOME/.oh-my-zsh/plugins/gitignore/gitignore.plugin.zsh
# [ -f $HOME/.oh-my-zsh/plugins/node/node.plugin.zsh ] && source $HOME/.oh-my-zsh/plugins/node/node.plugin.zsh
# [ -f $HOME/.oh-my-zsh/plugins/rsync/rsync.plugin.zsh ] && source $HOME/.oh-my-zsh/plugins/rsync/rsync.plugin.zsh
# [ -f $HOME/.oh-my-zsh/plugins/colored-man-pages/colored-man-pages.plugin.zsh ] && source $HOME/.oh-my-zsh/plugins/colored-man-pages/colored-man-pages.plugin.zsh
# [ -f $HOME/.oh-my-zsh/plugins/ripgrep/_ripgrep ] && source $HOME/.oh-my-zsh/plugins/ripgrep/_ripgrep


[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

#===========================================================================
#=========================== WALL SETTINGS =================================
#===========================================================================
(cat $HOME/.config/wpg/sequences &) # Alternative (blocks terminal for 0-3ms)
# To add support for TTYs this line can be optionally added.
# source $HOME/.cache/wal/colors-tty.sh
# source $HOME/.cache/wal/colors.sh

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
[ -f ~/.exports ] && source ~/.exports # If exists ~/.exports source this file:
# [ -f ~/.shell_functions ] && source ~/.shell_functions # If exists ~/.shell_functions source this file:

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh;
[ -f /home/evgeniy/.config/cani/completions/_cani.zsh ] && source /home/evgeniy/.config/cani/completions/_cani.zsh

[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f $HOME/.local/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh ] && source $HOME/.local/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source ~/03_Drafts/05_finance/myfinance/.bashrc
source /home/evgeniy/.config/broot/launcher/bash/br

# Blitz.js autocompletion
eval BLITZ_AC_ZSH_SETUP_PATH="$HOME/.cache/@blitzjs/cli/autocomplete/zsh_setup" && test -f $BLITZ_AC_ZSH_SETUP_PATH && source $BLITZ_AC_ZSH_SETUP_PATH; # blitz autocomplete setup
# Time meter (uncomment last and firs lines)

#export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion zprof

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
