{ pkgs, ... }:

{
  imports = [
    ./programs/nushell.nix
  ];

  home-manager = { 
    useGlobalPkgs = true;
    useUserPackages = true;
    users.alex.home = {
      stateVersion = "24.11";
      packages = with pkgs; [
        krabby
        btop
        fastfetch
        unzip
      ];
    };
  };

  catppuccin = {
    enable = true;
    flavor = "mocha";
  };
}
