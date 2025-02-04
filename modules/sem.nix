{ inputs, pkgs, ... }:
{
  users.users.sem = {
    isNormalUser = true;
    extraGroups = [ 
      "networkmanager" 
      "wheel"
      "docker" 
    ];
    shell = pkgs.zsh;
  };
}
