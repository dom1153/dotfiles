#!/usr/bin/env bash

# README:
# Assumes dot files are directory above

addArgs=""
# for arg in "$@"
# do
#     case $arg in
#         "-f" )
#            addArgs+="-f ";;
#    esac
# done

### TODO: ignore flake.nix...

dotdir="$HOME/.config"
dotfiles=(amethyst windows wofi nixpkgs nvim cheat navi hypr alacritty bash foot nix kitty nvim.kickstart tmux tmuxinator waybar wofi windows zellij zsh)
for d in ${dotfiles[*]}; do
	curdir="$dotdir/$d"
	if [ ! -d "$curdir" ]; then
		echo "SCRIPT: Unable to find $curdir, skipping"
	else
		cd "$curdir"
		if [ -z "$(chezmoi unmanaged -p absolute .)" ]; then
			echo "SCRIPT: Skipping $curdir, no unmanaged files"
		else
			echo "curdir: $curdir"
			### xargs -p : interactive, -I {} command "{}" should quote each argument (to handle whitespace)
			chezmoi unmanaged -p absolute . | xargs -p -I {} trash "{}"
		fi
	fi
done

echo "SCRIPT: Done!"
