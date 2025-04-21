{
  pkgs,
  lib,
  ...
}: {
  services = {
    gvfs.enable = true;
    tumbler.enable = true;
    playerctld.enable = true;
    gnome.gnome-keyring.enable = true;

    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
      };
    };

    pipewire = {
      enable = true;
      wireplumber.enable = true;
      alsa.enable = true;
      pulse.enable = true;
    };

    greetd = {
      enable = true;
      settings.default_session = {
        command = "${lib.getExe pkgs.greetd.tuigreet} --cmd Hyprland --remember --time --time-format '%I:%M %p | %a • %h | %F' --theme border=magenta;text=cyan;prompt=green;time=red;action=blue;button=yellow;container=black;input=red";
        user = "greeter";
      };
    };

    logind = {
      extraConfig = ''
        HandlePowerKey=suspend
      '';
    };

    udev.packages = with pkgs; [
      via
    ];
  };
}
