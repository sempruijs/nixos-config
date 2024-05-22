{ config, pkgs, platform, ...}: {
  home = {
    username = "sem";

    stateVersion = "23.11";
  } // (if platform == "utm" then {
    homeDirectory = "/home/sem";
  } else {});
} 
