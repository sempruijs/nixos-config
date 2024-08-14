{ config, pkgs, platform, ...}:
{
  programs.nushell = {
    enable = true;
    envFile.source = (if (platform == "darwin")
      then (./env-mac.nu)
      else (./env-nix.nu));

    configFile.source = ./config.nu;
  };
}
