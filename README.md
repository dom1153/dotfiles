# dotfiles

```sh
chezmoi init dom1153
chezmoi apply
```

Settings for dotfiles can be configured with a local chezmoidata file:

```
chezmoi cd
cp .chezmoidata.toml.dist .chezmoidata.toml

# recommended, but not required
cp .chezmoidata.toml.dist .chezmoidata.toml
```

Uncomment features accordingly in .chezmoidata
