dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_AUTO_SCREEN_SCALE_FACTORS=0
export GDK_SCALE=0
export QT_QPA_PLATFORMTHEME=gtk2

export _JAVA_AWT_WM_NONREPARENTING=1

xsetroot -xcf /usr/share/icons/Adwaita/cursors/left_ptr 64 &
start-pulseaudio-x11
