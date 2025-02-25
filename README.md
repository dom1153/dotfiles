# dotfiles

Personal RC dotfiles

A very messy setup

Based around nixos configs.

Original created with normal dotfiles in mind, but expaned over time to nixos.

# Usage

These dotfiles are configured with [chezmoi](https://www.chezmoi.io/)

To copy these to your own config directory, run:

(warning: --apply WILL overwrite files without prompt. e.g. bashrc, unlike normal chezmoi apply)

`chezmoi init --apply dom1153`

(needs testing:)
consider

chezmoi init dom1153
chezmoi apply

This will download the dotfiles to your home directory.

Will not override existing files by default.

## NixOS Installation

3. Run the flake:

`sudo nixos-rebuild boot --flake . --option eval-cache false`

or

`~/.config/custom-scripts/rebuild.sh`

## Mac (darwin) Installation

1. Install nix through [zero-to-nix installer](https://zero-to-nix.com/start/install)

2. Install [brew](https://brew.sh/)

3. Run [darwin-nix](https://github.com/LnL7/nix-darwin?tab=readme-ov-file#flakes) via flakes:

`nix run nix-darwin -- switch --flake ~/.config/nix/.#target-hostname`

# Inspiration

https://github.com/Misterio77/nix-starter-configs

https://github.com/fufexan/dotfiles

https://github.com/budimanjojo/dotfiles

