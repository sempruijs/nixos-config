{ pkgs, ... }:
{
  home.file.".spacemacs".text = import ./spacemacs.el;
}
