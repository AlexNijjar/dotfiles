{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      theme = "catppuccin-mocha";
      font-size = 13;
      background-opacity = 0.9;
      scrollback-limit = 1024 * 1024 * 1024;
      clipboard-paste-protection = false;
      confirm-close-surface = false;
      gtk-tabs-location = "hidden";
      window-inherit-working-directory = true;
      window-save-state = "always";
      working-directory = "home";
      keybind = [
        "performable:ctrl+c=copy_to_clipboard"
        "performable:ctrl+v=paste_from_clipboard"
        "ctrl+a=select_all"
        "ctrl+k=clear_screen"
        "ctrl+l=clear_screen"
        "ctrl+shift+[=previous_tab"
        "ctrl+shift+]=next_tab"
        "ctrl+t=new_tab"
        "ctrl+q=close_tab"
        "ctrl+enter=ignore"
        "ctrl+comma=unbind"

        # TODO add when ghostty supports performable with scrolling https://github.com/ghostty-org/ghostty/issues/6765
        # "performable:ctrl+d=scroll_page_lines:15"
        # "performable:ctrl+u=scroll_page_lines:-15"
      ];
    };
  };
}
