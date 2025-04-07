{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    "${
      builtins.fetchTarball {
        url = "https://github.com/nix-community/disko/archive/master.tar.gz";
        sha256 = "sha256:01ir7h41rph2b3ix2p6qyjr8d5yz2wq3akp2v87ddjjnh4v3n8an";
      }
    }/module.nix"
    ./disko-config.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.wireless.enable = true;
  networking.wireless.networks = {
    Serenity = {
      psk = "";
    };
  };

  time.timeZone = "America/Los_Angeles";
  i18n.defaultLocale = "en_US.UTF-8";

  users.users.alex = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIdZWguoU6C7AIsM4+DDVx5RnjCdZ6xY0yhgkMZyAOBT alexander.nijjar@icloud.com"
    ];
  };

  environment.systemPackages = with pkgs; [
    git
    neovim
    btop
    fastfetch
    unzip
  ];

  environment.defaultPackages = [ ];
  programs.nano.enable = false;
  nix.settings.experimental-features = "nix-command flakes";

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };

  services.pipewire = {
    enable = true;
    wireplumber.enable = true;
    alsa.enable = true;
    pulse.enable = true;
  }

  system.stateVersion = "24.11";
}
