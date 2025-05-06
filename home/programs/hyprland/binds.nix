{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    bind =
      [
        "$mod, S, exec, mkdir ~/screenshots; grim ~/screenshots/$(date +'%s_grim.png')"
        "$mod_SHIFT, S, exec, mkdir ~/screenshots; grim -g \"$(slurp)\" ~/screenshots/$(date +'%s_grim.png')"
        "$mod, Q, killactive"
        "$mod, DELETE, exec, hyprlock"
        "$mod, DELETE_SHIFT, exit"
        "$mod, V, togglefloating"
        "$mod, F, fullscreen"
        "$mod, P, pin"
        "$mod, escape, exec, walker"
        "$mod, F1, exec, ghostty"
        "$mod, F2, exec, ghostty -e nvim"
        "$mod, F3, exec, ghostty -e yazi"
        "$mod, F4, exec, schizofox"
        "$mod, F5, exec, thunar"
        "$mod_SHIFT, H, movefocus, l"
        "$mod_SHIFT, J, movefocus, d"
        "$mod_SHIFT, K, movefocus, u"
        "$mod_SHIFT, L, movefocus, r"
        "$mode, H, workspace, -1"
        "$mod, L, workspace, +1"
        ", XF86AudioMute, exec, swayosd-client --output-volume mute-toggle"
        ", XF86AudioRaiseVolume, exec, swayosd-client --output-volume raise"
        ", XF86AudioLowerVolume, exec, swayosd-client --output-volume lower"
      ]
      ++ (
        builtins.concatLists (builtins.genList
          (
            i: let
              ws = i + 1;
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
  };
}
