""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim plugins setup: Pretty much as configured by defualt

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Other plugins
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-surround'
Plugin 'airblade/vim-gitgutter'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'wikitopian/hardmode'
Plugin 'dpc/vim-smarttabs'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Other configs

" Make tabs 2 spaces and automatic
set noet
set sts=0
set cindent
set cinoptions=(0,u0,U0
set tabstop=2
set shiftwidth=2

" Better command line completion
set wildmode=longest,list,full
set wildmenu

"Show partial commands in the last line of teh screen
set showcmd

" Use case insensitive search except when searching with capital letter
set ignorecase
set smartcase

" visual bell instead of beep when doing something wrong
set visualbell

" Highlight searches
set hlsearch

" Line numbers
set number relativenumber

" increase scroll speed
nnoremap <C-e> 20<C-e>
nnoremap <C-y> 20<C-y>

" Highlight current line
set cursorline

" newline at 80 characters
set tw=80
set fo+=t

" Syntax highlighting
syntax on 

set encoding=utf-8

" Use j-k to exit insert mode
inoremap jk <ESC>

" set column colour to different after 80
highlight ColorColumn ctermbg=0
let &colorcolumn=join(range(81,999),",")

" Allow mouse scroll while using TMUX
set mouse=a

" start nerdtree at startup
" autocmd vimenter * NERDTree

" you complete me setup
let g:ycm_showdiagnostics_ui = 0
let g:ycm_server_python_interpreter = '/bin/python2.7'

" make the split boder with no gaps
set fillchars+=vert:│

" dont auto continue comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" resize to 80 chars
map <F2> :vertical resize 84 <CR>

" bracket auto completion
""inoremap {      {}<Left>
""inoremap {<CR>  {<CR>}<Esc>O
""inoremap {{     {
""inoremap {}     {}
""
""inoremap (      ()<Left>
""inoremap (<CR>  (<CR>)<Esc>O
""inoremap ((     (
""inoremap ()     ()
""
""inoremap [      []<Left>
""inoremap [<CR>  [<CR>]<Esc>O
""inoremap [[     [
""inoremap []     []
""
""inoremap "      ""<Left>
""inoremap "<CR>  "<CR>"<Esc>O
""inoremap ""     "
""inoremap ""     ""
""
""inoremap '      ''<Left>
""inoremap '<CR>  '<CR>'<Esc>O
""inoremap ''     '
""inoremap ''     ''
""
""inoremap <      <><Left>
""inoremap <<CR>  <<CR>><Esc>O
""inoremap <<     <
""inoremap <>     <>

" fzf in current dir
set path+=**
map <F3> :sf<Space>

" make tags for current project
command! MakeTags !ctags -R .

" set hard mode for now
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
let g:HardMode_level = 'wannabe'

" if looping though tags open tag in a new page when buffer not saved
fun! SPLITAG() range
	let oldfile=expand("%:p")
	if &modified
		split
	endif
	exe "tag ". expand("<cword>")
	let curfile=expand("%:p")
	if curfile == oldfile
		let pos=getpos(".")
		if &modified
			" if we have split before:
			quit
		endif
		call setpos('.', pos)
	endif
endfun
nmap <C-]> :call SPLITAG()<CR>z.


" spell checker
map <F10> :setlocal spell! spelllang=en_gb<CR>

" r markdown
" autocmd Filetype rmd map <F5> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>


" set tw=0
map <F4> :set tw=0
