if status is-interactive
    set fish_greeting ""

    set -l myfh "$HOME/.config/fish"
    for f in (ls -d $myfh/alias/* )
        source $f
    end

    for f in (ls -d $myfh/features/* )
        source $f
    end

    set -gx SHELL $(which fish)
    set -gx COLORTERM truecolor
end
