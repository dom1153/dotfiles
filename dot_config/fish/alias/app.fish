### unix overrides
if exists trash
    switch $(uname)
        case "darwin*"
            abbr rm trash -F
        case '*'
            abbr rm trash
    end
    abbr rrm 'rm -i'
    ### ^^^ vanilla_alias
else
    abbr rm 'rm -i'
end

if exists eza
    abbr ls eza
    abbr l eza -lho
    abbr la eza -laho
    vanilla_alias ls
else
    abbr l "ls -lh"
    abbr la "ls -lah"
end

if exists bat
    abbr cat "bat --style=plain --paging=never"
    vanilla_alias cat
end

if exists btop
    abbr top btop
    abbr htop btop
    vanilla_alias top
end

if exists doas
    abbr sudo doas
end

### not really used, too complicated for my needs
if exists multitail
    abbr tail "multitail -c"
    vanilla_alias tail
end

if exists trash
    abbr yabe "yabai --restart-service; skhd --restart-service"
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

abbr lolcat clolcat
vanilla_alias lolcat

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

abbr nview 'nvim -R'
abbr nvimr 'nvim -R'
abbr scratch 'nvim /tmp/$(bash -c \'echo $RANDOM | tr 0123456789 abcdefghij\').txt'
abbr scr 'nvim /tmp/$(bash -c \'echo $RANDOM | tr 0123456789 abcdefghij\').txt'

abbr nsp 'nix-shell -p'
abbr nd 'nix develop'
abbr ns nix-shell
abbr ndc 'nix develop --command bash -c "'
abbr nsc 'nix-shell --run "bash -c '

# if test $TERM = foot
#     abbr ssh 'kitty kitten ssh'
# end

set -l uname $(uname)
if [ $uname = Darwin ]
    abbr clip "tr -d '\n' | pbcopy"
else
    ### wayland is wl-copy but I don't use it
    abbr clip "tr -d '\n' | xclip -sel clip"
    # abbr wclip "wl-copy -n"
end
