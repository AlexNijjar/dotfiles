{
  wayland.windowManager.hyprland.settings.windowrule = [
    "suppressevent maximize, class:"

    "workspace 1, title:^(vesktop)$"
    "workspace 1, title:^(spotify)$"

    "opacity 0.95,class:^(LibreWolf)$fullscreen:0"
    "opacity 0.9,class:^(spotify)$"
    "opacity 0.9,class:^(thunar)$"
    "opacity 0.95,class:^(vesktop)$fullscreen:0"
    "opacity 0.9,class:^(modrinth-app)$"
    "opacity 0.9,title:^(Lutris)$"

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
