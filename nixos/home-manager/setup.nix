{ pkgs, ... }: {
  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;
  home-manager.users.anthony = { ... }: {
    home.packages = [ ];
    imports = [
      ./applications/firefox.nix
    ];
    home.stateVersion = "24.11";
  };
}
