function cdf() {
  if [ -n "$1" ]; then
    cd $(dirname $1)
  else
    echo "usage: cdf <filepath>"
    echo "  e.g. cdf ~/personal-files/.vimrc"
  fi
}