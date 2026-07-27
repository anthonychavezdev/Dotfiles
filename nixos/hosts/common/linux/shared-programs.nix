{ pkgs, ... }: {
  programs = {
    # for development environments
    direnv.enable = true;
    # virtualization frontend
    virt-manager.enable = true;
    zsh.enable = true;
    steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      gamescopeSession.enable = true;
    };

    gamemode.enable = true;
    appimage = {
      enable = true;
      binfmt = true;
    };
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    # Enable dynamically linked executables
    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        # Noita's Entangled Worlds mod
        openssl
        libjack2
        alsa-lib
        libopus
        wayland
        libxkbcommon
        libGL
        # steamworksRedist
      ];
    };
  };
}

