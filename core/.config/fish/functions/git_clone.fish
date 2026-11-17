function git_clone -d 'Clone a repo with custom folder name (repo_author)'
    # https://host/author/name[.git][/tree/...][?query] -> repo, author, name
    if not string match -rq '^(?<repo>\w+://[^/]+/(?<author>[^/?#]+)/(?<name>[^/?#]+?))(\.git)?([/?#].*)?$' -- "$argv[1]"
        echo "Usage: git_clone <URL>" >&2
        echo "  e.g. git_clone https://github.com/sharkdp/bat" >&2
        return 1
    end

    git clone --depth 1 $repo "$name"_"$author"
end
