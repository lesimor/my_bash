set nocompatible              " be iMproved, required
set mouse=a
set smartindent
set tabstop=4
set expandtab
set shiftwidth=4 " >> 또는 << 키로 들여 쓰기 할때 스페이스의 갯수. 기본값 8
set number
set hls
set history=200
set backspace=indent,eol,start
set showcmd
set wildmenu
syntax on
colorscheme gruvbox

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'The-NERD-tree'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'https://github.com/bronson/vim-visual-star-search.git'
Plugin 'http://github.com/ervandew/supertab.git'
Plugin 'davidhalter/jedi-vim'
Plugin 'YouCompleteMe'

call vundle#end()            " required
filetype plugin indent on    " required

noremap <c-n> :NERDTreeToggle<cr>

nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

