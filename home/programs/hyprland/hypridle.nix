{
  programs.hyprlock = {
    enable = true;
    settings = {
      background = {
        path = "screenshot";
        blur_passes = 2;
        blur_size = 5;
        contrast = 1.2;
        brightness = 0.6;
      };
    };
  };
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        after_sleep_cmd = "hyprctl dispatch dpms on";
        lock_cmd = "hyprlock";
      };

      listener = [
        {
          timeout = 900;
          on-timeout = "hyprlock";
        }
        {
          timeout = 36000;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };
}
