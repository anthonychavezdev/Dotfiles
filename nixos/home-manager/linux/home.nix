{ config, pkgs, username, ... }: {
  imports = [
    ../applications
    ../desktop
    ../shells/zsh
  ];

  home.username = "${username}";
  home.homeDirectory = "/home/${username}";
  home.packages = [ ];
  programs.home-manager.enable = true;
  home.stateVersion = "24.05";
}
