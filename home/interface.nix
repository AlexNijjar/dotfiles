{ pkgs, ... }:

{
  gtk = {
    enable = true;

    theme = {
      package = pkgs.magnetic-catppuccin-gtk;
      name = "Catppuccin-GTK-Dark";
    };

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12;
    };
  };

  catppuccin = {
    enable = true;
    accent = "mauve";
    flavor = "mocha";
    gtk.icon = {
      enable = true;
      accent = "mauve";
    };
  };
}
