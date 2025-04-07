{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    "${builtins.fetchTarball "https://github.com/nix-community/disko/archive/master.tar.gz"}/module.nix"
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
  };

  environment.systemPackages = with pkgs; [
    git
    neovim
  ];

  users.mutableUsers = false;
  environment.defaultPackages = [ ];
  nix.settings.experimental-features = "nix-command flakes";

  services.openssh.enable = true;
  system.stateVersion = "24.11";
}
