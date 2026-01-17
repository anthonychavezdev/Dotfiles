{ pkgs, lib, inputs, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.anthony = {
    isNormalUser = true;
    description = "Anthony Chavez";
    extraGroups = [ "anthony" "networkmanager" "wheel" "plugdev" "docker" "libvirtd" "docker" "video" "adbusers" "uinput"];
    shell = pkgs.zsh;
    # openssh.authorizedKeys.keys = [ "SSHKEY" ];
    packages = with pkgs; [
    #  thunderbird
    fzf
    bat
    python3
    emacs30-pgtk
    neovim
    gnupg
    plex-desktop
    kitty
    ghostty
    (prismlauncher.override {
        jdks=[
	    temurin-bin-21
	    temurin-bin-8
	    jre8
            temurin-bin-11
            temurin-bin-17
	];
    })
    electron
    ripgrep
    # Lua for Neovim
    luarocks
    lua
    android-tools
    ];
  };
  users.groups.anthony = {};
  users.groups.uinput = {};
}
