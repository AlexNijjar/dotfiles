{pkgs, ...}: {
  programs = {
    nano.enable = false; # i use neovim btw
    neovim.enable = true;
    git.enable = true;
    hyprland.enable = true;
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
      ];
    };
  };
}
