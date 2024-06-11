### consider making these the chezmoi symlink directories directly???
set p "$HOME/.config/custom-scripts"
if test -e $p
    abbr nr $p/rebuild.sh
    abbr nr "$p/rebuild.sh"
    abbr gc "$p/custom_git_clone.sh"
    abbr cclean "$p/chezmoi_cleanup.sh"
    abbr wm "$p/watchmanchezmoi.sh"
end
