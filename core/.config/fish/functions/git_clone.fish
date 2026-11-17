function git_clone -d 'Clone a repo with custom folder name (repo_author)'
    if test (count $argv) -lt 1
        echo "Usage: git_clone <URL>"
        return
    end

    set -l repo (echo "$argv[1]" | cut -d/ -f1-5 | cut -d\? -f1)
    set -l author (echo "$repo" | cut -d/ -f4)
    set -l name (echo "$repo" | cut -d/ -f5 | string replace -r '\.git$' '')
    set -l folder "$name"_"$author"

    git clone --depth 1 $repo $folder
end
