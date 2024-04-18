{ config, pkgs, ...}: {
  home = {
    # homeDirectory = "/home/sem";
    stateVersion = "23.11";
    packages = with pkgs; [
      _1password-gui
      emacsPackages.emacspeak
      emacsPackages.doom
      espeak-ng
      gnumake42
      yazi
      kitty
      vieb
      emacs
      nushell
      cmake
      git
      gh
      helix
      zellij
      neofetch
      lazygit
      direnv
    ];
  };
} 
