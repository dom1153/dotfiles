function sii() {
  if [ -n "$1" ]; then
    grep "$1" . -ri --include="$2" "${@:3}" --exclude-dir="node_modules";
  else
    echo "usage: sii <search-term> <filter-pattern> [<args>]"
    echo "  e.g. sii main *.c"
  fi
}
