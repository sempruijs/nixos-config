{ pkgs, platform, ...}:
{
  programs.emacs = {
    enable = platform == "utm";
    package = pkgs.emacs;
    extraConfig = import ./emacs-config.nix;
  };
}
