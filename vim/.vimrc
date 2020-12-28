" colors por favor
syntax on
" colorscheme
colorscheme x33m0n

" cosmetics like line numbers, highlighting
set hlsearch
set number
set cursorline

" trim whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" ignore list
set wildignore=*.o,*.a,*.so,*.pyc

" load plugins
filetype plugin indent on
autocmd BufNewFile,BufRead *.gp setf gnuplot
autocmd BufNewFile,BufRead *.neomuttrc setf neomuttrc

" indentation settings
set autoindent noexpandtab tabstop=4 shiftwidth=4 softtabstop=4

" turn off the damn bell
set vb

set encoding=utf-8

" no more tabs for me!
set hidden

" plugins
call plug#begin()
Plug 'fatih/vim-go'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'rust-lang/rust.vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'neovimhaskell/haskell-vim'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-lua-ftplugin'
Plug 'tikhomirov/vim-glsl'
call plug#end()

" airline theme
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1
let g:airline_theme='minimalist'
"let g:airline_solarized_bg='dark'

" reset the cursor to an underscore
"	not a big fan of this solution as it is not dynamic but has to
"	do for the moment...
" autocmd VimLeave * set guicursor=a:hor50
