## Custom aliases
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
#alias ll="ls -lhA"
alias pfind="ps aux | grep"
alias apache-droot="grep -R "DocumentRoot" /etc/apache2/sites-enabled"
alias mkfat32="sudo mkdosfs -F 32 -I"
alias rmf='rm -rf'
#alias ls1='ls -1'
#alias lsa='ls -1a'
alias errors1="journalctl -b -p err"
alias errors2="journalctl -p 3 -xb"
alias errors3="systemctl --failed"
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
alias myip="curl http://ipecho.net/plain; echo"
alias busy.port="netstat -tanpl|grep"
alias jr.err="journalctl -p err..alert"
alias fix.icons="sudo sed -i 's/Context=Mimetypes/Context=MimeTypes/g; s/Context=Apps/Context=Applications/g ' /usr/share/icons/*/index.theme"
alias genpass="cat /dev/urandom | tr -dc a-zA-Z0-9 | fold -w 32 | head -n 1"
alias gfix="gita . && gitcm 'some fixes' && git push"
alias manjaro-pool-pkg="https://mirror.netzspielplatz.de/manjaro/packages/pool/overlay/"
alias fix.def.files="xdg-mime default org.gnome.Nautilus.desktop inode/directory"
alias show.def.files="xdg-mime query default inode/directory"
#alias get.all.res="find -type f -iname "*.jpg" -exec identify -format "%wx%h\n" "{}" \; | sort | uniq "
alias get.all.res="find . -iname "*.jpg" -type f -print0 | xargs -0 -I{} identify -format '%wx%h\n' {} | sort | uniq"
alias ya='yaourt'
alias apps='cd /usr/share/applications'
alias apps_home='cd ~/.local/share/applications'
alias uconf='cd ~/.config'
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

alias dotfiles='/usr/bin/git --git-dir=/home/evgeniy/dotfiles/ --work-tree=/home/evgeniy'
alias dfa="dotfiles add"
alias dfcm="dotfiles commit -m"
alias dfs="dotfiles status"
alias dfp="dotfiles push"
