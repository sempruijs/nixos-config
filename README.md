# NixOS configuration

Reproducable configuration with flakes

### Using the configuration

1. Clone the repo

```shell
cd ~
git clone git@github.com:sempruijs/nixos-config.git
```

Then enable flakes and run:

```
  sudo nixos-rebuild switch --flake .#nixos
```

This will install al the software and will write all the .dotfiles defined in this repo.

