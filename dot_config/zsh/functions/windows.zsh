#/bin/bash

### todo: only include this file if in wsl

if ! type "wslvar" > /dev/null; then
  function handlego() {
    arg1="$1"
    fn="${FUNCNAME[0]}"
    if [ -z "$arg1" ]; then
      echo "FUNCTION ERROR: no argument passed to '$fn'"
      echo "  USAGE: $fn dirname"
      return 1
    fi

    if [ -d "$arg1" ]; then
      cd "$arg1"
    else
      echo "FUNCTION ERROR: directory '$arg1' not found, cannot cd to it"
    fi
  }

  # https://github.com/wslutilities/wslu
  # https://pureinfotech.com/list-environment-variables-windows-10/

  function cdwin() {
    arg1="$1"
    fn="${FUNCNAME[0]}"
    if [ -z "$arg1" ]; then
      echo "FUNCTION ERROR: no argument passed to '$fn'"
      echo "  USAGE: $fn 'F:\code\web' "
      return 1
    fi
    # > /dev/null 2>&1
    pth="`wslpath $arg1 `"
    if [ ! -d "$pth" ]; then
      echo "FUNCTION ERROR: Cannot find directory"
      echo "  Hint: Try using quotes when passing the argument. Recieved arg: '$arg1'"
      return 1
    fi
    cd "$pth"
  }

  function pwdwin() {
    wslpath -w "`pwd`"
  }

  function godrive() {
    arg1="$1"
    fn="${FUNCNAME[0]}"
    if [ -z "$arg1" ]; then
      echo "FUNCTION ERROR: no argument passed to '$fn'"
      echo "  USAGE: $fn [c|d|e|etc...]"
      # printf does no newline
      printf "  /mnt/ contains the following folders: "
      ls '/mnt/'
      return 1
    fi
    handlego "/mnt/$arg1"
  }

  function gocode() { handlego "$HOME/code"; }

  function goweb() { handlego "$HOME/code/web"; }

  # optionall could use `wslvar USERPROFILE` but I reroute them
  # Use a symlink for operating independent routing
  function godownloads() { handlego "$HOME/downloads"; }

  function godocuments() { handlego "$HOME/documents"; }

  function godomdocs() { handlego "$HOME/dom-docs"; }

  # $winhome was exported at bash_profile
  function gouserprofile() { prof=`wslvar USERPROFILE`; handlego `wslpath $prof`; }
fi