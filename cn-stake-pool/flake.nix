{
  description = "cardano stake pool";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";

    cardano-node.url = "github:intersectmbo/cardano-node";
  };
  # pass inputs to output function
  outputs = inputs@{ self, nixpkgs, flake-parts, cardano-node, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems =
        [ "x86_64-linux" "x86_64-darwin" ];
      perSystem = { config, self', inputs', pkgs, system, ... }:
        let
        in {
          packages = {
            # add build phases here
            # default = 
            cardano-node = inputs.cardano-node.packages.${system}.cardano-node;
            cardano-cli = inputs.cardano-node.packages.${system}.cardano-cli;
          };
          devShells = {
            default = pkgs.mkShell {
              buildInputs = with pkgs; [ ponysay ];
            };
          };
        };
    };
}
