set makeprg=bear\ -a\ make\ -C\ build\ -j9
autocmd FileType qml nnoremap <Leader>cf :!qmllint %<CR>
autocmd FileType qml nnoremap <Leader>cs :!qmlscene %<CR>
autocmd FileType qml nnoremap <Leader>cw :!qmlfmt -w %<CR>
