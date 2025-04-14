{inputs, pkgs, ...}:

{
  programs.spicetify = let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
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
