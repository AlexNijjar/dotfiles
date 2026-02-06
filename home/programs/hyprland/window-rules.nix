{
  wayland.windowManager.hyprland.settings.windowrule = [
    "match:class .*, suppress_event maximize"

    "match:title ^(vesktop)$, workspace 1"
    "match:title ^(spotify)$, workspace 1"
    "match:class ^(firefox)$, workspace 2"

    "match:class ^(spotify)$, opacity 0.9"
    "match:class ^(thunar)$, opacity 0.9"
    "match:class ^(vesktop)$ match:fullscreen 0, opacity 0.9"
    "match:title ^(Lutris)$, opacity 0.9"

    "match:class ^(imv)$, float on"
    "match:class ^(mpv)$, float on"

    "match:title ^(Picture-in-Picture)$, float on"
    "match:title ^(Picture-in-Picture)$, pin on"

    "match:title ^(Discord Popout)$, float on"
    "match:title ^(Discord Popout)$, pin on"

    "match:title ^(Open Files)$, float on"
  ];
}
