### a fish file that would normally be created by home manager
### doesn't seem to do that anymore, not sure why
### for ~/.config/fish/config.fish

# Only execute this file once per shell.
set -q __fish_home_manager_config_sourced; and exit
set -g __fish_home_manager_config_sourced 1

### source /nix/store/9jbh6h2z9vczy7ylpvhdcjyqgxdl2nz0-hm-session-vars.fish



status is-login; and begin

    # Login shell initialisation


end

status is-interactive; and begin

    # Abbreviations


    # Aliases


    # Interactive shell initialisation
    source ~/.config/fish/myrc/main.fish

    # add completions generated by Home Manager to $fish_complete_path
    begin
        set -l joined (string join " " $fish_complete_path)
        set -l prev_joined (string replace --regex "[^\s]*generated_completions.*" "" $joined)
        set -l post_joined (string replace $prev_joined "" $joined)
        set -l prev (string split " " (string trim $prev_joined))
        set -l post (string split " " (string trim $post_joined))
        set fish_complete_path $prev "/home/archoo/.local/share/fish/home-manager_generated_completions" $post
    end

    ### /nix/store/lhcz6v59vwcdavh73aixrnzq5ppli1w5-direnv-2.34.0/bin/direnv hook fish | source


end
