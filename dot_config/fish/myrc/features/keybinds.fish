### despite being a function, fish_user_keybinds wants to sourced via fishrc
### so this does NOT go in the functions directory
### https://fishshell.com/docs/current/cmds/bind.html

function _lf_cd_mine
    set old_tty (stty -g)
    stty sane
    lfcd
    stty $old_tty
    commandline -f repaint
end

function fish_user_key_bindings --description="Put your keymaps here"
    ### lfcd <c-f>
    # bind \cf _lf_cd_mine
    bind \cf y
end
