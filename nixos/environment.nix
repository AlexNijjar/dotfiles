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
  };
}
