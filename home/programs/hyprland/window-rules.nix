{
  wayland.windowManager.hyprland.settings.windowrule = [
    "suppressevent maximize, class:"

    "workspace 1, title:^(vesktop)$"
    "workspace 1, title:^(spotify)$"
    "workspace 2, class:^(firefox)$"

    "opacity 0.95,class:^(firefox)$fullscreen:0"
    "opacity 0.95,class:^(spotify)$"
    "opacity 0.95,class:^(Thunar)$"
    "opacity 0.95,class:^(vesktop)$fullscreen:0"
    "opacity 0.95,class:^(modrinth-app)$"
    "opacity 0.95,title:^(Lutris)$"

    "float,class:^(imv)$"

    "float,title:^(Picture-in-Picture)$"
    "pin,title:^(Picture-in-Picture)$"

    "float,initialTitle:^(Discord Popout)$"
    "pin,initialTitle:^(Discord Popout)$"

    "float,title:^(Open Files)$"

    "stayfocused,title:^(Copy)$"
    "stayfocused,title:^(Rename)$"
    "stayfocused,title:^(Move)i$"
    "stayfocused,title:^(Optimize Imports)$"
    "stayfocused,title:^(Confirm Exit)$"
    "stayfocused,title:^()$class:^(jetbrains-idea)$floating:1"
    "stayfocused,title:^()$class:^(jetbrains-pycharm)$floating:1"
  ];
}
