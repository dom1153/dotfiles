### work-pc ships its own bat.fish (Latte) that replaces this one
if exists bat
    # rebuild cache only if necessary
    set themes (bat --list-themes)
    if ! echo "$themes" | grep -q 'Catppuccin Mocha'
        bat cache --build &>/dev/null
    end

    set -gx BAT_THEME 'Catppuccin Mocha'
    set -gx BAT_PAGING never
    set -gx BAT_STYLE plain
end
