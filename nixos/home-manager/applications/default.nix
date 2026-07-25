{ config, pkgs, ... }: {
  imports = [
    ./firefox
    ./ghostty
    ./devenv
  ];
}
