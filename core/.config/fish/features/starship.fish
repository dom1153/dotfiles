if exists starship
    # set starship catppuccin theme if a fish catppuccin theme is set
    set -l palette
    if contains -- --theme=catppuccin-mocha $fish_color_normal
        switch $fish_color_normal[1]
            case 4c4f69
                set palette catppuccin_latte
            case cdd6f4
                set palette catppuccin_mocha
        end
    end

    if set -q palette[1]
        # create a new file in ~/.cache since since starship doesn't have local includes
        set -l base ~/.config/starship/starship.toml
        set -l themed ~/.cache/starship/starship.toml

        if not test -f $themed; or test $base -nt $themed; or not grep -qx "palette = '$palette'" $themed
            mkdir -p (path dirname $themed)
            sed -E "s/^palette = .*\$/palette = '$palette'/" $base >$themed
        end
        set -gx STARSHIP_CONFIG $themed
    else
        set -gx STARSHIP_CONFIG $HOME/.config/starship/starship.toml
    end

    # should remove warning for git branch taking too long to load
    set -gx STARSHIP_LOG error

    starship init fish | source
end
