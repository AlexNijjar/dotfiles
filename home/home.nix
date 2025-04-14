{ pkgs, ... }:

{
  imports = [
    ./programs/ghostty.nix
    ./programs/git.nix
    ./programs/hyprland.nix
    ./programs/librewolf.nix
    ./programs/nushell.nix
    ./programs/ssh.nix
  ];

  home = {
    stateVersion = "24.11";
    packages = with pkgs; [
      krabby
      lutris
      spotify
      stremio
      vesktop
      via
      walker
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
