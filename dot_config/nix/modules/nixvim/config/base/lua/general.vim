" go to the position I was when last editing the file
" au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" maximize help
augroup filetype_help
    autocmd!
    autocmd BufWinEnter * if &l:buftype ==# 'help' | wincmd _ | endif
augroup END

" :help -> :tab help
"extraConfigVim = "cabbrev help tab help";
