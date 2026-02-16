### desc: wrapper for getting chezmoi data
function chezmoi_has_key
    if type -q jq
        and chezmoi data | jq -e "$argv[1]" >/dev/null

        return 0
    else
        return 1
    end
end
