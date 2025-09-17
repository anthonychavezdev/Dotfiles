{ config, pkgs, username, ... }: {
  imports = [
    ../shells/zsh
    ./keybinds
  ];

  home.username = "${username}";
  home.homeDirectory = "/Users/${username}";
  home.packages = [ ];
  programs.home-manager.enable = true;
  programs.gpg.enable = true;
  home.stateVersion = "24.05";
}
