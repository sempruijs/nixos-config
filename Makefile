switch-nixos:
	sudo nixos-rebuild switch --flake .#nixos

switch-darwin:
	darwin-rebuild switch --flake ".#default"

