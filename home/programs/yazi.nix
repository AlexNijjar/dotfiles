{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      mgr = {
        show_hidden = true;
        sort_dir_first = true;
      };
      preview = {
        max_width = 1920;
        max_height = 1080;
        image_quality = 90;
      };
    };
  };
}
