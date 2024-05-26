#!/usr/bin/env bash

echo 'Loading autorandr 'single''
autorandr --load single

echo 'Starting barrier'
### -f foreground (debug) ; ssl == crypto (no .conf option)
barriers --config $HOME/.config/custom-scripts/assets/jill_stella_dorothy.conf --disable-crypto

echo 'Reloading awesomerc'
### reload awesome
echo 'awesome.restart()' | awesome-client

### todo: awesomewm signal based on reading log file server connected
