#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

userresources="/home/evgeniy/.Xresources"
usermodmap="/home/evgeniy/.Xmodmap"
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
maidsh="/mnt/Data/Scripts/maid-run.sh"
# walxinitcolors=$HOME/.cache/wal/colors.Xresources

# merge in defaults and keymaps

if [ -f $sysresources ]; then
	xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
	xmodmap $sysmodmap
fi

# if [ -f $walxinitcolors ]; then
# xrdb -merge $walxinitcolors
# fi

if [ -f "$userresources" ]; then
	xrdb -merge $userresources
fi

if [ -f "$usermodmap" ]; then
	xmodmap "$usermodmap"
fi

#if [ -f "$maidsh" ]; then
#	bash $maidsh
#fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ]; then
	for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

# Make sure this is before the 'exec' command or it won't be sourced.
[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

get_session() {
	local dbus_args=(--sh-syntax --exit-with-session)
	case $1 in
	awesome) dbus_args+=(awesome) ;;
	bspwm) dbus_args+=(bspwm-session) ;;
	budgie) dbus_args+=(budgie-desktop) ;;
	cinnamon) dbus_args+=(cinnamon-session) ;;
	deepin) dbus_args+=(startdde) ;;
	enlightenment) dbus_args+=(enlightenment_start) ;;
	fluxbox) dbus_args+=(startfluxbox) ;;
	gnome) dbus_args+=(gnome-session) ;;
	i3 | i3wm) dbus_args+=(i3 --shmlog-size 0) ;;
	jwm) dbus_args+=(jwm) ;;
	kde) dbus_args+=(startkde) ;;
	lxde) dbus_args+=(startlxde) ;;
	lxqt) dbus_args+=(lxqt-session) ;;
	mate) dbus_args+=(mate-session) ;;
	xfce) dbus_args+=(xfce4-session) ;;
	openbox) dbus_args+=(openbox-session) ;;
	*) dbus_args+=($DEFAULT_SESSION) ;;
	esac
	echo "dbus-launch ${dbus_args[*]}"
}

exec $(get_session)
xset r rate 501 30
