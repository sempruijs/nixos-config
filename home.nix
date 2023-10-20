{ config, pkgs, ...}:

{
  # if you config gets too long, split it up into smaller modules
  imports = [
    ./git # looks for ./git/defualt.nix
    ./hypr/hyprland.nix # looks for ./hypr/hyprland.nix
   ];
    
  # The User and Path it manages
  home.username = "sem";
  home.homeDirectory = "/home/sem";
  
  # Let Home Manager manage itself
  programs.home-manager.enable = true;
  
  # List of user programs
  home.packages = with pkgs; [
    zsh
    git
    firefox
  ];
  
  # ZSH
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true
    shellAliases = {
      _ = "sudo";
      h = "history";
      hg = "history | grep ";
    };
  };
  
} 
