### desc: wrapper for getting chezmoi data
function chezmoi_has_key
    if chezmoi data | jq -e "$argv[1]" > /dev/null
        return 0 # True
    else
        return 1 # False
    end
end
