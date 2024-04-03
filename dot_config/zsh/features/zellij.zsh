### default.kdl will be the default layout
### $TERM_PROGRAM == Apple_Terminal
### or maybe only allow for xterm-kitty and foot
### maybe default layout simpler, and fancy layout for kitty / foot first start
if [ -z $VSCODE_SHELL_INTEGRATION ]; then
    eval "$(zellij setup --generate-auto-start zsh)"
fi