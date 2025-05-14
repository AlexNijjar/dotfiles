{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.catppuccin.homeModules.catppuccin];
  home.pointerCursor = {
    gtk.enable = true;
    hyprcursor.enable = true;
    size = 24;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
  };

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
