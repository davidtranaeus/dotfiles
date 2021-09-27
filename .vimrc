" Automatically executes filetype plugin indent on and syntax enable
call plug#begin('~/.vim/plugged')
" Theme
Plug 'arcticicestudio/nord-vim'

" fzf-vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Tree
"Plug 'preservim/nerdtree'

" Linting
Plug 'dense-analysis/ale'
call plug#end()

" Theme
colorscheme nord

" Line numbers
set nu

" Set autopep8 for gq for py
au FileType python setlocal formatprg=autopep8\ -

" Bind esc to jk in insert mode
inoremap jk <Esc>

" Incremental search
set incsearch

" Case insensitive search
set ignorecase

