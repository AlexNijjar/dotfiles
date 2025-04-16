{ pkgs, ... }:

{
  imports = [
    ./interface.nix
    ./programs/ghostty.nix
    ./programs/git.nix
    ./programs/hyprland.nix
    ./programs/librewolf.nix
    ./programs/neovim.nix
    ./programs/nushell.nix
    ./programs/spicetify.nix
    ./programs/starship.nix
    ./programs/ssh.nix
    ./programs/vesktop.nix
  ];

  home = {
    stateVersion = "24.11";
    packages = with pkgs; [
      lutris
      stremio
      via
      jetbrains.idea-ultimate
      jetbrains.pycharm-professional
      imv
      zathura
      walker
      krabby
      wl-clipboard
      ffmpegthumbnailer
      grim
      slurp
      xarchiver
      gcc
      cargo
      nodejs_20
      pnpm
      uv
    ];
  };

  programs = {
    btop.enable = true;
    fastfetch.enable = true;
    obs-studio.enable = true;
    ripgrep.enable = true;
    fd.enable = true;
  };

  services = {
    swayosd.enable = true;
  };
}
