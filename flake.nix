{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix.url = "github:Mic92/sops-nix";
  };
  
  outputs = { self, nixpkgs, disko, sops-nix, home-manager }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        disko.nixosModules.disko
        sops-nix.nixosModules.sops
        home-manager.nixosModules.home-manager
        {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.alex = ./home/home.nix;
        }
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
