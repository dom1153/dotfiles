# Stow

Migrating from chezmoi to [GNU Stow](https://www.gnu.org/software/stow/). Each top-level folder is a stow **package** whose contents mirror `$HOME`.

| Package       | Purpose                                   |
| ------------- | ----------------------------------------- |
| `core`        | Shared config for every machine (fish, zellij) |
| `dev`         | Dev tools: git, bat, fastfetch, ghostty, starship, wezterm, fish theme |
| `work-pc`     | Work PC overrides                         |
| `work-laptop` | Work laptop overrides                     |
| `extra`       | Optional extras                           |

Run stow from the repo root. The target defaults to the parent folder (`~`), so `-t` isn't needed.

## Setup: work-pc

```sh
brew install stow

cd ~/.dots
stow -n -v -R core dev work-pc   # dry run: shows what would be linked
stow -R core dev work-pc
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
brew bundle --file=brew/Brewfile.dev
brew bundle --file=brew/Brewfile.work-pc
```

Brewfiles are Ruby: guard OS-specific lines with `if OS.linux?` / `if OS.mac?` (e.g. `trash-cli` is Linux-only, macOS uses the built-in `trash`). Casks need `if OS.mac?`. `brew bundle dump --file=-` prints what's installed, to compare.

## Git config

- `dev/.config/git/config` is the global config (git reads `~/.config/git/config` alongside `~/.gitconfig`).
- It includes `local.gitconfig` last, so a machine package can override anything. `work-pc` uses it to switch delta to Catppuccin Latte.
- `~/.gitconfig` is read after `~/.config/git/config` and wins on any overlap. Keep only machine-specific bits there (e.g. `gh` credential helpers).

## Fish

- `core/.config/fish` holds the shared config: `config.fish`, `conf.d/` (env, PATH), `features/` (aliases plus one file per theme-independent tool integration: atuin, starship, zoxide, ...), `functions/`.
- `config.fish` sources every `features/*.fish`, and stow merges that folder from all packages.
- Themed features (`00-theme.fish`, `fzf.fish`, `bat-theme.fish`) are Mocha in `dev`; `work-pc` ships Latte copies with the same names. `.stowrc` passes `--override` for them, so list the machine package last. Edit both copies when changing one.
- Fish needs no theme files: Catppuccin is built into fish 4.4+. `dev` picks `catppuccin-mocha --color-theme=dark`, `work-pc` picks `catppuccin-mocha --color-theme=light` (Latte). Delete any old `~/.config/fish/conf.d/fish_frozen_theme.fish`.

## Themes (Catppuccin)

`dev` ships Mocha (dark); `work-pc` adds Latte (light).

- **bat**: `dev` has `Catppuccin Mocha.tmTheme`, `work-pc` has `Catppuccin Latte.tmTheme` (also used by delta's `syntax-theme`). `core`'s `features/bat.fish` reruns `bat cache --build` at shell start when a theme file is newer than bat's cache.
- **fish**: see [Fish](#fish) above.
- **ghostty**: `dev/.config/ghostty/config` sets Mocha and ends with `config-file = ?config.local` (optional, loaded last so it overrides). `work-pc/.config/ghostty/config.local` switches to Latte and sets the font.
- **starship**: no include support, so `work-pc/.config/starship/starship.toml` is a full copy of `dev`'s with the Latte palette. The repo-root `.stowrc` passes `--override` for it, so the **last package listed wins**: always list the machine package last. Edit both copies when changing the prompt.
- **television**: only `work-pc` has a config (Latte theme).
- **btop**: only `work-pc` ships a theme (`catppuccin_latte.theme`); `btop.conf` isn't tracked, so pick the theme in btop's options menu (Esc → Options).
- Theme files come from [catppuccin/btop](https://github.com/catppuccin/btop/tree/main/themes) and [catppuccin/bat](https://github.com/catppuccin/bat/tree/main/themes).

## Zellij

- `core/.config/zellij/config.kdl` sets `theme_dark` / `theme_light` to zellij's built-in `catppuccin-mocha` / `catppuccin-latte`. Zellij switches between them based on the color scheme the terminal reports. Don't set `theme`: it locks zellij to one theme and turns off switching. If a terminal doesn't report its scheme, set `explicit_theme_hue "light"`.
- Zellij has no include or local-config file. Machine packages can still add files to `themes/` (custom themes) and `layouts/`; anything else needs a full `config.kdl` copy plus an `--override` line, like starship.
- Local, untracked layouts can go straight in `~/.config/zellij/layouts/` (per-file links, see `--no-folding`).
- The settings screen can write to `config.kdl`, which is a link into the repo, so check `git status` after changing settings there.

## Other commands

```sh
stow -D work-pc   # remove a package's links
```

Unstow/restow all of a machine's packages together (`stow -D core dev work-pc`). Unstowing just one can fold a shared folder (e.g. `~/.config/ghostty`) into a link to the remaining package, and the next stow then aborts with "neither a link nor a directory".
