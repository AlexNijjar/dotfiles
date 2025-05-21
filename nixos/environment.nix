{pkgs, ...}: {
  environment = {
    systemPackages = with pkgs;
      [
        tree
        unzip
        rocmPackages.amdsmi
        rocmPackages.rocm-smi
        rocmPackages.rocminfo
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
        gh
        ty
        modrinth-app
      ]
      ++ (let
        vmopts = ''
          -Dawt.toolkit.name=WLToolkit
          -Xmx8G
        '';
      in [
        (jetbrains.idea-ultimate.override {vmopts = vmopts;})
        jetbrains.jdk
      ]);

    defaultPackages = [];

    variables = {
      EDITOR = "nvim";
      TERMINAL = "ghostty";
      LD_LIBRARY_PATH = "${pkgs.vulkan-loader}/lib";
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

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      alsa-lib
      atk
      cairo
      cups
      dbus
      expat
      glib
      gtk3
      libdrm
      libgbm
      libGL
      libvdpau
      libxkbcommon
      mesa
      nspr
      nss
      pango
      pipewire
      vulkan-loader
      wayland
      xorg.libX11
      xorg.libxcb
      xorg.libXcomposite
      xorg.libXdamage
      xorg.libXext
      xorg.libXfixes
      xorg.libXrandr
    ];
  };
}
