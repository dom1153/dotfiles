#!/usr/bin/env bash

### todo: integrate stop command as an argument

CHEZMOI_SOURCE_PATH="$(chezmoi source-path)"
echo 'Setting up watchman part 1'
watchman watch "${CHEZMOI_SOURCE_PATH}"
echo 'Setting up watchman part 2'
watchman -j <<EOT
["trigger", "${CHEZMOI_SOURCE_PATH}", {
  "name": "chezmoi-apply",
  "command": ["chezmoi", "apply", "--force"]
}]
EOT
echo 'Script complete. "watchman shutdown-server" when complete'

### "command": ["chezmoi", "apply", "--force"]
### "command": ["chezmoi", "apply"]
### watchman shutdown-server
