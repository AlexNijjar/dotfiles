{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    bind =
      [
        "$mod, S, exec, mkdir ~/screenshots; grim ~/screenshots/$(date +'%s_grim.png') && notify-send 'Screenshot Saved' -t 2000"
        "$mod_SHIFT, S, exec, mkdir ~/screenshots; grim -g \"$(slurp)\" ~/screenshots/$(date +'%s_grim.png') && notify-send 'Screenshot Saved' -t 2000"
        "$mod, R, exec, sh -c 'if pkill wf-recorder; then notify-send \"Recording Saved\" -t 2000; else mkdir -p ~/videos && wf-recorder --audio=$(wpctl inspect @DEFAULT_AUDIO_SINK@ | grep \"node.name\" | cut -d\"\\\"\" -f4).monitor -f ~/videos/$(date +\"%s_recording.mp4\") & notify-send \"Recording Started\" -t 2000; fi'"
        "$mod, Q, killactive"
        "$mod, DELETE, exec, hyprlock"
        "$mod, DELETE_SHIFT, exit"
        "$mod, V, togglefloating"
        "$mod, F, fullscreen"
        "$mod, P, pin"
        "$mod, escape, exec, walker"
        "$mod, F1, exec, ghostty"
        "$mod, F2, exec, schizofox"
        "$mod, H, movefocus, l"
        "$mod, J, movefocus, d"
        "$mod, K, movefocus, u"
        "$mod, L, movefocus, r"
        "$mod_SHIFT, H, workspace, -1"
        "$mod_SHIFT, L, workspace, +1"
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
    binde = [
      "$mod, right, resizeactive, 100 0"
      "$mod, left, resizeactive, -100 0"
      "$mod, up, resizeactive, 0 -100"
      "$mod, down, resizeactive, 0 100"
    ];
  };
}
