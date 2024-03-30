#!/usr/bin/env bash

### prompt_yns: yes / no / skip prompt
### usage: `if prompt_yns "test prompt"; then`
### 'no' exits the entire script
### https://stackoverflow.com/questions/6241256/what-is-the-proper-way-to-test-a-bash-functions-return-value
function prompt_yns {
    while true; do
        read -p "$* [yes/no/skip]: " yn
        case $yn in
            [Yy]*) return 0  ;;  
            [Nn]*) echo "Exiting script" ; exit 1 ;;
            [Ss]*) return 1;;
        esac
    done
}

### os specific branching
case $OSTYPE in
  darwin*)
    echo "darwin specific code"
    ;;
  linux-*)
    echo "linux specific code"
    ;;
  *)
    echo "catch all... I think"
    ;;
esac

### check if command had output
### https://stackoverflow.com/questions/12137431/test-if-a-command-outputs-an-empty-string
### Note: $cs will be inline text, so consider running again for line breaks?
cs=$(ls -l)
if [[ $cs ]]; then
  echo "has output"
else
  echo "no output"
fi

### zsh style checking if exe exists
if type "trash" >/dev/null; then
  echo "I have this command"
else
  echo "I do NOT have this command"
fi

### bash variant of above
if type "trash" >/dev/null 2>&1; then
  echo "I have this command"
else
  echo "I do NOT have this command"
fi

### zsh (and maybe bash) check path
p=$HOME/.config/custom-scripts
if [ -d "$p" ]; then
  alias nr="$p/rebuild.sh"
  alias cclean="$p/chezmoi_cleanup.sh"
fi