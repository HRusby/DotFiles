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
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
" LSP & AutoComplete
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" Telescope + Requirements
Plug 'nvim-telescope/telescope.nvim'    
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'gruvbox-community/gruvbox'
Plug 'nvim-lua/plenary.nvim'

" Fugitive, UndoTree, TreeSitter, 
call plug#end()

colorscheme gruvbox
lua << EOF
local pid = vim.fn.getpid()
local omnisharp_bin="/usr/lib/omnisharp-roslyn/OmniSharp"
require'lspconfig'.omnisharp.setup{
    cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) };
}
EOF

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

