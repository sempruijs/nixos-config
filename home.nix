{ config, pkgs, ...}: {
  home.username = "sem";
  home.homeDirectory = "/home/sem";
  home.stateVersion = "23.05";
  home.packages = with pkgs; [
    zsh
  ];

   programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    shellAliases = {
      _ = "sudo";
      h = "history";
      hg = "history | grep ";
    };
  };
} 
