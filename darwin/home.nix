{ config, pkgs, lib, inputs, ...}: 
{
    home.stateVersion = "22.05";

    home.packages = (with pkgs; [
        git 
        git-lfs
        gh
        lazygit
        neofetch
        pandoc
        tree
        ripgrep
        bat
        unixtools.watch
        qrencode
        zellij
        pandoc
        bottom
        yazi
        # nerdfonts
        ghc
        claude-code

         inputs.bible-computer.packages.aarch64-linux.bible-verify
    ]);

    # Hide "last login" message on new terminal.
    home.file.".hushlogin".text = "";
        
    # programs.ssh doesn't work well for darwin.
    # home.file.".ssh/config".text = ''
    #     Host *
    #         AddKeysToAgent yes
    #         UseKeychain yes
    #         IdentityFile ~/.ssh/id_rsa
    # '';

    # programs.helix = import ./programs/helix.nix inputs.helix.packages.${pkgs.system}.default;
    # programs.kitty = import ./programs/kitty.nix pkgs.kitty;
    # programs.lazygit = import ./programs/lazygit.nix pkgs.lazygit;
    # programs.zsh = import ./programs/zsh.nix;
    # programs.direnv = import ./programs/direnv.nix;
}
