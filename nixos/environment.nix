{ pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      tree
    ];

    defaultPackages = [];
    
    variables = {
      EDITOR = "nvim";
    };

    sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };
  };
}
