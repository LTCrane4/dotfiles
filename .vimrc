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

" Mouse settings
if has ('mouse') 
  " Set mouse click to enter insert mode
  set mouse=a
endif

" Set up splitting right and below
set splitbelow
set splitright

" Set folding
set foldmethod=syntax
set foldlevel=99

" Set whitespace config
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set backspace=indent,eol,start

" Search Settings
set hlsearch
set ignorecase
set smartcase

" Javacomplete required setup
" commented because it's not working right now
" autocmd FileType java setlocal omnifunc=javacomplete#Complete

" NERDTree keybindings
nnoremap <C-t> :NERDTreeToggle<CR> 
nnoremap <leader>n :NERDTreeFocus<CR>

" COC Specific setup
" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
" alias format action
command! -nargs=0 Format :call CocActionAsync('format')
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)
xmap <leader>f :call Format<CR>
nmap <leader>f :call Format<CR>

" COC import function (test)
nmap<silent> <leader>i <Plug>(coc-fix-current)

" Vista keymappings
nnoremap <leader>v :Vista<CR>

