{pkgs, ...}: {
  programs.nushell = {
    enable = true;

    shellAliases = {
      switch = "sudo nixos-rebuild switch --flake ~/dotfiles";
    };

    settings = {
      edit_mode = "vi";
      show_banner = false;
      completions.external = {
        enable = true;
        max_results = 200;
      };
    };

    environmentVariables = {
      OPENSSL_DIR = "${pkgs.openssl.dev}";
      OPENSSL_LIB_DIR = "${pkgs.openssl.out}/lib";
      OPENSSL_INCLUDE_DIR = "${pkgs.openssl.dev}/include/";
      PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
    };

    extraConfig = ''
      if 'TERM_PROGRAM' in ($env | columns) and $env.TERM_PROGRAM == "ghostty" and (not ('NVIM' in ($env | columns))) {
        krabby random
      }
    '';
  };
}
