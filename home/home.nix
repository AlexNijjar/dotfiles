{ pkgs, ... }:

{
  imports = [
    ./programs/hyprland.nix
    ./programs/nushell.nix
    ./programs/walker.nix
  ];

  home = {
    stateVersion = "24.11";
    packages = with pkgs; [
      krabby
      unzip
      vesktop
    ];
  };

  programs = {
    btop.enable = true
    fastfetch.enable = true;
    librewolf.enable = true;
    ghostty.enable = true;
  };

  services = {
    swayosd.enable = true;
    hyprpaper.enable = true;
  };

  catppuccin = {
    enable = true;
    accent = "mauve";
    flavor = "mocha";
  };
}
