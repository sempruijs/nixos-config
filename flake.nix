{
  description = "A simple NixOS flake";
  
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    home-manager = {
       url = "github:nix-community/home-manager";
       inputs.nixpkgs.follows = "nixpkgs";
    };
  }; 

  outputs = { self, nixpkgs, home-manager, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem rec {
        system = "aarch64-linux";
        modules = [ 
          ./nixos/configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.sem = {
                imports = [
                  ./home.nix
                  ./hm/nix.nix
                  ./hm/helix.nix
                  ./hm/git.nix
                  ./hm/kitty.nix
                  ./hm/direnv.nix
                  ./hm/nushell/nu.nix
                ];
              };
            };
          }
       ];
    };
  };
}
