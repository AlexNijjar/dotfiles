{inputs, ...}: {
  services.hyprpaper = let
    # Options: https://github.com/NotAShelf/wallpkgs/tree/main/wallpapers/catppuccin
    wallpaper = "${inputs.wallpkgs}/wallpapers/catppuccin/catppuccin-girls-stars.png";
  in {
    enable = true;
    settings = {
      preload = [wallpaper];
      wallpaper = [", ${wallpaper}"];
    };
  };
}
