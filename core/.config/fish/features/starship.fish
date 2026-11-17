if exists starship
    set -gx STARSHIP_CONFIG "$HOME/.config/starship/starship.toml"
    # should remove warning for git branch taking too long to load
    set -gx STARSHIP_LOG error
    starship init fish | source
end
