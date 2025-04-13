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

  programs.catppuccin = {
    enable = true;
    flavor = "mocha";
  };
}
