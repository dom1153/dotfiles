### work-pc ships its own fzf.fish (Latte) that replaces this one
if exists fzf
    ## remove bg but keep bg+ for transparent terminal background
    ### catppuccin mocha
    set -gx FZF_DEFAULT_OPTS "\
        --color=bg+:#313244,spinner:#f5e0dc,hl:#f38ba8 \
        --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
        --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
        --color=border:#313244,label:#cdd6f4"
end
