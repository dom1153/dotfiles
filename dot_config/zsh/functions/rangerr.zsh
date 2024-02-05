### alias r for ranger with auto-cd support
### consider using ranger keybinds S and ^D instead
### 
if type "ranger" > /dev/null; then
  function r() {
      ranger $@ --choosedir=$HOME/.rangerdir;
      LASTDIR=`cat $HOME/.rangerdir`; 
      cd "$LASTDIR"
  }
else
  alias r="missingapp ranger"
fi
