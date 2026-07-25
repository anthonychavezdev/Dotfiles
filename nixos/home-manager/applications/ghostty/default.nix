{ ... }: {
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    installBatSyntax = true;
    settings = {
      font-size = 12;
      theme = "Ayu";
    };
  };
}
