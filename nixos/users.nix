{
  config,
  pkgs,
  ...
}: {
  sops.secrets.user_password = {
    neededForUsers = true;
  };
  sops.secrets.root_password = {
    neededForUsers = true;
  };

  users = {
    users.alex = {
      isNormalUser = true;
      extraGroups = ["wheel"];
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIdZWguoU6C7AIsM4+DDVx5RnjCdZ6xY0yhgkMZyAOBT alexander.nijjar@icloud.com"
      ];
      hashedPasswordFile = config.sops.secrets.user_password.path;
    };
    users.root.hashedPasswordFile = config.sops.secrets.root_password.path;
    defaultUserShell = pkgs.nushell;
    mutableUsers = false;
  };

  security = {
    sudo.extraConfig = ''
      Defaults timestamp_timeout=60
      Defaults timestamp_type=global
    '';
    pam.services.greetd.enableGnomeKeyring = true;
  };
}
