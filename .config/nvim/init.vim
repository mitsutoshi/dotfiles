" Base Setting
"-------------------------------------------------------------------------------
let g:python_host_prog = system('echo -n $(which python2)')
let g:python3_host_prog = $PYENV_ROOT.'/versions/neovim-python3/bin/python'

set backupdir=~/.vim
set directory=~/.vim
set showmode
set showcmd
set cursorline
set number
set ruler
set list
set listchars=nbsp:%,eol:↲,tab:»-,trail:-,extends:»,precedes:« "space:.,
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
set nostartofline

set nocompatible
map ^[OA ^[ka
map ^[OB ^[ja
map ^[OC ^[la
map ^[OD ^[ha

colorscheme jellybeans
augroup highlightIdegraphicSpace
  autocmd!
  autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
  autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END

let mapleader = "\<Space>"

" normal mode
nnoremap <leader>w :w<CR>
nnoremap <leader>q :qa<CR>
nnoremap <leader>t :tabnew<CR>
nnoremap <silent><C-p> :bprev<CR>
nnoremap <silent><C-n> :bnext<CR>
nnoremap <silent><C-x>p :echo expand('%')<CR>
nnoremap <silent><C-x>fp :echo expand('%:p')<CR>
nnoremap <silent>t1 :tabn1<CR>
nnoremap <silent>t2 :tabn2<CR>
nnoremap <silent>t3 :tabn3<CR>

" terminal mode
tnoremap <silent> <C-w>n <C-\><C-n>

au VimLeave * mks! ~/Session.vim
au BufRead,BufNewFile *.md set filetype=markdown

" Plugin Setting
"-------------------------------------------------------------------------------

" Start dein scripts -->
set runtimepath+=~/ghq/github.com/Shougo/dein.vim
let s:dein_dir = expand('~/.cache/dein')
let s:toml_dir = expand('~/.config/nvim')

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  let s:toml = s:toml_dir . '/dein.toml'
  let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
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
