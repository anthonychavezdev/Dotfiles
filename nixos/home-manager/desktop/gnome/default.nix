{ config, pkgs, ... }: {
  dconf = {
    enable = true;    
    settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = with pkgs.gnomeExtensions; [
          appindicator.extensionUuid
          gsconnect.extensionUuid
          blur-my-shell.extensionUuid
          system-monitor.extensionUuid
          launch-new-instance.extensionUuid
        ];
      };
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark"; 
        accent-color = "green";
        cursor-theme = "Adwaita";
        cursor-size = 48;
      };
    };
  };
}

