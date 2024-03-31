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
### 9. check if build is succesful before asking for reboot
### 10. check if git is out of sync
### 11. support --show-trace arg
### 12. 'build' command to put result in /tmp (named)
### update utils.sh as needed

### >>> functions
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

### >>> preamble
exe="$(basename $0)"
usage="Usage: ${exe} {switch | build | boot | test} [-f (force)] [-r (reboot)] [-y (yes)] [-v (verbose)]"

### >>> arg 1
nrcmd=$1
case "${nrcmd}" in
switch | build | boot | test) ;;
'' | '-'*)
	### ignore if empty, or ignore if only a flag
	nrcmd=''
	;;
*)
	echo "==> Invalid command '${nrcmd}'"
	echo "${usage}"
	exit
	;;
esac
# echo "nrcmd is '${nrcmd}'"

### >>> arg dash flags
while getopts ryfvd flag; do
	case "${flag}" in
	r) force_reboot=1 ;;
	y) yes=1 ;;
	f) force=1 ;;
	v) verbose=1 ;;
	d) dryrun=1 ;; ### dry run, debug, maybe auto apply verbose
	*)
		echo "${usage}"
		exit
		;;
	esac
done
# echo "yes?: '$yes'";
# echo "force?: '$force'";
# echo "restart?: '$r'";

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

ind="  "
case $OSTYPE in
darwin*)
	### sudo request will happen if needed
	### --show-trace
	if [ ! "$nrcmd" ]; then
		nrcmd="switch"
	fi

	myecho ">> darwin-rebuild ${nrcmd} --flake . --option eval-cache false"
	darwin-rebuild ${nrcmd} --flake . --option eval-cache false
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
	if [ "${nrcmd}" = "build" ]; then
		super=""
	fi

	myecho ">> ${super}nixos-rebuild ${nrcmd} --flake . --option eval-cache false"
	if ${super}nixos-rebuild ${nrcmd} --flake . --option eval-cache false; then
		if [ "${nrcmd}" = "boot" ]; then
			if [ "${force_reboot}" ]; then
				${super}reboot
			elif prompt_yns "Would you like to reboot?"; then
				${super}reboot
			fi
		fi
	fi
	;;
esac

myecho "==> Script Ends"
