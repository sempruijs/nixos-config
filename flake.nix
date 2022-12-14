{
    description = "NixOS system by sempruijs";
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/release-22.05";
        darwin = {
            url = "github:lnl7/nix-darwin/master";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        home-manager = {
            url = "github:nix-community/home-manager/release-22.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };
    outputs = {self, darwin, nixpkgs, home-manager}@inputs: {
        darwinConfigurations = {
            default = darwin.lib.darwinSystem {
                system = "aarch64-darwin";
                modules = [
                    ./darwin-configuration.nix
                    home-manager.darwinModules.home-manager {
                        users.users.sem = {
                            name = "sem";
                            home = "/Users/sem";
                        };
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                        home-manager.users.sem = import ./home.nix;
                        home-manager.extraSpecialArgs = { inherit inputs; };
                    }
                ];
            };
        };
    };
}