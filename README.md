# NixOS configuration

Reproducable configuration with flakes for nixos and darwin.

### About this configuration

I use [orbstack](https://orbstack.dev/) with NixOS on an apple silicon mac.
This configuration uses home manager.
Home manager generates configuration files.
These configuration files are generated through ```.nix``` files.
They are defined as home modules and they are stored in the a folder called ```hm```
All of these home modules are loaded in ```flake.nix```

If you want to use NixOS and you are visually impaired, forking this configuration is not a bad idea.
This repository does not contain well configured screen-readers, but it does have: 

- Kitty with large text with a github light high contrast theme.
- Helix with github light high contrast theme
- Nushell without ls-colors enabeld so it has more contrast.

It also has direnv configured to work well with flakes so you can start working right away.


### Using the configuration

I really like [orb stack](https://orbstack.dev). 
Orb stack is a hypervisor that integrates very well with macos.

You can set up a vm in minutes and it uses rosetta for fast compilation to x86-64 archtitecture so you can build docker images for both arctectures on a aarch64 mac with near native preformance.
It is not open-source and it has no gui. Everything is in the terminal.

1. Clone the repo

```shell
git clone git@github.com:sempruijs/nixos-config.git
cd nixos-config
```

Then run:

```
  sudo nixos-rebuild switch --flake .#nixos
```

This will install al the software and will write all the .dotfiles defined in this repo.

