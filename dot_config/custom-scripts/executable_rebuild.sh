#!/usr/bin/env bash

### https://www.baeldung.com/linux/use-command-line-arguments-in-bash-script

### TODO
### 1. allow arguments ;
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
### 9. check if build is succesful before asking for reboot
### 10. check if git is out of sync
### 11. support --show-trace arg
### 12. 'build' command to put result in /tmp (named)
### TODO: chezmoi update (check git; if NOT dirty)
### update utils.sh as needed

### >>> helper functions
function prompt_yns {
  while true; do
    read -p "$* [yes/no/skip]: " yn
    case $yn in
    [Yy]*) return 0 ;;
    [Nn]*)
      echo "Exiting script"
      exit 1
      ;;
    [Ss]*) return 1 ;;
    esac
  done
}

ind=""
function myecho {
  ### can't define ind here, or it will be kept locally
  echo "${ind}$*"
}

### >>> preamble
exe="$(basename "$0")"
usage="Usage: ${exe} {switch | build | boot | test} [-r (reboot)] [-v (verbose)] [-d (dry run)] [-s (show-trace)]"

### >>> arg dash flags
while getopts Rrvds flag; do
  # echo "flag: $flag"
  case "$flag" in
  R) force_reboot=1 ;;
  r) force_reboot=1 ;;
  v) verbose=1 ;;
  d) dryrun=1 ;; ### dry run, debug, maybe auto apply verbose
  s) stacktrace=1 ;;
  *)
    echo "$usage"
    exit
    ;;
  esac
done
shift $(($OPTIND - 1)) ### this is the secret sauce

nrcmd=$1
case "$nrcmd" in
switch | build | boot | test) ;;
'')
  ### ignore if empty, or ignore if only a flag
  ;;
*)
  echo "==> Invalid command '${nrcmd}'"
  echo "$usage"
  exit
  ;;
esac
# echo "nrcmd is '${nrcmd}'"

### chezmoi source-path
### note: bulding in chezmoi will IGNORE dirty changes
###     so build from .config now, since this doesn't fit my flow
chome=$HOME/.local/share/chezmoi/dot_config/nix
# nhome=$HOME/.config/nix
### TODO: go to chezmoi home
cd "$chome"

### pull
myecho "==> Chezmoi git pull"
chezmoi git pull -- --autostash --rebase
# myecho "  ==> Done"

### add any untracked git files
echo -e "a\n*\nq\n" | git add -i >/dev/null 2>&1

### update flakes (todo: upgrade nix so I can update specific packages)
myecho "==> Nix flake update"
# https://discourse.nixos.org/t/update-single-flake-input/13056
# nix flake update
nix flake lock --update-input dom1153-nvim-flake
# myecho "  ==> Done"

### update chezmoi (apply)
cs=$(chezmoi status)
if [ "$verbose" ]; then
  myecho "==> Checking chezmoi status"
  ind="  "
fi

### check if chezmoi returned any text (usually returns 0)
if [[ $cs ]]; then
  myecho "==> chezmoi is out of sync"

  ind="" ### reset indent height since we're running commands
  myecho ">> chezmoi status"
  chezmoi status

  myecho ">> chezmoi apply"
  chezmoi apply
else
  if [ "$verbose" ]; then
    myecho "==> chezmoi is in sync :)"
  fi
fi
ind=""

# if prompt_yns "==> Run cleanup script?"; then
### todo
# fi

addargs=""
if [ "$stacktrace" ]; then
  addargs="--show-trace ${addargs}"
fi

#### debugging code
if [ "$verbose" ]; then
  echo force_reboot: "$force_reboot"
  echo verbose: "$verbose"
  echo dryrun: "$dryrun"
  echo stacktrace: "$stacktrace"
  echo nrcmd: "$nrcmd"
fi

LOG_FILE="${PWD}/build.log"
echo "====================================" | tee -a "${LOG_FILE}"
date "+[INFO] Start %Y/%m/%d %H:%M:%S ===" | tee -a "${LOG_FILE}"
echo "====================================" | tee -a "${LOG_FILE}"

RESULT=0
BUILD_TIME=0

### ostype is a sh special (not fish...) ;)
case $OSTYPE in
darwin*)
  ### sudo request will happen if needed
  ### --show-trace

  # myecho ">> darwin-rebuild build --flake . --option eval-cache false ${addargs}"
  if [ ! "$dryrun" ]; then
    ### build-activate loop doesn't seem to respect home manager? doesn't work sometimes...
    ### maybe build returns bad return value...
    myecho ">> darwin-rebuild switch --flake . --option eval-cache false"
    darwin-rebuild switch --flake . --option eval-cache false
    RESULT=$?
    BUILD_TIME=$SECONDS

    # ### VVV try this again in the future; should work...
    # echo ">> darwin-rebuild build --flake . --option eval-cache false"
    # if darwin-rebuild build --flake . --option eval-cache false; then
    #   BUILD_TIME=$SECONDS
    #   ### TODO: require we return 1
    #   echo ">> darwin-rebuild activate --flake . --option eval-cache false"
    #   darwin-rebuild activate --flake . --option eval-cache false
    # else
    #   BUILD_TIME=$SECONDS
    # fi
  fi
  ;;
linux-*)
  super="sudo"
  super="${super} " ### append a space
  if type "doas" >/dev/null 2>&1; then
    super="doas"
    super="${super} " ### append a space
  fi

  ### todo maybe convert this to a case statement
  if [ ! "$nrcmd" ]; then
    nrcmd="boot"
  fi
  if [ "$nrcmd" = "build" ]; then
    super=""
  fi

  echo "$PWD"
  myecho ">> ${super}nixos-rebuild ${nrcmd} --flake . --option eval-cache false ${addargs}"
  if [ ! "$dryrun" ]; then
    if ${super}nixos-rebuild $nrcmd --flake . --option eval-cache false $addargs; then
      RESULT=$?
      ### TODO: catch result as pipe correctly
      if [ "$nrcmd" = "boot" ]; then
        # if type "wslvar" >/dev/null 2>&1; then
        #   cd /mnt/c/ && cmd.exe /c start "rebooting WSL" cmd /c "timeout 5 && wsl -d $WSL_DISTRO_NAME" && wsl.exe --terminate $WSL_DISTRO_NAME
        if [ "$force_reboot" ]; then
          ${super}reboot
        elif prompt_yns "Would you like to reboot?"; then
          ${super}reboot
        fi
      fi
    else
      RESULT=$?
    fi
  fi
  BUILD_TIME=$SECONDS
  ;;
esac

echo "====================================" | tee -a "${LOG_FILE}"
if [[ $RESULT -eq 0 ]]; then
  echo "[SUCCESS]: after $BUILD_TIME seconds" | tee -a "${LOG_FILE}"
else
  echo "[ERROR]: after $BUILD_TIME seconds" | tee -a "${LOG_FILE}"
fi
echo "====================================" | tee -a "${LOG_FILE}"

myecho "==> Script Ends"
