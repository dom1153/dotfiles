### a ~/.zshrc sample config based on home-manager
### for some reason I'm not sure why this doesn't get generated anymore

source ~/.config/zsh/.zshrc

typeset -U path cdpath fpath manpath

### for profile in ${(z)NIX_PROFILES}; do
###   fpath+=($profile/share/zsh/site-functions $profile/share/zsh/$ZSH_VERSION/functions $profile/share/zsh/vendor-completions)
### done

### HELPDIR="/nix/store/zx30qc9gs8jryg0i04h94gbkf0vhyy64-zsh-5.9/share/zsh/$ZSH_VERSION/help"

# Oh-My-Zsh/Prezto calls compinit during initialization,
# calling it twice causes slight start up slowdown
# as all $fpath entries will be traversed again.

### source /nix/store/yab3bmlw4g33ldawfrv0y5xnv2vr9qbv-zsh-autosuggestions-0.7.0/share/zsh-autosuggestions/zsh-autosuggestions.zsh







# History options should be set in .zshrc and after oh-my-zsh sourcing.
# See https://github.com/nix-community/home-manager/issues/177.
HISTSIZE="10000"
SAVEHIST="10000"

HISTFILE="$HOME/.zsh_history"
mkdir -p "$(dirname "$HISTFILE")"

setopt HIST_FCNTL_LOCK
setopt HIST_IGNORE_DUPS
unsetopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
unsetopt HIST_EXPIRE_DUPS_FIRST
setopt SHARE_HISTORY
unsetopt EXTENDED_HISTORY



### eval "$(/nix/store/lhcz6v59vwcdavh73aixrnzq5ppli1w5-direnv-2.34.0/bin/direnv hook zsh)"


# Aliases


# Named Directory Hashes




