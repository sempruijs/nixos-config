{ config, pkgs, ...}: {
  home.username = "sem";
  home.homeDirectory = "/home/sem";
  home.stateVersion = "23.05";
  home.packages = with pkgs; [
    helix
    kitty
    lazygit
    nushell
    nix
    git
  ];

  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  programs.git = import ./programs/git.nix;
  programs.nushell = import ./programs/nushell/nu.nix;
  programs.helix = import ./programs/helix.nix;
  programs.kitty = import ./programs/kitty.nix;
  programs.direnv = import ./programs/direnv.nix;
} 
