# dotfiles

## Installation

Setup (with homebrew essentials)

```sh
sudo apt install build-essential procps curl file git -y # can omit on MacOS

NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)" >> "$HOME"/.bashrc

brew install chezmoi helix fish yazi lazygit difftastic zellij

chezmoi init --apply dom1153/dotfiles
```

## App Setup

Atuin

```sh
atuin setup
atuin sync
autin import bash
autin import fish
```

Chezmoi

```sh
chezmoi cd
cp .chezmoidata.toml.dist .chezmoidata.toml
```

Ghostty

```sh
chezmoi cd
cp ./dot_config/ghostty/_dist/config.local ~/.config/ghostty/config.local
```

Git

```sh
chezmoi cd
cp ./files/home-template/dot_gitconfig ~/.gitconfig
```
