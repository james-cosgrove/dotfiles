call plug#begin('~/.config/vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'shougo/vimproc.vim', {'do' : 'make'}
Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-rails'
Plug 'takac/vim-hardtime'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-commentary'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/loremipsum'
Plug 'brooth/far.vim'
Plug 'neoclide/coc.nvim', { 'do': { -> coc#util#install() }}
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-unimpaired'
Plug 'Chiel92/vim-autoformat'
Plug 'elzr/vim-json'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
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
:set autoindent
:set smartindent
" let g:hardtime_default_on = 1
let NERDTreeShowLineNumbers = 1

if has("termguicolors")
  set termguicolors
endif

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" Remap leader key to space
let mapleader = "\<Space>"
":set timeout timeoutlen=100

" Always open splits to right
set splitright

" Set fugutive window height
set previewheight=30

" Disable folding
set foldlevelstart=99

" Fugitive
set diffopt+=vertical

" Enable mousewheel
set mouse=a

" Default window size for NERDTree
let g:NERDTreeWinSize=40

" let enter be used to select item
:inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Specify undo file directory
set undodir=~/.config/nvim/undodir

" Maintain undo history between sessions
set undofile

" NerdTree
nnoremap <leader>n :NERDTree ~/Sites<CR>
nnoremap <leader>r :NERDTreeFind<CR>
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" HTML Stuff
let g:html_indent_tags = 'p\|li\|nav'

" Python for nvim
let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" CSS Stuff
autocmd BufNewFile,BufRead *.scss :set ft=scss.css
nnoremap <leader>; 02Wdv$i
nnoremap <leader>S vi{:sort<CR>

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
function! <SID>StripTrailingWhitespaces()
	let l = line(".")
	let c = col(".")
	%s/\s\+$//e
	call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Emmet VIM
let g:user_emmet_leader_key='<C-e>'

"Airline colour theme
let g:airline_theme='base16_eighties'

" JSON stuff
au! BufRead,BufNewFile *.json set filetype=json

augroup json_autocmd
  autocmd!
  autocmd FileType json set autoindent
  autocmd FileType json set formatoptions=tcq2l
  autocmd FileType json set textwidth=78 shiftwidth=2
  autocmd FileType json set softtabstop=2 tabstop=8
  autocmd FileType json set expandtab
  autocmd FileType json set foldmethod=syntax
augroup END


" CUSTOM SNIPPETS AND REMAPPING >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
" Remap Ctrl-p to fzf
nnoremap <C-p> :Files<CR>
set rtp+=/usr/local/opt/fzf

" Map ESC to clear search highlighting
map <esc> :noh<CR>

" Remap jk to save and exit insert mode
:imap jk <Esc>:w<CR>

" Remap change tab commands
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>

"Go to prev file
nnoremap <C-b> :e#<CR>

" Split resizing
nnoremap <Leader>iw <C-w>20><CR>
nnoremap <Leader>dw <C-w>20<<CR>
nnoremap <Leader>ih <C-w>10+<CR>
nnoremap <Leader>dh <C-w>10-<CR>

" Snippets
nnoremap <leader>mt o@include respond-to(tablet) {<CR>}<Esc>O
nnoremap <leader>mn o@include respond-to(netbook) {<CR>}<Esc>O
nnoremap <leader>md o@include respond-to(desktop) {<CR>}<Esc>O
nnoremap <leader>l oconsole.log()<Esc>F(a

" Auto closing
inoremap {<CR> {<CR>}<ESC>O
inoremap (<CR> (<CR>)<ESC>O
inoremap [<CR> [<CR>]<ESC>O
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


" SEARCH SETTINGS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
" Open ripgrep results in new tab
autocmd FileType qf nnoremap <buffer> <C-T> <C-W><Enter><C-W>T

" Open ripgrep results in vertical split
autocmd FileType qf nnoremap <buffer> <C-V> <C-W><Enter><C-W>L

" Search smart case
set ignorecase
set smartcase

" ripgrep settings
let g:rg_highlight="true"

" Far use ripgrep
let g:far#source="rgnvim"

set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


" COC Config >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
" if hidden is not set, TextEdit might fail.
set hidden

" Better display for messages
set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
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

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
"autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Colour highlighting on cursor hold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Override highlighting
highlight CocHintSign ctermfg=Yellow guifg=#FAB005

" Add diagnostic info for https://github.com/itchyny/lightline.vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
