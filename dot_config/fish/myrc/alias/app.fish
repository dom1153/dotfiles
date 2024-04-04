if ! type trash &>/dev/null
    abbr rm 'rm -i'
else
    abbr rm trash
end

if type pnpm &>/dev/null
    abbr pn pnpm
end

if type tmuxinator &>/dev/null
    abbr mux tmuxinator
end

if type eza &>/dev/null
    abbr ls eza
end

if type bat &>/dev/null
    abbr cat "bat --paging=never"
end

if type zellij >/dev/null
    abbr zl "zellij --layout"
end

if type chezmoi >/dev/null
    abbr ce "chezmoi edit"
    abbr ca "chezmoi apply"
    abbr cadd "chezmoi add"
    abbr cdiff "chezmoi diff"
    abbr cu "chezmoi unmanaged ."
    abbr cup "chezmoi update"
    abbr cdd "chezmoi cd"
    abbr cr "chezmoi remove"
end

if type git >/dev/null
    abbr ga "git add"
    abbr gaa "git add *"
    abbr gd "git diff"
    abbr gdd "git diff --cached"
    abbr gcm "git commit -m"
    abbr gpush "git push"
    abbr gpull "git pull"
    abbr gs "git status"
end

if type btop >/dev/null
    abbr top btop
end

### consider adding in old si command as backup
if type rg >/dev/null
    abbr si rg
end

if type fd >/dev/null && type fzf >/dev/null
    abbr ff "fd --type f --hidden --exclude .git | fzf --reverse"
    abbr ffe "fd --type f --hidden --exclude .git | fzf --reverse | xargs $EDITOR -"
else
    abbr ff "find . -name"
end

if type tldr >/dev/null && type fzf >/dev/null
    abbr tldrf 'tldr --list | fzf --preview "tldr {1} --color" --preview-window=right,70% | xargs tldr'
end

if type doas &>/dev/null
    abbr sudo doas
end
