{ pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      tree
      unzip
    ];

    defaultPackages = [];
    
    variables = {
      EDITOR = "nvim";
      TERMINAL = "ghostty";

      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";

      QT_QPA_PLATFORMTHEME = "qt5ct";
      QT_QPA_PLATFORM = "wayland";

      HYPRCURSOR_THEME = "Adwaita";
      HYPRCURSOR_SIZE = 24;
      XCURSOR_SIZE = 24;
    };

    sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };
  };
}
