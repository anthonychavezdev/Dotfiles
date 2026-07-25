{pkgs, ... }:
{
  programs.plasma = {
    enable = true;
    workspace = {
      lookAndFeel = "org.kde.breezedark.desktop";
      cursor = {
        theme = "Breeze";
        size = 48;
      };
      theme = "breeze-dark";
      colorScheme = "BreezeDark";
      wallpaper = "/home/anthony/Pictures/Wallpapers/japanese-house.jpeg";
    };
    kwin = {
      effects = {
        shakeCursor.enable = true;
        minimization = {
          animation = "magiclamp";
          duration = 150;
        };
      };
      nightLight = {
        enable = true;
        mode = "times";
        time.morning = "06:30";
        time.evening = "20:30";
        temperature.day = 6500;
        temperature.night = 4500;
        transitionTime = 30;
      };
    };
    input = {
      keyboard = {
        repeatDelay = 300;
        repeatRate = 35.0;
      };
    };
    windows = {
      allowWindowsToRememberPositions = true;
    };
    panels = [
      # Windows-like panel at the bottom
      {
        location = "bottom";
        widgets = [
          {
            kickoff = {
              sortAlphabetically = true;
              icon = "nix-snowflake-white";
            };
          }
	        {
	          iconTasks = {
              launchers = [
                "applications:org.kde.dolphin.desktop"
                "applications:app.zen_browser.zen.desktop"
                "applications:com.mitchellh.ghostty.desktop"
                "applications:emacs.desktop"
              ];
              iconsOnly = true;
              appearance = {
                fill = true;
                indicateAudioStreams = true;
                rows = {
                  multirowView = "never";
                };
                iconSpacing = "medium";
              };
              behavior = {
                grouping = {
                  method = "byProgramName";
                  clickAction = "cycle";
                };
                sortingMethod = "manually";
                minimizeActiveTaskOnClick = true;
                middleClickAction = "toggleMinimized";
                wheel = {
                  switchBetweenTasks = true;
                  ignoreMinimizedTasks = true;
                };
                showTasks = {
                  onlyInCurrentDesktop = true;
                  onlyInCurrentActivity = true;
                };
                unhideOnAttentionNeeded = true;
                newTasksAppearOn = "right";
              };
            };
	        }
	        {
	          systemTray = {
              icons = {
                spacing = "small";
                scaleToFit = true;
              };
              items = {
                showAll = false;
                shown = [
                  "application:com.nextcloud.desktopclient.nextcloud.desktop"
                  "org.kde.plasma.networkmanagement"
                  "org.kde.plasma.volume"
                  "org.kde.plasma.notifications"
                  "org.kde.kdeconnect"
                  "discord"
                  "vesktop"
                ];
                hidden = [
                  "org.kde.plasma.brightness"
                  "org.kde.plasma.clipboard"
                  "org.kde.plasma.devicenotifier"
                  "plasmashell_microphone"
                ];
              };
            };
	        }
          {
            digitalClock = {
              calendar.firstDayOfWeek = "sunday";
              time.format = "12h";
              date = {
                enable = true;
                format = "isoDate";
              };
            };
          }
        ];
      }
    ];
    configFile = {
      kdeglobals.General.AccentColor = "0,225,0";
    };
  };
}
