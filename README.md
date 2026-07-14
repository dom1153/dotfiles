# dotfiles

```sh
chezmoi init dom1153
chezmoi apply
```

(Optional) Enable local features in .chezmoidata:

```
cp .chezmoidata.toml.dist .chezmoidata.toml
```

## Core script (debian)

```
sudo apt install build-essential procps curl file git -y
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)" >> "$HOME"/.bashrc
brew install chezmoi helix fish yazi lazygit difftastic
chezmoi init --apply dom1153/dotfiles-slim
exec fish
```
