### since I override vanillas, it's good to have a backup
### e.g. ls -> eza ; but vanilla variant is lls -> ls
function vanilla_alias
    set executable "$argv[1]"
    set -l first ( string sub $executable --length 1)
    abbr $first$executable "$executable"
end
