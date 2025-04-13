{ config, ... }:

{
  sops.secrets.wpa_supplicant = {};

  networking = {
    hostName = "nixos";
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
    useDHCP = true;
    defaultGateway = "10.0.4.1";
    nameservers = [ "1.1.1.1" "8.8.8.8" ];
  };
}
