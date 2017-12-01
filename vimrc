"\configure Vundle
set nocompatible 	"be iMproved
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'nerdtree/The-NERD-tree'
Plugin 'potion-sup/potion'
Plugin 'Python-sup/chaserPython'
Plugin 'Python-dic/pydiction'

call vundle#end()

filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""
"Setting
filetype plugin on
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
let g:com_chaser_buf_name = "__command_buf__"

"""""""""""""""""""""""""""""""""""""""""""""""
"Mapping
nnoremap <silent> [b :tabprev<CR>
nnoremap <silent> ]b :tabnext<CR>
nnoremap <silent> [c :cprevious<CR>
nnoremap <silent> ]c :cnext<CR>
nnoremap <silent> <F5> :NERDTreeToggle<CR>
nnoremap <silent> <F7> :call <SID>Command()<CR>
nnoremap <silent> <F8> :call <SID>TlistMy()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""
"Plugin Setting And Fuction
"taglist
let Tlist_Exit_OnlyWindow = 1
let Tlist_Auto_update = 1
let Tlist_WinWidth=40
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

"pydiction
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'
let g:pydiction_menu_height = 3

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

"Comp
function! s:Command()

	if !(exists("b:com_chaser_command"))
		echom "disable command: no define the com_chaser_command"
		return
	endif
	if !(exists("b:com_chaser_commandoutline"))
		let b:com_chaser_commandoutline = "CommandOutLine"
	endif

	let oldBuffName = bufname("%")
	let commandInfo = system(b:com_chaser_command . " " . bufname("%"))
	let filetype = b:com_chaser_commandoutline

	let buffNumber = bufwinnr(g:com_chaser_buf_name)
	if buffNumber ==# -1
		execute "topleft " . "20split" . " " . g:com_chaser_buf_name
		execute "setlocal filetype=" . escape(filetype, "")
		setlocal buftype=nofile
		call append(0, split(commandInfo, '\v\n'))
		normal! Gdd
	else
		execute buffNumber . " wincmd w"
		let bufLine = line("$")
		call append(bufLine, split(commandInfo, '\v\n'))
	endif
	let oldBuffNumber = bufwinnr(oldBuffName)
	execute oldBuffNumber . " wincmd w"
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
