{
  imports = [
    ./interface.nix
    ./programs/ghostty.nix
    ./programs/git.nix
    ./programs/hyprland.nix
    ./programs/lutris.nix
    ./programs/schizofox.nix
    ./programs/spotify-player.nix
    ./programs/ssh.nix
    ./programs/starship.nix
    ./programs/vesktop.nix
    ./programs/walker.nix
    ./programs/waybar.nix
    ./programs/yazi.nix
    ./programs/zsh.nix
  ];

  home.stateVersion = "24.11";

  programs = {
    btop.enable = true;
    cava.enable = true;
    fastfetch.enable = true;
    imv.enable = true;
    mpv.enable = true;
    zathura.enable = true;
    ripgrep.enable = true;
    fd.enable = true;
    bun.enable = true;
    uv.enable = true;
    carapace = {
      enable = true;
      enableZshIntegration = true;
    };
    pgcli.enable = true;
  };

  services = {
    mako = {
      enable = true;
      settings.default-timeout = 5000;
    };
    swayosd.enable = true;
  };

  programs.ruff = {
    enable = true;
    settings = {
      fix = true;
    };
  };
}
