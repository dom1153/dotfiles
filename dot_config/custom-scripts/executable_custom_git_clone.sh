#!/usr/bin/env bash

###!/usr/bin/env nix-shell
###!nix-shell -i bash --packages gnused gnugrep

# echo "arg1: $1"
r=$(echo "$1" | grep -Eo 'https?://\w+\.\w+\w+/\w+/\w+')
f=$(echo "$r" | sed -E 's/https?:\/\/\w+\.\w+\/(\w+)\/(\w+)/\2_\1/g')
# echo "r: $r"
# echo "f: $f"
# echo git clone "$r" "$f"
git clone "$r" "$f"
