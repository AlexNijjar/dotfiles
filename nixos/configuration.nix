{
  nix.settings.experimental-features = "nix-command flakes";

  time.timeZone = "America/Los_Angeles";
  i18n.defaultLocale = "en_US.UTF-8";

  sops = {
    defaultSopsFile = ../secrets.yaml;
    age = {
      sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
      generateKey = true;
    };
  };

  system.stateVersion = "24.11";
}
