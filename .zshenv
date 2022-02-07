
alias chromium="chromium-browser"

export TERMEMU="alacritty"
export EDITOR="emacsclient -c"

export PATH=$PATH:~/bin:~/scripts:~/GB/gbdk/bin:~/.local/bin:/home/anthony/.local/share/gem/ruby/2.7.0/bin:/opt/android-studio/bin:~/pico-8:~/.npm-global/bin:~/.cargo/bin

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"
# for programs that follow XDG standards,
# config files should go in ~/.config/
export XDG_CONFIG_HOME=$HOME/.config/

PATH="/home/anthony/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/anthony/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/anthony/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/anthony/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/anthony/perl5"; export PERL_MM_OPT;

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/anthony/.sdkman"
[[ -s "/home/anthony/.sdkman/bin/sdkman-init.sh" ]] && source "/home/anthony/.sdkman/bin/sdkman-init.sh"
