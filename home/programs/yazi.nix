{
  programs.yazi = {
    enable = true;
    enableNushellIntegration = true;
    settings = {
      yazi = {
        sort_dir_first = true;
        show_hidden = true;
        preview = {
          max_width = 1920;
          max_height = 1080;
          image_quality = 90;
        };
      };
    };
  };
}
