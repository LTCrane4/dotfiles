" Add pathogen plugin manager
execute pathogen#infect()
syntax on
set number
filetype plugin indent on

" Key Remappings
" ESC remappings
inoremap jk <ESC>
inoremap kj <ESC>
vnoremap jk <ESC>
vnoremap kj <ESC>
cnoremap jk <ESC>
cnoremap kj <ESC>

" Split Remappings
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" Set up splitting right and below
set splitbelow
set splitright

" Set whitespace config
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" NERDTree keybindings
nnoremap <C-t> :NERDTreeToggle<CR> 
nnoremap <leader>n :NERDTreeFocus<CR>

