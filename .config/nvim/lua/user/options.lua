tabsInSpaces					= 2								-- I opt for tabs and spaces to be displayed the same
local options = {
	number						= true,							-- Show LineNumber
	relativenumber				= true,							-- Show Line Numbers relative to current line

    -- Tab Options
	tabstop						= tabsInSpaces,					-- # Spaces to display a tab as
	softtabstop					= tabsInSpaces,					-- # Spaces to remove when backspacing
	shiftwidth					= tabsInSpaces,					-- # Spaces to display normal mode indenting
	expandtab					= true,						    -- Don't expand tabs to spaces
	smartindent					= true,							-- Auto Indent for brace pairs
    showtabline                 = 2,                         -- Always show tabs

    -- File Options
	swapfile					= false,
	backup						= false,
	undofile					= true,
	undodir						= "/home/harry/.vim/undodir",

	--hidden						= true, -- Defaulted therefore not needed
	hlsearch					= false,						-- Don't highlight search results after searching
	errorbells					= false,
	scrolloff					= 8,							-- Keep 8 lines above/below the cursor when scrolling vertically
	sidescrolloff				= 8,                            -- Keep 8 lines left/right the cursorwhen scrolling horizontally
	signcolumn					= "yes",
	colorcolumn					= "100",
	cmdheight					= 2,                            -- More room for displaying messages
	timeoutlen					= 500,                          -- Time for entering mapped sequence (in ms)
    updatetime                  = 1000,                         -- Faster completion (4000ms default)
    conceallevel                = 0,                            -- So `` is displayed in MarkDown files

	-- CompletionOptions
	completeopt					= {"menuone", "noinsert", "noselect"},
	fileencoding				= "utf-8",                      -- Encoding written to file
	pumheight					= 10,                           -- Pop Up Menu Height
	smartcase					= true,
	splitbelow					= true,
	splitright					= true,
	cursorline					= true,
	wrap						= false,
    clipboard                   = "unnamedplus"                 -- Allow NVim to use system clipboard
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
