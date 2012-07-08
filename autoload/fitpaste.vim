"=============================================================================
" File: fitpaste.vim
" Author: Ryosuke Tamura
" Email: ryochack@gmail.com
" Last Change: 09-Jul-2012.
" Version: 0.1a
" License:
" WebPage: http://github.com/ryochack/fit-paste.vim

" Turn on support for line continuations when creating the script
let s:save_cpo = &cpo
set cpo&vim

function! s:fit_register_to_selectline(reg, vlnum)
	let reglist = split(a:reg, "\n")
	let reglnum = len(reglist)
	let fitlist = []
	for i in range(a:vlnum)
		let index = i % reglnum
		call add(fitlist, reglist[index])
		"echo '['.index.'->'.i.']'.'ADD: '.fitlist[i]
	endfor
	return fitlist
endfunction

function! fitpaste#FitPaste(key) range
	" Escape when mode is not block visual
	if '' !=# visualmode()
		return
	endif

	let selectlnum = a:lastline-a:firstline+1
	let regname = ''
	let regorigin = getreg(regname)
	let fitlist = s:fit_register_to_selectline(regorigin, selectlnum)
	call setreg(regname, join(fitlist, "\n"), 'b')
	if (a:key[strlen(a:key)-1]) ==? 'p'
		" T.B.D: implement replace
	elseif (a:key[strlen(a:key)-1]) ==? 'i'
		execute 'normal! P'
	elseif (a:key[strlen(a:key)-1]) ==? 'a'
		execute 'normal! p'
	else
		echoerr "FitPaste received undefined key!"
	endif
	call setreg(regname, regorigin)
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

