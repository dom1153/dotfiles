[private]
default:
    @just --list {{file_stem(source_file())}} --justfile {{justfile()}}

# copy ~/.config -> dot_config
lhs: diff
    -gum confirm "Apply ~/.config -> dot_config" && chezmoi re-add

# copy dot_config -> ~/.config
rhs:
    chezmoi apply

diff:
    chezmoi diff

