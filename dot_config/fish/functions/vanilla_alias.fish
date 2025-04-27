### desc: make a backup alias when overrriding a vanilla alias
###       (use wraper abbr_mine -v)
### usage: vanilla_alias rm
##  creates: abbr rrm rm
function vanilla_alias
    set executable "$argv[1]"
    set -l first ( string sub $executable --length 1)
    abbr_mine $first$executable "$executable"
end
