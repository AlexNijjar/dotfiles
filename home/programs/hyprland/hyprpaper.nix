{ inputs, ... }: {
  services.hyprpaper =
    let
      # Options: https://github.com/NotAShelf/wallpkgs/tree/main/wallpapers/catppuccin
      wallpaper = "${inputs.wallpkgs}/wallpapers/catppuccin/catppuccin-whale.jpg";
    in
    {
      enable = true;
      settings = {
        preload = [ wallpaper ];
        wallpaper = [ ", ${wallpaper}" ];
      };
    };
}
