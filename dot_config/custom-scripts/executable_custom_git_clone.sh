#!/usr/bin/env bash

###!/usr/bin/env nix-shell
###!nix-shell -i bash --packages gnused gnugrep

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
  wget --spider -q "$r"
  s=$?
  if [[ ! "$s" -eq "0" ]]; then
    echo "  !!! wget error: $s"
  fi
  # echo "r: $r"
  # echo "p: $p"
  # echo "f: $f"
  echo git clone "'$r'" "'$f'"
  exit
fi
git clone "$r" "$f"
