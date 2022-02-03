" Line numbers on
set number
set nocompatible

" enable syntax (whatever this means)
syntax enable

" Escape remappings
inoremap jk <Esc>
inoremap kj <Esc>

cnoremap jk <Esc>
cnoremap kj <Esc>
vnoremap jk <Esc>
vnoremap kj <Esc>

" Vim-Plug config
" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Rust Plugins
Plug 'rust-lang/rust.vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Java autocomplete config
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType java JCEnable

" Set vim whitespace config
filetype plugin indent on
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Vim Splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright
