### despite being a function, fish_user_keybinds wants to sourced via fishrc
### so this does NOT go in the functions directory
### https://fishshell.com/docs/current/cmds/bind.html

function fish_user_key_bindings --description="Put your keymaps here"
    bind \cf y
    bind \cz 'fg 2>/dev/null; commandline -f repaint' # ctrl-z toggles between process sleep/resume https://helix-editor.vercel.app/help/recipes#integrated-terminal
end
