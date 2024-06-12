### Change working dir in shell to last dir in lf on exit (adapted from ranger).
### https://github.com/gokcehan/lf/blob/master/etc/lfcd.sh

lfcd() {
  # `command` is needed in case `lfcd` is aliased to `lf`
  cd "$(command lf -print-last-dir "$@")"
}

bind '"\C-f":"lfcd\C-m"'
