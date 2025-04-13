{
  services.hyprpolkitagent.enable = true;
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      exec-once = [
        "hyprpaper"
        "swayosd-server"
        "walker --gapplication-service"
        "systemctl --user start hyprpolkitagent"
      ];

      "$scale" = "1.5";
      monitor = [", highres, auto, $scale"];
      env = [
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"

        "QT_QPA_PLATFORMTHEME,qt5ct"
        "QT_QPA_PLATFORM,wayland"

        "HYPRCURSOR_THEME,Adwaita"
        "HYPRCURSOR_SIZE,24"

        "XCURSOR_SIZE,24"
        "GDK_SCALE,$scale"
      ];

      "$mod" = "SUPER";
      bind = [
        "$mod, F1, exec, walker"
        "$mod, F2, exec, ghostty"
        "$mod, F3, exec, librewolf"
        "$mod, F4, exec, thunar"
      ] ++ (
        builtins.concatLists (builtins.genList (i:
          let ws = i + 1;
          in [
            "$mod, code:1${toString i}, workspace, ${toString ws}"
            "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
          ]
        )
        9)
      );
    };
  };
}