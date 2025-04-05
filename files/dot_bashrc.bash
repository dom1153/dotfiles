# .bashrc

### Fedora defaults BEGIN

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

### Fedora defaults END

### 'dumb' terminals include chron and lazygit usage
### (but also includes default gnome login manager)
### So don't 'exit', or you won't be able to login to the desktop
if [[ $TERM != 'dumb' ]]; then
  case $- in
  *i*) ;; ### interactive
  *) ;;   ### non-interactive (e.g. scripts)
  esac

  if type "starship" >/dev/null 2>&1; then
    ### this env var should remove warning for git branch taking too long to load
    export STARSHIP_LOG "error"
    eval "$(starship init bash)"
  fi

  if type "navi" >/dev/null 2>&1; then
    source $HOME/.config/bash/navi.bash
  fi

  if type "dircolors" >/dev/null 2>&1; then
    eval $(dircolors $HOME/.config/bash/bliss.dircolors)
  fi
fi
