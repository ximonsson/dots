" colors por favor and my colorscheme
syntax on

" cosmetics like line numbers, highlighting
set hlsearch
set number
set cursorline

" indentation settings
set autoindent noexpandtab tabstop=4 shiftwidth=4 softtabstop=4

" turn off the damn bell
set vb

set encoding=utf-8
set autoread

" no more tabs for me!
set hidden

" trim whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" ignore list
set wildignore=*.o,*.a,*.so,*.pyc

" netrw settings
let g:netrw_liststyle = 3
let g:netrw_browse_split = 1
let g:netrw_alto = 1
let g:netrw_altv = 1

" load plugins
filetype plugin indent on
autocmd BufNewFile,BufRead *.gp setf gnuplot
autocmd BufNewFile,BufRead *.neomuttrc setf neomuttrc

" plugins
call plug#begin()
Plug 'fatih/vim-go'
Plug 'tpope/vim-fugitive'
Plug 'rust-lang/rust.vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'neovimhaskell/haskell-vim'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-lua-ftplugin'
Plug 'tikhomirov/vim-glsl'
Plug 'hashivim/vim-terraform'
Plug 'leafgarland/typescript-vim'
Plug 'neovim/nvim-lspconfig'
Plug 'udalov/kotlin-vim'
Plug 'leafOfTree/vim-svelte-plugin'
Plug 'rebelot/kanagawa.nvim'
Plug 'huggingface/llm.nvim'
Plug 'milanglacier/minuet-ai.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'olimorris/codecompanion.nvim'
call plug#end()

" no mouse interaction
set mouse=
