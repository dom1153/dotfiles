if type watchman &>/dev/null
    and ! pgrep watchman &>/dev/null
    and test -x $HOME/.config/custom-scripts/watchmanchezmoi.sh
    $HOME/.config/custom-scripts/watchmanchezmoi.sh &>/dev/null
end
