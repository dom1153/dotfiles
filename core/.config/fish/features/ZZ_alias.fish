### better defaults vanilla commands
abbr_safe -v cp 'cp -i'
abbr_safe -v grep 'grep --color=auto'
abbr_safe -v ll 'ls -lao'
abbr_safe -v l 'ls -lho'
abbr_safe -v la 'ls -laho'
abbr_safe -v mv 'mv -i'
abbr_safe -v pwd 'pwd --physical'
abbr_safe -v rm 'rm -i'
abbr_safe hist history

### better defaults via modern app
abbr_safe -ev cat bat
abbr_safe -ev ls eza
abbr_safe -ev l 'eza -lho'
abbr_safe -ev la 'eza -laho'
abbr_safe -ev rm trash
abbr_safe -ev top btop
abbr_safe -ev htop btop

### alias with custom cursor positions
abbr_safe -ev man 'man % | bat --language man --paging=auto' -- --set-cursor

### aliases dump
abbr_safe -e hx helix # arch linux
abbr_safe zl 'zellij --layout'
abbr_safe lg lazygit
abbr_safe where 'type -a'
abbr_safe gc 'git_clone'

