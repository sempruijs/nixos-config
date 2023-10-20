{
  description = "A simple NixOS flake";
  
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
       url = "github:nix-community/home-manager";
       inputs.nixpkgs.follows = "nixpkgs";
    };
  }; 

  outputs = { self, nixpkgs, home-manager ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem rec {
        system = "aarch64-linux";
        modules = [ ./configuration.nix ];
    };
  };
}
