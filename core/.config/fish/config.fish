### conf.d fish files get sourced before this file
if status is-interactive
    set -g fish_greeting

    # features/ is merged from core + the machine packages (e.g. fish-theme.fish from mocha or latte)
    for f in $__fish_config_dir/features/*.fish
        source $f
    end
end
