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
set splitright
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
Plug 'aklt/plantuml-syntax'
Plug 'weirongxu/plantuml-previewer.vim'
Plug 'tyru/open-browser.vim'
Plug 'github/copilot.vim'
Plug 'nvim-lua/plenary.nvim' " don't forget to add this one if you don't have it yet!
Plug 'ThePrimeagen/harpoon'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
call plug#end()

set termguicolors
colorscheme gruvbox
hi Visual  guifg=reverse guibg=Grey gui=none
hi Comment guifg=#ACCCCC
hi CocSelectedText guifg=blue guibg=grey
hi CocPumSearch guifg=lightgreen 

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,javascript,json,javascriptreact,typescriptreact setlocal formatexpr=CocAction('formatSelected')
  autocmd FileType typescript,javascript,html,htmldjango,javascriptreact,typescriptreact setlocal isk+=-
  autocmd FileType python,c,cpp,typescript,javascript,php,fortran,javascriptreact,typescriptreact let b:coc_pairs_disabled = ['<']
  autocmd FileType python set shiftwidth=4 tabstop=4
  autocmd FileType * setlocal formatoptions-=ro
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  autocmd QuickFixCmdPost *grep* cwindow
augroup end


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
            \ 'coc-java',
            \ 'coc-sql',
            \ ]

command! -nargs=0 Prettier :CocCommand prettier.formatFile


inoremap <silent> jj <ESC>
nnoremap <C-k> :wa!<CR>

xnoremap & :&&<CR>
nnoremap & :&&<CR>
nnoremap ' `
nnoremap <C-f> :Telescope find_files<CR>
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
    autocmd BufRead *puml set filetype=plantuml
    autocmd BufRead *.py set filetype=python
    autocmd BufRead *.jinja set filetype=htmldjango
    autocmd BufRead *.jsx set filetype=javascriptreact
    autocmd BufRead *.tsx set filetype=typescriptreact
    autocmd BufRead *.html set filetype=html
    autocmd BufWritePost *.html :Prettier
    autocmd BufWritePost *.py :Isort
augroup END



" Use <C-k> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<C-k>'
let g:coc_snippet_prev = '<C-h>'
" source ~/dotfiles/packages/neovim/.config/nvim/macmini.vim
let g:bracey_browser_command= "open"

nmap <C-u> :Telescope find_files<CR>
nnoremap <c-n> <TAB>
nmap tj :tabedit<CR><C-u>
nmap <S-tab> :tabprev<CR>
nmap <C-h> :tabprev<CR>
nnoremap <TAB> :tabnext<CR>

" Split window
nmap ss :split<CR><C-w>w<C-u>
nmap vv :vsplit<CR><C-w>w<C-u>
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
let g:quickrun_config.java = {
    \ 'command' : 'javac',
    \ 'cmdopt' : '-cp',
    \ }
let g:auto_ctags = 1
let g:python3_host_prog = '/usr/bin/python3'

nmap <silent> gdt :call CocAction('jumpDefinition', 'tabe')<CR>
nmap <silent> gdv :call CocAction('jumpDefinition', 'vsplit')<CR>

nmap <silent> gyt :call CocAction('jumpTypeDefinition', 'tabe')<CR>
nmap <silent> gyv :call CocAction('jumpTypeDefinition', 'vsplit')<CR>

nmap <silent> git :call CocAction('jumpImplementation', 'tabe')<CR>
nmap <silent> giv :call CocAction('jumpImplementation', 'vsplit')<CR>

nmap <silent> grt :call CocAction('jumpReferences', 'tabe')<CR>
nmap <silent> grv :call CocAction('jumpReferences', 'vsplit')<CR>

nmap gdi :Gdiffsplit<CR>
nmap gbr :Git branch -vv<CR>
nmap gbl :Git blame<CR>
nmap gst :Git status<CR>
nmap glg :Git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'<CR>

lua require("telescope").load_extension('harpoon')
nmap ma :lua require("harpoon.mark").add_file()<CR>
nmap mm :lua require("harpoon.ui").toggle_quick_menu()<CR>
nmap mt :tabedit<CR>:Telescope harpoon marks<CR>
nmap mv :vsplit<CR><C-w>w:Telescope harpoon marks<CR>

