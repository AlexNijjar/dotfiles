{inputs, ...}: {
  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;
      wallpaper = [
        {
          monitor = "";
          # Options: https://github.com/NotAShelf/wallpkgs/tree/main/wallpapers/catppuccin
          path = "${inputs.wallpkgs}/wallpapers/catppuccin/catppuccin-waterfall.png";
        }
      ];
    };
  };
}
