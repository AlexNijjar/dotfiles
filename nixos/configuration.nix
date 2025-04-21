{pkgs, ...}: {
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = "nix-command flakes";
      substituters = ["https://walker.cachix.org"];
      trusted-public-keys = ["walker-git.cachix.org-1:vmC0ocfPWh0S/vRAQGtChuiZBTAe4wiKDeyyXM0/7pM="];
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

  system.stateVersion = "24.11";
}
