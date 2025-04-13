{ pkgs, lib, ... }:

{
  services = {
    gvfs.enable = true;
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
        command = "${lib.getExe pkgs.greetd.tuigreet} --cmd Hyprland --remember --time --theme border=magenta;text=cyan;prompt=green;time=red;action=blue;button=yellow;container=black;input=red";
        user = "greeter";
      };
    };
  };
}
