"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.nvim-package-control/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.nvim-package-control')
  call dein#begin('~/.nvim-package-control')

  " Let dein manage dein
  " Required:
  call dein#add('~/.nvim-package-control/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  " My Plugin list
  call dein#add('fatih/vim-go.git')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('zchee/deoplete-go', {'build': 'make'})
  call dein#add('zchee/deoplete-jedi')

  " Color SCHEME
  call dein#add('altercation/vim-colors-solarized')
  call dein#add('fatih/molokai')
  
  call dein#add('scrooloose/nerdcommenter')
  call dein#add('scrooloose/nerdtree')
  
  "GIT
  call dein#add('airblade/vim-gitgutter')
  call dein#add('tpope/vim-fugitive')
  call dein#add('Xuyuanp/nerdtree-git-plugin')

  "Status line
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('luochen1990/rainbow')
  call dein#add('chrisbra/csv.vim')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" Install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

""""""""""""""
" Leader key "
""""""""""""""
let mapleader = ","
nnoremap <leader><leader> :w<cr>


set completeopt+=noselect
set number
set relativenumber
let g:python3_host_prog  = '/usr/bin/python'
" Skip the check of neovim module
let g:python3_host_skip_check = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#sources#jedi#show_docstring = 1 "check this

let g:rainbow_active = 1
let g:AutoPairsFlyMode = 0

"--------------------------------------------------
" vim-go
"--------------------------------------------------
augroup filetype-go
    autocmd!
    autocmd FileType go setlocal tabstop=4
    autocmd FileType go setlocal shiftwidth=4
    autocmd FileType go let g:auto_ctags = 1
    autocmd FileType go let g:go_fmt_fail_silently = 1
    autocmd FileType go let g:go_highlight_functions = 1
    autocmd FileType go let g:go_highlight_methods = 1
    autocmd FileType go let g:go_highlight_structs = 1
    autocmd FileType go let g:go_highlight_operators = 1
    autocmd FileType go let g:go_highlight_build_constraints = 1
    autocmd FileType go let g:go_play_open_browser = 1
    autocmd FileType go let g:go_fmt_command = 'goimports'
    autocmd FileType go let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
    autocmd FileType go let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
    autocmd FileType go let g:deoplete#sources#go#pointer = 1
    autocmd FileType go let g:deoplete#sources#go#use_cache = 1
    autocmd FileType go let g:deoplete#sources#go#json_directory = '~/.cache/nvim/deoplete/go'
"    autocmd FileType go let g:deoplete#sources#go#cgo = 1 

    autocmd FileType go nmap <leader>r :w<cr><Plug>(go-run)
    autocmd FileType go nmap <leader>b <Plug>(go-build)
    autocmd FileType go nmap <leader>tr <Plug>(go-test)
    autocmd FileType go nmap <leader>tf <Plug>(go-test-func)
    autocmd FileType go nmap <leader>c <Plug>(go-coverage)

    autocmd FileType go nmap <Leader>df <Plug>(go-def)
    autocmd FileType go nmap <Leader>ds <Plug>(go-def-split)
    autocmd FileType go nmap <Leader>dv <Plug>(go-def-vertical)
    autocmd FileType go nmap <Leader>dt <Plug>(go-def-tab)

    autocmd FileType go nmap <Leader>gd <Plug>(go-doc)
    autocmd FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

    autocmd FileType go nmap <Leader>s <Plug>(go-implements)
    autocmd FileType go nmap <Leader>i <Plug>(go-info)
    autocmd FileType go nmap <Leader>e <Plug>(go-rename)

    autocmd FileType go hi goErr term=bold ctermfg=13 gui=bold guifg=#ef5939
    autocmd FileType go :highlight goErr cterm=bold ctermfg=202
    autocmd FileType go :match goErr /\<err\>/
    autocmd FileType go ia iferr if<Space>err<Space>!=<Space>nil<Space>{<CR>return err<CR>}
    autocmd FileType go ia httpwr w<Space>http.ResponseWriter,<Space>r<Space>*http.Request
augroup END

autocmd FileType python nnoremap <leader>r :vsplit<cr> :terminal python %<cr>
" Theme config
colorscheme molokai
let g:airline_theme='molokai'

" toggle invisible characters
set list
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪

"------------------------------------------------------------------------------
" NERDTree
"------------------------------------------------------------------------------

" General properties
let NERDTreeDirArrows=1
let NERDTreeMinimalUI=1
let NERDTreeIgnore=['\.o$', '\.pyc$', '\.php\~$']
let NERDTreeWinSize = 35

" Make sure that when NT root is changed, Vim's pwd is also updated
let NERDTreeChDirMode = 2
let NERDTreeShowLineNumbers = 0
let NERDTreeAutoCenter = 1

" Open NERDTree on startup, when no file has been specified
autocmd VimEnter * if !argc() | NERDTree | endif

" Locate file in hierarchy quickly
map <leader>T :NERDTreeFind<cr>
" Toogle on/off
nmap <leader>o :NERDTreeToggle<cr>

" --------------------------------------
" Navigate between split windows quickly
" --------------------------------------
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>

" ---------------
" Search settings
" ---------------
set ignorecase
set smartcase
set incsearch


let g:rainbow_conf = {
\   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'lisp': {
\           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\       },
\       'vim': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\       },
\       'html': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\       },
\       'css': 0,
\   }
\}
