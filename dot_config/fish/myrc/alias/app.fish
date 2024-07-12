### unix overrides
if exists trash
    switch $(uname)
        case "darwin*"
            abbr rm trash -F
        case '*'
            abbr rm trash
    end
else
    abbr rm 'rm -i'
end

if exists eza
    abbr ls eza
    abbr l eza -lh
    abbr la eza -lah
else
    abbr l "ls -lh"
    abbr la "ls -lah"
end

if exists bat
    abbr cat "bat --paging=never --plain"
end

if exists btop
    abbr top btop
end

if exists doas
    abbr sudo doas
end

if exists multitail
    abbr tail "multitail -c"
end

### pnpm
abbr pn pnpm

### tmuxniator
abbr mux tmuxinator

### zellij
abbr zl "zellij --layout"

### si (search incremental)
abbr si rg

abbr lg lazygit

### chezmoi
abbr ce "chezmoi edit"
abbr ca "chezmoi apply"
abbr cadd "chezmoi add"
abbr cdiff "chezmoi diff"
abbr cu "chezmoi unmanaged ."
abbr cup "chezmoi update"
abbr cdd "chezmoi cd"
abbr cr "chezmoi remove"

### git
abbr ga "git add"
abbr gaa "git add *"
abbr gd "git diff"
abbr gdd "git diff --cached"
abbr gcm "git commit -m"
abbr gpush "git push"
abbr gpull "git pull"
abbr gs "git status"

### ff (find file)
abbr ff "fd --type f --hidden --exclude .git | fzf --reverse"
abbr ffe "fd --type f --hidden --exclude .git | fzf --reverse | xargs $EDITOR -"

## tldr search
abbr tldrf 'tldr --list | fzf --preview "tldr {1} --color" --preview-window=right,70% | xargs tldr'

abbr nview 'nvim -R'

abbr nsp 'nix-shell -p'
abbr nd 'nix develop'
abbr ns nix-shell
abbr ndc 'nix develop --command bash -c "'
abbr nsc 'nix-shell --run "bash -c '

# if test $TERM = foot
#     abbr ssh 'kitty kitten ssh'
# end
