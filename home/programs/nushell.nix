{
  programs.nushell = {
    enable = true;

    shellAliases = {
      switch = "sudo nixos-rebuild switch --flake ~/dotfiles";
    };

    settings = {
      show_banner = false;
      completions.external = {
        enable = true;
        max_results = 200;
      };
    };

    environmentVariables = {
    };

    extraConfig = ''
      krabby random
    '';
  };
}
