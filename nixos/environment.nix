{pkgs, ...}: {
  environment = {
    systemPackages = with pkgs;
      [
        tree
        unzip
        rocmPackages.amdsmi
        rocmPackages.rocm-smi
        lutris
        stremio
        via
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
        speedtest-cli
      ]
      ++ (let
        vmopts = ''
          -Dawt.toolkit.name=WLToolkit
          -Xmx8G
        '';
      in [
        (jetbrains.idea-ultimate.override {vmopts = vmopts;})
        (jetbrains.pycharm-professional.override {vmopts = vmopts;})
        jetbrains.jdk
      ]);

    defaultPackages = [];

    variables = {
      EDITOR = "nvim";
      TERMINAL = "ghostty";
    };

    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      OZONE_PLATFORM = "wayland";
      ELECTRON_OZONE_PLATFORM_HINT = "auto";

      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";

      XCURSOR_SIZE = 24;
    };
  };
}
