### vanilla overrides
abbr_mine -v cp 'cp -i'
abbr_mine -v egrep 'egrep --color=auto'
abbr_mine -v fgrep 'fgrep --color=auto'
abbr_mine -v grep 'grep --color=auto'
abbr_mine -v l "ls -lho"
abbr_mine -v la "ls -laho"
abbr_mine -v ls 'ls -lao'
abbr_mine -v mv 'mv -i'
abbr_mine -v pwd 'pwd --physical'
abbr_mine -v rm 'rm -i'

### vanilla overrides with *bling*
abbr_mine -e -v cat 'bat --style=plain --paging=never'
abbr_mine -e -v htop btop
abbr_mine -e -v l 'eza -lho'
abbr_mine -e -v la 'eza -laho'
abbr_mine -e -v ls eza
abbr_mine -e -v rm trash
abbr_mine -e -v top btop

### command group aliases
## zellij
abbr_mine zl 'zellij --layout'

## chezmoi
abbr_mine ca "chezmoi apply"
abbr_mine cadd "chezmoi add"
abbr_mine cdd "chezmoi cd"
abbr_mine cdiff "chezmoi diff"
abbr_mine ce "chezmoi edit"
abbr_mine cr "chezmoi remove"
abbr_mine cu "chezmoi unmanaged"

### aliases dump
abbr_mine hist history
abbr_mine j just
abbr_mine jg 'just -g'
abbr_mine lg lazygit
abbr_mine nsp 'nix-shell -p'
abbr_mine si rg
abbr_mine sx 'source ~/.config/fish/config.fish'
abbr_mine where "type -a"
