{ pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      tree
      unzip
    ];

    defaultPackages = [ ];

    variables = {
      EDITOR = "nvim";
      TERMINAL = "ghostty";
    };

    sessionVariables = {
      NIXOS_OZONE_WL = "1";

      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";

      XCURSOR_SIZE = 24;
    };
  };
}
