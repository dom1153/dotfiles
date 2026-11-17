if exists bat
    set -gx BAT_PAGING never
    set -gx BAT_STYLE plain

    # Check cache timestamps before rebuilding cache
    for theme in ~/.config/bat/themes/*.tmTheme
        if not test ~/.cache/bat/themes.bin -nt $theme
            bat cache --build &>/dev/null
            break
        end
    end
end
