{
  enable = true;
  enableCompletion = true;
  enableSyntaxHighlighting = true;    

  shellAliases = {
    lg = "lazygit";
    hxt = "CARGO_TARGET_DIR=target/rust-analyzer nix run github:pinelang/helix-tree-explorer/tree_explore"; # Helix PR with tree explorer
    nd = "nix develop --command zsh";
    zj = "zellij";
    audio-from-yt = "nix run github:sempruijs/audio-from-yt";

    # quick cargo commands
    ck = "cargo check";
    cr = "cargo run";
    cb = "cargo build";
    ct = "cargo test";

    pr-status = "watch -n 10 gh pr status";
    hs = "nix-shell -p ghc";
    rinit = "nix flake init -t github:cor/flake-templates\#rust";
  };
}