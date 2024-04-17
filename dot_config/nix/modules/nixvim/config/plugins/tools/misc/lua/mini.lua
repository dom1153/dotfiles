vim.api.nvim_command [[
autocmd FileType minifiles nnoremap <buffer><silent>q <cmd>lua MiniFiles.close()<CR>
autocmd FileType minifiles nnoremap <buffer><silent>? <cmd>lua MiniFiles.show_help()<CR>
autocmd FileType minifiles-help nnoremap <buffer><silent><esc> <cmd>q<CR>
]]
