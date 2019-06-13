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
alias apache-droot="grep -R "DocumentRoot" /etc/apache2/sites-enabled"
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
alias get.all.res="find . -iname "*.jpg" -type f -print0 | xargs -0 -I{} identify -format '%wx%h\n' {} | sort | uniq"
alias ya='yaourt'
alias apps='cd /usr/share/applications'
alias apps_h='cd ~/.local/share/applications'
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
alias tinbox="todo lf inbox"
alias tdone="todo lf done"
alias tinbadd="todo addto inbox.txt"
alias tasks='git grep -EI "TODO|FIXME"'
alias mux='tmuxinator'
alias wpg='wpg && bl-set-wal.sh'
alias nitrogen='nitrogen --save && bl-set-wal-nitr.sh'

## FUNCTIONS
# Configurations
conf() {
  case $1 in
  wacom) sudoedit $HOME/.config/xsetwacom-gnome-symbiotic/setup.sh && setwac-run ;;
  intel) sudoedit /etc/X11/mhwd.d/intel.conf ;;
  aliases) vim $HOME/.bash_aliases && source $HOME/.zshrc && dfa $HOME/.bash_aliases && dfcm "Updated aliases" && dfp ;;
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
  tmux) vim $HOME/.tmux.conf && dfa $HOME/.tmux.conf && dfcm "Updated the tmux.conf" && dfp ;;
  nano) vim $HOME/.nanorc && dfa $HOME/.nanorc && dfcm "Updated the nanorc" && dfp ;;
  xinit) vim $HOME/.xinitrc && dfa $HOME/.xinitrc && dfcm "Updated the xinitrc" && dfp ;;
  xres) vim $HOME/.Xresources && xrdb $HOME/.Xresources && dfa $HOME/.Xresources && dfcm "Updated the .Xresources" && dfp ;;
  fonts-u) vim $HOME/.config/fontconfig/70-emojione-color.conf && fc-cache -f -v ;;
  theme2) vim $HOME/.themes/FlatStudioCustom/gtk-2.0/gtkrc ;;
  theme3) vim $HOME/.themes/FlatStudioCustom/gtk-3.0/gtk.css ;;
  gtk2) vim $HOME/.gtkrc-2.0 ;;
  gtk3) vim $HOME/.config/gtk-3.0/settings.ini ;;
  zsh) vim $HOME/.zshrc && source $HOME/.zshrc && dfa $HOME/.zshrc && dfcm "Updated the zshrc" && dfp ;;
  hosts) sudoedit /etc/hosts ;;
  vhosts) sudoedit /etc/httpd/conf/extra/httpd-vhosts.conf ;;
  httpd) sudoedit /etc/httpd/conf/httpd.conf ;;
  mux) vim $HOME/.config/tmuxinator/$2.yml && dfa $HOME/.config/tmuxinator/$2.yml && dfcm "Updated the tmuxinator $2" && dfp ;;
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
