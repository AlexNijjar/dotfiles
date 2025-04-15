{ pkgs, ... }:

{
  imports = [
    ./programs/ghostty.nix
    ./programs/git.nix
    ./programs/hyprland.nix
    ./programs/librewolf.nix
    ./programs/neovim.nix
    ./programs/nushell.nix
    ./programs/spicetify.nix
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
      walker
      krabby
      wl-clipboard
      gcc
      cargo
      nodejs_20
      pnpm
      uv
    ];

    pointerCursor = {
      gtk.enable = true;
      hyprcursor.enable = true;
      size = 24;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
    };
  };

  gtk = {
    enable = true;

    theme = {
      package = pkgs.flat-remix-gtk;
      name = "Flat-Remix-GTK-Grey-Darkest";
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "mauve";
      };
    };

    font = {
      name = "JetBrainsMono";
      size = 12;
    };
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
    hyprpaper.enable = true;
  };

  catppuccin = {
    enable = true;
    accent = "mauve";
    flavor = "mocha";
  };
}
