{pkgs, ...}: {
  nix = {
    settings = {
      warn-dirty = false;
      auto-optimise-store = true;
      experimental-features = "nix-command flakes";
      substituters = [
        "https://attic.xuyh0120.win/lantian"
        "https://cache.garnix.io"
      ];
      trusted-public-keys = [
        "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
        "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
      ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  time.timeZone = "America/Los_Angeles";
  i18n.defaultLocale = "en_US.UTF-8";

  sops = {
    defaultSopsFile = ../secrets.yaml;
    age = {
      sshKeyPaths = ["/etc/ssh/ssh_host_ed25519_key"];
      generateKey = true;
    };
    log = ["secretChanges"];
  };

  # Disable all devices waking up my computer
  powerManagement.powerDownCommands = ''
    for device in $(grep enabled /proc/acpi/wakeup | cut -f1); do
      echo $device > /proc/acpi/wakeup
    done
  '';

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    twemoji-color-font
  ];

  catppuccin = {
    enable = true;
    accent = "mauve";
    flavor = "mocha";
  };

  zramSwap.enable = true;

  boot.kernel.sysctl = {
    "vm.swappiness" = 180;
    "vm.page-cluster" = 0;
    "net.ipv4.tcp_congestion_control" = "bbr";
    "net.core.default_qdisc" = "fq";
  };

  documentation.nixos.enable = false;

  system.stateVersion = "24.11";
}
