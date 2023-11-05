{ config, pkgs, ...}: {
  home.username = "sem";
  home.homeDirectory = "/home/sem";
  home.stateVersion = "23.11";
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
} 
