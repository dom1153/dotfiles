#!/usr/bin/env bash

### config to support arguments, test, switch, build etc
### with error prompt

### switch case to handle wsl, darwin, nixos, etc

### initial prompt to rebuild script
### verbose options

### chezmoi source-path
nhome=$HOME/.local/share/chezmoi/dot_config/nix

### home-manager --flake . news

cd $nhome

### y/no if out of date (prompt)
chezmoi apply

### run chezmoi cleanup script (prompt)

### --option eval-cache false
### --show-trace
nixos-rebuild switch --flake $nhome