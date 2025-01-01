{ config, pkgs, ... }: {
  imports = [
    ./home-manager/applications
    ./home-manager/desktop
  ];

  home.username = "anthony";
  home.homeDirectory = "/home/anthony";
  home.packages = [ ];
  programs.home-manager.enable = true;
  home.stateVersion = "24.05";
}
