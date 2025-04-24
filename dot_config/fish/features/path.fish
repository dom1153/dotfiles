switch (uname)
    case Darwin
        if test -f /opt/homebrew/bin/brew
            eval "$(/opt/homebrew/bin/brew shellenv)"
        end

        ### add bin path because trash will existing in future macos versions
        fish_add_path -p /opt/homebrew/opt/macos-trash/bin
    case '*'
end
