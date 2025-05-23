{pkgs, ...}: {
  programs = {
    steam = {
      enable = true;
      extest.enable = true;

      extraCompatPackages = [
        pkgs.proton-ge-bin
      ];
    };

    gamescope = {
      enable = true;
      capSysNice = true;
    };

    gamemode = {
      enable = true;
      settings = {
        general.renice = 10;

        gpu = {
          apply_gpu_optimisations = "accept-responsibility";
          gpu_device = 0;
          amd_performance_level = "high";
        };

        custom = {
          start = "${pkgs.libnotify}/bin/notify-send 'GameMode started'";
          end = "${pkgs.libnotify}/bin/notify-send 'GameMode ended'";
        };
      };
    };
  };
}
