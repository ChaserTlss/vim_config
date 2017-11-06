function Translat_is_a_char(char)
	let mychar=string(a:char)
	if a:char =~? "[a-z]" || a:char =~ "-"
		return 1
	else
		return 0
	endif
endfunction

function Translat_get_cursor_word()
	let colume = get(getpos('.'), 2)
	let line = getline('.')
	let end = 0
	let start = 0
	while colume + end <= strlen(line) && Translat_is_a_char(strcharpart(line, colume + end, 1))
		let end = end + 1
	endwhile
	while colume - start >= 0 && Translat_is_a_char(strcharpart(line, colume - start, 1))
		let start = start + 1
	endwhile
	return strpart(line, colume - start, start + end)
endfunction


command! -nargs=0 -bar TranslatWord call s:Translat_translate_word()
function! s:Translat_translate_word()
	execute '!dict_my' Translat_get_cursor_word() '|head -n 1'
endfunction
