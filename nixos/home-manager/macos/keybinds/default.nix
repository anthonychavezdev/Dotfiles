{ config, pkgs, ... }:

{
  targets.darwin.keybindings = {
    "^u" = "deleteToBeginningOfLine:";
    "^w" = "deleteWordBackward:";
    "~f" = "moveWordForward:"; # Option-F
    "~b" = "moveWordBackward:"; # Option-b
  };
}
