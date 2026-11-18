# Stow

Migrating from chezmoi to [GNU Stow](https://www.gnu.org/software/stow/). Each top-level folder is a stow **package** whose contents mirror `$HOME`.

| Package       | Purpose                                   |
| ------------- | ----------------------------------------- |
| `core`        | Shared config for every machine (fish, git, ghostty, helix, starship, zellij), no theme |
| `mocha`       | Catppuccin Mocha (dark) plus dev tools: fastfetch, wezterm; bat/fish/ghostty/delta/helix/starship/zellij themes |
| `latte`       | Catppuccin Latte (light): gitui, btop; bat/fish/ghostty/delta/helix/starship/zellij themes, ghostty font |
| `extra`       | Optional extras                           |

Run stow from the repo root. The target defaults to the parent folder (`~`), so `-t` isn't needed.

A machine stows `core` plus **one** theme package: `core mocha` or `core latte`. The two theme packages are never stowed together.

## Setup

```sh
brew install stow

cd ~/.dots
stow -n -v -R core latte   # dry run: shows what would be linked
stow -R core latte         # or: core mocha
```

`-R` (restow) unlinks and relinks, so it's also the command to rerun after adding or removing files in a package.

`.stowrc` passes `--no-folding`: stow creates real folders and links each file, never a whole folder. Files that tools (or you) add next to the links stay out of the repo, so no `mkdir` is needed before stowing.

Check:

```sh
ls -la ~/.config/git
git config --show-origin --get-regexp 'user|delta|merge'
```

## Brew

Brewfiles live in `brew/`, outside the stow packages (they're inputs to `brew bundle`, not files for `~`). Each pairs with a package: run the ones the machine stows.

```sh
brew bundle --file=brew/Brewfile          # core: fish and what its config uses
brew bundle --file=brew/Brewfile.mocha
brew bundle --file=brew/Brewfile.latte
```

Brewfiles are Ruby: guard OS-specific lines with `if OS.linux?` / `if OS.mac?` (e.g. `trash-cli` is Linux-only, macOS uses the built-in `trash`). Casks need `if OS.mac?`. `brew bundle dump --file=-` prints what's installed, to compare.

## Git config

- `core/.config/git/config` is the global config (git reads `~/.config/git/config` alongside `~/.gitconfig`). It also defines the delta Catppuccin themes (`catppuccin.gitconfig`) but doesn't pick one.
- It includes `local.gitconfig` last, so a machine package can override anything. `mocha` uses it to pick delta's `catppuccin-mocha`, `latte` picks `catppuccin-latte`.
- `~/.gitconfig` is read after `~/.config/git/config` and wins on any overlap. Keep only machine-specific bits there (e.g. `gh` credential helpers).

## Fish

- `core/.config/fish` holds the shared config: `config.fish`, `conf.d/` (env, PATH), `features/` (aliases plus one file per theme-independent tool integration: atuin, starship, zoxide, ...), `functions/`.
- `config.fish` sources every `features/*.fish`, and stow merges that folder from all packages.
- Themed features (`fish-theme.fish`, `fzf.fish`, `bat-theme.fish`, `starship-theme.fish`) exist in both `mocha` and `latte` with the same names. Edit both copies when changing one.
- Fish needs no theme files: Catppuccin is built into fish 4.4+. `mocha` picks `catppuccin-mocha --color-theme=dark`, `latte` picks `catppuccin-mocha --color-theme=light` (Latte). Delete any old `~/.config/fish/conf.d/fish_frozen_theme.fish`.

## Themes (Catppuccin)

`core` has no theme (each tool's default); `mocha` ships Mocha (dark), `latte` ships Latte (light).

- **bat**: `mocha` has `Catppuccin Mocha.tmTheme`, `latte` has `Catppuccin Latte.tmTheme` (also used by delta's `syntax-theme`). `core`'s `features/bat.fish` reruns `bat cache --build` at shell start when a theme file is newer than bat's cache.
- **fish**: see [Fish](#fish) above.
- **helix**: `core/.config/helix/config.toml` uses `theme = "custom"`. Helix has no includes, and 25.07 can't switch light/dark by itself. So `themes/custom.toml` comes from the machine: `core` ships a `base16_default` fallback, `mocha` / `latte` replace it (`--override` in `.stowrc`, so list the theme package after `core`). Each one also clears `ui.background` so the terminal's background shows through.
- **ghostty**: `core/.config/ghostty/config` sets no theme and ends with `config-file = ?config.local` (optional, loaded last so it overrides). `mocha`'s `config.local` sets Mocha; `latte`'s sets Latte and the font.
- **starship**: no include or local-config support, and no light/dark setting. `core/.config/starship/starship.toml` is the only copy: it holds both palettes from [catppuccin/starship](https://github.com/catppuccin/starship/tree/main/themes) and leaves `palette = ''` (starship's default colors on a core-only machine; the "Could not find color palette" warning is hidden by `STARSHIP_LOG error`).
  - `features/starship-theme.fish` in `mocha` / `latte` writes a copy to `~/.cache/starship/starship.toml` with `palette` set to its own palette (sed), and sets `STARSHIP_CONFIG` to it. It rewrites the copy when it's missing, older than core's file, or its `palette` is blank or the other theme's (left over from switching packages).
  - core's `features/starship.fish` only sets `STARSHIP_CONFIG` if it's unset, so the feature wins whichever is sourced first.
  - `palette` must stay a top-level key, above the first `[table]`: placed after one, TOML assigns it to that table and starship ignores it.
- **btop**: only `latte` ships a theme (`catppuccin_latte.theme`); `btop.conf` isn't tracked, so pick the theme in btop's options menu (Esc → Options).
- Theme files come from [catppuccin/btop](https://github.com/catppuccin/btop/tree/main/themes) and [catppuccin/bat](https://github.com/catppuccin/bat/tree/main/themes).

## Zellij

- `core/.config/zellij/config.kdl` sets `theme_dark "default"` and `theme_light "default-light"`, zellij's built-in themes. Zellij switches between them based on the color scheme the terminal reports. If a terminal doesn't report its scheme, set `explicit_theme_hue "light"`.
- Zellij loads the built-in themes first, then the files in `themes/`, so a file that defines a built-in's name replaces it. `mocha/.config/zellij/themes/default.kdl` defines `default` as Catppuccin Mocha; `latte/.config/zellij/themes/default-light.kdl` defines `default-light` as Catppuccin Latte. Both are zellij's own `catppuccin-*.kdl` from v0.46.0, renamed. The theme picker therefore lists them as "default" / "default-light".
- Result: `core` alone gets zellij's built-ins for both hues, `mocha` gets Mocha for dark, `latte` gets Latte for light. No fallback file is needed.
- Don't set `theme`: it locks zellij to one theme and turns off switching.
- If a zellij update renames its built-in themes, the overrides silently stop applying: check `zellij-utils/assets/themes/` in the release.
- Zellij has no include or local-config file. Theme packages can still add files to `themes/` (custom themes) and `layouts/`; anything else needs a full `config.kdl` copy plus an `--override` line, like helix's theme.
- Local, untracked layouts can go straight in `~/.config/zellij/layouts/` (per-file links, see `--no-folding`).
- The settings screen can write to `config.kdl`, which is a link into the repo, so check `git status` after changing settings there.

## Other commands

```sh
stow -D latte   # remove a package's links
```

Unstow/restow all of a machine's packages together (`stow -D core latte`). Unstowing just one can fold a shared folder (e.g. `~/.config/ghostty`) into a link to the remaining package, and the next stow then aborts with "neither a link nor a directory".
