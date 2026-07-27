# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../common/linux/shared-configuration.nix
      ../common/linux/shared-programs.nix
      ../common/linux/shared-firewall.nix
    ];

  # Bootloader.
  boot = {
    kernelModules = [ "uinput" ];
    loader = {
      systemd-boot.enable = false;
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      grub = {
        useOSProber = true;
        efiSupport = true;
        device = "nodev";
      };
    };
    plymouth = {
      enable = true;
      theme = "rings";
      themePackages = with pkgs; [
        # By default we would install all themes
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "rings" ];
        })
      ];
    };
    # Enable "Silent boot"
    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "udev.log_priority=3"
      "rd.systemd.show_status=auto"
    ];
    # Hide the OS choice for bootloaders.
    # It's still possible to open the bootloader list by pressing any key
    # It will just not appear on screen unless a key is pressed
    loader.timeout = 3;
  };
  networking.hostName = "icarus"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable the GNOME Desktop Environment.
 # services.xserver.displayManager.gdm.enable = true;
 # services.xserver.desktopManager.gnome.enable = true;
 # services.gnome.gnome-remote-desktop.enable = true;
 # systemd.services.gnome-remote-desktop = {
 #   wantedBy = [ "graphical.target" ];
 # };
#  services.xrdp.enable = true;
#  services.xrdp.defaultWindowManager = "${pkgs.gnome-session}/bin/gnome-session";
#  services.xrdp.openFirewall = true;


  # Enable KDE 6 Desktop
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Enable xdg portal
  # xdg.portal = {
  #   enable = true;
  #   # wlr.enable = true;
  #   # extraPortals = with pkgs; [
  #   #   xdg-desktop-portal-gtk
  #   #   xdg-desktop-portal-wlr
  #   # ];
  # };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
     unzip
     git
     nextcloud-client
     valent
     mangohud
     protonup
     chromium
     # GNOME extensions
     gnome-remote-desktop
     # gnomeExtensions.appindicator
     # gnomeExtensions.gsconnect
     # KDE
     # kdePackages.xwaylandvideobridge
     # kdePackages.plasma-browser-integration
     # kdePackages.dolphin-plugins
     # kdePackages.xwaylandvideobridge
     # kdePackages.merkuro
     # kdePackages.kaddressbook
     # kdePackages.kdeconnect-kde
     # kdePackages.krdc
  ];
  # services.udev.packages = with pkgs; [ gnome-settings-daemon ];
  # services.gnome.gnome-keyring.enable = true;
  # programs.sway = {
  #   enable = true;
  #   wrapperFeatures.gtk = true;
  # };

  environment.variables = {
    XDG_SESSION_TYPE = "wayland";
    # SDL_VIDEODRIVER = "wayland";
    CLUTTER_BACKEND = "wayland";
    QT_QPA_PLATFORM = "wayland;xcb";
    # Tell Electron apps to use Wayland
    NIXOS_OZONE_WL = "1";
    # Where to install proton-ge
    STEAM_EXTRA_COMPAT_TOOLS_PATH = "/home/anthony/.steam/root/compatibilitytools.d";
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  services.udev.extraRules = ''
    KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
  '';
  services.kanata = {
    enable = true;
    keyboards = {
      internalKeyboard = {
        devices = [
          "/dev/input/by-id/usb-Hangsheng_R75Pro-event-kbd"
          "/dev/input/by-path/platform-i8042-serio-0-event-kbd"
        ];
        extraDefCfg = "process-unmapped-keys yes";
        config = ''
               (defsrc
                 caps)
               (defalias
                 escctrl (tap-hold 100 100 esc lctrl))
               (deflayer base
                 @escctrl)
             '';
         };
     };
   };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
