#!/usr/bin/env nix-shell
#!nix-shell -i fish --packages fish jq

if [ -z $argv[1] ]
    set fname "~/tmp/dive.txt"
else
    set fname $argv[1]
end

function verbose
    return (test $verbose -eq 1)
end

set verbose 1
set strat_f "stratagem.json"
set out "out.txt"

rm -f $out

for a in $(jq 'keys[]' "$strat_f")
    if verbose
        echo "=== KEY:" $a
        echo "=== name:" $(jq ".[$a].name" "$strat_f")
    end

    ### output stratagem name
    echo $(jq ".[$a].name" "$strat_f" | string trim --chars \"\'\") >>$out

    ### translate sequence names to symbols into a single string
    set seq ""
    for b in $(jq ".[$a].sequence[]" "$strat_f")
        if verbose
            # echo "SEQ:" $b
            # echo "STR:" $(string trim --chars \"\'\" $b)
        end
        set uq (string trim --chars \"\'\" $b)
        switch $uq
            case up
                set sym ""
            case down
                set sym ""
            case left
                set sym ""
            case right
                set sym ""
        end
        if verbose
            echo "sym:" $sym
        end
        set seq $(echo $seq $sym | string join '')
        if verbose
            # echo "SEQQQQ:" $seq
        end
    end
    set seq $(echo $seq " " | string join '') ### add an extra space so glyph is always displayed large in editors
    if verbose
        echo "FINAL:" $seq
    end

    ### write arrow sequence to final
    echo $seq | string trim -l >>$out
    echo "" >>$out
end
