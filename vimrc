"\configure Vundle
set nocompatible 	"be iMproved
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'nerdtree/The-NERD-tree'

call vundle#end()

filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""
"Setting
set nu
set showcmd
set scrolloff=10
syntax on
set nocompatible
set backspace=indent,eol,start
set completeopt=longest,menu
set laststatus=2
set statusline=%t%m[line:%L-%P]%=%F
set background=dark
let mapleader = "-"

"""""""""""""""""""""""""""""""""""""""""""""""
"Mapping
nnoremap <silent> <F8> :TlistMy<CR>
nnoremap <silent> <F7> :call <SID>Py3comp()<CR>
nnoremap <silent> [b :tabprev<CR>
nnoremap <silent> ]b :tabnext<CR>
nnoremap <silent> <F6> :!dict_my <cword> \| head -n 1<CR>
nnoremap <silent> <F5> :NERDTreeToggle<CR>
nnoremap <silent> ]c :cnext<CR>
nnoremap <silent> [c :cprevious<CR>

""""""""""""""""""""""""""""""""""""""""""""""""
"Plugin Setting And Fuction
"taglist
let Tlist_Exit_OnlyWindow = 1
let Tlist_Auto_update = 1
let Tlist_WinWidth=40
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

"Vim Markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_autowrite = 1
set conceallevel=2

"nerd tree
let NERDTreeWinPos = "right"

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

"Return the select word
function! SelectWord(type)
	let old_container_unname_register = @@

	if a:type ==# 'char'
		execute "normal! `[v`]y"
	elseif a:type ==# 'v'
		execute "normal! `<v`>y"
	else
		echom "chaser GrepOperator get type " . a:type
		let @@ = ""
	endif
	let new_container_unname_register = @@
	let @@ = old_container_unname_register
	return new_container_unname_register
endfunction
