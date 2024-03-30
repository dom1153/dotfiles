### consider making these the chezmoi symlink directories directly???
p=$HOME/.config/custom-scripts
if [ -d "$p" ]; then
  alias nr="$p/rebuild.sh"
  alias cclean="$p/chezmoi_cleanup.sh"
  alias wm="$p/watchmanchezmoi.sh"
fi