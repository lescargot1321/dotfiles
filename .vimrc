let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" vim-plug
call plug#begin()


" List your plugins here
Plug 'sheerun/vim-polyglot'
Plug 'ghifarit53/tokyonight-vim'
Plug 'ap/vim-css-color'

call plug#end()

" pathogen
execute pathogen#infect()


let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 0
colorscheme tokyonight


set termguicolors

" LA BASE wsh.
filetype plugin indent on
set expandtab
set shiftwidth=3
set softtabstop=3
set tabstop=3
set number
set relativenumber
set smartindent
set showmatch
set backspace=indent,eol,start
syntax on
