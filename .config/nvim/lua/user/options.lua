tabsInSpaces					= 4										 -- I opt for tabs and spaces to be displayed the same
local options = {
	number						= true,								 -- Show LineNumber
	relativenumber				= true,								 -- Show Line Numbers relative to current line

	tabstop						= tabsInSpaces,				 -- # Spaces to display a tab as
	softtabstop					= tabsInSpaces,				 -- # Spaces to remove when backspacing
	shiftwidth					= tabsInSpaces,				 -- # Spaces to display normal mode indenting
	expandtab					= false,								-- Don't expand tabs to spaces
	smartindent					= true,								 -- Auto Indent for brace pairs

	swapfile					= false,
	backup						= false,
	undofile					= true,
	undodir						= "/home/harry/.vim/undodir",

	--hidden						= true, -- Defaulted therefore not needed
	hlsearch					= false,								-- Don't highlight search results after searching
	errorbells					= false,
	scrolloff					= 8,										-- Keep 8 lines above/below the cursor when scrolling
	sidescrolloff				= 8,
	signcolumn					= "yes",
	colorcolumn					= "100",
	cmdheight					= 2,
	timeoutlen					= 200,

	-- CompletionOptions
	completeopt					= {"menuone", "noinsert", "noselect"},
	fileencoding				= "utf-8",
	pumheight					= 10,
	smartcase					= true,
	splitbelow					= true,
	splitright					= true,
	cursorline					= true,
	wrap						= false
}

for k, v in pairs(options) do
		vim.opt[k] = v
end
