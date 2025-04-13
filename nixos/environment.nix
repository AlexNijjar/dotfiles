{ pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      nushell
      git
      neovim
      btop
      fastfetch
      unzip
      tree
    ];

    defaultPackages = [];
    
    variables = {
      EDITOR = "nvim";
    };
  };
}
