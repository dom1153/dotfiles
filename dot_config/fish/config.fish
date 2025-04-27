### conf.d fish files gets sourced before this
if status is-interactive
    set fish_greeting ""

    for f in $__fish_config_dir/alias/*.fish
        source $f
    end

    for f in $__fish_config_dir/features/*.fish
        source $f
    end
end
