{pkgs, ...}: {
  imports = [
    ./programs/neovim.nix
    ./programs/spicetify.nix
    ./programs/steam.nix
    ./programs/sunshine.nix
    ./programs/walker.nix
  ];
  programs = {
    nano.enable = false; # i use neovim btw
    neovim.enable = true;
    git.enable = true;
    hyprland.enable = true;
    waybar.enable = true;
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
      ];
    };
    zsh.enable = true;
  };
}
