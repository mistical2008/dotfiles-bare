# Custom aliases
alias aurup='yaourt -Syua'
alias pacupa='yaourt -Syu --aur'
alias pacup='sudo pacman -Syu'
alias vmplayer='primusrun vmplayer'
alias vmware='primusrun vmware'
alias wacompr='wacom-profile-switcher.sh'
alias gits='git status'
alias gita='git add'
alias gitch='git checkout'
alias gitbr='git branch'
alias gitch-b='git checkout -b'
alias gitbr-d='git branch -d'
alias gitme='git merge'
alias gitcm='git commit -m'
alias gitr='git remote'
alias hist='log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'
alias rmgl="rm -rf .git/index.lock"
alias dev-sc="rm -rf .git && git init && pnpm i"
# alias ll="ls -lhA"
alias pfind="ps aux | grep"
alias apache-droot="grep -R 'DocumentRoot' /etc/apache2/sites-enabled"
alias mkfat32="sudo mkdosfs -F 32 -I"
alias rmf='rm -rf'
## alias ls1='ls -1'
## alias lsa='ls -1a'
alias err1="journalctl -b -p err"
alias err2="journalctl -p 3 -xb"
alias err3="systemctl --failed"
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
alias myip="curl http://ipecho.net/plain; echo"
alias jerr="journalctl -p err..alert"
alias fix.icons="sudo sed -i 's/Context=Mimetypes/Context=MimeTypes/g; s/Context=Apps/Context=Applications/g ' /usr/share/icons/*/index.theme"
alias genpass="cat /dev/urandom | tr -dc a-zA-Z0-9 | fold -w 32 | head -n 1"
alias gfix="gita . && gitcm 'some fixes' && git push"
alias manjaro-pool-pkg="https://mirror.netzspielplatz.de/manjaro/packages/pool/overlay/"
alias fix.def.files="xdg-mime default org.gnome.Nautilus.desktop inode/directory"
alias show.def.files="xdg-mime query default inode/directory"
## alias get.all.res="find -type f -iname "*.jpg" -exec identify -format "%wx%h\n" "{}" \; | sort | uniq "
alias get.all.res="find . -iname '*.jpg' -type f -print0 | xargs -0 -I{} identify -format '%wx%h\n' {} | sort | uniq"
alias ya='yaourt'
alias apps='cd /usr/share/applications'
alias apps_u='cd ~/.local/share/applications'
alias sounds_s='cd /usr/share/sounds'
alias conf_u='cd ~/.config'
alias kodi-pc='192.168.100.7'
alias dirinf='ll | grep'
alias topCom='history | awk "{print }" | sort | uniq -c | sort -rn | head'
alias 3did='lspci | grep NVIDIA | cut -b -8'
alias rmbadtr='find /var/cache/pacman/pkg/ -iname *.part -exec rm {} \;'
alias pacsize="pacman -Qi | awk '/^Name/{name=$3} /^Installed Size/{print $4$5, name}' | sort -h"
alias setwac-run='~/.config/xsetwacom-gnome-symbiotic/setup.sh'
alias zup=". ~/.zshrc"
# alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias b='buku --suggest'
alias toutf8="find . -name '*.txt' -exec iconv --verbose -f cp1251 -t utf-8 -o {} {} \;"
alias nnn_upd_plugs="curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | sh"

# Configs
alias sudolist='sudo /usr/sbin/visudo'
alias dotfiles='/usr/bin/git --git-dir=/home/evgeniy/.dotfiles/ --work-tree=/home/evgeniy'
alias dfa="dotfiles add"
alias dfcm="dotfiles commit -m"
alias dfs="dotfiles status"
alias dfp="dotfiles push"
alias dfch="dotfiles checkout"
alias get_keys="xev | grep -A2 --line-buffered '^KeyRelease' | sed -n '/keyvim /s/^.*keyvim \([0-9]*\).* (.*, \(.*\)).*$/\1 \2/p'"
alias sys_sounds="cd /usr/share/sounds/"
alias pipupg="pip install --user --upgrade"
alias t="todo.sh -d ~/.config/todo/config -t"
alias today="t listpri A-B"
alias tdone="todo lf done"
alias tinbadd="todo addto inbox.txt"
alias tasks='git grep -EI "TODO|FIXME"'
alias mux='tmuxinator'
alias wpg='wpg && bl-set-wal.sh'
alias nitrogen='nitrogen --save && bl-set-wal-nitr.sh'
alias tuijam-fix='stty -ixon'
alias tuijam='stty -ixon; tuijam'
alias yafz='yay -Slq | fzf -m --preview "yay -Si {1}" | xargs -ro yay -S'
alias yafzr='yay -Qeq | fzf -m --preview 'yay -Qi {1}' | xargs -ro yay -Rs'
alias yafzl='yay -Ql | awk "{print $2}" | fzf --preview "cat {}" | tr -d "\n" | xclip -i -selection clipboard'
alias fzcp='fzf | tr -d "\n" | xclip -i -sel clip'
alias kbtglg='grep "grp:.*toggle" /usr/share/X11/xkb/rules/base.lst | fzf'
alias kbtgl3='grep "lv3:.*toggle" /usr/share/X11/xkb/rules/base.lst | fzf'
alias getpwd='echo $PWD | tr -d "\n" | xclip -i -selection clipboard'
alias VW='vim +VimwikiUISelect'
alias VWJ='vim +VimwikiDiaryIndex'
alias diff='diff -y --color'
alias lynx='lynx -vikeys'
alias who='who -H'
alias cmd_bell="echo -e '\a' || (echo -e '\a'; sleep 1; echo -e '\a')"
alias btrdf="sudo btrfs filesystem usage"
alias cheat="cht.sh"
alias learn:js="cht.sh js/:learn | less"
alias learn:py="cht.sh python/:learn | less"
alias learn:rb="cht.sh ruby/:learn | less"
alias learn:js-ref="cht.sh js learn"
alias learn:node-ref="cht.sh nodejs learn | less"
alias learn:py-ref="cht.sh python learn | less"
alias learn:rb-ref="cht.sh ruby learn | less"
alias addtr="vim '$HOME/03_Drafts/05_finance/myfinance/journal.ledger'"
alias tinbox="todo.sh ls -(.)"
alias tweek="todo.sh listpri c"
alias tlater="todo.sh listpri d"
alias cltmp="ls -ca $HOME/tmp; rm -r $HOME/tmp/*"

## FUNCTIONS
# Configurations
conf() {
  case $1 in
  ctags) vim $HOME/.ctags.d/cfg.2.ctags && dfa $HOME/.ctags.d/cfg.2.ctags && dfcm "ctags autocommit" && dfp ;;
  wacom) sudoedit $HOME/.config/xsetwacom-gnome-symbiotic/setup.sh && setwac-run ;;
  tuijam) vim $HOME/.config/tuijam/config.yaml && dfa $HOME/.config/tuijam/config.yaml && dfcm "tuijam autocommit" && dfp;;
  esp) vim $HOME/.config/espanso/default.yml && dfa $HOME/.config/espanso/default.yml && dfcm "Espanso autocommit" && dfp ;;
  intel) sudoedit /etc/X11/mhwd.d/intel.conf ;;
  vim) vim $HOME/.vimrc && dfa $HOME/.vimrc && dfcm "Updated .vimrc" && dfp ;;
  mutt) vim $HOME/.muttrc && dfa $HOME/.muttrc && dfcm "Updated .vimrc" && dfp ;;
  lightdm) sudoedit /etc/lightdm/lightdm.conf ;;
  nvidia) sudoedit /etc/bumblebee/xorg.conf.nvidia ;;
  aliases) vim $HOME/.bash_aliases && source $HOME/.zshrc && dfa $HOME/.bash_aliases && dfcm "Updated aliases" && dfp ;;
  arps) vim $HOME/.config/autorandr/postswitch && dfa $HOME/.config/autorandr/postswitch && dfcm "Updated autorandr postswitch" && dfp ;;
  bmblb) sudoedit /etc/bumblebee/bumblebee.conf ;;
  homepage) olddir=$(pwd) && cd $HOME/scripts/homepage.py && nano homepage.py && ./homepage.py cd $olddir ;;
  mimeapps) vim $HOME/.config/mimeapps.list && dfa $HOME/.config/mimeapps.list && dfcm "Updated mimeapps.list" && dfp ;;
  pacman) sudoedit /etc/pacman.conf ;;
  samba) sudoedit /etc/samba/smb.conf ;;
  fstab) sudoedit /etc/fstab ;;
  i3) vim $HOME/.config/i3/config && dfa $HOME/.config/i3/config && dfcm "Updated the i3 config" && dfp ;;
  maid) vim $HOME/.maid/rules.rb && dfa $HOME/.maid/rules.rb && dfcm "Updated the maid config" && dfp ;;
  todo) vim $HOME/.config/todo/config && dfa $HOME/.config/todo/config && dfcm "Updated the todo.txt config" && dfp ;;
  ranger) vim $HOME/.config/ranger/rc.conf && dfa $HOME/.config/ranger/rc.conf && dfcm "Updated the ranger config" && dfp ;;
  compton) vim $HOME/.config/i3/compton.conf && dfa $HOME/.config/i3/compton.conf && dfcm "Updated the compton.conf" && dfp ;;
  polybar) vim $HOME/.config/i3/polybar.conf && dfa $HOME/.config/i3/polybar.conf && dfcm "Updated the polybar.conf" && dfp ;;
  dunst) vim $HOME/.config/dunst/dunstrc && dfa $HOME/.config/dunst/dunstrc && dfcm "Updated the dunstrc" && dfp ;;
  rofi) vim $HOME/.config/rofi/config.rasi && $HOME/.config/rofi/config.rasi && dfcm "Updated the rofi config" && dfp ;;
  tmux) vim $HOME/.tmux.conf && dfa $HOME/.tmux.conf && dfcm "Updated the tmux.conf" && dfp ;;
  nano) vim $HOME/.nanorc && dfa $HOME/.nanorc && dfcm "Updated the nanorc" && dfp ;;
  xinit) vim $HOME/.xinitrc && dfa $HOME/.xinitrc && dfcm "Updated the xinitrc" && dfp ;;
  xprofile) vim $HOME/.xprofile && dfa $HOME/.xprofile && dfcm "Updated the.xprofile" && dfp ;;
  xres) vim $HOME/.Xresources && xrdb $HOME/.Xresources && dfa $HOME/.Xresources && dfcm "Updated the .Xresources" && dfp && xrdb -merge ~/.Xresources ;;
  alac) vim $HOME/.config/alacritty/alacritty.yml && dfa $HOME/.config/alacritty/alacritty.yml && dfcm "Updated the alacritty.yaml" && dfp ;;
  sr) vim $HOME/.config/surfraw/conf && dfa $HOME/.config/surfraw/conf && dfcm "surfraw autocommt" && dfp ;;
  fonts-u) vim $HOME/.config/fontconfig/70-emojione-color.conf && fc-cache -f -v ;;
  theme2) vim $HOME/.themes/FlatStudioCustom/gtk-2.0/gtkrc ;;
  theme3) vim $HOME/.themes/FlatStudioCustom/gtk-3.0/gtk.css ;;
  gtk2) vim $HOME/.gtkrc-2.0 ;;
  gtk3) vim $HOME/.config/gtk-3.0/settings.ini ;;
  zsh) vim $HOME/.zshrc && source $HOME/.zshrc && dfa $HOME/.zshrc && dfcm "Updated the zshrc" && dfp ;;
  exp) vim $HOME/.exports && source $HOME/.exports && dfa $HOME/.exports && dfcm "Updated the .exports" && dfp ;;
  hosts) sudoedit /etc/hosts ;;
  vhosts) sudoedit /etc/httpd/conf/extra/httpd-vhosts.conf ;;
  httpd) sudoedit /etc/httpd/conf/httpd.conf ;;
  mux) vim $HOME/.config/tmuxinator/$2.yml && dfa $HOME/.config/tmuxinator/$2.yml && dfcm "Updated the tmuxinator $2" && dfp ;;
  psd) vim $HOME/.config/psd/psd.conf && dfa $HOME/.config/psd/psd.conf && dfcm "Updated the profile-sync-daemons config" && dfp ;;
  git) vim $HOME/.gitconfig && dfa $HOME/.gitconfig && dfcm "gitconfig autocommt" && dfp ;;
  *) echo "Unknown application: $1" ;;
  esac
}

# Other functions
function open() {
  xdg-open $1 &>/dev/null &
  disown
}

# Download site
dls() {
  wget --random-wait -r -p -e robots=off -U mozilla $1
}

# Ranger. CD on quit:
function ranger {
    local IFS=$'\t\n'
    local tempfile="$(mktemp -t tmp.XXXXXX)"
    local ranger_cmd=(
        command
        ranger
        --cmd="map Q chain shell echo %d > "$tempfile"; quitall"
    )
    
   "${ranger_cmd[@]}" "$@"
    if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
        cd -- "$(cat "$tempfile")" || return
    fi
    command rm -f -- "$tempfile" 2>/dev/null
}

# nnn CD on quit:
n ()
{
    # Block nesting of nnn in subshells
    if [ -n "$NNNLVL" ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "export" as in:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    # NOTE: NNN_TMPFILE is fixed, should not be modified
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}
