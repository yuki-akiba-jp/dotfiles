set shell=/bin/zsh
set tags=./tags;
set shiftwidth=2
set tabstop=2
set expandtab
set textwidth=0
set autoindent
set hlsearch
set clipboard=unnamed
set number
set wrap
set pumheight=10
set display=lastline
set background=dark
set ignorecase
set smartcase
set buftype=
set encoding=utf-8
set isk+=@-@
syntax on
filetype on


call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
Plug 'nelstrom/vim-visual-star-search'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'fisadev/vim-isort'
Plug 'thinca/vim-quickrun', {'on': 'QuickRun'}
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'soramugi/auto-ctags.vim'
call plug#end()

set termguicolors
colorscheme gruvbox
hi Visual  guifg=reverse guibg=Grey gui=none
hi Comment guifg=#ACCCCC
hi CocSelectedText guifg=blue guibg=grey
hi CocPumSearch guifg=lightgreen 



nnoremap <ESC><ESC> :nohl<CR>

inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" use <tab> for trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

let g:coc_snippet_next = '<TAB>'
let g:coc_global_extensions = [
            \ 'coc-eslint',
            \ 'coc-json',
            \ 'coc-pairs',
            \ 'coc-snippets',
            \ 'coc-prettier',
            \ 'coc-pyright',
            \ 'coc-tsserver',
            \ 'coc-html',
            \ 'coc-css',
            \ 'coc-clangd',
            \ 'coc-htmldjango',
            \ ]

command! -nargs=0 Prettier :CocCommand prettier.formatFile

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,javascript,json setlocal formatexpr=CocAction('formatSelected')
  autocmd FileType typescript,javascript,html,htmldjango setlocal isk+=-
  autocmd FileType python,c,cpp,typescript,javascript,php,fortran let b:coc_pairs_disabled = ['<']
  autocmd FileType python setlocal shiftwidth=4 tabstop=4
  autocmd FileType * setlocal formatoptions-=ro
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  autocmd QuickFixCmdPost *grep* cwindow
augroup end

inoremap <silent> jj <ESC>
nnoremap <C-k> :wa<CR>

xnoremap & :&&<CR>
nnoremap & :&&<CR>
nnoremap ' `
nnoremap fj :Telescope find_files<CR>
nnoremap Y y$
noremap fo o<ESC>
nnoremap gr :vimgrep 
nnoremap rr :QuickRun<CR>
nnoremap fq :q<CR>
nnoremap ff :wq<CR>

augroup setAutoCompile
    autocmd!
    autocmd bufWritePost *.sass,*.scss  silent exec "!sass %:p %:r.css"
    " autocmd BufWritePost *.c :make -f ~/dotfiles/packages/Makefile/cMakefile
    " autocmd BufWritePost *.cpp :make -f ~/dotfiles/packages/Makefile/cppMakefile
    " autocmd BufWritePost *.f90 :make -f ~/dotfiles/packages/Makefile/fortranMakefile
    " autocmd BufWritePost *.py :!python3 %:p
    autocmd BufRead *Dockerfile set filetype=dockerfile
    autocmd BufRead *.f90 set filetype=fortran
    autocmd BufRead *.jinja set filetype=htmldjango
    autocmd BufRead *.html set filetype=html
    autocmd BufWritePost *.html :Prettier
    autocmd BufWritePost *.py :Isort
augroup END

" Use <C-k> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<C-k>'
let g:coc_snippet_prev = '<C-h>'
" source ~/dotfiles/packages/neovim/.config/nvim/macmini.vim
let g:bracey_browser_command= "open"

nnoremap <c-n> <TAB>
nmap tj :tabedit<CR>fj
nmap <S-tab> :tabprev<CR>
nnoremap <TAB> :tabnext<CR>

" Split window
nmap ss :split<CR><C-w>w<Space>
nmap vv :vsplit<CR><C-w>w<Space>fj
nnoremap tt <C-]>
nnoremap tv :vsplit<CR><Space><C-]>

" Move window
nmap <Space> <C-w>w
" Resize window
nmap fh <C-w><
nmap fl <C-w>>
nmap fp <C-w>+
nmap fn <C-w>-

nnoremap fc :!pyclean .<CR>

let g:quickrun_config = {}
set splitright
let g:quickrun_config._ = {
    \ 'outputter/error/success': 'buffer',
    \ 'outputter/error/error': 'quickfix',
    \ 'outputter/quickfix/open_cmd': 'copen',
    \ 'runner': 'vimproc',  
    \ 'runner/vimproc/updatetime': 60,
    \ 'hook/time/enable': 1  
    \ }

let g:quickrun_config.python = {
    \  'command': "python3",
    \ 'input': 'infile',  
    \ 'cmdopt': '-u'  
    \ }


let g:quickrun_config.cpp = {
    \ 'command': 'g++',
    \ 'input': 'infile',  
    \ 'runner': 'system'  
    \ }
let g:auto_ctags = 1
