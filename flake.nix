{
  description = "A simple NixOS flake";
  
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    home-manager = {
       url = "github:nix-community/home-manager";
       inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
        url = "github:lnl7/nix-darwin/master";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  }; 

  outputs = { self, nixpkgs, home-manager, darwin, ... }@inputs: {

    # nixos
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem rec {
        system = "aarch64-linux";
        modules = [ 
          ./nixos/configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager = import ./home-manager.nix;
          }
       ];
    };

    # darwin
    darwinConfigurations = {
        default = darwin.lib.darwinSystem {
            system = "aarch64-darwin";
            modules = [
              ./darwin/darwin-configuration.nix
              home-manager.darwinModules.home-manager {
                # users.users.sem = {
                #   name = "sem";
                #   home = "/Users/sem";
                # };
                home-manager = import ./home-manager.nix;
              }
            ];
        };
    };
  };
}
