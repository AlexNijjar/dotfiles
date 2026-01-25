{
  config,
  pkgs,
  ...
}: {
  sops.secrets.wombo_psk = {};

  sops.templates."WOMBO.psk" = {
    path = "/var/lib/iwd/WOMBO.psk";
    content = ''
      [Security]
      PreSharedKey=${config.sops.placeholder.wombo_psk}
    '';
    owner = "root";
    mode = "0600";
  };

  networking = {
    useDHCP = false;
    useNetworkd = true;
    wireguard.enable = true;
    wireless.iwd = {
      enable = true;
      settings = {
        Settings.AutoConnect = true;
      };
    };
    interfaces.wlan0 = {
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
      interface = "wlan0";
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
