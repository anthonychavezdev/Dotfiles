{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    mac-app-util.url = "github:hraban/mac-app-util";
    nix-homebrew = {
      url = "github:zhaofengli/nix-homebrew";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ghostty.url = "github:ghostty-org/ghostty";

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nix-darwin,
      mac-app-util,
      nix-homebrew,
      homebrew-core,
      homebrew-cask,
      homebrew-bundle,
      home-manager,
      firefox-addons,
      plasma-manager,
      ... }:
    let
      username = "anthony";
      # Helper function to create pkgs for a given system
      mkPkgs = system: import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
    in
      {
        nixosConfigurations = let
          system = "x86_64-linux";
        in
          {
            jupiter = nixpkgs.lib.nixosSystem {
              inherit system;
              specialArgs = { inherit inputs; };
              modules = [
                ./hosts/jupiter
                ./users/${username}
                # make home-manager as a module of nixos
                # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
                home-manager.nixosModules.home-manager
                {
                  home-manager.useGlobalPkgs = true;
                  home-manager.useUserPackages = true;
                  home-manager.extraSpecialArgs = {
                    inherit inputs;
                    firefox-addons-allowUnfree = (mkPkgs system).callPackage firefox-addons { };
                    username = "${username}";
                  };
                  home-manager.sharedModules = [ plasma-manager.homeManagerModules.plasma-manager ];
                  home-manager.users."${username}" = import ./home-manager/linux/home.nix;
                }
              ];
            };
            icarus = nixpkgs.lib.nixosSystem {
	            system = "x86_64-linux";
              specialArgs = { inherit inputs; };
              modules = [
                ./hosts/icarus
                ./users/${username}
                # make home-manager as a module of nixos
                # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
                home-manager.nixosModules.home-manager
                {
                  home-manager.useGlobalPkgs = true;
                  home-manager.useUserPackages = true;
                  home-manager.extraSpecialArgs = {
                    inherit inputs;
                    firefox-addons-allowUnfree = (mkPkgs system).callPackage firefox-addons { };
                    username = "${username}";
                  };
                  home-manager.sharedModules = [ plasma-manager.homeManagerModules.plasma-manager ];
                  home-manager.users."${username}" = import ./home-manager/linux/home.nix;
                }
              ];
            };
          };
        darwinConfigurations = let
          system = "aarch64-darwin";
        in
          {
            pufferfish = nix-darwin.lib.darwinSystem {
              inherit system;
              specialArgs = { inherit inputs username; };
              modules = [
                ./hosts/pufferfish
	              mac-app-util.darwinModules.default
	              nix-homebrew.darwinModules.nix-homebrew
                {
                  nix-homebrew = {
                    enable = true;
                    # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
                    enableRosetta = true;
                    user = "${username}";

                    taps = {
                      "homebrew/homebrew-core" = homebrew-core;
                      "homebrew/homebrew-cask" = homebrew-cask;
                      "homebrew/homebrew-bundle" = homebrew-bundle;
                    };
                    mutableTaps = false;
                  };
                }

                home-manager.darwinModules.home-manager
                {
                  home-manager.useGlobalPkgs = true;
                  home-manager.useUserPackages = true;
                  home-manager.extraSpecialArgs = {
                    inherit inputs;
                    username = "${username}";
                  };
                  home-manager.users."${username}" = import ./home-manager/macos/home.nix;
                }
	            ];
            };
          };
      };
}
