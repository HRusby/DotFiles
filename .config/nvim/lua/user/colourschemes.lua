-- Settings for the nord colorscheme
vim.g.nord_contrast = true
vim.g.nord_borders = true
require('nord').set()

vim.cmd [[
try
  colorscheme gruvbox
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
