" Base Setting
"-------------------------------------------------------------------------------
set backupdir=~/.vim
set directory=~/.vim
set showmode
set showcmd
set cursorline
set number
set ruler
set list
set listchars=space:.,nbsp:%,eol:↲,tab:»-,trail:-,extends:»,precedes:«
set nowrap
set showmatch
set tabstop=4
set shiftwidth=4
set hidden
set autoindent
set smarttab
set expandtab
set backspace=2
set encoding=utf-8
set incsearch
set hlsearch
set clipboard+=unnamed

" syntax enable
colorscheme jellybeans
augroup highlightIdegraphicSpace
  autocmd!
  autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
  autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END


" Plugin Setting
"-------------------------------------------------------------------------------

" Start dein scripts -->
if &compatible
  set nocompatible
endif

set runtimepath+=~/dev/src/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#add('~/.cache/dein')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('scrooloose/nerdtree')
  call dein#add('plasticboy/vim-markdown')
  call dein#add('kannokanno/previm')
  call dein#add('tyru/open-browser.vim')
  call dein#add('fatih/vim-go')
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })
  call dein#add('yuttie/comfortable-motion.vim')
  call dein#add('neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'})
  call dein#add('itchyny/lightline.vim')
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup
if dein#check_install()
  call dein#install()
endif
" --> End dein Scripts


" Custom Behavior Setting
"-------------------------------------------------------------------------------

let mapleader = "\<Space>"
nnoremap <leader>w :w<CR>
nnoremap <leader>t :tabnew<CR>
nnoremap <silent><C-p> :bprev<CR>
nnoremap <silent><C-n> :bnext<CR>
au VimLeave * mks! ~/Session.vim
au BufRead,BufNewFile *.md set filetype=markdown
 
" NERDTree
nnoremap <silent><C-e> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1
" autocmd VimEnter * execute 'NERDTree'

" Previm
nnoremap <silent><C-m> :PrevimOpen<CR>
let g:vim_markdown_folding_disabled=1
let g:previm_enable_realtime = 1

" go-vim
autocmd FileType go nmap <leader>f <Plug>(go-format)
autocmd FileType go nmap <leader>i <Plug>(go-imports)
autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>d <Plug>(go-doc)
let g:go_gocode_unimported_packages = 1
let g:go_auto_type_info = 1
