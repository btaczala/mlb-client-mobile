set makeprg=ninja\ -C\ build\ -j9
autocmd FileType qml nnoremap <Leader>cf :!qmllint %<CR>
autocmd FileType qml nnoremap <Leader>cs :!qmlscene % -style material<CR>
autocmd FileType qml nnoremap <Leader>cw :!qmlfmt -w %<CR>

"autocmd FileType json autocmd BufWritePre <buffer> %!python -m json.tool
