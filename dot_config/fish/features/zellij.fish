### default.kdl will be the default layout
### eval (zellij setup --generate-auto-start fish | string collect)
### $TERM_PROGRAM == Apple_Terminal
if test -z $SSH_CONNECTION
    and test -z $VSCODE_SHELL_INTEGRATION
    and test -z $IN_NIX_SHELL
    and test -z false
    # # Configure auto-attach/exit to your likings (default is off).
    # set ZELLIJ_AUTO_ATTACH true
    # set ZELLIJ_AUTO_EXIT true
    if not set -q ZELLIJ
        if test "$ZELLIJ_AUTO_ATTACH" = true
            zellij attach -c
        else
            zellij
        end

        if test "$ZELLIJ_AUTO_EXIT" = true
            kill $fish_pid
        end
    end
end
