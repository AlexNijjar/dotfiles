{pkgs, ...}: {
  users = {
    users.alex = {
      isNormalUser = true;
      extraGroups = ["wheel"];
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIdZWguoU6C7AIsM4+DDVx5RnjCdZ6xY0yhgkMZyAOBT alexander.nijjar@icloud.com"
      ];
    };
    defaultUserShell = pkgs.nushell;
  };

  security = {
    sudo.extraConfig = ''
      Defaults timestamp_timeout=60
      Defaults timestamp_type=global
    '';
    pam.services.greetd.enableGnomeKeyring = true;
  };
}
