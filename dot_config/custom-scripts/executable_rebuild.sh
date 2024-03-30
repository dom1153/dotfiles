#!/usr/bin/env bash

### https://www.baeldung.com/linux/use-command-line-arguments-in-bash-script

### TODO
### 1. allow arguments ; 
    ### a. verbose?
    ### b. usage prompt (-h)
    ### c. --show stack
### 2. build, switch, boot, test
###     a. boot -> reboot prompt! (and maybe prompt b4 build for convenience :)
###     b. test should build to $TMP/date/result
###         a. and ofc tell user this occured
### 3. can we ID wsl and steamdeck?
### 4. can we make a prompt for new setup scripts? (e.g. facilitate # XYZ with parsed prompt)
### 5. maybe check if git is out of date too? (or does chezmoi do that for free ;)
### 6. consider a way to make debugging this script easier
###     a. maybe a flag to only apply, then rerun it?
###     b. I think the best way is to do this automatically... (with echo to tell user)
### 7. only use 'prompt' for rebuild if out of date... otherwise go straight to build script
### 8. diff flake.lock prompt as well (update, etc) -> probably do it's own script
### update utils.sh as needed

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

ind=""
function myecho {
    ### can't define ind here, or it will be kept locally 
    echo "${ind}$*"
}

### chezmoi source-path
### note: bulding in chezmoi will IGNORE dirty changes
###     so build from .config now, since this doesn't fit my flow
chome=$HOME/.local/share/chezmoi/dot_config/nix
nhome=$HOME/.config/nix
cd $nhome

### update chezmoi (apply)
cs=$(chezmoi status)
myecho "==> Checking chezmoi status"
ind="  "
### check if chezmoi returned any text (usually returns 0)
if [[ $cs ]]; then
    myecho "==> chezmoi is out of sync"

    ind="" ### reset indent height since we're running commands
    myecho ">> chezmoi status"
    chezmoi status

    myecho ">> chezmoi apply"
    chezmoi apply
else
    myecho "==> chezmoi is in sync :)"
fi
ind=""

# if prompt_yns "==> Run cleanup script?"; then
    ### todo
# fi

if prompt_yns "==> Continue to rebuild?"; then
    ind="  "
    case $OSTYPE in
    darwin*)
        ### sudo request will happen if needed
        ### --show-trace
        myecho ">> darwin-rebuild switch --flake . --option eval-cache false"
        darwin-rebuild switch --flake . --option eval-cache false
        ;;
    linux-*)
        ### if switch, require sudo, else
        ### --fast
        myecho ">> sudo nixos-rebuild switch --flake . --option eval-cache false"
        sudo nixos-rebuild switch --flake . --option eval-cache false
        ;;
    esac
else
  echo "==> Done"
fi