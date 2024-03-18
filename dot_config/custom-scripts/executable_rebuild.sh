#!/usr/bin/env bash

### config to support arguments, test, switch, build etc
### with error prompt

### chezmoi source-path
nhome=$HOME/.local/share/chezmoi/dot_config/nix

### home-manager --flake . news

cd $nhome

chezmoi apply

nixos-rebuild switch --flake $nhome