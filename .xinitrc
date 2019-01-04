xrdb -I$HOME ~/.Xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

exec i3
# exec herbstluftwm --locked
# exec openbox-session
# exec startxfce4
# exec cinnamon-session
#exec gnome-session
# exec startkde
# exec mate-session

# Start BSPWM
# sxhkd -c .config/bspwm/sxhkd/sxhkdrc &
# source ~/.zshrc
# xrdb -merge ~/.Xresources
# xsetroot -cursor_name left_ptr
# exec bspwm
# exec awesome
#
# wal -i "$(< "${HOME}/.cache/wal/wal")"
# xsetroot -xcf /usr/share/icons/DMZ-Black/cursors/left_ptr 64
pulseaudio --start
