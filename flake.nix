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

    vscode-server.url = "github:nix-community/nixos-vscode-server";

    book-notes-generator.url = "github:sempruijs/book-notes-generator";

    aider-chat.url = "github:cor/nixpkgs/update-aider-chat";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    darwin,
    helix,
    yazi,
    vscode-server,
    book-notes-generator,
    aider-chat,
    ...
  }@inputs: {
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
                ./modules/packages.nix
                ./modules/nix.nix
                ./modules/sem.nix
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
                        # ./hm/git.nix
                        ./hm/direnv.nix
                        ./hm/zsh.nix
                        ./hm/ghostty.nix
                        # ./hm/nushell/nu.nix
                      ]
                      ++
                      (if platform == "utm" then [
                        ./hm/kitty.nix
                      ] else []);
                    };
                  };
                }
              ]
              ++ 
              (if platform == "orbstack" then [
                ./modules/orbstack.nix
                ./modules/orbstack/configuration.nix
                ./modules/orbstack/lxd.nix
                vscode-server.nixosModules.default
                ({ config, pkgs, ... }: {
                  services.vscode-server.enable = true;
                })
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
            specialArgs = {inherit inputs;};
            modules = [
              {
                nixpkgs.config.allowUnfree = true;
              }
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
                    # ./hm/nushell/nu.nix
                    ./darwin/home.nix
                    ./hm/nix.nix
                    ./hm/zsh.nix
                    ./hm/helix.nix
                    # ./hm/git.nix
                    ./hm/kitty.nix
                    ./hm/direnv.nix
                    ./hm/lazygit.nix
                    ./hm/ghostty.nix
                    # ./hm/emacs/spacemacs.nix
                  ];
                };
                home-manager.extraSpecialArgs = { 
                    inherit inputs;
                    platform = "darwin";
                    # pkgs-unstable = import inputs.nixpkgs-unstable { system = "aarch64-darwin"; config.allowUnfree = true; };
                };
              }
            ];
        };
    };
  };
}
