{
  config,
  pkgs,
  ...
}: {
  sops.secrets.wpa_supplicant = {};

  networking = {
    useDHCP = false;
    useNetworkd = true;
    wireguard.enable = true;
    wireless = {
      enable = true;
      secretsFile = config.sops.secrets.wpa_supplicant.path;
      networks.WOMBO.pskRaw = "ext:wombo_psk";
    };
    interfaces.wlp11s0 = {
      useDHCP = false;
      wakeOnLan.enable = true;
      ipv4 = {
        addresses = [
          {
            address = "192.168.0.2";
            prefixLength = 24;
          }
        ];
        routes = [
          {
            address = "192.168.0.1";
            prefixLength = 24;
          }
        ];
      };
    };
    defaultGateway = {
      address = "192.168.0.1";
      interface = "wlp11s0";
    };
    nameservers = ["1.1.1.1" "8.8.8.8"];
    firewall.allowedTCPPorts = [22];
  };

  systemd.services.enable-wowlan = {
    description = "Enable Wake-on-WLAN";
    wantedBy = ["multi-user.target"];
    after = ["network.target"];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.iw}/bin/iw phy phy0 wowlan enable magic-packet";
      RemainAfterExit = true;
    };
  };
}
