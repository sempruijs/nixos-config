{ config, pkgs, platform, ...}: {
  home = {
    username = "sem";
    # homeDirectory = "/home/sem";
    stateVersion = "23.11";
    packages = with pkgs; [
      nushell
      cmake
      git
      gh
      helix
      zellij
      neofetch
      lazygit
      direnv
    ] 
    ++ 
    (if platform == "utm" then [
      emacsPackages.emacspeak
      kitty
    ] else []);
  };
} 
