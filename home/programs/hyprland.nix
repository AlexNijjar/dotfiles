{
  imports = [
    ./hyprland/animations.nix
    ./hyprland/binds.nix
    ./hyprland/decoration.nix
    ./hyprland/general.nix
    ./hyprland/window-rules.nix
  ];
      
  services.hyprpolkitagent.enable = true;
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      # Catppuccin colors
      "$mauve" = "rgb(cba6f7)";
      "$sapphire" = "rgb(74c7ec)";
      "$base" = "rgb(1e1e2e)";
      "$scale" = "1.5";

      monitor = [", highres, auto, $scale"];

      exec-once = [
        "[workspace 1 silent] spotify & vesktop"
        "hyprpaper"
        "swayosd-server"
        "walker --gapplication-service"
        "systemctl --user start hyprpolkitagent"
      ];

      env = [
        "GDK_SCALE,$scale"
        "QT_SCALE_FACTOR,$scale"
      ];

      xwayland = {
        force_zero_scaling = true;
        use_nearest_neighbor = true;
      };

      misc = { 
        font_family = "JetBrainsMono";
        middle_click_paste = false;
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      input = {
        kb_layout = "us";
      };
    };
  };
}
