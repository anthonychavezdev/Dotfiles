{...}: {
  programs.fzf.enable = true;
  programs.direnv.enable = true;
  programs.direnv.enableZshIntegration = true;
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = ["git" "fzf"];
      theme = "bira";
    };
  };
}
