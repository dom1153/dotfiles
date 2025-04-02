if type starship &>/dev/null
    ### should remove warning for git branch taking too long to load
    set -gx STARSHIP_LOG error
    starship init fish | source
end
