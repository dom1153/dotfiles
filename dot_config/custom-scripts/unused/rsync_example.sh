#!/usr/bin/env bash
cd "$(dirname $0)"
cd ..
gum log -linfo "Running rsync dry run"
a='hostname:/remotedir/dir'
b='/localdir/dir'
cmd="rsync -Pcauv --info=progress --delete --backup --backup-dir=/tmp/rsync $a $b"
$cmd -n
if gum confirm "Copy remote -> $(hostname)?"; then
  gum log -linfo "OK doing REAL rsync run"
  $cmd
else
  gum log -linfo "Doing nothing"
fi

### now the other way!
cmd="rsync -Pcauv --info=progress --delete --backup --backup-dir=/tmp/rsync $b $a"
$cmd -n
if gum confirm "Copy $(hostname) -> remote?"; then
  gum log -linfo "OK doing REAL rsync run"
  $cmd
else
  gum log -linfo "Doing nothing"
fi
