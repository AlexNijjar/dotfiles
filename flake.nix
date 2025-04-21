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
    nixcord = {
      url = "github:kaylorben/nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:gerg-l/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    walker.url = "github:abenz1267/walker";
    catppuccin.url = "github:catppuccin/nix";
    sops-nix.url = "github:Mic92/sops-nix";
    schizofox.url = "github:schizofox/schizofox";
    wallpkgs.url = "github:NotAShelf/wallpkgs";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = inputs:
    with inputs; {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          {
            nixpkgs = {
              config.allowUnfree = true;
            };
          }
          disko.nixosModules.disko
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.extraSpecialArgs = {inherit inputs;};
            home-manager.users.alex.imports = [./home/home.nix];
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
          ./nixos/sunshine.nix
          ./nixos/users.nix
        ];
      };
    };
}
