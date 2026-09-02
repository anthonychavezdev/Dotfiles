{ pkgs, config, inputs, username, ... }: {
  nixpkgs.config.allowUnfree = true;
  fonts.packages = with pkgs; [
    jetbrains-mono
  ];
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    neovim
    direnv
    utm
    git
    android-tools
    tree-sitter
    nodejs
    signal-desktop
    comma
    nix-index
    vicinae
  ];


  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Enable alternative shell support in nix-darwin.
  # programs.fish.enable = true;

  users.users.anthony = {
    name = username;
    home = "/Users/anthony";
  };
  system.primaryUser = "anthony";
  homebrew = {
    enable = true;
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };
    brews = [
      "jq"
      "mas"
      "bat"
      "mplayer"
      "llvm"
      "autoconf"
      "ripgrep"
      "fd"
      "ffmpeg"
      "libsndfile"
      "dbus"
    ];
    greedyCasks = true;
    casks = [
      "zed"
      "firefox"
      "discord"
      "nextcloud"
      "the-unarchiver"
      "jellyfin-media-player"
      "spotify"
      "scroll-reverser"
      "aldente"
      "chromium"
      "sanesidebuttons"
      "betterdisplay"
      "whisky"
      "transmission"
      "bluesnooze"
      "android-studio"
      "zen"
      "QLMarkdown"
      "jordanbaird-ice"
      "crossover"
      "vorssaint"
      "vlc"
      "dash"
    ];
    masApps = {
      "bitwarden" = 1352778147;
      "privacy" = 6449850851;
      "darkreader" = 1438243180;
      "wireguard" = 1451685025;
    };
    taps = builtins.attrNames config.nix-homebrew.taps;
  };

  system = {
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };
    defaults = {
      universalaccess = {
        mouseDriverCursorSize = 3.0;
        closeViewZoomFollowsFocus = true;
      };
      NSGlobalDomain = {
        "com.apple.trackpad.scaling" = 2.0;
        AppleShowAllFiles = true;
        InitialKeyRepeat = 15;
        KeyRepeat = 2;
        # Don't save documents to iCloud
        NSDocumentSaveNewDocumentsToCloud = false;

        NSNavPanelExpandedStateForSaveMode = true;
        PMPrintingExpandedStateForPrint = true;
      };
      controlcenter = {
        BatteryShowPercentage = true;
      };
      dock = {
        autohide = true;
        orientation = "right";
        # disable hot corners
        wvous-tl-corner = 1;
        wvous-bl-corner = 1;
        wvous-tr-corner = 1;
        wvous-br-corner = 1;
      };
      finder = {
        ShowStatusBar = true;
        ShowPathbar = true;
        NewWindowTarget = "Home";
        AppleShowAllFiles = true;
        AppleShowAllExtensions = true;
        QuitMenuItem = true;
        FXPreferredViewStyle = "Nlsv";
        FXDefaultSearchScope = "SCcf";
        FXRemoveOldTrashItems = true;
        FXEnableExtensionChangeWarning = false;
        _FXSortFoldersFirst = true;
      };
      CustomSystemPreferences = {
        NSGlobalDomain = {
          "com.apple.mouse.linear" = true;
          "com.apple.mouse.scaling" = 1.0;
        };
        ".GlobalPreferences" = {
          AppleAccentColor = 3;
        };
      };
    };
  };

  # Set Git commit hash for darwin-version.
  system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
}
