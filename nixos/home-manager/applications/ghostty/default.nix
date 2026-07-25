{ pkgs, ... }: {
  programs.ghostty = {
    enable = true;
    package = if pkgs.stdenv.hostPlatform.isDarwin
      then pkgs.ghostty-bin
      else pkgs.ghostty;
    enableZshIntegration = true;
    installBatSyntax = true;
    settings = {
      font-size = 12;
      theme = "Ayu";
    };
  };
}
