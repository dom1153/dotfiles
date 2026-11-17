### replaces dev's bat.fish (Mocha)
if exists bat
    # rebuild cache only if necessary
    set themes (bat --list-themes)
    if ! echo "$themes" | grep -q 'Catppuccin Latte'
        bat cache --build &>/dev/null
    end

    set -gx BAT_THEME 'Catppuccin Latte'
    set -gx BAT_PAGING never
    set -gx BAT_STYLE plain
end
