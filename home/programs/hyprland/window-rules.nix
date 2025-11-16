{
  wayland.windowManager.hyprland.settings.windowrule = [
    "suppressevent maximize, class:\"\""

    "workspace 1, title:^(vesktop)$"
    "workspace 1, title:^(spotify)$"
    "workspace 2, class:^(firefox)$"

    "opacity 0.9,class:^(firefox)$fullscreen:0"
    "opacity 0.9,class:^(spotify)$"
    "opacity 0.9,class:^(thunar)$"
    "opacity 0.9,class:^(vesktop)$fullscreen:0"
    "opacity 0.9,class:^(modrinth-app)$"
    "opacity 0.9,title:^(Lutris)$"

    "float,class:^(imv)$"
    "float,class:^(mpv)$"

    "float,title:^(Picture-in-Picture)$"
    "pin,title:^(Picture-in-Picture)$"

    "float,initialTitle:^(Discord Popout)$"
    "pin,initialTitle:^(Discord Popout)$"

    "float,title:^(Open Files)$"
  ];
}
