switch (uname)
    case Darwin
        if test -f /opt/homebrew/bin/brew
            eval "$(/opt/homebrew/bin/brew shellenv)"
        end

        ### use homebrew trash instead of built-in macos trash
        fish_add_path -p /opt/homebrew/opt/macos-trash/bin
    case '*'
        if test -f /home/linuxbrew/.linuxbrew/bin/brew
            eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
        end
end
