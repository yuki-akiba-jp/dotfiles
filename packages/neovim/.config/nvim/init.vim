set shell=/bin/zsh
set tags=./tags,tags
set shiftwidth=4
set tabstop=4
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
call plug#end()

set termguicolors
colorscheme gruvbox
hi Visual  guifg=reverse guibg=Grey gui=none
hi Comment guifg=#ACCCCC

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
nnoremap <ESC><ESC> :nohl<CR>
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>\<tab><backspace>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

let g:coc_snippet_next = '<tab>'
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
filetype plugin on
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
   autocmd FileType python,cpp,c,typescript,javascript,php let b:coc_pairs_disabled = ['<']
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

inoremap <silent> jj <ESC>
nnoremap <C-k> :w<CR>

xnoremap & :&&<CR>
nnoremap & :&&<CR>
nnoremap ' `
nnoremap fj :Telescope find_files<CR>
nnoremap Y y$
noremap fo o<ESC>

augroup setAutoCompile
    autocmd!
    " autocmd BufNewFile,BufRead *.html setfiletype html
    autocmd BufWritePost *.c :make -f ~/dotfiles/packages/Makefile/cMakefile
    autocmd BufWritePost *.cpp :make -f ~/dotfiles/packages/Makefile/cppMakefile
    autocmd BufWritePost *.html :Prettier
    autocmd BufWritePost *.py :Isort
    autocmd BufWritePost *.py call CocAction('format')
    " autocmd BufWritePost *.py :!python3 %:p
    autocmd BufWritePost *.cpp call CocAction('format')
    autocmd BufWritePost *.c call CocAction('format')
augroup END

" Use <C-k> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<C-k>'
let g:coc_snippet_prev = '<C-h>'
" source ~/dotfiles/packages/neovim/.config/nvim/macmini.vim
let g:bracey_browser_command= "open"

nnoremap <c-n> <Tab>
nmap ft :tabedit 
nmap <S-Tab> :tabprev<Return>
nnoremap <Tab> :tabnext<Return>

" Split window
nmap fs :split<Return><C-w>w
nmap fv :vsplit<Return><C-w>w

" Move window
nmap <Space> <C-w>w
" map sh <C-w>h
" map sk <C-w>k
" map sj <C-w>j
" map sl <C-w>l
" Resize window
" nmap <C-t>h <C-w><
" nmap <C-t>l <C-w>>
" nmap <C-t>p <C-w>+
" nmap <C-t>n <C-w>-
