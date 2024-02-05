function si() {
  if [ -n "$1" ]; then
    grep "$1" . -ri "${@:2}" --exclude-dir="node_modules";
  else
    echo "usage: si <search-term> [<args>]"
  fi
}
