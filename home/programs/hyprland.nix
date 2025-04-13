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
        "$mod, Q, killactive"
        "$mod, DELETE, exit"
        "$mod, V, togglefloating"
        "$mod, F, fullscreen"
        "$mod, P, pin"

        "$mod, F1, exec, walker"
        "$mod, F2, exec, ghostty"
        "$mod, F3, exec, librewolf"
        "$mod, F4, exec, thunar"

        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"

        "XF86AudioMute, exec, swayosd-client --output-volume mute-toggle"
        "xf86audioraisevolume, exec, swayosd-client --output-volume raise"
        "xf86audiolowervolume, exec, swayosd-client --output-volume lower"
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

      bindl = [
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
        ", mouse:275, workspace, +1"
        ", mouse:276, workspace, -1"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      bindel = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ];
    };
  };
}