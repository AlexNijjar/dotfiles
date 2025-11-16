{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.spicetify-nix.nixosModules.spicetify];
  programs.spicetify = let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  in {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      hidePodcasts
      shuffle
      songStats
    ];
    theme = spicePkgs.themes.catppuccin;
    colorScheme = "mocha";
  };
}
