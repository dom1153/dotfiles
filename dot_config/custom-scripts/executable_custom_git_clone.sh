###!/usr/bin/env nix-shell
###!nix-shell -i bash --packages jq gum trurl

###!/usr/bin/env bash

### VVV useful script grabbing .config remote url
### bat --paging=never */.git/config | grep --color=auto 'url = ' | sed -E 's/.*url = //g'

### general regex tester: https://www.regextester.com/109207

debug=0
while getopts d flag; do
  case "$flag" in
  d) debug=1 ;;
  *)
    echo USAGE: "$usage"
    exit
    ;;
  esac
done
shift $(($OPTIND - 1)) ### this is the secret sauce
# echo "debug $debug"
# echo "args: $*"
# echo "args1: $1"
# exit

### repo (arg 1 of git clone) ; path, filename (arg 2 of git clone)
p=$(trurl "$1" --get '{path}' | grep -Eo '^/([^/]*)/([^/]*)')
p=$(echo "$p" | sed -E 's/.git$//g') ### remove .git extension
r="$(trurl "$1" --get '{scheme}://{host}')$p"
f=$(echo "$p" | sed -E 's/^\/([^\/]*)\/([^\/]*)/\2_\1/g')
if [[ "$debug" -eq "1" || "$2" == "-d" ]]; then
  echo "arg1: $1"
  echo "p: $p"
  echo "r: $r"
  echo "f: $f"
  wget --spider -q "$r"
  s=$?
  if [[ ! "$s" -eq "0" ]]; then
    echo "  !!! wget error: $s"
  fi
  echo git clone "'$r'" "'$f'"
  exit
fi
sizeee=$(curl -su "{:username}" "https://api.github.com/repos${p}" | jq '.size')
# echo "Repo size:" $sizeee KB "($(($sizeee / 1000)) MB)"
# echo "Clone URL:" $r
# gum log -linfo "Repo size:" $sizeee KB "($(($sizeee / 1000)) MB)"
# gum log -linfo "Clone URL:" $r
echo '{{ Color "2" "0" "Repo size:"  }}' $sizeee KB "($(($sizeee / 1000)) MB)" | gum format -t template
echo '{{ Color "3" "0" "Clone URL:"  }}' $r | gum format -t template
git clone "$r" "$f"
