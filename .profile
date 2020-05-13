dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_AUTO_SCREEN_SCALE_FACTORS=0
export GDK_SCALE=0
export QT_QPA_PLATFORMTHEME=gtk2

export _JAVA_AWT_WM_NONREPARENTING=1

# Sets cursor size
xsetroot -xcf /usr/share/icons/Adwaita/cursors/left_ptr 64 &
start-pulseaudio-x11

if [ "$TERM" == "xterm" ]; then
    # No it isn't, it's gnome-terminal
    export TERM=xterm-256color
fi

# syntax highlighting for less
export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export LESS=' -R '
# colorize man pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
export RADV_PERFTEST="aco"
