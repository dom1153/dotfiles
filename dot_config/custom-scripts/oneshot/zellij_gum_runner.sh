#!/usr/bin/env bash
cd "$(dirname $0)"
cd ..

# Check if gum is installed
if ! command -v gum &>/dev/null; then
  echo "Error: gum is not installed"
  echo "Please install gum first: https://github.com/charmbracelet/gum#installation"
  exit 1
fi

script_dir="$(dirname "$0")"
scripts=("be.sh" "fe.sh" "build_fe_watch.sh" "stripe_listen.sh" "expose.sh" "install_fe_clean.sh")

### forge path $script_dir/scripts
cmd_a=()
for opt in "${scripts[@]}"; do
  cmd_a+=("$script_dir/$opt")
done

use_nix=''
if command -v nix &>/dev/null; then
  use_nix='nix develop -c'
fi

### add in zellij (or other terminal multiplexer)
options=()
if [ -n "$ZELLIJ" ]; then
  for opt in "${cmd_a[@]}"; do
    ### optionally -s to start suspended
    multiplexer="zellij run --"
    cmd="$multiplexer $use_nix $opt"
    options+=("$cmd")
  done
else
  echo "Error: zellij is not installed"
  exit 1
fi

options+=('Exit') ### mandatory command
while true; do
  choices=$(gum choose --no-limit "${options[@]}" --header 'Select commands to run')
  if [ "$choices" = "" ]; then
    break
  fi
  if [ "$choices" = "Exit" ]; then
    break
  fi

  # use bash IFS (internal field separator) to split choice
  IFS=$'\n' read -rd '' -a choice_array <<<"$choices"
  for choice in "${choice_array[@]}"; do
    zsh -c "$choice"
  done
done
