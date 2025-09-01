{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    initContent = ''
      krabby random
      setopt CORRECT EXTENDED_GLOB MENU_COMPLETE AUTO_LIST COMPLETE_IN_WORD ALWAYS_TO_END GLOB_DOTS

      zvm_after_init() {
        bindkey -M vicmd '_' vi-first-non-blank
      }
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
      path = "$XDG_STATE_HOME/zsh/history";
      ignoreDups = true;
      ignoreAllDups = true;
      saveNoDups = true;
      findNoDups = true;
      share = true;
      append = true;
    };

    plugins = [
      {
        name = "zsh-vi-mode";
        file = "./share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
        src = pkgs.zsh-vi-mode;
      }
    ];
  };
}
