# dotfiles

```sh
chezmoi init dom1153
chezmoi apply
```

```toml
# Creating a ~/.local/share/chezmoi/.chezmoidata.toml allows additional files or configuration
# To disable a feature, do not define the key (true/false value is ignored)
[local]
light_mode= true
helix_languages = true ### require dot_config/helix/languages.local.toml
```
