#!/usr/bin/env bash

###!/usr/bin/env nix-shell
###!nix-shell -i bash --packages gnused gnugrep

### VVV useful script grabbing .config remote url
### bat --paging=never */.git/config | grep --color=auto 'url = ' | sed -E 's/.*url = //g'

### test cases: https://github.com/mipmip/home-manager-option-search
###             https://github.com/mipmip/home-manager-option-search/blob/main/scripts/parse_options-json.rb
###             https://github.com/end-4/CirnOS
###             https://github.com/Amitabha37377/Awful-DOTS.git
### general regex tester: https://www.regextester.com/109207

debug=0

# echo "arg1: $1"
r=$(echo "$1" | grep -Eo 'https?://\w+\.\w+\w+/[^/]*/[^/.]*')
f=$(echo "$r" | sed -E 's/https?:\/\/\w+\.\w+\/(\S+)\/(\w+)/\2_\1/g')
if [[ "$debug" -eq "1" ]]; then
  echo "r: $r"
  echo "f: $f"
  echo git clone "'$r'" "'$f'"
  exit
fi
git clone "$r" "$f"
