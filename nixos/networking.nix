{ config, pkgs, ... }:

{
  sops.secrets.wpa_supplicant = { };

  networking = {
    hostName = "nixos";
    useDHCP = false;
    wireless = {
      enable = true;
      secretsFile = config.sops.secrets.wpa_supplicant.path;
      networks.Serenity.pskRaw = "ext:serenity_psk";
    };
    interfaces.wlp11s0 = {
      useDHCP = false;
      wakeOnLan.enable = true;
      ipv4.addresses = [{
        address = "10.0.4.2";
        prefixLength = 24;
      }];
    };
    defaultGateway = "10.0.4.1";
    nameservers = [ "1.1.1.1" "8.8.8.8" ];
  };

  systemd.services.enable-wowlan = {
    description = "Enable Wake-on-WLAN";
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.iw}/bin/iw phy phy0 wowlan enable magic-packet";
      RemainAfterExit = true;
    };
  };
}
