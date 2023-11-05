{ config, pkgs, ...}: {
  home = {
    username = "sem";
    homeDirectory = "/home/sem";
    stateVersion = "23.11";
    packages = with pkgs; [
      helix
      kitty
      lazygit
      nushell
      nix
      git
    ];
  };
} 
