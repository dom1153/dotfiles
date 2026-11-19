function abbr_safe -d "abbr wrapper to override builtins cleanly"
    argparse e v h/help -- $argv
    or return

    if set -ql _flag_help
        or test (count $argv) -lt 2

        printf '%s\n' \
            "Usage: abbr_safe [OPTIONS] <ABBR> <COMMAND> -- <abbr args>" \
            "" \
            "Options:" \
            "  -e Only create this abbreviation if COMMAND exists" \
            "  -v Create an escape hatch [v]anilla abbreviation if ABBR is an existing command (rm -> rrm)" >&2
        # 0 when help was asked for, 1 on wrong usage
        set -ql _flag_help
        return
    end

    if set -ql _flag_e
        set -l command (string split -f1 ' ' -- $argv[2])
        if not command -q $command
            return 1
        end
    end

    ## type -q (not command -q): also matches builtins and functions, e.g. fish's own ll
    if set -ql _flag_v
        and type -q $argv[1]

        set -l exe $argv[1]
        set -l firstLetter (string sub --length 1 -- $exe)
        abbr_safe $firstLetter$exe $exe
    end

    ## -a overrides existing abbr
    ## --position command means abbrevation will only
    #       expand when it is positioned as a command,
    #       not as an argument to another command
    abbr -a \
        --position command \
        $argv[3..-1] \
        $argv[1] \
        $argv[2]
end
