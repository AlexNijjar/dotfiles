{
  programs.ghostty = {
    enable = true;

    settings = {
      theme = "catppuccin-mocha";
      font-size = 13;
      background-opacity = 0.95;
      clipboard-paste-protection = false;
      confirm-close-surface = false;
      gtk-tabs-location = "hidden";
      window-inherit-working-directory = true;
      keybind = [
        "performable:ctrl+c=copy_to_clipboard"
        "ctrl+v=paste_from_clipboard"
        "ctrl+a=select_all"
        "ctrl+k=clear_screen"
        "ctrl+l=clear_screen"
        "ctrl+shift+[=previous_tab"
        "ctrl+shift+]=next_tab"
        "ctrl+t=new_tab"
        "ctrl+q=close_tab"
        "ctrl+enter=ignore"
      ];
    };
  };
}
