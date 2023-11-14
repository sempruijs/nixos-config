nixos:
	sudo nixos-rebuild switch --flake .#nixos

darwin:
	darwin-rebuild switch --flake ".#default"

