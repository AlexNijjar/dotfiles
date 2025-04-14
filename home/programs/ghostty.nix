{
  programs.ghostty = {
    enable = true;

    settings = {
      theme = "catppuccin-mocha";
      font-size = 13;
      background-opacity = 0.9;
      keybind = [
        "performable:ctrl+c=copy_to_clipboard"
        "ctrl+v=paste_from_clipboard"
        "ctrl+a=select_all"
        "ctrl+k=clear_screen"
        "ctrl+l=clear_screen"
      ];
    };
  };
}
