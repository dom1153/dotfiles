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
### nwg-bar <-- keeps randomly getting cleaned, unsure why
dotfiles=(ags alacritty amethyst bash cheat eww fish foot fuzzel hypr kitty navi nix nixpkgs nvim nvim.kickstart tmux tmuxinator waybar windows windows wofi wofi zellij zsh)
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
			#### --verbose will show the actual trash commands occuring :)
			chezmoi unmanaged -p absolute . | xargs --verbose -I {} trash "{}"
		fi
	fi
done

echo "SCRIPT: Done!"
