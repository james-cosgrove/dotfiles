call plug#begin('~/.config/vim/plugged')
Plug 'jremmen/vim-ripgrep'
Plug 'kien/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
"Plug 'rstacruz/sparkup'
Plug 'chriskempson/base16-vim'
"Plug 'digitaltoad/vim-pug'
Plug 'isRuslan/vim-es6'
Plug 'leafgarland/typescript-vim'
Plug 'tpope/vim-rails'
Plug 'takac/vim-hardtime'
Plug 'hail2u/vim-css3-syntax'
Plug 'jiangmiao/auto-pairs'
Plug 'ervandew/supertab'
Plug 'scrooloose/syntastic'
Plug 'valloric/youcompleteme'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

syntax on
filetype plugin indent on
:set nocompatible
:set cursorline
:set expandtab
:set formatoptions-=cro
:set incsearch
:set laststatus=2
:set number relativenumber
:set scrolloff=10
:set shiftwidth=2
:set synmaxcol=300
:set tabstop=2
:set omnifunc=csscomplete#CompleteCSS
:set autoindent
:set smartindent
"let g:hardtime_default_on = 1
let NERDTreeShowLineNumbers = 1

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" Omnicomplete stuff
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd BufNewFile,BufRead *.scss             set ft=scss.css

:set completeopt+=noselect,menu,preview
" let enter be used to select item
:inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Maintain undo history between sessions
set undofile

" Specify undo file directory
set undodir=~/.config/nvim/undodir

" Remap leader key to space
let mapleader = "\<Space>"
":set timeout timeoutlen=100

" Remap jk to save and exit insert mode
:imap jk <Esc>:w<CR>

" HTML Stuff
let g:html_indent_tags = 'p\|li\|nav'

" Python for nvim
let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" CSS Stuff
autocmd BufNewFile,BufRead *.scss :set ft=scss.css
nnoremap <leader>; 02Wdv$i
nnoremap <leader>s vi{:sort<CR>

" Ctrl+P setup.
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

" ripgrep settings
let g:rg_highlight = "true"

" set fugutive window height
set previewheight=30

" Open ripgrep results in new tab
autocmd FileType qf nnoremap <buffer> <C-T> <C-W><Enter><C-W>T

" Snippets
nnoremap <leader>mt o@include respond-to(tablet) {<CR>}<Esc>O
nnoremap <leader>mn o@include respond-to(netbook) {<CR>}<Esc>O
nnoremap <leader>md o@include respond-to(desktop) {<CR>}<Esc>O
nnoremap <leader>l oconsole.log()<Esc>F(a
set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip
au FileType typescript setl sw=4 sts=4 et

" NerdTree
nnoremap <leader>n :NERDTree ~/Sites<CR>
nnoremap <leader>r :NERDTreeFind<CR>
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" Auto watch vimrc for changes and reload.
augroup myvimrc
  au!
  au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" Auto toggle out of relative numbers for unfocused split
augroup numbertoggle autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Fugitive
set diffopt+=vertical

" Default window size for NERDTree
let g:NERDTreeWinSize=40

" Remap change tab commands
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>

" Use PHP syntax highlighting for squarespace templates
autocmd BufNewFile,BufRead *.list,*.item,*.block set syntax=php

" Override error highlighting to underlines
hi clear SpellBad
hi SpellBad cterm=underline
hi clear SpellCap
hi SpellCap cterm=underline

"Airline colour theme
let g:airline_theme='base16_eighties'
