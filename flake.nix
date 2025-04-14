{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix";
    sops-nix.url = "github:Mic92/sops-nix";
  };
  
  outputs = inputs: with inputs; {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        {
          nixpkgs = {
            config.allowUnfreePredicate = pkg: builtins.elem (nixpkgs.lib.getName pkg) [
             "steam"
             "steam-unwrapped"
             "spotify"
             "stremio-shell"
             "stremio-server"
            ];
            overlays = [
              nur.overlays.default
            ];
          };
        }
        disko.nixosModules.disko
        home-manager.nixosModules.home-manager
        {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users.alex = { 
              imports = [
                ./home/home.nix
                catppuccin.homeModules.catppuccin
              ];
            };
        }
        sops-nix.nixosModules.sops
        catppuccin.nixosModules.catppuccin
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
