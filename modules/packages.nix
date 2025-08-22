{ inputs, pkgs, platform, ... }: 
{
  environment = {
    systemPackages = with pkgs; [
      vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
      wget
      neovim
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
      claude-code

      inputs.helix.packages.aarch64-linux.default
      inputs.randaam-cli.packages.aarch64-linux.default
      inputs.bible-computer.packages.aarch64-linux.bible-verify
      # inputs.yazi.packages.aarch64-linux.default

      inputs.tools.packages.aarch64-linux.audio-from-yt
      inputs.tools.packages.aarch64-linux.to-chords
      inputs.tools.packages.aarch64-linux.qrcode
      inputs.tools.packages.aarch64-linux.update-deps-pr

      inputs.book-notes-generator.packages.aarch64-linux.default
      inputs.aider-chat.legacyPackages.aarch64-linux.aider-chat
    ]
    ++
    (if platform == "utm" then [
      emacsPackages.emacspeak
      kitty
      vieb
    ] else []);

    variables = {
      PS1 = "> ";
      PROMPT = "> ";
      RPROMPT = "> ";
      EDITOR = "hx";
      VISUAL = "hx";
    };
  };
}
