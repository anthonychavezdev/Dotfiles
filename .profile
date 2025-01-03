# dbus-update-activation-environment --systemd DISPLAY
# eval $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)

export ANDROID_HOME=$HOME/Android/Sdk

export SSH_AUTH_SOCK

export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_AUTO_SCREEN_SCALE_FACTORS=0
# export GDK_SCALE=0
# export QT_QPA_PLATFORMTHEME=gnome
# export QT_STYLE_OVERRIDE=gnome

export _JAVA_AWT_WM_NONREPARENTING=1

# if [ "$TERM"=="xterm" ]; then
#     # No it isn't, it's gnome-terminal
#     export TERM=screen-256color
# fi

export TERMEMU="kitty"

# syntax highlighting for less
# export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
# export LESS=' -R '
# colorize man pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
# Use Valve's aco for shaders
# export RADV_PERFTEST="aco"

# Honestly, I don't know what this does.
# I assume openGL multithreading?
# export mesa_glthread=true

# hid-nintendo SDL2 mappings

# export SDL_GAMECONTROLLERCONFIG="050000007e0500000920000001800000,Nintendo Switch Pro Controller,platform:Linux,a:b0,b:b1,x:b3,y:b2,back:b9,guide:b11,start:b10,leftstick:b12,rightstick:b13,leftshoulder:b5,rightshoulder:b6,dpup:b14,dpdown:b15,dpleft:b16,dpright:b17,leftx:a0,lefty:a1,rightx:a2,righty:a3,lefttrigger:b7,righttrigger:b8,
# # 030000007e0500000920000011810000,Nintendo Switch Pro Controller,platform:Linux,a:b0,b:b1,x:b3,y:b2,back:b9,guide:b11,start:b10,leftstick:b12,rightstick:b13,leftshoulder:b5,rightshoulder:b6,dpup:h0.1,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,leftx:a0,lefty:a1,rightx:a2,righty:a3,lefttrigger:b7,righttrigger:b8,
# # 060000007e0500000620000000000000,Nintendo Switch Combined Joy-Cons,platform:Linux,a:b0,b:b1,x:b3,y:b2,back:b9,guide:b11,start:b10,leftstick:b12,rightstick:b13,leftshoulder:b5,rightshoulder:b6,dpup:b14,dpdown:b15,dpleft:b16,dpright:b17,leftx:a0,lefty:a1,rightx:a2,righty:a3,lefttrigger:b7,righttrigger:b8,
# # "

# Use ** as the trigger sequence
export FZF_COMPLETION_TRIGGER='**'

# Options to fzf command
export FZF_COMPLETION_OPTS="+c -x"

# Alacritty theme downloading destination
# Used with https://github.com/toggle-corp/alacritty-colorscheme
export DEST="$HOME/.config/alacritty/themes"

# Have alacritty use xwayland
# export WAYLAND_DISPLAY=alacritty

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# (EXPERIMENTAL) Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf "$@" --preview 'tree -C {} | head -200' ;;
    export|unset) fzf "$@" --preview "eval 'echo \$'{}" ;;
    ssh)          fzf "$@" --preview 'dig {}' ;;
    nvim)         fzf "$@" --preview 'bat --style=numbers --color=always --line-range :500 {}' ;;
    v)            fzf "$@" --preview 'bat --style=numbers --color=always --line-range :500 {}' ;;
    *)            fzf "$@" ;;
  esac
}

export TERMEMU="kitty"
export EDITOR="emacsclient -c"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"
# for programs that follow XDG standards,
# config files should go in ~/.config/
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

PERL5LIB="/home/anthony/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/anthony/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/anthony/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/anthony/perl5"; export PERL_MM_OPT;
