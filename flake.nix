{
  description = "Nixos and darwin configuration";
  
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

    helix.url = "github:helix-editor/helix";
    randaam-cli.url = "github:sempruijs/randaam-cli";
    yazi.url = "github:sxyazi/yazi";

    tools.url = "github:sempruijs/tools";
  }; 

  outputs = { self, nixpkgs, home-manager, darwin, helix, yazi, ... }@inputs: {
    nixosConfigurations = 
      let
        mkSystem = { platform, ...}:
          let 
            pkgs = import nixpkgs;
          in
            nixpkgs.lib.nixosSystem rec {
              system = "aarch64-linux";
              specialArgs = {inherit inputs; inherit platform;};
              modules = [ 
                # ./${platform}/configuration.nix
                ./modules/packages.nix
                ./modules/nix.nix
                home-manager.nixosModules.home-manager {
                  home-manager = {
                    useGlobalPkgs = true;
                    useUserPackages = true;
                    extraSpecialArgs = {
                      platform = platform;
                    };
                    users.sem = {
                      imports = [
                        ./home.nix
                        ./hm/nix.nix
                        ./hm/helix.nix
                        ./hm/git.nix
                        ./hm/direnv.nix
                        ./hm/nushell/nu.nix
                        ./hm/emacs/emacs.nix
                      ];
                    };
                  };
                }
              ]
              ++ 
              (if platform == "orbstack" then [
                ./modules/orbstack.nix
                ./modules/orbstack/configuration.nix
              ] else (if platform == "utm" then [
                ./modules/utm/configuration.nix
                ./modules/utm/hardware-configuration.nix
              ] else []));
            };
      in
      {
        orbstack = mkSystem {
          platform = "orbstack";
        };
        utm = mkSystem {
          platform = "utm";
        };
      };

    # darwin
    darwinConfigurations = {
        default = darwin.lib.darwinSystem {
            system = "aarch64-darwin";
            modules = [
              ./darwin/darwin-configuration.nix
              home-manager.darwinModules.home-manager {
                users.users.sem = {
                  name = "sem";
                  home = "/Users/sem";
                };
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users.sem = {
                  imports = [
                    ./darwin/home.nix
                    ./hm/nix.nix
                    ./hm/helix.nix
                    ./hm/git.nix
                    ./hm/kitty.nix
                    ./hm/direnv.nix
                    ./hm/lazygit.nix
                    ./hm/nushell/nu.nix
                  ];
                };
                home-manager.extraSpecialArgs = { 
                    inherit inputs; 
                    # pkgs-unstable = import inputs.nixpkgs-unstable { system = "aarch64-darwin"; config.allowUnfree = true; };
                };
              }
            ];
        };
    };
  };
}
