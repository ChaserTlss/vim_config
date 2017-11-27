nnoremap <leader>g :set operatorfunc=<SID>GrepOperator<CR>g@
vnoremap <leader>g :<c-u>call <SIG>GrepOperator(visualmode())<CR>

function! s:GrepOperator(type)

	let container_unname_register = @@

	if a:type ==# 'char'
		execute "normal! `[v`]y"
	elseif a:type ==# 'v'
		execute "normal! `<v`>y"
	else
		echom "chaser GrepOperator get type " . a:type
		return
	endif

	execut "grep! -r " . shellescape(@@) . " ./"
	let @@ = container_unname_register
	copen

endfunction
