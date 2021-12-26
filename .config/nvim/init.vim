
" LHS Margin Options
set number
set relativenumber

" Tab Options
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent


" Backup/Swap options
set noswapfile
set nobackup
set undodir=~/.vim/undodir " Works well with UndoTree
set undofile

" General Options
set exrc
set nohlsearch
set hidden
set noerrorbells
set scrolloff=8
set signcolumn=yes
set colorcolumn=100
" More space for Messages
set cmdheight=2

" Completion Options
set completeopt=menuone,noinsert,noselect
call plug#begin('~/.vim/plugged')
Plug 'nvim-telescope/telescope.nvim'    
Plug 'gruvbox-community/gruvbox'
" Fugitive, UndoTree, TreeSitter, 
call plug#end()

colorscheme gruvbox
