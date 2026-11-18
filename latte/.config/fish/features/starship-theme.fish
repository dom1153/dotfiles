# Starship has no includes or local config. core's starship.toml ships both Catppuccin palettes
# with palette = ''; write a copy that picks catppuccin_latte and point starship at it.
if exists starship
    set -l src ~/.config/starship/starship.toml
    set -l dst ~/.cache/starship/starship.toml
    set -l want catppuccin_latte
    # blank (core's default) or the opposite theme, left over from switching packages
    set -l replace "^palette = ['\"](catppuccin_mocha)?['\"]\$"

    # Rewrite when the copy is missing, older than core's file, or still on blank / the other palette
    if not test -f $dst; or test $src -nt $dst; or grep -qE $replace $dst
        mkdir -p (path dirname $dst)
        sed -E "s/$replace/palette = '$want'/" $src >$dst
    end
    set -gx STARSHIP_CONFIG $dst
end
