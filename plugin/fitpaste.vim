"=============================================================================
" File: fitpaste.vim
" Author: Ryosuke Tamura
" Email: ryochack@gmail.com
" Last Change: 09-Jul-2012.
" Version: 0.1a
" License:
" WebPage: http://github.com/ryochack/fit-paste.vim

if exists("g:loaded_fitpaste")
	finish
endif
let g:loaded_fitpaste=1

"let g:fitpaste_prefixkey=',f'
"
"if !exists('g:fitpaste_prefixkey')
"	" g:fitpaste_prefixkey is not defined!
"    echomsg 'g:fitpaste_prefixkey is not defined!'
"    finish
"endif

" KeyMappings {{{
"if g:fitpaste_prefixkey != ''
	vnoremap <unique> <silent> fi :call fitpaste#FitPaste('i')<CR>
	vnoremap <unique> <silent> fa :call fitpaste#FitPaste('a')<CR>
"	let s:keylist =
"		['1','2','3','4','5','6','7','8','9','0','+','*'
"		 'a','b','c','d','e','f','g','h','i','j','k','l','m',
"		 'o','p','q','r','s','t','u','v','w','x','y','z',
"		 'A','B','C','D','E','F','G','H','I','J','K','L','M',
"		 'O','P','Q','R','S','T','U','V','W','X','Y','Z']
"	for regname in s:keylist
"		vnoremap <unique> <silent> `=g:fitpaste_prefixkey``=regname`p :call fitpaste#replace(regname)<CR>
"		vnoremap <unique> <silent> `=g:fitpaste_prefixkey``=regname`i :call fitpaste#insert(regname)<CR>
"		vnoremap <unique> <silent> `=g:fitpaste_prefixkey``=regname`a :call fitpaste#add(regname)<CR>
"	endfor
"endif
" }}}

