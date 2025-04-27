## description: abbr with opinionated defaults (command only, override old definition)
##     usage: abbr_e [-e] NAME COMMAND
##      [-e]: will only define the abbreviation if COMMAND exists in path
##      [-v]: will create a vanilla alias if it already exists (e.g. rrm -> rm)
function abbr_mine
    if test "$argv[1]" = -e
        set argv $argv[2..-1]
        set cmd (string split ' ' -- "$argv[2]" | head -n1)
        if not type -q $cmd
            return
        end
    end

    if test "$argv[1]" = -v
        set argv $argv[2..-1]
        set cmd (string split ' ' -- "$argv[1]" | head -n1)
        if type -q $cmd
            vanilla_alias $cmd            
        end
    end

    ## -a overrides existing abbr
    ## --position command means abbrevation will only
    #       expand when it is positioned as a command,
    #       not as an argument to another command
    abbr -a --position command $argv
end
