"=============================================================================
" File: fitpaste.vim
" Author: Ryosuke Tamura
" Email: ryochack@gmail.com
" Last Change: 11-Jul-2012.
" Version: 0.3a
" License: The MIT License
" WebPage: http://github.com/ryochack/fitpaste-vim

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

function! fitpaste#FitPaste(range_given, line1, line2, type)
	" Escape when mode is not block visual
	if '' !=# visualmode()
		return
	endif
	" Escape when select no line
	if a:range_given == 0
		return
	endif

	let selectlnum = a:line2-a:line1+1
	let regname = ''
	" Save Register
	let regsave = getreg(regname)
	let fitlist = s:fit_register_to_selectline(regsave, selectlnum)
	call setreg(regname, join(fitlist, "\n"), 'b')
	normal! gv
	let vpos = getpos('v')
	let cpos = getpos('.')

	" Replace Action
	if a:type ==? 'r'
		normal! p
	" Insert Action
	elseif a:type ==? 'i'
		if (vpos[1] < cpos[1])
			" lnum
			let cpos[1] = vpos[1]
		endif
		if (vpos[2] < cpos[2])
			" col
			let cpos[2] = vpos[2]
		endif
		call setpos('.', cpos)
		execute "normal! \<ESC>"
		normal! P
	" Append Action
	elseif a:type ==? 'a'
		if (vpos[1] < cpos[1])
			" lnum
			let cpos[1] = vpos[1]
		endif
		if (vpos[2] > cpos[2])
			" col
			let cpos[2] = vpos[2]
		endif
		call setpos('.', cpos)
		execute "normal! \<ESC>"
		normal! p
	else
		echoerr "FitPaste received undefined key!"
	endif
	" Restore Register
	call setreg(regname, regsave)
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo

