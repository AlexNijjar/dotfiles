{pkgs, ...}: {
  imports = [
    ./programs/neovim.nix
    ./programs/spicetify.nix
    ./programs/steam.nix
    ./programs/sunshine.nix
    ./programs/walker.nix
  ];
  programs = {
    corectrl.enable = true;
    nano.enable = false; # i use neovim btw
    neovim.enable = true;
    noisetorch.enable = true;
    git.enable = true;
    hyprland.enable = true;
    waybar.enable = true;
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
      ];
    };
    zsh.enable = true;
  };

  systemd.user.services.noisetorch = {
    enable = true;
    description = "Noisetorch noise suppression";
    after = ["pipewire.service" "graphical-session.target"];
    wants = ["pipewire.service"];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.noisetorch}/bin/noisetorch -i -s alsa_input.usb-Amba_Insta360_Link-02.mono-fallback";
      RemainAfterExit = true;
    };
    wantedBy = ["default.target"];
  };
}
