{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    bind =
      [
        "$mod, S, exec, mkdir ~/screenshots; grim ~/screenshots/$(date +'%s_grim.png')"
        "$mod_SHIFT, S, exec, mkdir ~/screenshots; grim -g \"$(slurp)\" ~/screenshots/$(date +'%s_grim.png')"
        "$mod, Q, killactive"
        "$mod, escape, exec, hyprlock"
        "$mod, DELETE, exit"
        "$mod, V, togglefloating"
        "$mod, F, fullscreen"
        "$mod, P, pin"
        "$mod, F1, exec, walker"
        "$mod, F2, exec, ghostty"
        "$mod, F3, exec, firefox"
        "$mod, F4, exec, ghostty -e yazi"
        "$mod, F5, exec, thunar"
        "$mod_SHIFT, H, movefocus, l"
        "$mod_SHIFT, L, movefocus, r"
        "$mod_SHIFT, K, movefocus, u"
        "$mod_SHIFT, J, movefocus, d"
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
