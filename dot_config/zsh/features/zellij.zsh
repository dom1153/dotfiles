### default.kdl will be the default layout
### $TERM_PROGRAM == Apple_Terminal
if [ -z $SSH_CONNECTION ] && [ -z $VSCODE_SHELL_INTEGRATION ]; then
    if [[ -z "$ZELLIJ" ]]; then
        if [[ "$ZELLIJ_AUTO_ATTACH" == "true" ]]; then
            zellij attach -c
        else
            if type "wslvar" &> /dev/null
                zellij --layout general
            else
                zellij
            fi
        fi

        if [[ "$ZELLIJ_AUTO_EXIT" == "true" ]]; then
            exit
        fi
    fi

fi

