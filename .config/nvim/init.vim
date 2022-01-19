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
set timeoutlen=200

" Completion Options
set completeopt=menuone,noinsert,noselect

call plug#begin('~/.vim/plugged')
Plug 'nvim-telescope/telescope.nvim'    
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'gruvbox-community/gruvbox'

" Fugitive, UndoTree, TreeSitter, 
call plug#end()

colorscheme gruvbox
let mapleader = " "

" Remaps
nnoremap <leader>fs <cmd>lua require('telescope.builtin').live_grep()<CR>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<CR>

nnoremap oo o<ESC>
nnoremap OO O<ESC>


" Disable arrow keys for learning purpose
for key in ['<Left>', '<Right>', '<Up>', '<Down>']
    exec 'noremap' key '<nop>'
    exec 'noremap!' key '<nop>'
endfor
"noremap <Left> <nop>
"noremap <Right> <nop>
"noremap <Up> <nop>
"noremap <Down> <nop>

