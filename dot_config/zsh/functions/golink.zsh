### follow a symlink directory
### note this assumes your in the same directory...
function golink() {
  if [ -n "$1" ]; then
    if [ ! -L $1 ]; then
      echo "$1 is not a symlink"
    else
      p=$PWD;
      l=$(readlink $1);
      echo "$l"
      if [ -d "$l" ]; then
        cd $l;
      elif [ -f "$l" ]; then
        d=$(dirname $l);
        cd $d;
      else
        echo "$1 appears to be a broken link or unhandled scenario"
      fi
    fi
  else
    echo "usage: golink <symlink-file>"
    echo "  e.g. golink ~/.vimrc"
  fi
}
