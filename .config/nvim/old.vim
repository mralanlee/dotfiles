if &compatible
 set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
 call dein#begin('~/.cache/dein')

 call dein#add('~/.cache/dein')
 call dein#add('Shougo/deoplete.nvim')
 call dein#add('Shougo/dein.vim')
 call dein#add('Shougo/denite.nvim')
 call dein#add('Shougo/neosnippet-snippets')
 call dein#add('Shougo/neosnippet.vim')
 call dein#add('benekastah/neomake')
 call dein#add('editorconfig/editorconfig-vim')
 call dein#add('fatih/vim-go', { 'on_ft': ['go'] })
 call dein#add('jparise/vim-graphql', { 'on_ft': ['graphql'] })
 call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
 call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
 call dein#add('justinmk/vim-sneak')
 call dein#add('mattn/emmet-vim', { 'on_ft': ['javascript', 'javascript.jsx', 'html', 'xml'] })
 call dein#add('mhinz/vim-grepper')
 call dein#add('othree/es.next.syntax.vim', { 'on_ft': 'javascript' })
 call dein#add('othree/javascript-libraries-syntax.vim', { 'on_ft': ['javascript', 'javascript.jsx'] })
 call dein#add('prettier/vim-prettier')
 call dein#add('pangloss/vim-javascript')
 call dein#add('scrooloose/nerdcommenter')
 call dein#add('tpope/vim-fugitive')
 call dein#add('~/.cache/dein')
 call dein#add('cohama/lexima.vim')
 call dein#add('tpope/vim-surround')
 call dein#add('tpope/vim-repeat')
 call dein#add('Glench/Vim-Jinja2-Syntax')
 call dein#add('hashivim/vim-terraform')
 call dein#add('ekalinin/Dockerfile.vim')
 call dein#add('Yggdroot/indentLine')
 " call dein#add('Valloric/MatchTagAlways')
 " call dein#add('neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}})
 call dein#add('airblade/vim-gitgutter')
 call dein#add('ntpeters/vim-better-whitespace')
 call dein#add('chr4/nginx.vim')
 call dein#add('marcweber/vim-addon-mw-utils')
 call dein#add('garbas/vim-snipmate')
 call dein#add('tomtom/tlib_vim')
 call dein#add('phanviet/vim-monokai-pro')
 if !has('nvim')
   call dein#add('roxma/nvim-yarp')
   call dein#add('roxma/vim-hug-neovim-rpc')
 endif

 call dein#end()
 call dein#save_state()
endif

set background=dark
colorscheme monokai_pro
filetype plugin indent on
syntax enable
highlight Pmenu guibg=#161616

set termguicolors
" disable mouse
set mouse=r
set encoding=utf8
set hidden
set nomodeline
set secure
set nobackup nowritebackup noswapfile autoread
set hlsearch incsearch ignorecase smartcase
set wildmenu
set backspace=indent,eol,start
set clipboard+=unnamed,unnamedplus
set showcmd
set showmatch
set showmode
set ruler
set number
set nofoldenable
set scrolloff=1
set sidescrolloff=5
set colorcolumn=+1
set formatoptions+=o
set linespace=0
set noerrorbells
set nojoinspaces
set splitbelow
set splitright
set display+=lastline
set updatetime=250
set timeoutlen=500
set shiftwidth=2
set expandtab
set tabstop=2
"set softtabstop=2
set conceallevel=1
set undolevels=100
set nowrap

let g:NERDCustomDelimiters={ 'conf': { 'left': '#' } }
let g:NERDCustomDelimiters={ 's': { 'left': '{/*','right': '*/}' } }
let g:NERDSpaceDelims=1
let g:fzf_buffers_jump=1
let g:fzf_history_dir='~/.local/share/fzf-history'
let g:fzf_tags_command='fd | ctags --links=no -L-'
let g:gitgutter_enabled=0
let g:indentLine_char="•"
let g:indentLine_color_term=239
let g:indentLine_enabled=1
let g:jsx_ext_required=0
let g:lexima_enable_basic_rules=1  " AUTOCLOSE PAIRS
let g:lexima_enable_newline_rules=1 " AUTOCLOSE PAIRS
let g:neosnippet#snippets_directory="~/.config/nvim/mysnips"

" Go
let g:go_fmt_command= "goimports"

" Prettier
let g:prettier#config#bracket_spacing='true'
let g:prettier#config#single_quote='true'
let g:prettier#config#trailing_comma='all'
let g:prettier#exec_cmd_async=1

" Rust
let g:rustfmt_autosave=1

let g:sneak#s_next=1
let g:used_javascript_libs='react'
let g:vim_jsx_pretty_colorful_config=1

" Terraform
let g:terraform_align=1
let g:terraform_fmt_on_save=1

let g:javascript_plugin_jsdoc=1

" FUNCTIONS
function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction
au! User FzfStatusLine call <SID>fzf_statusline()

if executable('./node_modules/.bin/eslint')
  let g:neomake_javascript_eslint_exe='./node_modules/.bin/eslint'
endif
let g:neomake_javascript_eslint_maker={
    \ 'args': ['-f', 'compact'],
    \ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
    \ '%W%f: line %l\, col %c\, Warning - %m'
    \ }
let g:neomake_javascript_enabled_makers=['eslint']
let g:neomake_jsx_eslint_maker={
    \ 'args': ['-f', 'compact'],
    \ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
    \ '%W%f: line %l\, col %c\, Warning - %m'
    \ }
let g:neomake_jsx_enabled_makers=['eslint']
let g:neomake_yaml_enabled_makers=['yamllint']
au! BufWritePost * Neomake

au FileType make setlocal noexpandtab sw=4 ts=4 sts=4

nmap , :Files<CR>
let mapleader="\<SPACE>"
nnoremap <leader>= <C-w>=
noremap <leader>q :q<CR>
noremap <leader>w :w<CR>
noremap <leader>q! :q!<CR>
nnoremap <ESC> :noh<return><ESC>
nnoremap <leader><leader> <c-^>
nnoremap <Tab> :bnext!<CR>
nnoremap <S-Tab> :bprev!<CR><Paste>
nnoremap <bar> <C-w><bar>
xnoremap p pgvy
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F
nmap <Leader>b :Buffers<CR>
nmap <Leader>f :GFiles<CR>
nmap <Leader>F :Files<CR>
nmap <Leader>t :Tags<CR>
nmap <Leader>m :History<CR>
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)
nnoremap <leader>* :Grepper -tool rg -cword -noprompt<cr>
nnoremap <leader>g :Grepper -tool rg<cr>
nnoremap <leader>G :Grepper -tool rg -buffers<cr>
" WINDOWS
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
" if on iterm2, add key pref for CTRL-H in prefs,
" action send escape sequence, type in [104;5u
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap _ <C-w>_

filetype plugin indent on
