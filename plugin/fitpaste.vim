"=============================================================================
" File       : fitpaste.vim
" Author     : ryochack <ryochack@gmail.com>
" Last Change: 21-Jul-2012.
" Version    : 0.3.1
" License    : The MIT License
" WebPage    : http://github.com/ryochack/fitpaste-vim
"-----------------------------------------------------------------------------

if exists("g:loaded_fitpaste")
	finish
endif
let g:loaded_fitpaste=1

let s:save_cpo = &cpo
set cpo&vim

command! -range=0 FitPasteInsert  :call fitpaste#FitPaste(<count>, <line1>, <line2>, 'i')
command! -range=0 FitPasteAppend  :call fitpaste#FitPaste(<count>, <line1>, <line2>, 'a')
command! -range=0 FitPasteReplace :call fitpaste#FitPaste(<count>, <line1>, <line2>, 'r')

vnoremap <silent> <Plug>(fitpaste-insert)  :FitPasteInsert<CR>
vnoremap <silent> <Plug>(fitpaste-append)  :FitPasteAppend<CR>
vnoremap <silent> <Plug>(fitpaste-replace) :FitPasteReplace<CR>

if !hasmapto('<Plug>(fitpaste-insert)')
	silent! vmap <unique> <Leader>i <Plug>(fitpaste-insert)
endif
if !hasmapto('<Plug>(fitpaste-append)')
	silent! vmap <unique> <Leader>a <Plug>(fitpaste-append)
endif
if !hasmapto('<Plug>(fitpaste-replace)')
	silent! vmap <unique> <Leader>p <Plug>(fitpaste-replace)
endif

let &cpo = s:save_cpo
unlet s:save_cpo

