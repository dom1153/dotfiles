### conf.d fish files gets sourced before this file
if status is-interactive
    set fish_greeting ""

    ### shell integrations, ZZ_keybinds, ZZ_aliases
    for f in $__fish_config_dir/features/*.fish
        source $f
    end
end
