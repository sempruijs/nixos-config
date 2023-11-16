{ config, pkgs, ...}: {
  home = {
    username = "sem";
    homeDirectory = "/home/sem";
    stateVersion = "23.11";
    packages = with pkgs; [
      nushell
      bottom
      cmake
      git
      gh
      helix
      vieb
      zellij
      neofetch
      lazygit
      _1password-gui
      kitty
      direnv
    ];
  };
} 
