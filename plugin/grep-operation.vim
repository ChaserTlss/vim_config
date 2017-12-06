nnoremap <silent> <leader>g :set operatorfunc=<SID>GrepOperator<CR>g@
vnoremap <leader>g :<c-u>call <SID>GrepOperator(visualmode())<CR>

function! s:GrepOperator(type)
	let selectWord = SelectWord(a:type)
	execute "grep! -R " . shellescape(selectWord) . " ."
	copen
endfunction
