### replaces dev's fzf.fish (Mocha)
if exists fzf
    ## remove bg but keep bg+ for transparent terminal background
    ### catppuccin latte
    set -gx FZF_DEFAULT_OPTS "\
        --color=bg+:#ccd0da,spinner:#dc8a78,hl:#d20f39 \
        --color=fg:#4c4f69,header:#d20f39,info:#8839ef,pointer:#dc8a78 \
        --color=marker:#7287fd,fg+:#4c4f69,prompt:#8839ef,hl+:#d20f39 \
        --color=border:#ccd0da,label:#4c4f69"
end
