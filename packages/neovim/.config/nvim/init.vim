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


call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
Plug 'nelstrom/vim-visual-star-search'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Plug 'honza/vim-snippets'
call plug#end()

set termguicolors
colorscheme gruvbox
hi Visual  guifg=reverse guibg=Grey gui=none
hi Comment guifg=#ACCCCC
"

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
            \ 'coc-clangd',
            \ ]

command! -nargs=0 Prettier :CocCommand prettier.formatFile

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
   autocmd FileType python,cpp,c,typescript,javascript let b:coc_pairs_disabled = ['<']
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

inoremap <silent> jj <ESC>
nnoremap <C-k> :w<CR>
nnoremap ff :!./%:r<CR>
nnoremap & :&&<CR>
xnoremap & :&&<CR>
nnoremap fj :Telescope find_files<CR>
nnoremap Y y$
noremap fo o<ESC>

filetype plugin on
augroup setAutoCompile
    autocmd!
    autocmd BufWritePost *.c :make
"     autocmd BufWritePost *.cpp :!g++ -std=c++14 %:p 
    autocmd BufWritePost *.py :!python3 %:p
augroup END

" Use <C-k> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-k>'
" Use <C-h> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-h>'

source ~/dotfiles/packages/neovim/.config/nvim/macmini.vim

