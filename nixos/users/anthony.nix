{ config, pkgs, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.anthony = {
    isNormalUser = true;
    description = "Anthony Chavez";
    extraGroups = [ "networkmanager" "wheel" "plugdev" "docker" "libvirtd" "docker" "video" "adbusers"];
    shell = pkgs.zsh;
    # openssh.authorizedKeys.keys = [ "SSHKEY" ];
    packages = with pkgs; [
    #  thunderbird
    fzf
    python3
    emacs29-pgtk
    neovim
    plex-media-player
    kitty
    bitwarden-desktop
    prismlauncher
    electron
    ];
  };
}
