{ pkgs, ... }: {
  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  hardware = {
    bluetooth.enable = true;
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    uinput.enable = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  services = {
    fwupd.enable = true;
    flatpak.enable = true;
    # Enable the X11 windowing system.
    xserver.enable = true;

    # Configure keymap in X11
    xserver.xkb = {
      layout = "us";
      variant = "";
    };
    # Enable CUPS to print documents.
    printing.enable = true;
    pulseaudio.enable = false;
    # Enable sound with pipewire.
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # wireplumber.enable = true;
      # If you want to use JACK applications, uncomment this
      # jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };
  };
  virtualisation = {
    libvirtd.enable = true;
    docker.enable = true;
    docker.liveRestore = false;
  };
  # Remove older generations
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  security.rtkit.enable = true;

  environment.variables = {
    # XDG_SESSION_TYPE = "wayland";
    # SDL_VIDEODRIVER = "wayland";
    # CLUTTER_BACKEND = "wayland";
    # QT_QPA_PLATFORM = "wayland;xcb";
    # Tell Electron apps to use Wayland
    NIXOS_OZONE_WL = "1";
    # Where to install proton-ge
    STEAM_EXTRA_COMPAT_TOOLS_PATH = "/home/anthony/.steam/root/compatibilitytools.d";
  };
  # Fonts
  fonts = {
    packages = with pkgs; [
      jetbrains-mono
    ];
    fontDir.enable = true;
  };
  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes"];
}
