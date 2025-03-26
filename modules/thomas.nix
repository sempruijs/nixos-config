{ inputs, pkgs, ... }:
{
  users.users.thomasmiddelbos = {
    # isNormalUser = true;
    extraGroups = [ 
      "networkmanager" 
      "wheel"
      "docker" 
    ];
    # shell = pkgs.zsh;
   };
}
