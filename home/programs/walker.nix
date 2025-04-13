{ flake, ... }:

{
  imports = [flake.inputs.walker.homeManagerModules.default];
  programs.walker = {
    enable = true;
    runAsService = true;
  };

  nix.settings = {
    substituters = ["https://walker.cachix.org"];
    trusted-public-keys = ["walker.cachix.org-1:fG8q+uAaMqhsMxWjwvk0IMb4mFPFLqHjuvfwQxE4oJM="];
  };
}