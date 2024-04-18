{
  useGlobalPkgs = true;
  useUserPackages = true;
  users.sem = {
    imports = [
      ./home.nix
      ../../hm/nix.nix
      ../../hm/helix.nix
      ../../hm/git.nix
      ../../hm/direnv.nix
      ../../hm/nushell/nu.nix
    ];
  };
}
