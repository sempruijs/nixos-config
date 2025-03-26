{ config, pkgs, platform, ...}: {
  home = {
    username = "thomasmiddelbos";

    stateVersion = "23.11";
  } // (if platform == "utm" then {
    homeDirectory = "/home/thomasmiddelbos";
  } else {});
} 
