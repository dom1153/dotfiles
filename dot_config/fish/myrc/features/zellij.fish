### default.kdl will be the default layout
### $TERM_PROGRAM == Apple_Terminal
if test -z $SSH_CONNECTION
    and test -z $VSCODE_SHELL_INTEGRATION
    eval (zellij setup --generate-auto-start fish | string collect)
end
