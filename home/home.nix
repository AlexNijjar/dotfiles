{ pkgs, ... }:

{
  imports = [
    ./programs/nushell.nix
  ];

  home = {
    stateVersion = "24.11";
    packages = with pkgs; [
      krabby
      btop
      fastfetch
      unzip
    ];
  };

  catppuccin = {
    enable = true;
    accent = "mauve";
    flavor = "mocha";
  };
}
