{
  imports = [
    ./interface.nix
    ./programs/aerc.nix
    ./programs/claude-code.nix
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

  sops = {
    defaultSopsFile = ../secrets.yaml;
    defaultSopsFormat = "yaml";

    age = {
      keyFile = "/home/alex/.config/sops/age/keys.txt";
      sshKeyPaths = [];
    };

    defaultSymlinkPath = "/run/user/1000/secrets";
    defaultSecretsMountPoint = "/run/user/1000/secrets.d";
  };

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
    atuin = {
      enable = true;
      enableZshIntegration = true;
      daemon.enable = true;
    };
    yt-dlp.enable = true;
    skim = {
      enable = true;
      enableZshIntegration = true;
    };
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
