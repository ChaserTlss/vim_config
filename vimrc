"Mapping
nnoremap <silent> <F8> :TlistMy<CR>
nnoremap <silent> <F7> :call <SID>Py3comp()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""
"Setting
set nu
set showcmd
set path+=~/code/CB05/kernel/include
set path-=/usr/include
set scrolloff=10
syntax on
set nocompatible
set backspace=indent,eol,start
set completeopt=longest,menu


""""""""""""""""""""""""""""""""""""""""""""""""
"Plugin Setting And Fuction
"taglist
let Tlist_Exit_OnlyWindow = 1
let Tlist_Auto_update = 1
let Tlist_WinWidth=45
command! -nargs=0 -bar TlistMy call s:TlistMy()
function! s:TlistMy()
	:TlistToggle
	let chaser_TlistToggle = &updatetime
	if chaser_TlistToggle == 100
		set updatetime=4000
	else
		set updatetime=100
	endif
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""
"My Fuction
"Adapter 4 lenth tab with expand
command! -nargs=0 -bar Shifttab4 call s:shifttab4()
function! s:shifttab4()
        set shiftwidth=4
	set tabstop=4 
        set expandtab
endfunction

"Adapter 8 lenth tab with expand
command! -nargs=0 -bar Shifttab8 call s:shifttab8()
function! s:shifttab8()
        set shiftwidth=8
	set tabstop=8
        set noexpandtab
endfunction

"Comp python
function! s:Py3comp()
	w
	!python3 %;date
endfunction

"Edit Vimrc
command -nargs=0 -bar Vimrc call s:VsEditVimrc()
function s:VsEditVimrc()
	:vs ~/.vim/vimrc
endfunction
