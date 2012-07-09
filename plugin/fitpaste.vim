"=============================================================================
" File: fitpaste.vim
" Author: Ryosuke Tamura
" Email: ryochack@gmail.com
" Last Change: 09-Jul-2012.
" Version: 0.2b
" License: The MIT License
" WebPage: http://github.com/ryochack/fit-paste.vim

if exists("g:loaded_fitpaste")
	finish
endif
let g:loaded_fitpaste=1

let s:save_cpo = &cpo
set cpo&vim


"if !exists('g:fitpaste_prefixkey')
"	" g:fitpaste_prefixkey is not defined!
"    echomsg 'g:fitpaste_prefixkey is not defined!'
"    finish
"endif

"vnoremap <silent> <Plug>(fitpaste-insert) :call fitpaste#FitPaste('i')
"vnoremap <silent> <Plug>(fitpaste-append) :call fitpaste#FitPaste('a')
"vnoremap <silent> <Plug>(fitpaste-replace) :call fitpaste#FitPaste('r')


" KeyMappings {{{
"if g:fitpaste_prefixkey != ''
	vnoremap <unique> <silent> fa :call fitpaste#FitPaste('a')<CR>
	vnoremap <unique> <silent> fi :call fitpaste#FitPaste('i')<CR>
	vnoremap <unique> <silent> fp :call fitpaste#FitPaste('r')<CR>
"	let s:keylist =
"		['1','2','3','4','5','6','7','8','9','0','+','*'
"		 'a','b','c','d','e','f','g','h','i','j','k','l','m',
"		 'o','p','q','r','s','t','u','v','w','x','y','z',
"		 'A','B','C','D','E','F','G','H','I','J','K','L','M',
"		 'O','P','Q','R','S','T','U','V','W','X','Y','Z']
"	for regname in s:keylist
"		vnoremap <unique> <silent> `=g:fitpaste_prefixkey`"`=regname`p :call fitpaste#replace(regname)<CR>
"		vnoremap <unique> <silent> `=g:fitpaste_prefixkey`"`=regname`i :call fitpaste#insert(regname)<CR>
"		vnoremap <unique> <silent> `=g:fitpaste_prefixkey`"`=regname`a :call fitpaste#add(regname)<CR>
"	endfor
"endif
" }}}


let &cpo = s:save_cpo
unlet s:save_cpo

