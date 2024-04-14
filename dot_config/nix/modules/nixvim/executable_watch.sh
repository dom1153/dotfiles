#!/usr/bin/env bash

mkdir -p /tmp/mylogs
rm -f /tmp/mylogs/nixvim.log

### could nix run, OR clean result every time, and run result/bin/nvim

watchman watch "$HOME/.config/nix/home/editors/nixvim/config"
### should be smart enough to search for flake.log above
### nix-run will log runtime errors (lua), so that's probably good
watchman -j <<EOT
["trigger", "$HOME/.config/nix/home/editors/nixvim/config", {
  "name": "nixvim run/build",
  "command": ["nix", "run", ".", "--verbose"],
  "expression": ["pcre", ".(lua|nix)$"],
  "stdout": ">>/tmp/mylogs/nixvim.log",
  "stderr": ">>/tmp/mylogs/nixvim.log",
  "chdir": "$HOME/.config/nix/home/editors/nixvim"
}]
EOT
echo 'Script complete. "watchman shutdown-server" when complete'
