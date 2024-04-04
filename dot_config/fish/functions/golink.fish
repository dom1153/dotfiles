### follow a symlink directory
### note this assumes your in the same directory...
function golink
  if ! test -z $argv[1]
    set f $argv[1]
    if ! test -L (basename $f)
      echo "$f is not a symlink"
      return 1
    else
      set -l l (readlink $f)
      echo "$l"
      if test -d "$l"
        cd $l
      else if test -f "$l"
        set -l d (dirname $l)
        cd $d
      else
        echo "$l appears to be a broken link or unhandled scenario"
      end
    end
  else
    echo "usage: golink <symlink-file>"
    echo "  e.g. golink ~/.vimrc"
  end
end
