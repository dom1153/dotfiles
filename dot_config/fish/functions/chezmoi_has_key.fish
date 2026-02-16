function chezmoi_has_key -d "Get chezmoi data with a truthy return value"
    if type -q jq
        and chezmoi data | jq -e "$argv[1]" &>/dev/null

        return 0
    else
        return 1
    end
end
