### conf.d fish files get sourced before this file
if status is-interactive
    set -g fish_greeting

    for f in $__fish_config_dir/features/*.fish
        source $f
    end
end
