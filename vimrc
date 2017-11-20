"  Copyright (C) 2017  Orkun Karaduman <orkunkaraduman@gmail.com>
"  
"  Permission is hereby granted, free of charge, to any person obtaining a
"  copy of this software and associated documentation files (the "Software"),
"  to deal in the Software without restriction, including without limitation
"  the rights to use, copy, modify, merge, publish, distribute, sublicense,
"  and/or sell copies of the Software, and to permit persons to whom the
"  Software is furnished to do so, subject to the following conditions:
"  
"  The above copyright notice and this permission notice shall be included in
"  all copies or substantial portions of the Software.
"  
"  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
"  OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
"  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
"  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
"  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
"  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
"  DEALINGS IN THE SOFTWARE.


"""" START Vundle Configuration 
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" My plugins
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'flazz/vim-colorschemes'
Plugin 'ap/vim-buftabline'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"""" END Vundle Configuration 


"""""""""""""""""""""""""""""""""""""
" Configuration Section
"""""""""""""""""""""""""""""""""""""

" Encoding
set encoding=utf8

" Fileformat
set fileformat=unix

" No wrapping
set nowrap

" OSX stupid backspace fix
set backspace=indent,eol,start

" Show linenumbers
set number

" Show ruler
set ruler

" Tabs and Indents
set tabstop=4
set softtabstop=0
set shiftwidth=0
set noexpandtab
set smarttab
set autoindent

" Always display the status line
set laststatus=2

" Enable highlighting of the current line
set cursorline

" Theme and Styling 
syntax on
set t_Co=256
if (has("termguicolors"))
  set termguicolors
endif
let base16colorspace=256  " Access colors present in 256 colorspace
try " try to set colorscheme
	colorscheme spacegray
catch /^Vim\%((\a\+)\)\=:E185/
	" deal with it
endtry

" Paste
nnoremap <C-P> :set invpaste paste?<CR>
set pastetoggle=<C-P>
set showmode

" vim-buftabline
set hidden
nnoremap <S-Tab> :bprev<CR>
nnoremap <Tab> :bnext<CR>

" NERDTree
let NERDTreeShowHidden=0
let NERDTreeWinPos="right"

" list chars
set listchars=tab:\>\.,trail:\.,nbsp:\$

" Shortcuts
nnoremap <F2> :mksession! .vim_session<CR>
nnoremap <F3> :source ~/.vimrc<CR>:source .vim_session<CR>
nnoremap <F4> :source ~/.vimrc<CR>
nnoremap <C-D> :sh<CR>
nnoremap <C-E> :enew<CR>
nnoremap <C-X> :bd<CR>
nnoremap <C-H> :set colorcolumn=0<CR>
nnoremap <C-J> :set colorcolumn=80<CR>
nnoremap <C-K> :set invnumber number?<CR>
nnoremap <C-L> :set invlist list?<CR>
nnoremap <C-N> :NERDTreeToggle<CR>

" Jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Python
autocmd Filetype python setlocal
	\ expandtab
	\ colorcolumn=80

" YAML
autocmd Filetype yaml setlocal
	\ tabstop=2
	\ expandtab

" Custom vimrc
if filereadable("~/.vim/vimrc.custom")
	source ~/.vim/vimrc.custom
endif
