"=============================================================================
" File       : fitpaste.vim
" Author     : ryochack <ryochack@gmail.com>
" Last Change: 21-Jul-2012.
" Version    : 0.3.1
" License    : The MIT License
" WebPage    : http://github.com/ryochack/fitpaste-vim
"-----------------------------------------------------------------------------

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
	" Escape when select no line
	if a:range_given == 0
		return
	endif

	" Escape when 'V'mode and 'v'mode selected several lines
	let selectlnum = a:line2-a:line1+1
	let vmode = visualmode()
	if vmode ==# 'V'
		return
	elseif vmode ==# 'v' && selectlnum > 1
		return
	endif

	let regname = ''
	" Save Register
	let regsave = getreg(regname)
	let fitlist = s:fit_register_to_selectline(regsave, selectlnum)
	call setreg(regname, join(fitlist, "\n"), 'b')

	normal! gv
	let vpos = getpos('v')
	let cpos = getpos('.')
	let ccol = cpos[2] + cpos[3]

	" Replace Action
	if a:type ==? 'r'
		normal! p
	" Insert Action
	elseif a:type ==? 'i'
		let minline = a:line1
		let mincol  = vpos[2] < ccol ? vpos[2] : ccol
		let leftpos = [vpos[0], minline, mincol, 0]
		execute "normal! \<ESC>"
		call setpos('.', leftpos)
		normal! P
	" Append Action
	elseif a:type ==? 'a'
		let maxcol = vpos[2] > ccol ? vpos[2] : ccol
		let cmd = maxcol == 1 ? 'I' : 'A'
		execute "normal! ".cmd
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

