{ inputs, pkgs, ... }: 
{
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    slides
    curl
    git
    gh
    nushell
    zellij
    direnv
    lazygit
    neofetch
    tree
    bat
    bottom
    gomuks
    flyctl
    delta
    emacs
    nil

    inputs.helix.packages.aarch64-linux.default
    inputs.randaam-cli.packages.aarch64-linux.default
    inputs.yazi.packages.aarch64-linux.default

    inputs.tools.packages.aarch64-linux.audio-from-yt
    inputs.tools.packages.aarch64-linux.to-chords
    inputs.tools.packages.aarch64-linux.qrcode
    inputs.tools.packages.aarch64-linux.update-deps-pr
  ];
}
