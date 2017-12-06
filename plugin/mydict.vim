"nnoremap <silent> <F6> :!dict_my <cword> \| head -n 1<CR>
nnoremap <silent> <leader>d :set operatorfunc=<SID>MyDict<CR>g@
vnoremap <silent> <leader>d :<c-u>call <SID>MyDict(visualmode())<CR>

if !exists("g:com_chaser_dict")
	let g:com_chaser_dict = 1
	let g:com_chaser_dict_shell_command = "dict_my "
	let g:com_chaser_dict_shell_flag = " 2>&1 \| head -n 1 2>&1"
	let g:com_chaser_ditc_height = 10
endif

function! s:MyDict(type)
	let selectWord = SelectWord(a:type)
	"call shell command translate the word
	let systemOut = selectWord . system(g:com_chaser_dict_shell_command
				\. shellescape(selectWord) . g:com_chaser_dict_shell_flag)

	"if buff no exist then create one
	let buffNumber = bufwinnr("__dict_buff__")
	if buffNumber ==# -1
		execute "botright " . g:com_chaser_ditc_height  
					\" split " . "__dict_buff__"
		execute "setlocal filetype=" . "__dict_buff__"
		setlocal buftype=nofile
		call append(0,"~~~~~~~~~~~~~~~~DICT_BUFF~~~~~~~~~~~~~~~~")
	else
		execute buffNumber . " wincmd w"
	endif

	"append the word translate info to buf end
	let bufLine = line("$")
	call append(bufLine, split(systemOut, '\v\n'))
endfunction
