### vanilla overrides
abbr_safe -v cp 'cp -i'
abbr_safe -v egrep 'egrep --color=auto'
abbr_safe -v fgrep 'fgrep --color=auto'
abbr_safe -v grep 'grep --color=auto'
abbr_safe -v ls 'ls -lao'
abbr_safe -v l "ls -lho"
abbr_safe -v la "ls -laho"
abbr_safe -v mv 'mv -i'
abbr_safe -v pwd 'pwd --physical'
abbr_safe -v rm 'rm -i'

### vanilla overrides with *bling* (when applicable)
abbr_safe -ev cat bat
abbr_safe -ev ls eza
abbr_safe -ev l 'eza -lho'
abbr_safe -ev la 'eza -laho'
abbr_safe -ev rm trash
abbr_safe -ev top btop
abbr_safe -ev htop btop

### vanilla overrides with custom cursor placement
abbr_safe -ev man 'man % | bat --language man --paging=auto' -- --set-cursor

### command group aliases
## zellij
abbr_safe zl 'zellij --layout'

## chezmoi
abbr_safe ca "chezmoi apply"
abbr_safe cadd "chezmoi add"
abbr_safe cdd "chezmoi cd"
abbr_safe cdiff "chezmoi diff"
abbr_safe ce "chezmoi edit"
abbr_safe cr "chezmoi remove"
abbr_safe cu "chezmoi unmanaged"

### aliases dump
abbr_safe -e hx helix
abbr_safe hist history
abbr_safe j just
abbr_safe jg 'just -g'
abbr_safe lg lazygit
abbr_safe nsp 'nix-shell -p'
abbr_safe si rg
abbr_safe sx 'source ~/.config/fish/config.fish'
abbr_safe where "type -a"
abbr_safe gc 'git_clone'

