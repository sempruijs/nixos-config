{
  useGlobalPkgs = true;
  useUserPackages = true;
  users.sem = {
    imports = [
      ./nixos/orb/home.nix
      # ./hm/nix.nix
      # ./hm/helix.nix
      # ./hm/git.nix
      # ./hm/kitty.nix
      # ./hm/direnv.nix
      # ./hm/nushell/nu.nix
    ];
  };
}
