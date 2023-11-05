# NixOS configuration

Reproducable configuration with flakes

### About this configuration

I use a apple silicon mac and I use NixOS inside a VM with [utm](https://github.com/utmapp/UTM).
This configuration uses home manager.
Home manager generates configuration files.

These configuration files are generated through ```.nix``` files.
They are defined as home modules and they are stored in the a folder called ```hm```
All of these home modules are loaded in ```flake.nix```

I want to migrate my [nix-darwin-config](https://github.com/sempruijs/nix-darwin-config) into this repository in the near future.

If you want to use NixOS and you are visually impaired, forking this configuration is not a bad idea.
This repository does not contain well configured screen-readers, but it does have: 

- Kitty with large text with a github light high contrast theme.
- Helix with github light high contrast theme
- Nushell without ls-colors enabeld so it has more contrast.

It also has direnv configured to work well with flakes so you can start working right away.


### Using the configuration

1. Clone the repo

```shell
cd ~
git clone git@github.com:sempruijs/nixos-config.git
cd nixos-config
```

Then run:

```
  sudo nixos-rebuild switch --flake .#nixos
```

This will install al the software and will write all the .dotfiles defined in this repo.

