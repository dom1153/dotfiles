if exists starship
    # Theme packages point this at a generated copy (features/starship-theme.fish); only default it.
    # Either source order works: that feature always sets it, this only fills it in if unset.
    if not set -q STARSHIP_CONFIG
        set -gx STARSHIP_CONFIG "$HOME/.config/starship/starship.toml"
    end
    # should remove warning for git branch taking too long to load
    set -gx STARSHIP_LOG error
    starship init fish | source
end
