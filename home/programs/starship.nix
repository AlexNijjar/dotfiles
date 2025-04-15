{
  programs.starship = {
    enable = true;
    enableNushellIntegration = true;
    settings = {
      add_newline = false;
      scan_timeout = 100;
      command_timeout = 1000;
      character = {
        success_symbol = "[[󰄛](green) ❯](#cba6f7)";
        error_symbol = "[[󰄛](red) ❯](#cba6f7)";
        vimcmd_symbol = "[󰄛 ❮](subtext1)";
      };
    };
  };
}
