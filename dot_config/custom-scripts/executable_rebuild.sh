#!/usr/bin/env bash

### config to support arguments, test, switch, build etc
### with error prompt

### switch case to handle wsl, darwin, nixos, etc

### chezmoi source-path
nhome=$HOME/.local/share/chezmoi/dot_config/nix

### home-manager --flake . news

cd $nhome

chezmoi apply

### --option eval-cache false
### --show-trace
nixos-rebuild switch --flake $nhome