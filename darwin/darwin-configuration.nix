{ config, pkgs, ... }: 
{    
  nix = {
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    settings = {
      substituters = [ 
        "https://nixos-search.cachix.org" 
      ];
      trusted-public-keys = [
        "nixos-search.cachix.org-1:1HV3YF8az4fywnH+pAd+CXFEdpTXtv9WpoivPi+H70o="
      ];
    };
  };
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [ 
    gnumake
    coreutils
    cmake 
    element-desktop
    vscodium
    kitty
  ];

  environment.variables = {
    EDITOR = "hx";
  };
  networking = let name = "SemBook"; in {
    computerName = name;
    hostName = name;
    localHostName = name;
  };

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  # environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  # Create /etc/zshrc that loads the nix-darwin environment.

  # do NOT remove this line. Everything will break and you have nothing from the nix store
  programs.zsh.enable = true;  # default shell on catalina
  # programs.fish.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

}
