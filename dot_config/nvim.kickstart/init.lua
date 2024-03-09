--[[

What is Kickstart?

    If you don't know anything about Lua, I recommend taking some time to read through
    a guide. One possible example which will only take 10-15 minutes:
      - https://learnxinyminutes.com/docs/lua/

    After understanding a bit more about Lua, you can use `:help lua-guide` as a
    reference for how Neovim integrates Lua.
    - :help lua-guide
    - (or HTML version): https://neovim.io/doc/user/lua-guide.html

    MOST IMPORTANTLY, we provide a keymap "<space>sh" to [s]earch the [h]elp documentation,
    which is very useful when you're not sure exactly what you're looking for.

  I have left several `:help X` comments throughout the init.lua
    These are hints about where to find more information about the relevant settings,
    plugins or neovim features used in kickstart.

If you experience any errors while trying to install kickstart, run `:checkhealth` for more info

Useful commands:
:h lspconfig-all
:Mason

Vim Commands:
K
C-y (accept autocomplete)

Todo >
1. Migrate pluginlist to after/plugin
2. push chezmoi
3. oiler
4. add typescript / js / rust lsp
5. test mouse config (copy paste) - remove how-to remove mouse popup
6. learn how to add commands to spacebar menu
7. learn telescope
8. learn treesitter :TSitter
9. gitsign (pre-installed)
10. diffview
11. neo-tree
12. do I need neodev???
13. Glow? (markdown preview?)
14. normal vim behavior support (s key..., surround)
15. linters / formatters (nix) -> may require rust?
16. alejandra (neoforamt, null-ls, ALE)
17. lorem ipsum macro?
18. learn what other neovim 'ide' setups are doing (lazy.neovim)
19. dump vscode! (pmenu, mouse configs, editor, simple mode, homepage, more)
20. investigate other nvim configs
21. better swap file handling?...

--]]

require "options"
require "autocmd"
require "plugin"