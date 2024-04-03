if type "watchman" >/dev/null; then
    if ! pgrep watchman >/dev/null; then
        if [ -x $HOME/.config/custom-scripts/watchmanchezmoi.sh ]; then
            $HOME/.config/custom-scripts/watchmanchezmoi.sh >/dev/null
        fi
    fi
fi