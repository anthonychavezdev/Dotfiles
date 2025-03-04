{ config, pkgs, username, ... }: {
  imports = [
    ./home-manager/applications
    ./home-manager/desktop
  ];

  home.username = "${username}";
  home.homeDirectory = "/home/${username}";
  home.packages = [ ];
  programs.home-manager.enable = true;
  home.stateVersion = "24.05";
}
