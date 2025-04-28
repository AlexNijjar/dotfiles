{pkgs, ...}: {
  imports = [
    ./interface.nix
    ./programs/ghostty.nix
    ./programs/git.nix
    ./programs/hyprland.nix
    ./programs/mpd.nix
    ./programs/nushell.nix
    ./programs/schizofox.nix
    ./programs/ssh.nix
    ./programs/starship.nix
    ./programs/thunderbird.nix
    ./programs/vesktop.nix
    ./programs/waybar.nix
    ./programs/yazi.nix
  ];

  home = {
    stateVersion = "24.11";
    packages = with pkgs; [
      lutris
      stremio
      via
      jetbrains.idea-ultimate
      jetbrains.pycharm-professional
      krabby
      pavucontrol
      wl-clipboard
      ffmpegthumbnailer
      grim
      slurp
      xarchiver
      gcc
      cargo
      nodejs_20
      python3
      uv
      jq
      sops
      openssl
      openssl.dev
      openssl.out
      pkg-config
      protobuf
      rustfmt
      clippy
      unrar
    ];
  };

  programs = {
    btop.enable = true;
    cava.enable = true;
    fastfetch.enable = true;
    obs-studio.enable = true;
    imv.enable = true;
    zathura.enable = true;
    ripgrep.enable = true;
    fd.enable = true;
    bun.enable = true;
    carapace = {
      enable = true;
      enableNushellIntegration = true;
    };
    pay-respects = {
      enable = true;
      enableNushellIntegration = true;
    };
    zoxide = {
      enable = true;
      enableNushellIntegration = true;
    };
  };

  services = {
    mako = {
      enable = true;
      defaultTimeout = 5000;
    };
    podman.enable = true;
    swayosd.enable = true;
  };

  xdg.userDirs.enable = true;
}
