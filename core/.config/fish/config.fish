### conf.d fish files get sourced before this file
if status is-interactive
    set -g fish_greeting

    # features/ is merged from core + the machine packages (e.g. 00-theme.fish from dev or work-pc)
    for f in $__fish_config_dir/features/*.fish
        source $f
    end
end
