{ config, pkgs, ...}: {
  home.username = "sem";
  home.homeDirectory = "/home/sem";
  home.stateVersion = "23.05";
  home.packages = with pkgs; [
    zsh
    helix
    kitty
    lazygit
  ];

  programs.zsh = import ./programs/zsh.nix;
  programs.helix = import ./programs/helix.nix;
  programs.kitty = import ./programs/kitty.nix;
  programs.direnv = import ./programs/direnv.nix;
} 
