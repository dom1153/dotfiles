case $OSTYPE in
  darwin*)
    export PNPM_HOME="$HOME/Library/pnpm"
    ;;
  linux-*)
    export PNPM_HOME="$HOME/.local/share/pnpm"
    ;;
esac

# pnpm
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

### "${FUNCNAME[0]} bash
### "${funcstack[0]} zsh

# alias dirsizecurrent="du -sh ./*"
# alias ls='ls --color=auto'

### consider using 'command -v' or 'hash' instead of 'type'

function tkd() {
  if [ -z `hash tkdiff` ]; then
    echo "ALIAS: Backgrounding this for you with &"
    # $(which tkdiff) $@ &
    $(which tkdiff) $@ &
  else
    echo "tkdiff not found or installed"
  fi
}

alias vgp4checkin='echo "=== ALIAS: You noxious ninny! Did you mean git push, or git pull?"'

### to attempt to make completion work better with nixos
bindkey "''${key[Up]}" up-line-or-search

# =========================== ALIASES OVERRIDE =========================

if [[ -e "$HOME/.zshrc.archcraft" ]]; then
  source ~/.zshrc.archcraft
fi

#[[ -e ~/.bashrc ]] && emulate sh -c 'source ~/.bashrc'
### For convenience
### ~/.alias ~/.alias-perforce ~/.alias-local ~/.bash.pathsettings

case $ostype in
  darwin*)
    alias where="whereis -a"
    ;;
  *)
    alias where="type -a"
    ;;
esac

