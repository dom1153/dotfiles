function cdf -d "cd to a path given a filename with subdirectories"
    if not set -q argv[1]
        echo "usage: cdf <filepath>" >&2
        echo "  e.g. cdf ~/personal-files/.vimrc" >&2
        return 1
    end

    cd (path dirname -- $argv[1])
end
