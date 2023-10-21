{ config, pkgs, ...}: {
  home.username = "sem";
  home.homeDirectory = "/home/sem";
  home.stateVersion = "23.05";
  home.packages = with pkgs; [
    zsh
  ];

   programs.zsh = import ./programs/zsh.nix;
} 
