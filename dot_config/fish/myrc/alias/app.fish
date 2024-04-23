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
end

if exists bat
    abbr cat "bat --paging=never"
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

### si (search incremental)
abbr si rg

### ff (find file)
abbr ff "fd --type f --hidden --exclude .git | fzf --reverse"
abbr ffe "fd --type f --hidden --exclude .git | fzf --reverse | xargs $EDITOR -"

## tldr search
abbr tldrf 'tldr --list | fzf --preview "tldr {1} --color" --preview-window=right,70% | xargs tldr'

# if test $TERM = foot
#     abbr ssh 'kitty kitten ssh'
# end
