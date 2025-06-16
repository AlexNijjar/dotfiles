{
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    initExtra = ''
      krabby random
      setopt CORRECT EXTENDED_GLOB MENU_COMPLETE AUTO_LIST COMPLETE_IN_WORD ALWAYS_TO_END GLOB_DOTS
    '';

    shellAliases = {
      switch = "sudo nixos-rebuild switch --flake ~/dotfiles";
    };

    autosuggestion = {
      enable = true;
      highlight = "fg=8";
    };

    syntaxHighlighting = {
      enable = true;
      highlighters = ["main" "brackets" "pattern"];
    };

    history = {
      size = 50000;
      ignoreDups = true;
      ignoreAllDups = true;
      saveNoDups = true;
      findNoDups = true;
      share = true;
      append = true;
    };
  };
}
