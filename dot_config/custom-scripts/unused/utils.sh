#!/usr/bin/env bash

### prompt_yns: yes / no / skip prompt
### usage: `if prompt_yns "test prompt"; then`
### 'no' exits the entire script
### https://stackoverflow.com/questions/6241256/what-is-the-proper-way-to-test-a-bash-functions-return-value
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

### bash way of check if command returns 0
if command; then
	echo "Command succeeded"
else
	echo "Command failed"
fi

### swww has more examples here
### https://github.com/LGFae/swww/tree/main/example_scripts
swww init &
swww img ~/Pictures/AnimeWallpaperSetV2/landscape/giga-screenshot-13_final_40418139823_o.jpg

### random number 1 through 6, a directory based on symlinked videos
num=$((1 + $RANDOM % 6))
mpvpaper -o "no-audio --loop-playlist  --panscan=1" DP-1 /home/archoo/Pictures/Wallpapers/vid/playlist/${num}.mp4 &

#### pick one via sort
vidPath="/home/archoo/Pictures/Wallpapers/vid/"
vid="$(ls $vidPath | sort -R | tail -1)"
mpvpaper -o "no-audio --loop-playlist  --panscan=1" DP-1 "$vidPath/${vid}" &

mpvpaper -o "no-audio --loop-playlist  --panscan=1" DP-2 /home/archoo/Downloads/wall_test/aru_ny.mp4 &

### bash check empty string
### [ ! "str" ]; will flip the logic
if [ "$nrcmd" ]; then
	echo "hello '${nrcmd}'"
else
	echo "empty '${nrcmd}'"
fi

### bash process opts. use ':' after letter to require an argument
while getopts r:yf flag; do
	case "${flag}" in
	r) r=${OPTARG} ;;
	y) yes=1 ;;
	f) force=1 ;;
	*)
		echo "$(usage)"
		exit
		;;
	esac
done

### process a numbered arg
case "${nrcmd}" in
switch | build | boot | test) ;;
'' | '-'*)
	### ignore if empty, or ignore if only a flag
	nrcmd=''
	;;
*)
	echo "==> Invalid command '${nrcmd}'"
	echo "$(usage)"
	exit
	;;
esac

### preamble
exe="$(basename $0)"
usage="Usage: ${exe} {switch | build | boot | test} [-f (force)] [-r (reboot)] [-y (yes)]"

### bash simple match string
if [ "$x" = "valids" ]; then
	echo "x has the value 'valid'"
else
	echo "no"
fi
