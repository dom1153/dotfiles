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
dotfiles=(ags alacritty amethyst bash cheat eww fish foot fuzzel hypr kitty navi nix nixpkgs nvim nvim.kickstart nwg-bar tmux tmuxinator waybar windows windows wofi wofi zellij zsh)
for d in "${dotfiles[*]}"; do
	curdir="$dotdir/$d"
	if [ ! -d "$curdir" ]; then
		echo "SCRIPT: Unable to find $curdir, skipping"
	else
		cd "$curdir"
		if [ "$(chezmoi unmanaged -p absolute .)"]; then
			echo "SCRIPT: Skipping $curdir, no unmanaged files"
		else
			echo "curdir: $curdir"
			### xargs -p : interactive, -I {} command "{}" should quote each argument (to handle whitespace)
			### todo: have a internactive cli flag (or show what got deleted at least...)
			chezmoi unmanaged -p absolute . | xargs -I {} trash "{}"
			# chezmoi unmanaged -p absolute . | xargs -p -I {} trash "{}"
		fi
	fi
done

echo "SCRIPT: Done!"
