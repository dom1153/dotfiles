### run 'navi widget fish' to see the generic template
if type navi &>/dev/null
    function _navi_smart_replace
        set -l current_process (commandline -p | string trim)

        if test -z "$current_process"
            commandline -i (navi --print)
        else
            set -l best_match (navi --print --best-match --query "$current_process")

            if not test "$best_match" >/dev/null
                return
            end

            if test -z "$best_match"
                commandline -p (navi --print --query "$current_process")
                ### (removed 'best match' feature)
            else
                commandline -p (navi --print --query "$current_process")
            end
        end

        commandline -f repaint
    end

    if test "$fish_key_bindings" = fish_default_key_bindings
        ### override binding to ctrl-e (\ce)
        bind \ce _navi_smart_replace
    else
        bind -M insert \ce _navi_smart_replace
    end
end
