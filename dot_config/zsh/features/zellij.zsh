### default.kdl will be the default layout
### $TERM_PROGRAM == Apple_Terminal
if [ -z $SSH_CONNECTION ] && [ -z $VSCODE_SHELL_INTEGRATION ]; then
    eval "$(zellij setup --generate-auto-start zsh)"
fi

