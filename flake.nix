{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix.url = "github:Mic92/sops-nix";
  };
  
  outputs = { self, nixpkgs, disko, sops-nix }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        disko.nixosModules.disko
        sops-nix.nixosModules.sops
        ./nixos/boot.nix
        ./nixos/configuration.nix
        ./nixos/disko-config.nix
        ./nixos/environment.nix
        ./nixos/hardware-configuration.nix
        ./nixos/networking.nix
        ./nixos/programs.nix
        ./nixos/services.nix
        ./nixos/users.nix
      ];
    };
  };
}
