{ inputs, pkgs, platform, ... }: 
{
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    curl
    ghostty
    git
    gh
    # nushell
    zellij
    direnv
    lazygit
    neofetch
    tree
    bat
    bottom
    delta
    emacs
    nil
    zsh

    inputs.helix.packages.aarch64-linux.default
    inputs.randaam-cli.packages.aarch64-linux.default
    # inputs.yazi.packages.aarch64-linux.default

    inputs.tools.packages.aarch64-linux.audio-from-yt
    inputs.tools.packages.aarch64-linux.to-chords
    inputs.tools.packages.aarch64-linux.qrcode
    inputs.tools.packages.aarch64-linux.update-deps-pr
  ]
  ++
  (if platform == "utm" then [
    emacsPackages.emacspeak
    kitty
    vieb
  ] else []);
}
