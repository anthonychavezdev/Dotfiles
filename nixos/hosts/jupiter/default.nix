# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../common/linux/shared-configuration.nix
      ../common/linux/shared-programs.nix
      ../common/linux/shared-firewall.nix
    ];

  boot = {
    kernelModules = [ "uinput" ];
    # Bootloader.
    loader = {
      systemd-boot.enable = false;
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
      grub = {
        useOSProber = false;
        efiSupport = true;
        device = "nodev";
        extraEntries = ''
            menuentry "Windows 11" {
                insmod part_gpt
                insmod fat
                insmod chain
                search --fs-uuid --no-floppy --set=root B032-007A
                chainloader /EFI/Microsoft/Boot/bootmgfw.efi
            }
            menuentry "UEFI Settings" {
                fwsetup
            }
        '';
      };
    };
  };

  networking.hostName = "jupiter"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  services.xserver.videoDrivers = [ "amdgpu" ];

  # Enable the GNOME Desktop Environment.
  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;

  # Enable KDE 6 Desktop
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;
  # services.displayManager.defaultSession = "plasma";

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

  programs = {
    kde-pim = {
      enable = true;
      # Includes KMail, Kontact, and Merkuro as options
      kmail = true;
      kontact = true;
      merkuro = true;
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
     libreoffice-qt6-fresh
     mangohud
     protonup-ng
     dmidecode
     # GNOME exteions
     gnomeExtensions.appindicator
     gnomeExtensions.gsconnect
     gnomeExtensions.blur-my-shell
     # KDE
     kdePackages.plasma-browser-integration
     kdePackages.dolphin-plugins
     kdePackages.korganizer
     kdePackages.kdepim-addons
     kdePackages.kdepim-runtime
     kdePackages.calendarsupport
     kdePackages.merkuro
     kdePackages.kcontacts
     kdePackages.kaddressbook
     kdePackages.kdeconnect-kde
     kdePackages.ksvg
     kdePackages.koko
     kdePackages.kdav
     kdePackages.kalk
     haruna
     godot
  ];
  # services.udev.packages = with pkgs; [ gnome-settings-daemon ];
  # services.gnome.gnome-keyring.enable = true;
  # programs.sway = {
  #   enable = true;
  #   wrapperFeatures.gtk = true;
  # };

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

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
