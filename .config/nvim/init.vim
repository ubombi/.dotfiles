if &compatible
	set nocompatible               " Be iMproved
endif
let mapleader = ","
nnoremap <leader><leader> :w<cr>

set hidden
set completeopt+=noselect
set mouse=a
" Fast move
set number
set relativenumber

" Autoreload changed files
set autoread

" Enable folding
set foldmethod=indent
set foldlevel=99

" toggle invisible characters
set list
set tabstop=4
set shiftwidth=4
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪

" Search settings
set ignorecase
set smartcase
set incsearch

"dein Scripts-----------------------------
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
	call dein#add('jodosha/vim-godebug')
	call dein#add('Shougo/deoplete.nvim')
	call dein#add('zchee/deoplete-go', {'build': 'make'})
	call dein#add('zchee/deoplete-jedi')
	call dein#add('davidhalter/jedi-vim')
	call dein#add('vim-ctrlspace/vim-ctrlspace')

	" Color SCHEME
	call dein#add('altercation/vim-colors-solarized')
	call dein#add('fatih/molokai')

	" Syntax
	call dein#add('vim-syntastic/syntastic')
	call dein#add('sheerun/vim-polyglot')

	call dein#add('scrooloose/nerdcommenter')
	call dein#add('scrooloose/nerdtree')
	call dein#add('jistr/vim-nerdtree-tabs')
	call dein#add('majutsushi/tagbar')
	call dein#add('kien/ctrlp.vim')

	"GIT
	call dein#add('airblade/vim-gitgutter')
	call dein#add('tpope/vim-fugitive')
	call dein#add('idanarye/vim-merginal')
	call dein#add('Xuyuanp/nerdtree-git-plugin')
	call dein#add('int3/vim-extradite')

	"Status line
	call dein#add('vim-airline/vim-airline')
	call dein#add('vim-airline/vim-airline-themes')

	" You can specify revision/branch/tag.
	call dein#add('Shougo/vimshell', { 'rev': '3787e5' })
	call dein#add('jiangmiao/auto-pairs')
	call dein#add('luochen1990/rainbow')
	call dein#add('chrisbra/csv.vim')
	call dein#add('Chiel92/vim-autoformat')
	call dein#add('nvie/vim-flake8')
"	call dein#add('fholgado/minibufexpl.vim')

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


nnoremap b, :bp<CR>
nnoremap b. :bn<CR>

let g:python3_host_prog  = '/usr/bin/python'
let g:python_host_prog  = '/usr/bin/python2'
" Skip the check of neovim module
"let g:python3_host_skip_check = 1

let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#sources#jedi#show_docstring = 1 "check this
call deoplete#custom#set('buffer', 'rank', 99)

" CtrlSpace
let g:CtrlSpaceDefaultMappingKey = "<C-space> "
nnoremap <silent><C-p> :CtrlSpace O<CR>
set showtabline=0

let g:rainbow_active = 1
let g:AutoPairsFlyMode = 0

" AutoFormatter
let g:autoformat_verbosemode=0
" TABS
let g:nerdtree_tabs_open_on_console_startup=1
let g:syntastic_aggregate_errors = 1

let g:formatters_js = ['js-beautify']
let g:formatters_css = ['css-beautify']

let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['go', 'python']}
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:neotags_enabled = 1
"--------------------------------------------------
" vim-go
"--------------------------------------------------
augroup filetype-go
	autocmd!
	autocmd FileType go setlocal tabstop=4
	autocmd FileType go setlocal shiftwidth=4
	autocmd FileType go let g:auto_ctags = 1
	"autocmd FileType go let g:go_fmt_fail_silently = 1
	autocmd FileType go let g:go_highlight_functions = 1
	autocmd FileType go let g:go_highlight_methods = 1
	autocmd FileType go let g:go_highlight_structs = 1
	autocmd FileType go let g:go_highlight_operators = 1
	autocmd FileType go let g:go_highlight_extra_types = 1
	autocmd FileType go let g:go_highlight_build_constraints = 1
	autocmd FileType go let g:go_auto_sameids = 1
	autocmd FileType go let g:go_auto_type_info = 1
	autocmd FileType go let g:go_play_open_browser = 1
	autocmd FileType go let g:go_fmt_command = 'goimports'
	autocmd FileType go let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
	autocmd FileType go let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
	autocmd FileType go let g:deoplete#sources#go#pointer = 1
	autocmd FileType go let g:deoplete#sources#go#use_cache = 1
	autocmd FileType go let g:deoplete#sources#go#json_directory = '~/.cache/nvim/deoplete/go'

	let g:go_metalinter_excludes = ['dupl', 'gas', 'errcheck', 'gotype']
	let g:go_metalinter_deadline = '1500s'
	"
	let g:syntastic_go_checkers = ['golint', 'govet', 'gometalinter']
	let g:syntastic_go_gometalinter_args = ['--disable-all', '--enable=errcheck', '--enable=deadcode', '--enable=gocyclo', '--enable=staticcheck', '--enable=gosimple']
	"let g:syntastic_mode_map = { 'mode': 'passive' }
	"    autocmd FileType go let g:deoplete#sources#go#cgo = 1

	autocmd FileType go nmap <leader>r :w<cr><Plug>(go-run)
	autocmd FileType go nmap <leader>rd :w<cr>:GoDebug<cr>
	autocmd FileType go nmap <leader>b <Plug>(go-build)
	autocmd FileType go nmap <leader>tr <Plug>(go-test)
	autocmd FileType go nmap <leader>tf <Plug>(go-test-func)
	autocmd FileType go nmap <leader>c <Plug>(go-coverage)

	autocmd FileType go nmap <Leader>df <Plug>(go-def)
	autocmd FileType go nmap <Leader>g <Plug>(go-def)
	autocmd FileType go nmap <Leader>ds <Plug>(go-def-split)
	autocmd FileType go nmap <Leader>dv <Plug>(go-def-vertical)
	autocmd FileType go nmap <Leader>dt <Plug>(go-def-tab)

	autocmd FileType go nmap <Leader>gd <Plug>(go-doc)
	autocmd FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

	autocmd FileType go nmap <Leader>s <Plug>(go-implements)
	autocmd FileType go nmap <Leader>i <Plug>(go-info)
	autocmd FileType go nmap <Leader>e <Plug>(go-rename)
	autocmd FileType go nmap <Leader>br :GoToggleBreakpoint<cr>

	autocmd FileType go hi goErr term=bold ctermfg=13 gui=bold guifg=#ef5939
	autocmd FileType go :highlight goErr cterm=bold ctermfg=202
	autocmd FileType go :match goErr /\<err\>/
	autocmd FileType go ia iferr if<Space>err<Space>!=<Space>nil<Space>{<CR>return err<CR>}
	autocmd FileType go ia httpwr w<Space>http.ResponseWriter,<Space>r<Space>*http.Request
augroup END


augroup python
	au!
	" au filetype python set omnifunc=pythoncomplete#Complete complete+=k~/.vim/syntax/python.vim isk+=.,(
	" au filetype python setlocal omnifunc=pysmell#Complete complete+=k~/.vim/syntax/python.vim
	" au filetype python let python_highlight_all=1

	au FileType python let g:auto_ctags = 1
	au FileType python let g:formatdef_autopep8 = "'autopep8 - --max-line-length=120 --range '.a:firstline.' '.a:lastline"
	au FileType python let g:formatters_python = ['autopep8']
	au FileType python let g:flake8_show_in_gutter = 1
	au FileType python nnoremap <leader>r :vsplit<cr> :terminal python %<cr>
	au FileType python let g:jedi#rename_command = "<leader>e"
	au FileType python let g:jedi#use_tabs_not_buffers = 0
	au FileType python let g:jedi#completions_enabled = 0 " Because of deoplete-jedi
	autocmd BufWrite *.py :Autoformat
	autocmd BufWritePost *.py call Flake8()
augroup END


" Theme config
colorscheme molokai
let g:airline_theme='molokai'
let g:airline#extensions#tabline#enabled = 0


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
" autocmd VimEnter * if !argc() | NERDTree | endif

" Locate file in hierarchy quickly
map <leader>T :NERDTreeFind<cr>
" Toogle on/off
noremap <leader>o :NERDTreeToggle<cr>
noremap <leader>l :TagbarToggle<cr>
noremap <leader>m :MerginalToggle<cr>


noremap <F3> :Autoformat<CR>

" --------------------------------------
" Navigate between split windows quickly
" --------------------------------------
"
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>



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
