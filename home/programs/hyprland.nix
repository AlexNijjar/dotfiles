{
  services.hyprpolkitagent.enable = true;
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      # Catppuccin colors
      "$mauve" = "rgb(cba6f7)";
      "$sapphire" = "rgb(74c7ec)";
      "$base" = "rgb(1e1e2e)";
      "$scale" = "1.5";

      imports = [
        ./hyprland/binds.nix
      ];

      env = ./hyprland/env.nix;
      windowrule = ./hyprland/window-rules.nix;
      general = ./hyprland/general.nix;
      decoration = ./hyprland/decoration.nix;
      animations = ./hyprland/animations.nix;

      monitor = [", highres, auto, $scale"];

      exec-once = [
        "hyprpaper"
        "swayosd-server"
        "walker --gapplication-service"
        "systemctl --user start hyprpolkitagent"
      ];

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
}
