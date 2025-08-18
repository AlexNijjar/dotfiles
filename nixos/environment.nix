{pkgs, ...}: {
  environment = {
    systemPackages = with pkgs;
      [
        tree
        unzip
        p7zip
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
        dua
        gradle
        socat
        detekt
        patchelf
        ccache
        zlib
        blockbench
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
      LD_LIBRARY_PATH = "${pkgs.vulkan-loader}/lib:${pkgs.libglvnd}/lib";
      PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
      OPENSSL_DIR = "${pkgs.openssl.dev}";
      OPENSSL_LIB_DIR = "${pkgs.openssl.out}/lib";
      OPENSSL_INCLUDE_DIR = "${pkgs.openssl.dev}/include/";
    };

    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      OZONE_PLATFORM = "wayland";
      ELECTRON_OZONE_PLATFORM_HINT = "auto";

      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";

      XCURSOR_SIZE = 24;

      VK_ICD_FILENAMES = "/run/opengl-driver/share/vulkan/icd.d/radeon_icd.x86_64.json";
      VK_LAYER_PATH = "/run/opengl-driver/share/vulkan/explicit_layer.d";
    };
  };

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      glibc
      gcc-unwrapped.lib
      stdenv.cc.cc.lib
      zlib
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
      libglvnd
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
