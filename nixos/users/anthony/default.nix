{ pkgs, lib, inputs, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.anthony = {
    isNormalUser = true;
    description = "Anthony Chavez";
    extraGroups = [ "anthony" "networkmanager" "wheel" "plugdev" "docker" "libvirtd" "docker" "video" "adbusers"];
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
    plex-media-player
    kitty
    inputs.ghostty.packages.${system}.default
    prismlauncher
    electron
    ];
  };
  users.groups.anthony = {};
}
